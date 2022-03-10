#include <stdio.h>
#include <math.h>

#include "numbers.h"

void outputValue(int* value)
{
	printf_s("%d ", *value);
}
void forAll(int* mass, int size, FnPtr action)
{
	for (int i = 0; i < size; ++i)
		action(&mass[i]);
}
int simpleCompare(const void* lhs, const void* rhs)
{
	int* left = (int*)lhs;
	int* right = (int*)rhs;
	return *left > *right;
}
int compareOddEvenSubgroups(const void* lhs, const void* rhs)
{
	int* left = (int*)lhs;
	int* right = (int*)rhs;

	if (abs((*left) % 2) == abs((*right) % 2))
	{
		if (*left < *right)
			return -1;
		else if (*left > *right)
			return 1;
		else
			return 0;
	}
	else if (((*left) % 2 != 0) && ((*right) % 2 == 0))
		return -1;
	else if (((*right) % 2 != 0) && ((*left) % 2 == 0))
		return 1;
	return 0;
}