#pragma once

#include "coordinates.h"
#include "apple.h"
#include "../List/list.h"

typedef enum { right, down, left, up } direction;

typedef struct
{
	list* elements;
	direction direction;
} snake;

void initSnake(snake*, coordinates*);
void move(snake*);
int eatApple(snake*, apple*);
void findWay(snake*, apple*);
void pushOldTail(snake*, coordinates*);
void drawSnake(snake*);
void drawSnakeHead(snake*);
void destroySnake(snake*);