#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

#include "person.hpp"

person::person(std::string _name, size_t _age, std::string _phoneNumber) : name(_name), age(_age), phoneNumber(_phoneNumber)
{

}
void person::print() const
{
	std::cout << "person: " << this->name << " " << this->age << " " << this->phoneNumber << std::endl;
}
void person::test(const std::string& fileName)
{
	std::vector<person> persons;
	std::ifstream personsFile(fileName);
	std::string currentName, currentPhoneNumber;
	size_t currentAge;
	while (!personsFile.eof())
	{
		personsFile >> currentName >> currentAge >> currentPhoneNumber;
		persons.push_back(person(currentName, currentAge, currentPhoneNumber));
	}
	std::cout << "Persons:" << std::endl;
	for (const person& p : persons)
		p.print();
	std::sort(persons.begin(), persons.end(), [](const person& left, const person& right)
		{
			return left.age < right.age;
		});
	std::cout << "Persons sorted by age:" << std::endl;
	for (const person& p : persons)
		p.print();
	std::sort(persons.begin(), persons.end(), [](const person& left, const person& right)
		{
			return left.name > right.name;
		});
	std::cout << "Persons sorted by name descending:" << std::endl;
	for (const person& p : persons)
		p.print();
}