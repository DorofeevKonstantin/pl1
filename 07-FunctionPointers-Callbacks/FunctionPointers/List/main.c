#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

struct List
{
	int value;
	struct List* next;
};

typedef struct List list;

typedef void (*FunPtr)(list*);
typedef int (*ConditionPtr)(list*);

void setRandomValue(list* node)
{
	node->value = rand() % 20;
	node->next = 0;
}
void randomNodeAdd(list* head)
{
	list* current = head;
	while (current->next != 0)
		current = current->next;
	list* newNode = (list*)malloc(sizeof(list));
	current->next = newNode;
	setRandomValue(newNode);
}
void destroyList(list* head)
{
	list* current;
	while (head != 0)
	{
		current = head;
		head = head->next;
		free(current);
	}
}
int positive(list* node)
{
	if (node->value > 0)
		return 1;
	else
		return -1;
}
void output(list* node)
{
	printf("%d -> ", node->value);
}
void square(list* node)
{
	node->value = node->value * node->value;
}
void forAll(list* head, FunPtr action)
{
	list* current = head;
	while (current != 0)
	{
		action(current);
		current = current->next;
	}
}
void forAllIf(list* head, FunPtr action, ConditionPtr condition)
{
	list* current = head;
	while (current != 0)
	{
		if (condition(current) > 0)
			action(current);
		current = current->next;
	}
}
int main()
{
	srand((unsigned int)time(0));
	list* head = (list*)malloc(sizeof(list));
	setRandomValue(head);
	for (int i = 0; i < 10; ++i)
		randomNodeAdd(head);
	forAll(head, output);
	printf_s("\n");
	forAllIf(head, square, positive);
	forAll(head, output);
	printf_s("\n");
	destroyList(head);
	return 0;
}