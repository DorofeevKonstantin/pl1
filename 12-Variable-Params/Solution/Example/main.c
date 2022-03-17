#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

int sumIntegers(int n, ...)
{
	int result = 0;
	int* ptr = &n;
	++ptr;
	while (n > 0)
	{
		result += *ptr;
		++ptr;
		--n;
	}
	return result;
}
int sumIntegersViaStdarg(int n, ...)
{
	va_list arglist;
	va_start(arglist, n);
	int result = 0, i = 0;
	while (n > 0)
	{
		i = va_arg(arglist, int);
		result += i;
		--n;
	}
	va_end(arglist);
	return result;
}
double sumDoubles(int n, ...)
{
	double result = 0;
	int* ptrInt = &n;
	++ptrInt;
	double* ptrDouble = (double*)ptrInt;
	while (n > 0)
	{
		result += *ptrDouble;
		++ptrDouble;
		--n;
	}
	return result;
}
double sumDoublesViaStdarg(int n, ...)
{
	va_list arglist;
	va_start(arglist, n);
	double result = 0, i = 0;
	while (n > 0)
	{
		i = va_arg(arglist, double);
		result += i;
		--n;
	}
	va_end(arglist);
	return result;
}

int main()
{
	printf("sumIntegers(4, 1, 2, 3, 4) = %d\n", sumIntegers(4, 1, 2, 3, 4));
	printf("sumIntegersViaStdarg(4, 1, 2, 3, 4) = %d\n", sumIntegersViaStdarg(4, 1, 2, 3, 4));

	printf("sumDoubles(4, 1.1, 2.2, 3.0, 0.1) = %lf\n", sumDoubles(4, 1.1, 2.2, 3.0, 0.1));
	printf("sumDoublesViaStdarg(4, 1.1, 2.2, 3.0, 0.1) = %lf\n", sumDoublesViaStdarg(4, 1.1, 2.2, 3.0, 0.1));

	/*char* str1 = concat("one ", "two ", "three ", "four", "\0");
	printf("concat(\"one \", \"two \", \"three \", \"four\", \"\\0\") : %s\n", str1);
	free(str1);*/
	return 0;
}