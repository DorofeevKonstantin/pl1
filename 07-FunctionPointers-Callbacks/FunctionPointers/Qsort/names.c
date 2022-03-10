#include <stdio.h>
#include <string.h>

int compareStrings(const void* lhs, const void* rhs)
{
	unsigned char** left = (unsigned char**)lhs;
	unsigned char** right = (unsigned char**)rhs;
	return strcmp(*left, *right);
}
void outputStringsArray(unsigned char** mass, int str)
{
	for (int i = 0; i < str; ++i)
	{
		printf("%s\n", mass[i]);
	}
}