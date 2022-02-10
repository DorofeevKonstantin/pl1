#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <time.h>
#include <FCNTL.H>
#include <io.h>
#include <malloc.h>
#include <windowsx.h>

const char g_szClassName[] = "myWindowClass";
int xPos = 0, yPos = 0, countPressed = 0;
HWND hButton1, hButton2;
HWND HwndStatic1, HwndStatic2, HwndStatic3, hwnd;
HINSTANCE hIns;             // описатель приложения

#define BT_1		201
#define BT_2		203
#define ST_1        202
#define ST_2        204
#define ST_3        205

void CreateControlWindowsMain(HWND hwnd)
{
    hButton1 = CreateWindow(L"button", L"button",
        WS_VISIBLE | WS_CHILD | BS_NOTIFY,
        500, 100,
        150, 50,
        hwnd, (HMENU)BT_1, hIns, NULL);
    SetWindowText(hButton1, L"PressMe");

    hButton2 = CreateWindow(L"button", L"button",
        WS_VISIBLE | WS_CHILD | BS_NOTIFY,
        500, 200,
        150, 50,
        hwnd, (HMENU)BT_2, hIns, NULL);
    SetWindowText(hButton2, L"WindowSize");

    HwndStatic1 = CreateWindow(L"static", NULL,
        WS_CHILD | WS_VISIBLE | WS_BORDER | ES_NUMBER,
        10, 10,
        300, 100,
        hwnd, (HMENU)ST_1, hIns, NULL);
    SetWindowText(HwndStatic1, L"events");

    HwndStatic2 = CreateWindow(L"edit", NULL,
        WS_CHILD | WS_VISIBLE | ES_LEFT | ES_MULTILINE | ES_AUTOVSCROLL | ES_AUTOHSCROLL,
        10, 210,
        300, 100,
        hwnd, (HMENU)ST_2, hIns, NULL);
    SetWindowText(HwndStatic2, L"width:");

    HwndStatic3 = CreateWindow(L"edit", NULL,
        WS_CHILD | WS_VISIBLE | ES_LEFT | ES_MULTILINE | ES_AUTOVSCROLL | ES_AUTOHSCROLL,
        10, 310,
        300, 100,
        hwnd, (HMENU)ST_3, hIns, NULL);
    SetWindowText(HwndStatic3, L"height:");
}

// Step 4: the Window Procedure
LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    switch (msg)
    {
    case WM_CREATE:
        CreateControlWindowsMain(hwnd);
        return 0;
    case WM_COMMAND:
        // в параметре wParam идентификатор нажатой кнопки
        switch (LOWORD(wParam))
        {
        case BT_1:
            if (HIWORD(wParam) == BN_CLICKED)
            {
                ++countPressed;
                LPCWSTR tmp = (WCHAR*)malloc(10 * sizeof(WCHAR));
                _itow_s(countPressed, tmp, 10, 10);
                LPCWSTR coordsString = (WCHAR*)malloc(30 * sizeof(WCHAR));
                lstrcpyW(coordsString, L"Button pressed : ");
                lstrcatW(coordsString, tmp);
                lstrcatW(coordsString, L" times");
                //MessageBox(hwnd, L"Button pressed!", L"LButton pressed", MB_OK);
                SetWindowText(HwndStatic1, coordsString);
                free(tmp);
                free(coordsString);
            }
            break;
        case BT_2:
            if (HIWORD(wParam) == BN_CLICKED)
            {
                int width, height;
                LPCWSTR widthStr = (WCHAR*)malloc(20 * sizeof(WCHAR));
                LPCWSTR heightStr = (WCHAR*)malloc(20 * sizeof(WCHAR));
                GetWindowText(HwndStatic2, widthStr, 20);
                GetWindowText(HwndStatic3, heightStr, 20);
                //widthStr = wcsstr(widthStr, L"Width:");
                width = _wtoi(widthStr + 6);
                height = _wtoi(heightStr + 7);
                if (width > 0 && width < 1400 && height > 0 && height < 1200)
                {
                    LPCWSTR strToSHow = (WCHAR*)malloc(40 * sizeof(WCHAR));
                    lstrcpyW(strToSHow, widthStr);
                    lstrcatW(strToSHow, L" , ");
                    lstrcatW(strToSHow, heightStr);
                    //MessageBox(hwnd, strToSHow, L"LButton pressed", MB_OK);
                    MoveWindow(hwnd, 200, 100, width, height, TRUE);
                    free(strToSHow);
                }
                free(widthStr);
                free(heightStr);
            }
            break;
        default:
            break;
        }
        break;
    case WM_MOUSEMOVE:
        xPos = LOWORD(lParam);
        yPos = HIWORD(lParam);
        LPCWSTR tmp = (WCHAR*)malloc(10 * sizeof(WCHAR));
        _itow_s(xPos, tmp, 10, 10);
        // X:20,Y:30
        LPCWSTR coordsString = (WCHAR*)malloc(20 * sizeof(WCHAR));
        lstrcpyW(coordsString, L"X:");
        lstrcatW(coordsString, tmp);
        _itow_s(yPos, tmp, 10, 10);
        lstrcatW(coordsString, L" Y:");
        lstrcatW(coordsString, tmp);
        // помещаем текст в статическое окно
        SetWindowText(HwndStatic1, coordsString);
        free(tmp);
        free(coordsString);
        break;
    case WM_CLOSE:
        DestroyWindow(hwnd);
        break;
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    WNDCLASSEX wc;
    MSG Msg;
    hIns = hInstance;
    //Step 1: Registering the Window Class
    wc.cbSize = sizeof(WNDCLASSEX);
    wc.style = 0;
    wc.lpfnWndProc = WndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon(NULL, IDI_APPLICATION);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.lpszMenuName = NULL;
    wc.lpszClassName = g_szClassName;
    wc.hIconSm = LoadIcon(NULL, IDI_APPLICATION);

    if (!RegisterClassEx(&wc))
    {
        MessageBox(NULL, L"Window Registration Failed!", "Error!",
            MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    // Step 2: Creating the Window
    hwnd = CreateWindowEx(
        WS_EX_CLIENTEDGE,
        g_szClassName,
        L"The title of my window",
        WS_OVERLAPPEDWINDOW,
        200, 100, 1000, 600,
        NULL, NULL, hInstance, NULL);
    if (hwnd == NULL)
    {
        MessageBox(NULL, L"Window Creation Failed!", "Error!",
            MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);
    // Step 3: The Message Loop
    while (GetMessage(&Msg, NULL, 0, 0) > 0)
    {
        TranslateMessage(&Msg);
        DispatchMessage(&Msg);
    }
    return Msg.wParam;
}