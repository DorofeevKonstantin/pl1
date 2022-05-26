#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <clocale>

class book
{
private:
	std::string author;
	std::string name;
	size_t pagesCount;
	size_t publishingYear;
public:
	book(std::string _author = "", std::string _name = "",
		size_t _pagesCount = 0, size_t _publishingYear = 0) :
		author(_author), name(_name),
		pagesCount(_pagesCount), publishingYear(_publishingYear)
	{

	}
	void print() const
	{
		std::cout << "book: " << author << "," << name << "," << pagesCount << "," << publishingYear << std::endl;
	}
	size_t getPagesCount() const
	{
		return this->pagesCount;
	}
	size_t getPublishingYear() const
	{
		return this->publishingYear;
	}
};

bool bookIsModern(const book& b)
{
	if (b.getPagesCount() > 1000 && b.getPublishingYear() > 1990)
		return true;
	return false;
}

class library
{
private:
	std::vector<book> books;
public:
	library(const std::string& fileName)
	{
		std::string currentAuthor, currentName;
		size_t currentPagesCount, currentPublishingYear;
		std::ifstream booksFile(fileName);
		while (!booksFile.eof())
		{
			booksFile >> currentAuthor >> currentName >> currentPagesCount >> currentPublishingYear;
			books.push_back(book(currentAuthor, currentName, currentPagesCount, currentPublishingYear));
		}
	}
	void print()
	{
		std::cout << "Library books:" << std::endl;
		for (const book& b : books)
			b.print();
	}
	void printModernBooks()
	{
		std::cout << "Library modern books:" << std::endl;
		for (const book& b : books)
		{
			if (bookIsModern(b))
				b.print();
		}
	}
};


int main()
{
	setlocale(LC_ALL, "Russian");
	library l1("books.txt");
	l1.print();
	l1.printModernBooks();
	return 0;
}