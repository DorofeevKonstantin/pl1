#pragma once

#include "coordinates.h"
#include "field.h"

typedef struct
{
	coordinates position;
} apple;


void generateApple(field*, apple*);
void drawApple(apple*);