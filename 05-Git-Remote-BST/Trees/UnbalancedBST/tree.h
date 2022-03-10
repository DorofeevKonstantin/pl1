#pragma once

struct Node
{
	struct Node* left;
	struct Node* right;
	int value;
};

typedef struct Node node;

struct Tree
{
	node* root;
};

typedef struct Tree tree;

tree* createTree();
void generateTree(tree*, int*, int);
void destroyTree(tree*);
void outputInorderRecursive(tree*);
void outputInorderStack(tree*);
int getNodeHeight(tree*, int);