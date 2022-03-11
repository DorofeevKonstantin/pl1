#pragma once

typedef struct
{
	size_t left;
	size_t top;
	size_t width;
	size_t height;
} field;

void drawField(field* f);