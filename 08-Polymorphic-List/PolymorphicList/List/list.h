#pragma once

typedef void (*fPtrCopy)(void**, void*);

typedef void (*fPtrPrint)(void*);

typedef void (*fPtrFree)(void*);

typedef void (*fPtrAction)(void*);

struct Node
{
	struct Node* prev;
	void* value;
	struct Node* next;
};

typedef struct Node node;

typedef struct
{
	node* head;
	node* tail;
	size_t size;
	fPtrCopy copyDataFunction;
	fPtrPrint printDataFunction;
	fPtrFree freeDataFunction;
} list;

list* createList(fPtrCopy, fPtrPrint, fPtrFree);
void pushBack(list*, void*);
void pushFront(list*, void*);
size_t getSize(list*);
void printList(list*);
void forEach(list*, fPtrAction);
void destroyList(list*);
void* getTailValue(list*);
void* getHeadValue(list*);