#pragma once

#include <string>

class person
{
private:
	std::string name;
	size_t age;
	std::string phoneNumber;
public:
	person(std::string _name = "", size_t _age = 0, std::string _phoneNumber = "");
	void print() const;
	static void test(const std::string& fileName);
};