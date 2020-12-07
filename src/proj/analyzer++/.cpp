#pragma comment(linker, "/FILEALIGN:0x200")
#pragma comment(linker, "/ALIGN:16")
#pragma optimize("gsy", on)

// also learning about true hardcore optimization in c programs with this:
// https://www.catch22.net/tuts/win32/reducing-executable-size

// optimize main code even more when computer comes back
// using generic file stream thingy
// virgin vc++ 2015 with bloat stuff that could be 6-7kb

#include <stdio.h>
#include <iostream>
#include <fstream>
#include "..\\library\\klo.h"
using namespace std;

ifstream lvdata;
static VISION level;
const char* buildtime[2] = { __DATE__, __TIME__ };

int main(int argc, char*argv[])
{
	puts("Klonoa Custom Level Analyzer\n");
	level = VISION__CTOR(VISION__TEST);
	if (argc > 1)
	{
		if (level.magicno == 0xAC1E)
		{
			printf(
"Vision version:  %5d\n\
Level type:\t     %d\n\
Music / Theme:       %02d / %02d\n\
Level size (x16):    %5d x %5d\n\
Player start (x16):  %5d x %5d\n\n\
Existing objects (%d):\n\
",
			level.visver,
				level.settings[0],
				HIBIT(level.settings[1]),
				LOBIT(level.settings[1]),
				level.size.x, level.size.y,
				level.start.x, level.start.y,
				level.objcount);
			for (int i = 0; i < level.objcount; i++)
			{
				printf("%02X%02X : %02X%02X : %5d,%5d\n",
					level.objects[i].ID, level.objects[i].PROPS[0],
					level.objects[i].PROPS[1], level.objects[i].PROPS[2],
					level.objects[i].POS.x, level.objects[i].POS.y);
			}
			puts("\nLevel layout:");
			/*for (int i = 0; i < (level.size.x * level.size.y) / 2 + 1; i++)
			{
				int j = 0;
				printf("%X ", (HIBIT(level.tiles[i])), i);
				if (i > 0 && i - 1 % level.size.x == 0 && !j)
				{
					putc('\n', stdout);
					j = 1;
				}
				printf("%X ", (LOBIT(level.tiles[i])), i);
				if (i > 0 && i - 1 % level.size.x == 0 && !j)
				{
					putc('\n', stdout);
					j = 1;
				}
			}*/
			{
				int i = 0, j = 0;
				while (1)
				{
					if (j >= (level.size.x * level.size.y))
						break;
					printf("%X", (HIBIT(level.tiles[i])), i);
					j++;
					if (j >= (level.size.x * level.size.y))
						break;
					printf("%X", (LOBIT(level.tiles[i])), i);
					j++;
					i++;
				}
			}
		}
	}
	else
	{
		puts("Please specify a file");
	}
	//scanf_s("test");
	return 0;
}