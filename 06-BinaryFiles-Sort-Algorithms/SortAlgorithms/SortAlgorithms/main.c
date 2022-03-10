#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>

#include "executionTime.h"
#include "bubbleSort.h"
#include "quickSort.h"

typedef void (*SortFunPtr)(void* arr, size_t count, size_t sizeOfElem, _CoreCrtNonSecureSearchSortCompareFunction compareFun);

static void outputMass(int* mass, size_t size)
{
	for (size_t i = 0; i < size; i++)
		printf("%d ", mass[i]);
	printf("\n");
}
int simpleCompare(const void* lhs, const void* rhs)
{
	int* left = (int*)lhs;
	int* right = (int*)rhs;
	return *left > *right;
}
int* createRandomMass(size_t size)
{
	int* mass = (int*)malloc(size * sizeof(int));
	for (int i = 0; i < size; ++i)
		mass[i] = rand() % ((int)size);
	return mass;
}
void testSortFunction(SortFunPtr fptr, size_t size, char* functionName, int debug)
{
	int* mass = createRandomMass(size);
	if (debug)
		outputMass(mass, size);
	clock_t start = startTimeMeasure();
	fptr((void*)mass, size, sizeof(int), simpleCompare);
	if (debug)
		outputMass(mass, size);
	printf_s("%s : ", functionName);
	stopTimeMeasure(start);
	free(mass);
}
void testSortFunctions(size_t size, int debug)
{
	testSortFunction(bubbleSort, size, "bubble sort", debug);
	testSortFunction(myQsort, size, "myqsort", debug);
	testSortFunction(qsort, size, "qsort", debug);
}

int main()
{
	srand((unsigned int)time(0));
	/*for (size_t size = 500; size <= 2500; size += 1000)
		testSortFunctions(size);*/
	testSortFunctions(100000, 0);
	return 0;
}