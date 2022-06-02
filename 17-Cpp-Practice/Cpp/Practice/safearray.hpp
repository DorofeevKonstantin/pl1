#pragma once

#include <iostream>
#include <random>
#include <exception>

class safearray
{
private:
	size_t size;
	int* data;
public:
	safearray(size_t _size = 0) :size(_size), data(nullptr)
	{
		if (size > 0)
			data = new int[size];
	}
	~safearray()
	{
		delete[] data;
	}
	void fillRandom()
	{
		std::random_device rd;
		std::mt19937 gen(rd());
		for (size_t i = 0; i < size; i++)
			data[i] = gen() % size;
	}
	int& operator[](size_t index)
	{
		if (index < size)
			return data[index];
		else
		{
			throw std::range_error("bad index in safearray");
		}
	}
	void print()
	{
		std::cout << "safearray: ";
		for (unsigned int i = 0; i < size; i++)
			std::cout << data[i] << " ";
		std::cout << std::endl;
	}
	static void test();
};