#include <stdio.h>

#include "math.h"

void fastPowerExample()
{
	ullong base = 6, pow = 11;
	printf_s("%llu ^ %llu = %llu\n", base, pow, fastPower(base, pow));
}

void binarySearchExample()
{
	int mass[] = { 1,2,3,4,5,6,7,8,9 };
	int value = 7;
	int pos = binarySearch(mass, 0, 8, value);
	if (pos > 0)
		printf("Position of %d : %d.\n", value, pos);
	else
		printf("%d value not finded.\n", value);
}