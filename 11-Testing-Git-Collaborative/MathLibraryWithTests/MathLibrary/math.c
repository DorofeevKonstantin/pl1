#include "math.h"

ullong fastPower(ullong base, ullong pow)
{
	ullong result = 1;
	while (pow)
	{
		if ((pow % 2) == 0)
		{
			base *= base;
			pow /= 2;
		}
		else
		{
			result *= base;
			--pow;
		}
	}
	return result;
}

int binarySearch(int* mass, int l, int r, int value)
{
	int pos = -1;
	while (l <= r)
	{
		int midPos = (l + r) / 2;
		int midValue = mass[midPos];
		if (value < midValue)
			r = midPos - 1;
		else if (value > midValue)
			l = midPos + 1;
		else
		{
			pos = midPos;
			break;
		}
	}
	return pos;
}

int countVowels(const char* s)
{
	const char* position = s;
	int vowels = 0;
	while (*position)
	{
		if (*position == 'a' || *position == 'e' || *position == 'i' || *position == 'o' || *position == 'u')
			vowels++;
		position++;
	}
	return vowels;
}