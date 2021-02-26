#pragma once

#define BLOCK_SIZE (4096)
#define NUM_SIZES_OF_BLOCKS (64)
#define ull unsigned long long

typedef struct BuddyNode
{
	struct BuddyNode* next;
	struct BuddyNode* prev;
	int level;
} BNode;

typedef struct BuddyAllocator
{
	BNode* heads[64];
	BNode* tails[64];
	void* pokNaPocetak;
	int numBlocks;
	int numFreeBlocks;
} BAllocator;

void* initializeBuddy(void* pok, int blockNum);
void* allocate(BAllocator* ba, int blockNum); 
void deallocate(BAllocator* ba, void* pok, int blockSize);
void print(BAllocator* ba);
