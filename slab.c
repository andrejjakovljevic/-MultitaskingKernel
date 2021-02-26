#define _CRT_SECURE_NO_WARNINGS 
#include<stdio.h>
#include<windows.h>
#include<assert.h>
#include"Slab.h"
#include"BuddyAllocator.h"

typedef struct Slab
{
	struct Slab* next;
	struct Slab* prev;
	void* memoryStart;
	kmem_cache_t* master;
	ull numObjects;
	ull numFreeObjects;
	ull offset;
	ull* flags;
} SNode;


typedef struct kmem_cache_s
{
	char name[50];
	SNode* fullheader;
	SNode* partialheader;
	SNode* emptyheader;
	void (*ctor)(void*);
	void (*dtor)(void*);
	struct kmem_cache_s* next;
	struct kmem_cache_s* prev;
	ull objectSize;
	ull offset;
	ull waste;
	ull slabSizeInBlocks;
	ull numObjects;
	ull numSlabs;
	short errorCode; // 1 - no space for slab, 2 - nothing to deallocate
	short isDeallocated;
	CRITICAL_SECTION sc;
} kmem_cache_t;

typedef struct slab_struct
{
	kmem_cache_t* cacheHeader;
	kmem_cache_t* smallBuffers[14];
	BAllocator* ba;
	CRITICAL_SECTION sc;
} SSAlloc;

void printSlabInfo(SNode* node)
{
	if (node == 0) return;
	printf_s("numObjects = %llu\n", node->numObjects);
	printf_s("memStart = %llu\n", (ull)node->memoryStart);
	printf_s("offset = %llu\n", node->offset);
	printf_s("num Free Objects = %llu\n", node->numFreeObjects);
	printf_s("\n");
}

void deleteFromHeader(SNode** head, SNode* toDelete)
{
	if (toDelete == 0) return;
	SNode* prev = toDelete->prev;
	SNode* next = toDelete->next;
	if (prev == 0) *head = next;
	else prev->next = next;
	if (next != 0) next->prev = prev;
}

void addToHeader(SNode** head, SNode* toAdd)
{
	toAdd->next = 0;
	toAdd->prev = 0;
	toAdd->next = *head;
	if (*head != 0) (*head)->prev = toAdd;
	*head = toAdd;	
}

void addCache(kmem_cache_t** header, kmem_cache_t* add)
{
	add->next = 0;
	add->prev = 0;
	add->next = *header;
	if (*header != 0) (*header)->prev = add;
	*header = add;
}

void removeCache(BAllocator* ba, kmem_cache_t** header, kmem_cache_t* toDelete)
{
	if (toDelete == 0) return;
	kmem_cache_t* prev = toDelete->prev;
	kmem_cache_t* next = toDelete->next;
	if (prev == 0) *header = next;
	else prev->next = next;
	if (next != 0) next->prev = prev;
	deallocate(ba, (void*)toDelete, 1);
}

void deallocateSlab(BAllocator* ba, SNode* node)
{
	ull mem = (ull)(node->memoryStart) + node->offset;
	for (int i = 0; i < node->numObjects; i++)
	{
		if (node->master->dtor != 0) node->master->dtor((void*)mem);
		mem += node->master->objectSize;
	}
	deallocate(ba, node->memoryStart, (int)node->master->slabSizeInBlocks);
	deallocate(ba, node, 1);
}

ull numOfBloks(ull objectSize)
{
	ull k = BLOCK_SIZE;
	while (k < objectSize) k *= 2;
	return k;
}

ull calculateWaste(ull objectSize)
{
	ull num = numOfBloks(objectSize);
	ull numObjects = num / objectSize;
	return num - (numObjects * objectSize);
}

ull numOfObjectsInSlab(ull objectSize)
{
	ull num = numOfBloks(objectSize);
	ull numObjects = num / objectSize;
	return numObjects;
}

SSAlloc* slabAloc;

SNode* createSlab(kmem_cache_t* cache)
{
	SNode* newSlab = (SNode*)(allocate(slabAloc->ba, 1));
	if (newSlab == 0)
	{
		cache->errorCode = 1;
		return 0;
	}
	newSlab->master = cache;
	newSlab->numObjects = cache->numObjects;
	newSlab->numFreeObjects = cache->numObjects;
	newSlab->memoryStart = (void*)(allocate(slabAloc->ba, (int)cache->slabSizeInBlocks));
	ull mem = (ull)(newSlab->memoryStart) + cache->offset;
	newSlab->offset = cache->offset;
	for (int i = 0; i < newSlab->numObjects; i++)
	{
		if (cache->ctor != 0) cache->ctor((void*)mem);
		mem += cache->objectSize;
	}
	cache->offset += CACHE_L1_LINE_SIZE;
	if (cache->offset >= cache->waste) cache->offset = 0;
	newSlab->flags = (ull*)((ull)newSlab + (ull)sizeof(SNode));
	for (int i = 0; i < newSlab->numObjects / (sizeof(ull) * 8)+1; i++)
	{
		newSlab->flags[i] = (ull)0;
	}
	cache->numSlabs++;
	addToHeader(&cache->emptyheader, newSlab);
	return newSlab;
}

void* findEmpty(SNode* slab) // Find empty place in slab
{
	ull* pom = slab->flags;
	ull pok = (ull)slab->memoryStart + slab->offset;
	for (int i = 0; i < slab->numObjects / (sizeof(ull) * 8)+1; i++)
	{
		ull check = (ull)1;
		for (int j = 0; j < sizeof(ull) * 8; j++)
		{
			if ((check & (*pom)) == 0)
			{
				(*pom) |= check;
				return (void*)pok;
			}
			pok += slab->master->objectSize;
			check <<= 1;
		}
		pom += 1;
	}
	return 0; // Shouldn't go here
}

void* kmem_cache_alloc(kmem_cache_t* cachep) // Allocate one object from cache
{
	EnterCriticalSection(&(cachep->sc));
	if (cachep->emptyheader == 0 && cachep->partialheader == 0)
	{
		createSlab(cachep);
	}
	if (cachep->partialheader != 0) // Has partial
	{
		void* pok = findEmpty(cachep->partialheader);
		cachep->partialheader->numFreeObjects--;
		if (cachep->partialheader->numFreeObjects == 0) // is Full
		{
			SNode* napunjen = cachep->partialheader;
			deleteFromHeader(&cachep->partialheader, cachep->partialheader);
			addToHeader(&cachep->fullheader, napunjen);
		}
		LeaveCriticalSection(&(cachep->sc));
		return pok;
	}
	else if (cachep->emptyheader != 0) // this should always be true
	{
		void* pok = findEmpty(cachep->emptyheader);
		cachep->emptyheader->numFreeObjects--;
		SNode* neVisePrazan = cachep->emptyheader;
		deleteFromHeader(&cachep->emptyheader, cachep->emptyheader);
		addToHeader(&cachep->partialheader, neVisePrazan);
		if (cachep->partialheader->numFreeObjects == 0) // partial full
		{
			SNode* zaPrem = cachep->partialheader;
			deleteFromHeader(&cachep->partialheader, cachep->partialheader);
			addToHeader(&cachep->fullheader, zaPrem);
		}
		LeaveCriticalSection(&(cachep->sc));
		return pok;
	}
	LeaveCriticalSection(&(cachep->sc));
	return 0;
}

int kmem_cache_shrink(kmem_cache_t* cachep) // Shrink cache
{
	EnterCriticalSection(&(cachep->sc));
	int ret = 0;
	while (cachep->emptyheader != 0)
	{
		SNode* zaIzbac = cachep->emptyheader;
		deleteFromHeader(&cachep->emptyheader, zaIzbac);
		deallocateSlab(slabAloc->ba, zaIzbac);
		ret++;
	}
	cachep->numSlabs--;
	LeaveCriticalSection(&(cachep->sc));
	return ret;
}

kmem_cache_t* createCache(const char* name, size_t size, void(*ctor)(void*), void(*dtor)(void*), int addToList)
{
	kmem_cache_t* newCache = (kmem_cache_t*)(allocate(slabAloc->ba, 1));
	InitializeCriticalSection(&(newCache->sc));
	EnterCriticalSection(&(newCache->sc));
	newCache->objectSize = size;
	newCache->ctor = ctor;
	newCache->dtor = dtor;
	newCache->emptyheader = 0;
	newCache->fullheader = 0;
	newCache->partialheader = 0;
	newCache->slabSizeInBlocks = numOfBloks((ull)size) / BLOCK_SIZE;
	newCache->waste = calculateWaste((ull)size);
	newCache->objectSize = (ull)size;
	newCache->numObjects = numOfObjectsInSlab((ull)size);
	newCache->offset = 0;
	newCache->numSlabs = 0;
	newCache->errorCode = 0;
	newCache->isDeallocated = 0;
	strncpy(newCache->name, name, 50);
	if (addToList) addCache(&slabAloc->cacheHeader, newCache);
	LeaveCriticalSection(&(newCache->sc));
	return newCache;
}

kmem_cache_t* createSmallBuffer(const char* name, size_t size)
{
	return createCache(name, size, 0, 0, 0);
}

kmem_cache_t* kmem_cache_create(const char* name, size_t size, void(*ctor)(void*), void(*dtor)(void*))
{
	return createCache(name, size, ctor, dtor, 1);
}

void kmem_init(void* space, int block_num)
{
	BAllocator* ba = initializeBuddy(space, block_num);
	slabAloc = (SSAlloc*)(allocate(ba, 1));
	slabAloc->ba = ba;
	InitializeCriticalSection(&(slabAloc->sc));
	ull size = 32; // 2 na peti
	slabAloc->cacheHeader = 0;
	/*const char* names[13] =
	{ "Buffer1","Buffer2","Buffer3","Buffer4","Buffer5","Buffer6","Buffer7","Buffer8","Buffer9","Buffer10","Buffer11","Buffer12",
		"Buffer13" };*/
	for (int i = 0; i < 13; i++)
	{
		char name[50];
		sprintf_s(name, 50, "Buffer %d", i+1);
		//const char* newName = names[i];
		slabAloc->smallBuffers[i] = createSmallBuffer(name, size);
		size *= 2;
	}
}

SNode* findSlabInCache(kmem_cache_t* cachep, void* objp) // Finds slab for an object
{
	// Find object in full
	SNode* pom = cachep->fullheader;
	while (pom != 0)
	{
		ull mem = (ull)pom->memoryStart;
		if ((ull)objp >= mem && (ull)objp <= mem + cachep->slabSizeInBlocks * BLOCK_SIZE)
		{
			break;
		}
		pom = pom->next;
	}
	// Find object in partial
	if (pom == 0)
	{
		pom = cachep->partialheader;
		while (pom != 0)
		{
			ull mem = (ull)pom->memoryStart;
			if ((ull)objp >= mem && (ull)objp <= mem + cachep->slabSizeInBlocks * BLOCK_SIZE)
			{
				break;
			}
			pom = pom->next;
		}
	}
	return pom;
}

void kmem_cache_free(kmem_cache_t* cachep, void* objp) // Deallocate one object from cache
{
	EnterCriticalSection(&(cachep->sc));
	SNode* slab = findSlabInCache(cachep, objp);
	if (slab == 0)
	{
		LeaveCriticalSection(&(cachep->sc));
		return;
	}
	ull pos = ((ull)(objp)-(ull)(slab->memoryStart)) / ((ull)slab->master->objectSize);
	ull k = pos / (sizeof(ull) * 8); // num of word
	ull p = pos % (sizeof(ull) * 8); // num of bit
	ull bitmask = ~(((ull)1) << p);
	ull old = slab->flags[k];
	slab->flags[k] &= bitmask;
	if (old != slab->flags[k]) // Did we really deallocate something?
	{
		if (cachep->dtor) cachep->dtor(objp);
		if (cachep->ctor) cachep->ctor(objp);
		cachep->isDeallocated = 1;
		slab->numFreeObjects++;
		if (slab->numFreeObjects == 1) // Full->Partial
		{
			deleteFromHeader(&cachep->fullheader, slab);
			addToHeader(&cachep->partialheader, slab);
		}
		else if (slab->numFreeObjects == slab->numObjects) // Partial->Empty
		{
			deleteFromHeader(&cachep->partialheader, slab);
			addToHeader(&cachep->emptyheader, slab);
		}
	}
	else cachep->errorCode = 2; // wrong dealloc
	LeaveCriticalSection(&(cachep->sc));
}

void kmem_cache_destroy(kmem_cache_t* cachep) // Deallocate cache
{
	EnterCriticalSection(&(cachep->sc));
	while (cachep->emptyheader != 0)
	{
		SNode* zaBrisanje = cachep->emptyheader;
		deleteFromHeader(&cachep->emptyheader, cachep->emptyheader);
		deallocateSlab(slabAloc->ba, zaBrisanje);
	}
	while (cachep->partialheader != 0)
	{
		SNode* zaBrisanje = cachep->partialheader;
		deleteFromHeader(&cachep->partialheader, cachep->partialheader);
		deallocateSlab(slabAloc->ba, zaBrisanje);
	}
	while (cachep->fullheader != 0)
	{
		SNode* zaBrisanje = cachep->fullheader;
		deleteFromHeader(&cachep->fullheader, cachep->fullheader);
		deallocateSlab(slabAloc->ba, zaBrisanje);
	}
	deallocate(slabAloc->ba, (void*)cachep, 1);
	LeaveCriticalSection(&(cachep->sc));
	// Just for testing

	/*printf_s("----------------BUDDY-----------------\n");
	print(slabAloc->ba);*/
}

int findpower(ull p)
{
	ull k = 1;
	int br = 0;
	while (k < p)
	{
		k *= 2;
		br++;
	}
	return br;
}

void* kmalloc(size_t size) // Alloacate one small memory buffer
{
	EnterCriticalSection(&(slabAloc->sc));
	int p = findpower((ull)size);
	if (p>17)
	{
		LeaveCriticalSection(&(slabAloc->sc));
		return 0;
	}
	if (p < 5) p = 5;
	kmem_cache_t* buf_cache = slabAloc->smallBuffers[p - 5];
	void* ret = kmem_cache_alloc(buf_cache);
	LeaveCriticalSection(&(slabAloc->sc));
	return ret;
}

void kfree(const void* objp) // Deallocate one small memory buffer
{
	EnterCriticalSection(&(slabAloc->sc));
	for (int i = 0; i < 13; i++)
	{
		kmem_cache_free(slabAloc->smallBuffers[i], (void*)objp);
		if (slabAloc->smallBuffers[i]->isDeallocated == 1)
		{
			kmem_cache_shrink(slabAloc->smallBuffers[i]);
			slabAloc->smallBuffers[i]->isDeallocated = 0;
			break;
		}
	}
	LeaveCriticalSection(&(slabAloc->sc));
}

void kmem_cache_info(kmem_cache_t* cachep) // Print cache info
{
	EnterCriticalSection(&(slabAloc->sc));
	printf_s("----------------");
	printf_s("%s", cachep->name);
	printf_s("----------------\n");
	printf_s("object size=%llu\n", cachep->objectSize);
	printf_s("slab size=%llu\n", cachep->slabSizeInBlocks);
	printf_s("waste = %llu\n", cachep->waste);
	printf_s("offset = %llu\n", cachep->offset);
	printf_s("num of slabs = %llu\n", cachep->numSlabs);
	SNode* nodic = cachep->emptyheader;
	int broj = 0;
	printf_s("\n Empty slabs:\n");
	while (nodic != 0)
	{
		printSlabInfo(nodic);
		nodic = nodic->next;
		broj++;
	}
	printf_s("num Empty slabs=%d\n", broj);
	printf_s("\n Partial slabs:\n");
	nodic = cachep->partialheader;
	broj = 0;
	while (nodic != 0)
	{
		printSlabInfo(nodic);
		nodic = nodic->next;
		broj++;
	}
	printf_s("num Partial slabs=%d\n", broj);
	printf_s("\n Full slabs:\n");
	nodic = cachep->fullheader;
	broj = 0;
	while (nodic != 0)
	{
		printSlabInfo(nodic);
		nodic = nodic->next;
		broj++;
	}
	printf_s("num Full slabs=%d\n", broj);
	LeaveCriticalSection(&(slabAloc->sc));
}

int kmem_cache_error(kmem_cache_t* cachep) // Print error message
{
	EnterCriticalSection(&(slabAloc->sc));
	if (cachep->errorCode == 1) printf_s("No space for new slab\n");
	else if (cachep->errorCode == 2) printf_s("Nothing to deallocate");
	LeaveCriticalSection(&(slabAloc->sc));
	return cachep->errorCode;
}