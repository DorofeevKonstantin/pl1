#include <stdio.h>
#include <windows.h>
#include <conio.h>

int main()
{
	WIN32_FIND_DATA FindFileData;
	HANDLE hf;
	hf = FindFirstFile("*.*", &FindFileData);
	if (hf != INVALID_HANDLE_VALUE)
	{
		do 
		{
			printf("%s\n", FindFileData.cFileName);
		} while (FindNextFile(hf, &FindFileData) != 0);
		FindClose(hf);
	}
	_getch();
	return 0;
}