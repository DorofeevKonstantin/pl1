#include <stdio.h>
#include <stdlib.h>

#include "snake.h"
#include "graphics.h"

void coordinatesCopy(void** dst, void* src)
{
	coordinates* srcCoordinates = (coordinates*)src;
	coordinates* dstCoordinates = (coordinates*)malloc(sizeof(coordinates));
	if (dstCoordinates)
	{
		dstCoordinates->x = srcCoordinates->x;
		dstCoordinates->y = srcCoordinates->y;
		*dst = (void*)dstCoordinates;
	}
}
void coordinatesPrint(void* data)
{
}
void coordinatesFree(void* data)
{
	free(data);
}
void initSnake(snake* s, coordinates* position)
{
	s->direction = right;
	s->elements = createList(coordinatesCopy, coordinatesPrint, coordinatesFree);
	pushBack(s->elements, (void*)position);
	(position->x)--;
	pushBack(s->elements, (void*)position);
}
void move(snake* s)
{
	node* current = s->elements->tail;
	if (current != 0)
	{
		while (current->prev != 0)
		{
			((coordinates*)(current->value))->x = ((coordinates*)(current->prev->value))->x;
			((coordinates*)(current->value))->y = ((coordinates*)(current->prev->value))->y;
			current = current->prev;
		}
	}
	switch (s->direction)
	{
	case right:
		((coordinates*)getHeadValue(s->elements))->x++;
		break;
	case down:
		((coordinates*)getHeadValue(s->elements))->y++;
		break;
	case left:
		((coordinates*)getHeadValue(s->elements))->x--;
		break;
	case up:
		((coordinates*)getHeadValue(s->elements))->y--;
		break;
	default:
		break;
	}
}
int eatApple(snake* s, apple* apple)
{
	int result = 0;
	coordinates* headPosition = (coordinates*)getHeadValue(s->elements);
	if (headPosition->x == apple->position.x && headPosition->y == apple->position.y)
		result = 1;
	return result;
}
void findWay(snake* s, apple* apple)
{
	coordinates* headPosition = (coordinates*)getHeadValue(s->elements);
	if (headPosition->x < apple->position.x)
	{
		if (s->direction != left)
			s->direction = right;
		else
			s->direction = down;
	}
	else if (headPosition->x > apple->position.x)
	{
		if (s->direction != right)
			s->direction = left;
		else
			s->direction = down;
	}
	else if (headPosition->y < apple->position.y)
	{
		if (s->direction != up)
			s->direction = down;
		else
			s->direction = right;
	}
	else if (headPosition->y > apple->position.y)
	{
		if (s->direction != down)
			s->direction = up;
		else
			s->direction = right;
	}
}
void pushOldTail(snake* s, coordinates* oldTail)
{
	pushBack(s->elements, (void*)oldTail);
}
void drawElement(void* data)
{
	coordinates* coord = (coordinates*)data;
	gotoXY(coord->x, coord->y);
	printf_s("*");
}
void drawSnake(snake* s)
{
	forEach(s->elements, drawElement);
}
void drawSnakeHead(snake* s)
{
	coordinates* headPosition = (coordinates*)getHeadValue(s->elements);
	gotoXY(headPosition->x, headPosition->y);
	printf_s("*");
}
void destroySnake(snake* s)
{
	destroyList(s->elements);
}