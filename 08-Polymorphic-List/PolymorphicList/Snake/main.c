#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "game.h"

int main(int argc, char** argv)
{
	srand((unsigned int)time(0));
	game* snakeGame = createGame();
	mainLoop(snakeGame);
	while (snakeGame->needRestart)
	{
		destroyGame(snakeGame);
		snakeGame = createGame();
		mainLoop(snakeGame);
	}
	destroyGame(snakeGame);
	return 0;
}