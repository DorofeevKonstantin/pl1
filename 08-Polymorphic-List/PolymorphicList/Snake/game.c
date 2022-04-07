#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <Windows.h>

#include "game.h"
#include "coordinates.h"
#include "apple.h"
#include "snake.h"
#include "field.h"
#include "graphics.h"

game* createGame()
{
	game* g = (game*)malloc(sizeof(game));
	if (g)
	{
		clrScr();
		g->snakesCount = 1;
		g->snakes = (snake*)malloc(g->snakesCount * sizeof(snake));
		if (g->snakes)
		{
			coordinates startPosition = { 3,2 };
			for (size_t i = 0; i < g->snakesCount; i++)
				initSnake(&(g->snakes[i]), &startPosition);
		}
		g->field.left = 0;
		g->field.top = 0;
		g->field.width = 40;
		g->field.height = 20;
		generateApple(&(g->field), &(g->apple));
		g->sleepValue = 100;
		g->needRestart = 0;
	}
	return g;
}
static void drawSymbol(coordinates* c, char symbol)
{
	gotoXY(c->x, c->y);
	printf_s("%c", symbol);
}
static char getKeyPressed()
{
	char keyPressed = ' ';
	if (_kbhit())
		keyPressed = _getch();
	return keyPressed;
}
static int analyzeInput(game* g)
{
	int wantToQuit = 0;
	char keyPressed = getKeyPressed();
	if (keyPressed == 'q')
		wantToQuit = 1;
	else if (keyPressed == '1')
		g->sleepValue = 100;
	else if (keyPressed == '2')
		g->sleepValue = 500;
	else if (keyPressed == '3')
		g->sleepValue = 2000;
	else if (keyPressed == '0')
		g->sleepValue = 1;
	else if (keyPressed == 'r')
	{
		g->needRestart = 1;
		wantToQuit = 1;
	}
	return wantToQuit;
}
void mainLoop(game* g)
{
	hideCursor();
	drawField(&(g->field));
	drawApple(&(g->apple));
	for (size_t i = 0; i < g->snakesCount; i++)
		drawSnake(&(g->snakes[i]));

	while (1)
	{
		if (analyzeInput(g) == 1)
			break;
		for (size_t i = 0; i < g->snakesCount; i++)
		{
			coordinates* oldTailPtr = (coordinates*)getTailValue(g->snakes[i].elements);
			coordinates oldTailPosition = { oldTailPtr->x, oldTailPtr->y };
			findWay(&(g->snakes[i]), &(g->apple));
			move(&(g->snakes[i]));
			drawSnakeHead(&(g->snakes[i]));
			int appleEaten = eatApple(&(g->snakes[i]), &(g->apple));
			if (appleEaten)
			{
				pushOldTail(&(g->snakes[i]), &oldTailPosition);
				generateApple(&(g->field), &(g->apple));
				drawApple(&(g->apple));
			}
			else
				drawSymbol(&oldTailPosition, ' ');
		}
		Sleep((DWORD)g->sleepValue);
	}
}
void destroyGame(game* g)
{
	clrScr();
	if (g)
	{
		for (size_t i = 0; i < g->snakesCount; i++)
			destroySnake(&(g->snakes[i]));
		free(g->snakes);
	}
	free(g);
}