#include <stdio.h>
#include <stdlib.h>

#include "figure.h"

//////////////// vtables
#define size 5
typedef void (*vf)(void*);
vf* triangleVfunctions, * rectangleVfunctions;

void showPoints(void* figurePtr)
{
	figure* f = (figure*)figurePtr;
	printf_s("%d points : ", f->count);
	for (int i = 0; i < f->count; ++i)
	{
		printf_s("%d,%d ", f->points[i].x, f->points[i].y);
	}
	printf_s("\n");
}
void showTriangle(void* figurePtr)
{
	printf_s("Triangle ");
	showPoints(figurePtr);
}
void showRectangle(void* figurePtr)
{
	printf_s("Rectangle ");
	showPoints(figurePtr);
}
void destroyFigures(figure** figures, size_t count)
{
	for (size_t i = 0; i < count; ++i)
		free(figures[i]);
	free(figures);
}
figure** createFigures(size_t count)
{
	figure** figures = (figure**)malloc(count * sizeof(figure*));
	if (figures)
	{
		for (size_t i = 0; i < count; ++i)
			figures[i] = createFigure(rand() % 2);
	}
	return figures;
}
figure* createFigure(figureType ftype)
{
	figure* newFigure = (figure*)malloc(sizeof(figure));
	if (newFigure)
	{
		newFigure->count = rand() % 5 + 5;
		newFigure->points = (point*)malloc(newFigure->count * sizeof(point));
		for (int i = 0; i < newFigure->count; ++i)
		{
			(newFigure->points[i]).x = rand() % 10;
			(newFigure->points[i]).y = rand() % 10;
		}

		if (ftype == triangle)
		{
			if (triangleVfunctions == 0)
			{
				triangleVfunctions = (vf*)malloc(size * sizeof(void*));
				triangleVfunctions[0] = &showTriangle;
			}
			newFigure->vptr = (void*)triangleVfunctions;
		}
		else if (ftype == rectangle)
		{
			if (rectangleVfunctions == 0)
			{
				rectangleVfunctions = (vf*)malloc(size * sizeof(void*));
				rectangleVfunctions[0] = &showRectangle;
			}
			newFigure->vptr = (void*)rectangleVfunctions;
		}
	}
	return newFigure;
}
void showFigures(figure** figures, size_t count)
{
	for (size_t i = 0; i < count; ++i)
		showFigure(figures[i]);
}
void showFigure(figure* f)
{
	vf realFunction = *((vf*)(f->vptr));
	realFunction((void*)f);
}