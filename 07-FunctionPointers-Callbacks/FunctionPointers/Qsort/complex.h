#pragma once

struct Complex
{
	double Re;
	double Im;
};

typedef struct Complex complex;

int modulCompare(const void* lhs, const void* rhs);
void outputComplexArray(complex* mass, int len);