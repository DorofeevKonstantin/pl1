#include <stdio.h>

double square(double);

int main()
{
	double value = 5;
	printf("%lf ^ 2 == %lf\n", value, square(value));
	return 0;
}