#include <stdio.h>
#include <stdlib.h>

#include "../../../14-Linked-list/lecture-code/linkedList/linkedList.h"

size_t getPermutations(linkedList* alphabet, linkedList* upLevelPermutation)
{
	static size_t count = 0;
	if (alphabet->size == 0)
	{
		printList(upLevelPermutation);
		++count;
		destroyList(upLevelPermutation);
		return count;
	}
	for (size_t i = 0; i < alphabet->size; i++)
	{
		int detachedValue = popFront(alphabet);
		linkedList* downLevelPermutation = copyList(upLevelPermutation);
		pushBack(downLevelPermutation, detachedValue);
		getPermutations(alphabet, downLevelPermutation);
		pushBack(alphabet, detachedValue);
	}
	return count;
}

void permutations(int* values, size_t size)
{
	linkedList* alphabet = createList();
	for (size_t i = 0; i < size; i++)
		pushBack(alphabet, values[i]);
	linkedList* permutation = createList();
	size_t count = getPermutations(alphabet, permutation);
	printf_s("Calculated %lu permutations.\n", count);
	destroyList(alphabet);
	destroyList(permutation);
}

void printHelp()
{
	printf_s("Usage examples : permutations.exe 1 2 3");
	printf_s("Usage examples : permutations.exe 10 1 0");
}

int main(int argc, char* argv[])
{
	if (argc < 2)
	{
		printHelp();
		return -1;
	}
	int* values = (int*)malloc((argc - 1) * sizeof(int));
	if (values)
	{
		printf_s("Entered %d items : \n", argc - 1);
		for (int i = 0; i < argc - 1; i++)
		{
			values[i] = atoi(argv[i + 1]);
			printf_s("%d ", values[i]);
		}
		printf_s("\n\n");
		permutations(values, argc - 1);
		free(values);
	}
	return 0;
}