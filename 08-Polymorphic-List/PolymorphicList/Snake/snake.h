#pragma once

#include "coordinates.h"
#include "apple.h"
#include "../List/list.h"

enum Direction { right, down, left, up };
typedef enum Direction direction;

struct Snake
{
	list* elements;
	direction direction;
};

typedef struct Snake snake;

void initSnake(snake*, coordinates*);
void move(snake*);
int eatApple(snake*, apple*);
void findWay(snake*, apple*);
void saveOldTail(snake*, coordinates*);
void drawSnake(snake*);
void drawSnakeHead(snake*);
void destroySnake(snake*);