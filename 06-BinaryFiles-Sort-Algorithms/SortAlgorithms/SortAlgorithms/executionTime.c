#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "executionTime.h"

clock_t startTimeMeasure()
{
	clock_t start = clock();
	return start;
}

void stopTimeMeasure(clock_t start)
{
	clock_t end = clock();
	double difference = (double)(end - start) / CLOCKS_PER_SEC;
	printf_s("%d ms spended\n", (int)(difference * 1000));
}

void timeMeasurementExample()
{
	// START clock() or time()
	clock_t start = startTimeMeasure();
	const size_t size = 50000;
	int* mass = (int*)malloc(size * sizeof(int));
	for (size_t i = 0; i < size; i++)
	{
		mass[i] = (int)(size - i);
	}
	for (size_t i = 0; i < size; i++)
	{
		for (size_t j = i; j < size - 1; j++)
		{
			if (mass[j] > mass[j + 1])
			{
				int tmp = mass[j];
				mass[j] = mass[j + 1];
				mass[j + 1] = tmp;
			}
		}
	}
	free(mass);
	stopTimeMeasure(start);
	// END
}