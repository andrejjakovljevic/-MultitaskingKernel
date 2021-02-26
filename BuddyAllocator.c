#include<stdio.h>
#include<windows.h>
#include"BuddyAllocator.h"

CRITICAL_SECTION lock;

int findSize(ull k)
{
	ull p = 1;
	int br = 0;
	while (p < k)
	{
		p *= 2;
		br++;
	}
	return br;
}

ull pow(int k)
{
	ull p = 1;
	while (k > 0)
	{
		p *= 2;
		k--;
	}
	return p;
}

void insertInto(BNode** head,BNode** tail, BNode* inserting, int level)
{
	BNode* pom = *head;
	inserting->next = 0; inserting->prev = 0; inserting->level = level;
	while (pom != 0 && pom->next!=0 && pom<inserting && pom->next < inserting) pom = pom->next;
	if (pom == 0) // prazno
	{
		*head = *tail = inserting;
	}
	else if (pom>inserting) // na pocetku
	{
		inserting->next = *head;
		(*head)->prev = inserting;
		*head = inserting;
	}
	else if (pom->next == 0) // na kraju
	{
		pom->next = inserting;
		*tail = inserting;
		inserting->prev = pom;
	}
	else // negde u sredini
	{
		inserting->prev = pom;
		inserting->next = pom->next;
	}
}

void deleteFrom(BNode** head, BNode** tail, BNode* del)
{
	BNode* pok = *head;
	while (pok != del) pok = pok->next;
	if (*head == pok) // obrisi prvi
	{
		*head = (*head)->next;
		if (*head == 0) *tail = 0;
		else (*head)->prev = 0;
	}
	else if (*tail == pok) // obrisi zadnji
	{
		*tail = (*tail)->prev;
		if (*tail != 0) (*tail)->next = 0;
	}
	else // obrisi srednji
	{
		BNode* prev = pok->prev;
		BNode* next = pok->next;
		prev->next = next;
		next->prev = prev;
	}
}

void normalize(BAllocator* ba,int pocetniLvl)
{
	for (int i = pocetniLvl; i < NUM_SIZES_OF_BLOCKS; i++)
	{
		int toBreak = 1;
		ull size = pow(i);
		BNode* pok = ba->heads[i];
		while (pok != 0)
		{
			ull offset = (ull)pok - (ull)(ba->pokNaPocetak);
			if ((offset & size) == 0) // moguc prvi buddy
			{
				if ((ull)(pok->next) == (ull)pok + size*BLOCK_SIZE) // ima buddy
				{
					BNode* novi = pok->next->next;
					deleteFrom(&ba->heads[i], &ba->tails[i], pok);
					deleteFrom(&ba->heads[i], &ba->tails[i], pok->next);
					insertInto(&ba->heads[i + 1], &ba->tails[i + 1], pok, i + 1);
					pok = novi;
					toBreak = 0;
				}
				else pok = pok->next;
			}
			else pok = pok->next;
		}
		if (toBreak) break;
	}
}

void split(BAllocator* ba, int currLvl, int level, BNode* pok)
{
	if (currLvl > level)
	{
		ull size = pow(currLvl) * BLOCK_SIZE;
		deleteFrom(&ba->heads[currLvl], &ba->tails[currLvl], pok);
		insertInto(&ba->heads[currLvl - 1], &ba->tails[currLvl - 1], pok, currLvl - 1);
		insertInto(&ba->heads[currLvl - 1], &ba->tails[currLvl - 1], (BNode*)((ull)pok+size/2), currLvl - 1);
		split(ba, currLvl - 1, level, pok);
	}
}

void* allocate(BAllocator* ba, int blockNum)
{
	EnterCriticalSection(&lock);
	if (blockNum > ba->numFreeBlocks)
	{
		LeaveCriticalSection(&lock);
		return 0;
	}
	int level = findSize(blockNum);
	for (int i = level; i < NUM_SIZES_OF_BLOCKS; i++)
	{
		if (ba->heads[i] != 0)
		{
			void* pok = ba->heads[i];
			split(ba, i, level, ba->heads[i]);
			deleteFrom(&ba->heads[level], &ba->tails[level], pok);
			ba->numFreeBlocks -= pow(level);
			LeaveCriticalSection(&lock);
			return pok;
		}
	}
	LeaveCriticalSection(&lock);
	return 0;
}

void deallocate(BAllocator* ba, void* pok, int blockSize)
{
	EnterCriticalSection(&lock);
	int k = findSize(blockSize);
	insertInto(&ba->heads[k], &ba->tails[k], (BNode*)pok, k);
	ba->numFreeBlocks += pow(k);
	normalize(ba, k);
	LeaveCriticalSection(&lock);
}

void* initializeBuddy(void* pok, int blockNum)
{
	InitializeCriticalSection(&lock);
	EnterCriticalSection(&lock);
	ull pokAligned = ((((ull)pok) & 0xfffffffffffff000) == (ull)pok) ? (ull)pok : ((ull)pok & 0xfffffffffffff000) + BLOCK_SIZE;
	int realBlockNum = ((ull)pok == (ull)pokAligned) ? blockNum : blockNum - 1;
	// Ostavi prvi blok za allocator
	ull memStart = pokAligned + BLOCK_SIZE;
	realBlockNum--;
	BAllocator* buddyAllocator = (BAllocator*)pokAligned;
	for (int i = 0; i < NUM_SIZES_OF_BLOCKS; i++)
	{
		buddyAllocator->heads[i] = buddyAllocator->tails[i] = 0;
	}
	buddyAllocator->pokNaPocetak = (void*)memStart;
	buddyAllocator->numBlocks = realBlockNum;
	buddyAllocator->numFreeBlocks = realBlockNum;
	ull currMem = memStart;
	for (int i = 0; i < realBlockNum; i++)
	{
		insertInto(&buddyAllocator->heads[0], &buddyAllocator->tails[0], (BNode*)currMem, 0);
		currMem += BLOCK_SIZE;
	}
	normalize(buddyAllocator,0);
	LeaveCriticalSection(&lock);
	return (void*)buddyAllocator;
}

void print(BAllocator* ba)
{
	EnterCriticalSection(&lock);
	printf("pokazivac na poc = %llu\nbroj_blokova = %d\nbroj slobodnih blokova = %d\n", (ull)ba->pokNaPocetak, ba->numBlocks, ba->numFreeBlocks);
	for (int i = 0; i < NUM_SIZES_OF_BLOCKS; i++)
	{
		BNode* pok = ba->heads[i];
		while (pok != 0)
		{
			printf("%llu %d\n", (ull)pok,i);
			pok = pok->next;
		}
	}
	LeaveCriticalSection(&lock);
}