#pragma once

#include "tree.h"

typedef struct
{
#define MAX_SIZE 100
	node* data[MAX_SIZE];
	int position;
} stack;

stack* createStack();
node* top(stack* s);
node* pop(stack* s);
int push(stack* s, node* value);
int isEmpty(stack* s);
void destroyStack(stack* s);