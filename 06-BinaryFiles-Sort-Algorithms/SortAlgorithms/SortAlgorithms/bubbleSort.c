#include <stdio.h>
#include <stdlib.h>

#include "bubbleSort.h"

void bubbleSort(void* arr, size_t count, size_t sizeOfElem, _CoreCrtNonSecureSearchSortCompareFunction compareFun)
{
	int* mass = (int*)arr;
	for (size_t i = 0; i < count; i++)
	{
		for (size_t j = i; j < count - 1; j++)
		{
			if (compareFun(&(mass[j]), &(mass[j + 1])) > 0)
			{
				int tmp = mass[j + 1];
				mass[j + 1] = mass[j];
				mass[j] = tmp;
			}
		}
	}
}