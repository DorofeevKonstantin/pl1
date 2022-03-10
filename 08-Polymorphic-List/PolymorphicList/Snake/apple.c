#include <stdio.h>
#include <stdlib.h>

#include "apple.h"
#include "graphics.h"

void generateApple(field* f, apple* a)
{
	a->position.x = rand() % (f->width - 1) + 1;
	a->position.y = rand() % (f->height - 1) + 1;
}
void drawApple(apple* a)
{
	gotoxy(a->position.x, a->position.y);
	printf_s("@");
}