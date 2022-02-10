#include <string.h>
#include <stdlib.h>
#include <SDL.h>

int main()
{
	int quit = 1;
	SDL_Event event;
	int x = 288;
	int y = 208;

	// init SDL
	SDL_Init(SDL_INIT_VIDEO);
	SDL_Window* window = SDL_CreateWindow("SDL2 Keyboard/Mouse events",
		SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, 0);
	SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, 0);
	SDL_Surface* image = SDL_LoadBMP("1.bmp");
	SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, image);
	SDL_FreeSurface(image);
	SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
	char* strX = (char*)malloc(20);
	char* strY = (char*)malloc(10);

	// handle events
	while (quit)
	{
		SDL_Delay(1);
		SDL_PollEvent(&event);
		int mouseX, mouseY;
		switch (event.type)
		{
		case SDL_QUIT:
			quit = 0;
			break;
		case SDL_KEYDOWN:
			switch (event.key.keysym.sym)
			{
			case SDLK_LEFT:  x--; break;
			case SDLK_RIGHT: x+=10; break;
			case SDLK_UP:    y--; break;
			case SDLK_DOWN:  y++; break;
			}
			break;
		case SDL_MOUSEMOTION:
			mouseX = event.motion.x;
			mouseY = event.motion.y;
			_itoa_s(mouseX, strX, 20, 10);
			_itoa_s(mouseY, strY, 10, 10);
			strcat_s(strX, 20, ",");
			strcat_s(strX, 20, strY);
			strX[19] = 0;
			SDL_SetWindowTitle(window, strX);
			x = mouseX - 32;
			y = mouseY - 32;
			break;
		}

		SDL_Rect dstrect = { x, y, 64, 64 };
		SDL_RenderClear(renderer);
		SDL_RenderCopy(renderer, texture, NULL, &dstrect);
		SDL_RenderPresent(renderer);
	}

	SDL_DestroyTexture(texture);
	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();

	return 0;
}