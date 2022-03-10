#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "list.h"

void intCopy(void** dst, void* src)
{
	int intData = (int)src;
	*dst = (void*)intData;
}
void intPrint(void* data)
{
	int intData = (int)data;
	printf_s("%d", intData);
}
void intFree(void* data)
{

}
void intListTest()
{
	list* intList = createList(intCopy, intPrint, intFree);
	int newValue = 1;
	pushBack(intList, (void*)newValue);
	newValue = 2;
	pushBack(intList, (void*)newValue);
	newValue = 3;
	pushBack(intList, (void*)newValue);
	printList(intList);
	destroyList(intList);
	printf_s("\n");
}

void stringCopy(void** dst, void* src)
{
	char* stringData = (char*)src;
	size_t length = strlen(src);
	*dst = (char*)malloc((length + 1) * sizeof(char));
	strcpy_s(*dst, length + 1, src);
}
void stringPrint(void* data)
{
	char* stringData = (char*)data;
	printf_s("%s", stringData);
}
void stringFree(void* data)
{
	free(data);
}
void stringListTest()
{
	list* stringList = createList(stringCopy, stringPrint, stringFree);
	char* newValue = "123";
	pushBack(stringList, (void*)newValue);
	newValue = "456";
	pushBack(stringList, (void*)newValue);
	newValue = "Hello, world!";
	pushBack(stringList, (void*)newValue);
	printList(stringList);
	destroyList(stringList);
	printf_s("\n");
}

typedef struct
{
	int* mass;
	size_t size;
} myArray;
void myArrayListCopy(void** dst, void* src)
{
	myArray* srcArr = (myArray*)src;
	*dst = (myArray*)malloc(sizeof(myArray));
	if (*dst)
	{
		((myArray*)(*dst))->size = srcArr->size;
		((myArray*)(*dst))->mass = (int*)malloc(srcArr->size * sizeof(int));
		memcpy_s(((myArray*)(*dst))->mass, ((myArray*)(*dst))->size * sizeof(int), srcArr->mass, srcArr->size * sizeof(int));
	}
}
void myArrayListPrint(void* data)
{
	myArray* arr = (myArray*)data;
	for (size_t i = 0; i < arr->size; i++)
		printf_s("%d ", arr->mass[i]);
}
void myArrayListFree(void* data)
{
	myArray* arr = (myArray*)data;
	free(arr->mass);
	free(arr);
}
myArray* generateMyArray(size_t _size)
{
	myArray* result = (myArray*)malloc(sizeof(myArray));
	if (result)
	{
		result->size = _size;
		result->mass = (int*)malloc(result->size * sizeof(int));
		if (result->mass)
		{
			for (size_t i = 0; i < result->size; i++)
				result->mass[i] = rand() % _size;
		}
	}
	return result;
}
void myArrayListTest()
{
	list* myArrayList = createList(myArrayListCopy, myArrayListPrint, myArrayListFree);
	pushBack(myArrayList, (void*)generateMyArray(4));
	pushBack(myArrayList, (void*)generateMyArray(6));
	pushBack(myArrayList, (void*)generateMyArray(3));
	printList(myArrayList);
	destroyList(myArrayList);
	printf_s("\n");
}

int main(int argc, char** argv)
{
	srand((unsigned int)time(0));
	intListTest();
	stringListTest();
	myArrayListTest();
	return 0;
}