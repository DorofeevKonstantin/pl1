#pragma once

#include "coordinates.h"
#include "field.h"

struct Apple
{
	coordinates position;
};

typedef struct Apple apple;

void generateApple(field*, apple*);
void drawApple(apple*);