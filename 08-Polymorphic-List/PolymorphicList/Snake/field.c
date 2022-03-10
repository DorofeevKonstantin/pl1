#include <stdio.h>

#include "field.h"
#include "graphics.h"

void drawField(field* f)
{
	for (size_t i = f->left; i <= (f->left)+(f->width); ++i)
	{
		gotoxy(i, f->top);
		printf_s("#");
		gotoxy(i, f->top + f->height);
		printf_s("#");
	}
	for (size_t i = f->top; i <= (f->top) + (f->height); ++i)
	{
		gotoxy(f->left, i);
		printf_s("#");
		gotoxy(f->left + f->width, i);
		printf_s("#");
	}
}