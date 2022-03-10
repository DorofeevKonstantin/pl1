#pragma once

#include "coordinates.h"
#include "apple.h"
#include "field.h"
#include "snake.h"

struct Game
{
	size_t snakesCount;
	field field;
	apple apple;
	snake* snakes;
	size_t sleepValue;
	int needRestart;
};

typedef struct Game game;

game* createGame();
void mainLoop(game*);
void destroyGame(game*);