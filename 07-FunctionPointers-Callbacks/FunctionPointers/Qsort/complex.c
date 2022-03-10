#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <math.h>

#include "complex.h"

double modul(const complex* number)
{
	double result = sqrt((*number).Re * (*number).Re + (*number).Im * (*number).Im);
	return result;
}
int modulCompare(const void* lhs, const void* rhs)
{
	complex* left = (complex*)lhs;
	complex* right = (complex*)rhs;
	return modul(left) > modul(right);
}
void outputComplexArray(complex* mass, int len)
{
	for (int i = 0; i < len; ++i)
	{
		if (mass[i].Im > 0)
			printf("%d+%di  ", (int)mass[i].Re, (int)mass[i].Im);
		else
			printf("%d%di  ", (int)mass[i].Re, (int)mass[i].Im);
	}
	printf("\n");
}