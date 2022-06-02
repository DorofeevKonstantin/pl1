#include "safearray.hpp"

#include <vector>
#include <algorithm>

void safearray::test()
{
	safearray s1(10);
	s1.fillRandom();
	s1.print();
	s1[0] = 999;
	std::cout << "s1[0]==" << s1[0] << std::endl;
	try
	{
		s1[10] = 999;
	}
	catch (const std::range_error& exception)
	{
		std::cout << "exception: " << exception.what() << std::endl;
	}
	s1.print();
}