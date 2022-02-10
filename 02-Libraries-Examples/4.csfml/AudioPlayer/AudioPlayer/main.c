#include <stdio.h>
#include <conio.h>

#include <SFML/Audio.h>

void commandsLoop(sfSound* sound)
{
	int isPlaying = 0;
	char command = ' ';
	float volume = 100, speed = 1;
	while (command != 'q')
	{
		command = _getch();
		switch (command)
		{
		case 's':
			if (!isPlaying)
				sfSound_play(sound);
			else
				sfSound_pause(sound);
			isPlaying = !isPlaying;
			break;
		case '+':
			volume += 10;
			if (volume > 100)
				volume = 100;
			sfSound_setVolume(sound, volume);
			break;
		case '-':
			volume -= 10;
			if (volume < 0)
				volume = 0;
			sfSound_setVolume(sound, volume);
			break;
		case 'f':
			speed += 0.1;
			sfSound_setPitch(sound, speed);
			break;
		case 'l':
			speed -= 0.1;
			sfSound_setPitch(sound, speed);
			break;
		case 'n':
			speed = 1;
			sfSound_setPitch(sound, speed);
			break;
		case 'q':
		default:
			break;
		}
	}
}

int main()
{
	sfSoundBuffer* buffer = sfSoundBuffer_createFromFile("sound.wav");
	if (!buffer)
	{
		printf_s("Can't load file.\n");
		return -1;
	}
	printf_s("Audio file loaded.\n");
	printf_s("Commands : s/+/-/f/l/n/q\n");
	sfSound* sound = sfSound_create();
	sfSound_setBuffer(sound, buffer);
	commandsLoop(sound);
	sfSound_stop(sound);
	return 0;
}