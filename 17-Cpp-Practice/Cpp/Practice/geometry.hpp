#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <string>

bool almostEqual(double a, double b)
{
	return std::fabs(a - b) < std::numeric_limits<double>::epsilon();
}

class point2D
{
private:
	double x;
	double y;
public:
	point2D(double _x, double _y) :x(_x), y(_y) {}
	void print() const
	{
		std::cout << x << "," << y;
	}
	double getX()const
	{
		return this->x;
	}
	double getY()const
	{
		return this->y;
	}
	double distanceTo(const point2D& to)
	{
		return sqrt((to.x - this->x) * (to.x - this->x) + (to.y - this->y) * (to.y - this->y));
	}
};

class triangle
{
private:
	std::vector<point2D> points;
	std::vector<double> sides;
	double perimeter;
	double area;
public:
	triangle(point2D p1, point2D p2, point2D p3)
	{
		points.push_back(p1);
		points.push_back(p2);
		points.push_back(p3);
		double distanceP1P2 = points[0].distanceTo(points[1]);
		double distanceP2P3 = points[1].distanceTo(points[2]);
		double distanceP3P1 = points[2].distanceTo(points[0]);
		sides.push_back(distanceP1P2);
		sides.push_back(distanceP2P3);
		sides.push_back(distanceP3P1);
		perimeter = distanceP1P2 + distanceP2P3 + distanceP3P1;
		double semiPerimeter = perimeter / 2;
		area = sqrt(semiPerimeter * (semiPerimeter - sides[0]) * (semiPerimeter - sides[1]) * (semiPerimeter - sides[2]));
	}
	bool isEquilateral() const
	{
		if (almostEqual(sides[0], sides[1]))
			if (almostEqual(sides[0], sides[2]))
				return true;
		return false;
	}
	double getPerimeter() const
	{
		return perimeter;
	}
	double getArea() const
	{
		return area;
	}
	void print() const
	{
		std::cout << "triangle: ";
		for (const point2D& p : points)
		{
			p.print();
			std::cout << " ";
		}
		std::cout << " perimeter:" << perimeter << " area: " << area << std::endl;
	}
	static void test(const std::string& fileName)
	{
		std::vector<triangle> triangles;
		std::ifstream trianglesFile(fileName);
		double x, y;
		while (!trianglesFile.eof())
		{
			trianglesFile >> x >> y;
			point2D p1(x, y);
			trianglesFile >> x >> y;
			point2D p2(x, y);
			trianglesFile >> x >> y;
			point2D p3(x, y);
			triangles.push_back(triangle(p1, p2, p3));
		}
		std::cout << "Triangles:" << std::endl;
		for (const triangle& t : triangles)
			t.print();
		std::sort(triangles.begin(), triangles.end(), [](const triangle& left, const triangle& right)
			{
				return left.getArea() < right.getArea();
			});
		std::cout << "Triangles sorted by area:" << std::endl;
		for (const triangle& t : triangles)
			t.print();
		std::sort(triangles.begin(), triangles.end(), [](const triangle& left, const triangle& right)
			{
				return left.getPerimeter() > right.getPerimeter();
			});
		std::cout << "Triangles sorted by perimeter descending:" << std::endl;
		for (const triangle& t : triangles)
			t.print();
	}
};