#include <stdio.h>
#include <stdlib.h>
#include "BuddyAllocator.h"
#include "slab.h"

void cons(void* pok)
{
	printf("konstrkutor\n");
}

void desc(void* desc)
{
	printf("desktruktor\n");
}
