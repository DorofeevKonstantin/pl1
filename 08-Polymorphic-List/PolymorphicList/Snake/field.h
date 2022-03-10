#pragma once

struct Field
{
	size_t left;
	size_t top;
	size_t width;
	size_t height;
};

typedef struct Field field;

void drawField(field* f);