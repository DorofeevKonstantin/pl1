#include <iostream>

#include "geometry.hpp"
#include "person.hpp"
#include "safearray.hpp"

namespace kb
{
	// formulation of the problem in classes with dynamic fields
	class student
	{
	private:
		std::string name;
		size_t countGrades;
		int* grades;
	public:
		student() = default;
		student(std::string _name, size_t _countGrades) : name(_name), countGrades(_countGrades)
		{
			grades = new int[_countGrades];
			for (size_t i = 0; i < _countGrades; i++)
				grades[i] = rand() % 5;
		}
		~student()
		{
			delete[] grades;
		}
		void print()
		{
			std::cout << "Student : " << name << " ";
			for (size_t i = 0; i < countGrades; i++)
				std::cout << grades[i] << " ";
			std::cout << std::endl;
		}
		static void test()
		{
			student s1("Ivan", 5), s2;
			student s3(s1);
			s2.print();
			s3.print();
		}
	};
}

int main()
{
	//kb::student::test();
	triangle::test("triangles.txt");
	person::test("persons.txt");
	safearray::test();
	return 0;
}