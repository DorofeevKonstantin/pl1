#pragma once

typedef void(*FnPtr)(int*);

void outputValue(int* value);
void forAll(int* mass, int size, FnPtr action);
int simpleCompare(const void* lhs, const void* rhs);
int compareOddEvenSubgroups(const void* lhs, const void* rhs);