#include <stdio.h>
#include <stdlib.h>

#include "list.h"

list* createList(fPtrCopy fCopy, fPtrPrint fPrint, fPtrFree fFree)
{
	//printf_s("createList\n");
	list* l = (list*)malloc(sizeof(list));
	if (l)
	{
		l->head = 0;
		l->tail = 0;
		l->size = 0;
		l->copyDataFunction = fCopy;
		l->printDataFunction = fPrint;
		l->freeDataFunction = fFree;
	}
	return l;
}
void pushBack(list* l, void* newData)
{
	node* newNode = (node*)malloc(sizeof(node));
	if (newNode)
	{
		l->copyDataFunction(&(newNode->value), newData);
		newNode->next = 0;
		newNode->prev = 0;

		if (l->head == 0) // empty list
			l->head = newNode;
		else if (l->tail == 0) // 1 element in list
		{
			l->tail = newNode;
			l->tail->prev = l->head;
			l->head->next = l->tail;
		}
		else // n elements in list
		{
			l->tail->next = newNode;
			newNode->prev = l->tail;
			l->tail = newNode;
		}
		l->size++;
	}
}
void pushFront(list* l, void* newData)
{
	node* newNode = (node*)malloc(sizeof(node));
	if (newNode)
	{
		l->copyDataFunction(&(newNode->value), newData);
		newNode->next = 0;
		newNode->prev = 0;

		if (l->head == 0) // empty list
			l->head = newNode;
		else if (l->tail == 0) // 1 element in list
		{
			l->tail = l->head;
			l->head = newNode;
			l->head->next = l->tail;
			l->tail->prev = l->head;
		}
		else // n elements in list
		{
			l->head->prev = newNode;
			newNode->next = l->head;
			l->head = newNode;
		}
		l->size++;
	}
}
size_t getSize(list* l)
{
	return l->size;
}
void printList(list* l)
{
	//printf_s("printList : \n");
	node* current = l->head;
	while (current != 0)
	{
		l->printDataFunction(current->value);
		if (current->next != 0)
			printf_s(" -> ");
		current = current->next;
	}
	printf_s("\n");
}
void forEach(list* l, fPtrAction action)
{
	node* current = l->head;
	while (current != 0)
	{
		action(current->value);
		current = current->next;
	}
}
void destroyList(list* l)
{
	//printf_s("destroyList\n");
	node* current = l->head;
	node* nextNode = 0;
	while (current != 0)
	{
		nextNode = current->next;
		l->freeDataFunction(current->value);
		free(current);
		current = nextNode;
	}
	free(l);
}
void* getTailValue(list* l)
{
	return (l == 0 || l->tail == 0) ? 0 : l->tail->value;
}
void* getHeadValue(list* l)
{
	return (l == 0 || l->head == 0) ? 0 : l->head->value;
}