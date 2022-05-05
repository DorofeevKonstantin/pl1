#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "sput.h"

#include "../MathLibrary/math.h"

static void testVowelsPresent()
{
	sput_fail_unless(countVowels("book") == 2, "book == 2v");
	sput_fail_unless(countVowels("hand") == 1, "hand == 1v");
	sput_fail_unless(countVowels("test") == 1, "test == 1v");
	sput_fail_unless(countVowels("Peter") == 2, "Peter == 2v");
	sput_fail_unless(countVowels("Apu") == 2, "Apu == 2v");
}
static void testNoVowelsPresent()
{
	sput_fail_unless(countVowels("GCC") == 0, "GCC == 0v");
	sput_fail_unless(countVowels("BBC") == 0, "BBC == 0v");
	sput_fail_unless(countVowels("CNN") == 0, "CNN == 0v");
	sput_fail_unless(countVowels("GPS") == 0, "GPS == 0v");
	sput_fail_unless(countVowels("Ltd") == 0, "Ltd == 0v");
}
static void testFastPower()
{
	sput_fail_unless(fastPower(2, 3) == 8, "2^3 == 8");
	sput_fail_unless(fastPower(0, 5) == 0, "0^5 == 0");
	sput_fail_unless(fastPower(10, 0) == 1, "10^0 == 1");
	sput_fail_unless(fastPower(-1, 8) == 1, "(-1)^8 == 1");
	sput_fail_unless(fastPower(5, 4) == 625, "5^4 == 625");
}
static void testBinarySearch()
{
	int mass[] = { -1,0,1,2,3,4,5,6,7,8,9 };
	sput_fail_unless(binarySearch(mass, 0, 10, 8) == 9, "position 8 == 9");
	sput_fail_unless(binarySearch(mass, 0, 10, -1) == 0, "position -1 == 0");
	sput_fail_unless(binarySearch(mass, 0, 10, 9) == 10, "position 9 == 10");
	sput_fail_unless(binarySearch(mass, 0, 10, -9) == -1, "position -9 == -1");
	sput_fail_unless(binarySearch(mass, 0, 10, 99) == -1, "position 99 == -1");
}
static void testMyAtoi()
{
	char* param = "123";
	sput_fail_unless(myAtoi(param) == atoi(param), param);
	param = "-123";
	sput_fail_unless(myAtoi(param) == atoi(param), param);
	char* buff = (char*)calloc(100, sizeof(char));
	if (buff)
	{
		for (int i = -100; i < 100; i++)
		{
			_itoa_s(i, buff, _countof(buff), 10);
			sput_fail_unless(myAtoi(buff) == atoi(buff), buff);
		}
		free(buff);
	}
}

int main(int argc, char* argv[])
{
	sput_start_testing();

	sput_enter_suite("countVowels testing(): Vowels Present");
	sput_run_test(testVowelsPresent);
	sput_enter_suite("countVowels testing(): No Vowels Present");
	sput_run_test(testNoVowelsPresent);

	sput_enter_suite("fastPower testing():");
	sput_run_test(testFastPower);

	sput_enter_suite("binarySearch testing():");
	sput_run_test(testBinarySearch);

	sput_enter_suite("myAtoi testing():");
	sput_run_test(testMyAtoi);

	sput_finish_testing();

	return sput_get_return_value();
}