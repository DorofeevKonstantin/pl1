#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <math.h>

#include "quickSort.h"

static void outputArray(int* mass, int start, int end)
{
	for (int i = start; i < end; ++i)
		printf_s("%d ", mass[i]);
	printf_s("\n");
}
void myQsortImpl(int* mass, int first, int last, int debug)
{
	if (first < last)
	{
		int left = first, right = last, middle = mass[(left + right) / 2];
		if (debug)
		{
			outputArray(mass, first, last + 1);
			printf_s("left = %d , middle = %d , right = %d\n", mass[left], middle, mass[right]);
		}
		do
		{
			while (mass[left] < middle) left++;
			while (mass[right] > middle) right--;
			if (left <= right)
			{
				if (debug)
					printf_s("swapping : %d <-> %d\n", mass[left], mass[right]);
				int tmp = mass[left];
				mass[left] = mass[right];
				mass[right] = tmp;
				left++;
				right--;
			}
		} while (left <= right);
		if (debug)
		{
			outputArray(mass, first, last + 1);
			printf_s("\n");
			_getch();
		}
		myQsortImpl(mass, first, right, debug);
		myQsortImpl(mass, left, last, debug);
	}
}
void myQsort(void* arr, size_t count, size_t sizeOfElem, _CoreCrtNonSecureSearchSortCompareFunction compareFun)
{
	myQsortImpl((int*)arr, 0, (int)(count - 1), 0);
}