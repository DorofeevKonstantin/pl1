#include <SDL.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

int WinMain()
{
	int quit = 1;
	SDL_Event event;
	int drawX = 288, lastMouseX, drawY = 208, lastMouseY, drag = 0, keyDown = 0;

	// init SDL
	SDL_Init(SDL_INIT_VIDEO);
	SDL_Window* window = SDL_CreateWindow("SDL2 Keyboard/Mouse events",
		SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, 0);
	SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, 0);

	int tankImageCounts = 5;
	SDL_Surface** tankImages = (SDL_Surface**)malloc(tankImageCounts * sizeof(SDL_Surface*));
	tankImages[0] = SDL_LoadBMP("tank.bmp");
	tankImages[1] = SDL_LoadBMP("tankRight.bmp");
	tankImages[2] = SDL_LoadBMP("tankDown.bmp");
	tankImages[3] = SDL_LoadBMP("tankLeft.bmp");
	tankImages[4] = SDL_LoadBMP("default.bmp");

	SDL_Texture** tankTextures = (SDL_Texture**)malloc(tankImageCounts * sizeof(SDL_Texture*));
	tankTextures[0] = SDL_CreateTextureFromSurface(renderer, tankImages[0]);
	tankTextures[1] = SDL_CreateTextureFromSurface(renderer, tankImages[1]);
	tankTextures[2] = SDL_CreateTextureFromSurface(renderer, tankImages[2]);
	tankTextures[3] = SDL_CreateTextureFromSurface(renderer, tankImages[3]);
	tankTextures[4] = SDL_CreateTextureFromSurface(renderer, tankImages[4]);
	SDL_Texture* texture = tankTextures[4];

	for (int i = 0; i < tankImageCounts; ++i)
		SDL_FreeSurface(tankImages[i]);

	SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
	char* strX = (char*)malloc(20);
	char* strY = (char*)malloc(10);

	// handle events
	while (quit)
	{
		SDL_PollEvent(&event);
		switch (event.type)
		{
		case SDL_QUIT:
			quit = 0;
			break;
		case SDL_KEYDOWN:
			keyDown = 1;
			switch (event.key.keysym.sym)
			{
			case SDLK_LEFT:  drawX--; texture = tankTextures[3]; break;
			case SDLK_RIGHT: drawX++; texture = tankTextures[1]; break;
			case SDLK_UP:    drawY--; texture = tankTextures[0]; break;
			case SDLK_DOWN:  drawY++; texture = tankTextures[2]; break;
			case SDLK_SPACE:  drawX = 288; drawY = 208; texture = tankTextures[4]; break;
			default: break;
			}
			break;
		case SDL_KEYUP:
			keyDown = 0;
			//texture = tankTextures[4];
			break;
		case SDL_MOUSEBUTTONDOWN:
			lastMouseX = event.motion.x;
			lastMouseY = event.motion.y;
			drag = 1;
			break;
		case SDL_MOUSEBUTTONUP:
			texture = tankTextures[4];
			drag = 0;
			break;
		case SDL_MOUSEMOTION:
			int mouseX = event.motion.x;
			int mouseY = event.motion.y;
			_itoa_s(mouseX, strX, 20, 10);
			_itoa_s(mouseY, strY, 10, 10);
			strcat_s(strX, 20, ",");
			strcat_s(strX, 20, strY);
			strX[19] = 0;
			SDL_SetWindowTitle(window, strX);

			if (drag == 1)
			{
				int diffX = mouseX - lastMouseX, absDiffX = abs(diffX);
				int diffY = mouseY - lastMouseY, absDiffY = abs(diffY);
				if (absDiffX > absDiffY)
				{
					if (diffX > 0)
						texture = tankTextures[1];
					else if (diffX < 0)
						texture = tankTextures[3];
					/*else
						texture = tankTextures[4];*/
				}
				else if (absDiffX < absDiffY)
				{
					if (diffY > 0)
						texture = tankTextures[2];
					else if (diffY < 0)
						texture = tankTextures[0];
					/*else
						texture = tankTextures[4];*/
				}
				/*else
					texture = tankTextures[4];*/

				lastMouseX = mouseX;
				lastMouseY = mouseY;

				drawX = mouseX - 50;
				drawY = mouseY - 50;
			}
			break;
		}
		//SDL_Rect tankDstrect = { x, y, 20, 20 };
		SDL_Rect tankDstrect = { drawX, drawY, 100, 100 };

		SDL_RenderClear(renderer);
		SDL_RenderCopy(renderer, texture, NULL, &tankDstrect);
		SDL_RenderPresent(renderer);
		if (keyDown == 1)
			SDL_Delay(1);
	}
	// cleanup SDL
	SDL_DestroyTexture(texture);
	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();
	return 0;
}