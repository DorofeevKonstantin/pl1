#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <string.h>
#include <time.h>
#include <math.h>

typedef void (*FunPtr)(int*);
typedef int (*ConditionPtr)(int*);

int minusValue = 1;

int positive(int* value)
{
	if (*value > 0)
		return 1;
	else
		return -1;
}
void output(int* value)
{
	printf_s("%d ", *value);
}
void random(int* value)
{
	*value = rand() % 20 - 10;
}
void square(int* value)
{
	*value *= *value;
}
void minus(int* value)
{
	*value -= minusValue;
}
void forAll(int* mass, int size, FunPtr action)
{
	for (int i = 0; i < size; ++i)
		action(&mass[i]);
}
void forAllIf(int* mass, int size, FunPtr action, ConditionPtr condition)
{
	for (int i = 0; i < size; ++i)
	{
		if (condition(&mass[i]) > 0)
			action(&mass[i]);
	}
}

int main()
{
	int size = 10;
	int* mass = (int*)malloc(size * sizeof(int));
	srand((unsigned int)time(0));

	forAll(mass, size, random);
	forAll(mass, size, output);
	printf_s("\n");

	/*forAll(mass, size, square);
	forAll(mass, size, output);
	printf_s("\n");

	minusValue = 5;
	forAll(mass, size, minus);
	forAll(mass, size, output);
	printf_s("\n");*/

	forAllIf(mass, size, square, positive);
	forAll(mass, size, output);
	printf_s("\n");

	free(mass);
	system("pause");
	return 0;
}