#pragma once

struct Node
{
	struct Node* left;
	struct Node* right;
	int value;
};

typedef struct Node node;

typedef struct
{
	node* root;
} tree;

tree* createTree();
void generateTree(tree*, int*, int);
void destroyTree(tree*);
void outputInorderRecursive(tree*);
void outputInorderStack(tree*);
int getNodeHeight(tree*, int);