#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

#include "numbers.h"
#include "names.h"
#include "complex.h"

void numbersExample()
{
	int mass[] = { 1,2,3,4,5,6,7,-9,-10,-11,-12 };
	int size = 11;
	forAll(mass, size, outputValue);
	printf("\n");
	qsort(mass, size, sizeof(int), simpleCompare);
	forAll(mass, size, outputValue);
	printf("\n");
	qsort(mass, size, sizeof(int), compareOddEvenSubgroups);
	forAll(mass, size, outputValue);
	printf("\n\n");
}

void namesExample()
{
	setlocale(LC_ALL, "Ru");
	unsigned char* mass[4] = { "ян", "иван", "андрей", "борис" };
	printf("Массив имён :\n");
	outputStringsArray(mass, 4);
	qsort(mass, 4, sizeof(char*), compareStrings);
	printf("После сортировки :\n");
	outputStringsArray(mass, 4);
	printf("\n\n");
}

void complexExample()
{
	complex mass[] = { {1,2}, {4,-9}, {-5,-1}, {-1,4}, {2,3} };
	printf("Массив комплексных чисел :\n");
	outputComplexArray(mass, sizeof(mass) / sizeof(complex));
	qsort(mass, sizeof(mass) / sizeof(complex), sizeof(complex), modulCompare);
	printf("После сортировки :\n");
	outputComplexArray(mass, sizeof(mass) / sizeof(complex));
	printf("\n\n");
}

int main()
{
	numbersExample();
	namesExample();
	complexExample();
	return 0;
}