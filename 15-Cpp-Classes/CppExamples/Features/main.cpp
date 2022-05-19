#include <iostream>
#include <string>

// c++ standard library -> namespace std

struct complex
{
	double re;
	double im;
	void print()
	{
		std::cout << re << "," << im << std::endl;
	}
};

int main()
{
	complex c1 = { 1,2 }, c2, c3;
	c1.print();
	return 0;
}