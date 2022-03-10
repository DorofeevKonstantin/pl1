#include <stdio.h>

typedef void (*FunPtr)();

void f()
{
	printf_s("f");
}

int main()
{
	FunPtr fptr = &f;
	fptr();
	return 0;
}