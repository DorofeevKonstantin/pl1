#include <stdio.h>
#include <stdlib.h>

#include "tree.h"
#include "stack.h"

static void addNode(node* root, int value)
{
	node* current = root;
	node* last = 0;
	while (current != 0)
	{
		last = current;
		if (value < current->value)
			current = current->left;
		else if (value > current->value)
			current = current->right;
		else
			return;
	}
	current = (node*)malloc(sizeof(node));
	if (current)
	{
		current->value = value;
		current->left = 0;
		current->right = 0;
		if (last)
		{
			if (value < last->value)
				last->left = current;
			else
				last->right = current;
		}
	}
}
tree* createTree()
{
	tree* t = (tree*)malloc(sizeof(tree));
	return t;
}
void generateTree(tree* t, int* values, int count)
{
	if (t)
	{
		node* r = (node*)malloc(sizeof(node));
		if (r)
		{
			r->left = 0;
			r->right = 0;
			r->value = values[0];
			for (int i = 1; i < count; ++i)
				addNode(r, values[i]);
			t->root = r;
		}
	}
}
static void destroyNode(node* current)
{
	if (current->left != 0)
		destroyNode(current->left);
	if (current->right != 0)
		destroyNode(current->right);
	free(current);
}
void destroyTree(tree* t)
{
	destroyNode(t->root);
	free(t);
}
static void outputInorderRecursiveNode(node* current)
{
	if (current == 0)
		return;
	outputInorderRecursiveNode(current->left);
	printf_s("%d ", current->value);
	outputInorderRecursiveNode(current->right);
}
void outputInorderRecursive(tree* t)
{
	outputInorderRecursiveNode(t->root);
}
void outputInorderStack(tree* t)
{
	stack* s = createStack();
	node* r = t->root;
	while (r != 0 || !isEmpty(s))
	{
		if (r != 0)
		{
			push(s, r);
			r = r->left;
		}
		else
		{
			r = (node*)pop(s);
			printf_s("%d ", r->value);
			r = r->right;
		}
	}
	destroyStack(s);
	printf_s("\n");
}
int getNodeHeight(tree* t, int value)
{
	int nodeHeight = 0;
	node* r = t->root;
	while (r != 0 && r->value != value)
	{
		if (value < r->value)
			r = r->left;
		else
			r = r->right;
		++nodeHeight;
	}
	if (r == 0)
		return -1;
	return nodeHeight;
}