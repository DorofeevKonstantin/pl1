#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "figure.h"

int main()
{
	srand((unsigned int)time(0));
	size_t count = 10;
	figure** figures = createFigures(count);
	showFigures(figures, count);
	destroyFigures(figures, count);
	return 0;
}