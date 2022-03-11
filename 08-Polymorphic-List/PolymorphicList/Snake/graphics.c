#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

void setConsoleSize(int x, int y)
{
	HANDLE hCons;
	COORD crd;
	SMALL_RECT rct;
	crd.X = (short)x + 1;
	crd.Y = (short)y + 1;
	rct.Left = 0;
	rct.Top = 0;
	rct.Right = x;
	rct.Bottom = y;
	hCons = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleScreenBufferSize(hCons, crd);
	SetConsoleWindowInfo(hCons, 1, &rct);
}
void hideCursor()
{
	HANDLE hCons;
	CONSOLE_CURSOR_INFO cci;
	hCons = GetStdHandle(STD_OUTPUT_HANDLE);
	cci.dwSize = 1;
	cci.bVisible = 0;
	SetConsoleCursorInfo(hCons, &cci);
}
void clrScr()
{
	HANDLE hCons;
	CONSOLE_SCREEN_BUFFER_INFO csbi;
	COORD crd;
	int len;
	DWORD bRet;
	short x, y;
	char space = 0x20;
	hCons = GetStdHandle(STD_OUTPUT_HANDLE);
	GetConsoleScreenBufferInfo(hCons, &csbi);
	x = csbi.dwSize.X;
	y = csbi.dwSize.Y;
	len = (int)x * y;
	crd.X = 0;
	crd.Y = 0;
	FillConsoleOutputCharacter(hCons, space, len, crd, &bRet);
}
void gotoXY(size_t column, size_t row)
{
	HANDLE hCons;
	COORD crd;
	hCons = GetStdHandle(STD_OUTPUT_HANDLE);
	//#ifdef MY_DEBUG
	//  if (hCons == INVALID_HANDLE_VALUE || hCons == 0) printf("\nERROR!!!\n");
	//#endif  	  
	crd.X = (short)column;
	crd.Y = (short)row;
	//#ifedf MY_DEBUG
	// if (SetConsoleCursorPosition(hCons,crd) == 0) printf("\nERROR2\n");
	//#else 
	SetConsoleCursorPosition(hCons, crd);
	//#endif
}