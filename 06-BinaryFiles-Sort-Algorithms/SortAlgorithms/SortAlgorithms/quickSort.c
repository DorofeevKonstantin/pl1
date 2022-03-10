#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <math.h>

#include "quickSort.h"

static void outputArray(int* mass, int start, int end)
{
	for (int i = start; i < end; ++i)
		printf("%d ", mass[i]);
	printf("\n");
}
void myQsortImpl(int* s_arr, int first, int last, int debug)
{
	if (first < last)
	{
		int left = first, right = last, middle = s_arr[(left + right) / 2];
		if (debug)
		{
			outputArray(s_arr, first, last + 1);
			printf("left = %d , middle = %d , right = %d\n", s_arr[left], middle, s_arr[right]);
		}
		do
		{
			while (s_arr[left] < middle) left++;
			while (s_arr[right] > middle) right--;
			if (left <= right)
			{
				if (debug)
					printf("swapping : %d <-> %d\n", s_arr[left], s_arr[right]);
				int tmp = s_arr[left];
				s_arr[left] = s_arr[right];
				s_arr[right] = tmp;
				left++;
				right--;
			}
		} while (left <= right);
		if (debug)
		{
			outputArray(s_arr, first, last + 1);
			printf("\n");
			_getch();
		}
		myQsortImpl(s_arr, first, right, debug);
		myQsortImpl(s_arr, left, last, debug);
	}
}
void myQsort(void* arr, size_t count, size_t sizeOfElem, _CoreCrtNonSecureSearchSortCompareFunction compareFun)
{
	myQsortImpl((int*)arr, 0, (int)(count - 1), 0);
}