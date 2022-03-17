#pragma once

typedef enum { triangle, rectangle } figureType;

typedef struct
{
	int x;
	int y;
} point;

typedef struct
{
	void* vptr;
	point* points;
	int count;
} figure;

figure** createFigures(size_t count);
figure* createFigure(figureType ftype);
void destroyFigures(figure** figures, size_t count);
void showFigures(figure** figures, size_t count);
void showFigure(figure* figure);