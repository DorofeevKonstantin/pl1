#include <stdio.h>
#include <math.h>

#define TYPE_NAME(X) _Generic((X), \
      int: "int", \
      char: "char", \
      char*: "string", \
      float: "float", \
      double: "double", \
      default: "unknown")

void simpleExample()
{
	int value = 42;
	printf_s("Value is %s\n\n", _Generic(value, int : "integer", char : "character", default: "unknown"));
}

void typeNameExample()
{
	printf_s("Type name of 42.42 : %s\n", TYPE_NAME(42.42));
	printf_s("Type name of 1 : %s\n", TYPE_NAME(1));
	printf_s("Type name of 3.14f : %s\n", TYPE_NAME(3.14f));
	char c = 's';
	printf_s("Type name of 's' : %s\n", TYPE_NAME(c));
	printf_s("Type name of \"Hello\" : %s\n\n", TYPE_NAME("Hello"));
}

typedef struct
{
	double x;
	double y;
} vec2d;

#define SUMM(X, Y) _Generic((X),                    \
                            int: sum2l,             \
                            long: sum2l,            \
                            double: sum2d,          \
                            float: sum2d,           \
                            vec2d: sum2v)((X), (Y))

long sum2l(long x, long y)
{
	return x + y;
}
double sum2d(double x, double y)
{
	return x + y;
}
vec2d sum2v(vec2d a, vec2d b)
{
	vec2d r = { a.x + b.x, a.y + b.y };
	return r;
}
void summsExample()
{
	printf_s("5+3 == %ld\n5.0+3.14 == %lf\n", SUMM(5, 3), SUMM(5.0, 3.14));
	vec2d a = { 1.0, 2.5 };
	vec2d b = { 3.0, 3.5 };
	vec2d r = SUMM(a, b);
	printf("{1.0,2.5} + {3.0,3.5} == {%lf,%lf}\n\n", r.x, r.y);
}

#define printFormat(x) _Generic((x), \
    char: "%c\n", \
    unsigned char: "%hhu\n", \
    short: "%hd\n", \
    unsigned short: "%hu\n", \
    int: "%d\n", \
    unsigned int: "%u\n", \
    long int: "%ld\n", \
    unsigned long int: "%lu\n", \
    long long int: "%lld\n", \
    unsigned long long int: "%llu\n", \
    float: "%f\n", \
    double: "%f\n", \
    long double: "%Lf\n", \
    char*: "%s\n", \
    void*: "%p\n")

#define print(x) printf_s(printFormat(x), x)

void printExample()
{
	print(123);
	print(3.14);
	char c = 's';
	print(c);
	print("hello");
}

int main()
{
	simpleExample();
	typeNameExample();
	summsExample();
	printExample();
	return 0;
}