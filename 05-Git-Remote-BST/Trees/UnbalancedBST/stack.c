#include <stdio.h>
#include <stdlib.h>

#include "stack.h"

stack* createStack()
{
	stack* s = (stack*)malloc(sizeof(stack));
	if (s)
		s->position = 0;
	return s;
}
node* top(stack* s)
{
	if (s->position >= 0 && s->position < MAX_SIZE)
		return s->data[s->position];
	else
		printf_s("stack overflowed\n");
	return 0;
}
node* pop(stack* s)
{
	node* value = 0;
	if (s->position >= 0 && s->position < MAX_SIZE)
	{
		value = s->data[s->position];
		s->data[s->position] = 0;
		s->position--;
	}
	else if (s->position >= MAX_SIZE)
		printf_s("stack overflowed\n");
	else if (s->position == 0)
		printf_s("Empty\n");
	return value;
}
int push(stack* s, node* value)
{
	if (s->position >= 0 && s->position < MAX_SIZE)
	{
		s->position++;
		s->data[s->position] = value;
		return 1;
	}
	return 0;
}
int isEmpty(stack* s)
{
	if (s->position == 0)
		return 1;
	else
		return 0;
}
void destroyStack(stack* s)
{
	if (s != 0)
		free(s);
}