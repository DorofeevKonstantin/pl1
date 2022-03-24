#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "tree.h"

void treeTest1()
{
	int values[] = { 10,6,15,4,8,17 };
	tree* t = createTree();
	generateTree(t, values, 6);
	outputInorderRecursive(t);
	printf_s("\n");
	outputInorderStack(t);
	int value = 8;
	printf_s("height of %d == %d\n\n", value, getNodeHeight(t, value));
	destroyTree(t);
}
void randomTreeTest()
{
#define SIZE 10
	int values[SIZE];
	for (size_t i = 0; i < SIZE; i++)
	{
		values[i] = rand() % (2 * SIZE);
		printf_s("%d ", values[i]);
	}
	printf_s("\n");
	tree* t = createTree();
	generateTree(t, values, SIZE);
	outputInorderRecursive(t);
	printf_s("\n");
	outputInorderStack(t);
	for (size_t i = 0; i < SIZE; i++)
	{
		int value = values[i];
		printf_s("height of %d == %d\n", value, getNodeHeight(t, value));
	}
	destroyTree(t);
}

int main()
{
	srand((unsigned int)time(0));
	treeTest1();
	randomTreeTest();
	return 0;
}