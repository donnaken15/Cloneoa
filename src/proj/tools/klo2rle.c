
#include <stdio.h>
#include <stdlib.h>

typedef unsigned short WORD;
typedef unsigned char	BYTE;
#define MAKEWORD(a,b) ((WORD) (((BYTE) (b)) | ((WORD) ((BYTE) (a))) << 8))

char*header,*objects,*OLD,*NEW;
unsigned char rletile,rlecur;
FILE*files[2];
unsigned short w,h;
unsigned long filecur=0,filesz;

int main(int argc, char*argv[])
{
	if (argc > 2)
	{
		//if (argv[1] == argv[2])
		//{
			//puts("Input and output files cannot be the same.");
			//return 5;
		//}
		files[0] = fopen(argv[1],"rb");
		if(files[0])
		{
			fseek(files[0],0,SEEK_END);
			filesz = ftell(files[0]);
			fseek(files[0],0,SEEK_SET);
			header = (char*)malloc(0x10);
			fread(header,0x10,1,files[0]);
			w=MAKEWORD(header[0x8],header[0x9]);
			h=MAKEWORD(header[0xA],header[0xB]);
			//if (header[0] == 0xAC &&
				//header[1] == 0x1E)
				//WHY ISN'T THIS WORKING!!!
			if (w*h > 0)
			{
				filecur += 0x10;
				switch((header[0x4] & 0x30) >> 4)
				{
				case 0:
					OLD = (char*)malloc(w*h);
					fread(OLD,w*h,1,files[0]);
					filecur += w*h;
					if (filecur > filesz)
					{
						printf(
							"File loading ended prematurely.\n"
							"Expected level size: %ux%u | %u\n"
							"EOF position:				%u\n\n"
						,w,h,w*h,ftell(files[0]));
						break;
					}
					while (filecur < filesz && filecur % 16 != 0)
					filecur++;
					fseek(files[0],0,filecur);
					objects = (char*)malloc(filesz-filecur);
					unsigned int objcur = 0;
					while (filecur < filesz)
					{
						fread(objects+objcur,8,1,files[0]);
						objcur	+= 8;
						filecur += 8;
						if (filecur > filesz)
							printf("@ %6u bytes: Invalid object length, reached EOF.",filesz);
					}
					header[0x4] |= 0x10;
					files[1] = fopen(argv[2],"wb");
					fwrite(header,1,0x10,files[1]);
					for (unsigned int oldcur = 0; oldcur < filesz-0x10-objcur; oldcur++)
					{
						if ((oldcur > 0 && rletile != OLD[oldcur]) || rlecur == 0xFF)
						{
							if (rlecur < 0xFF)
							rlecur--;
							fwrite(&rletile,1,1,files[1]);
							fwrite(&rlecur,1,1,files[1]);
							rletile = OLD[oldcur];
							rlecur = 0;
						}
						rletile = OLD[oldcur];
						rlecur++;
					}
					unsigned int alignnew = ftell(files[1]);
					unsigned char unused = 0;
					while (alignnew % 16 != 0) {
						alignnew++;
						fwrite(&unused,1,1,files[1]);
					}
					//fseek(files[1],alignnew,SEEK_SET);
					//write original tiles, test: fwrite(OLD,1,filesz-0x10-objcur,files[1]);
					fwrite(objects,1,objcur,files[1]);
					break;
				case 1:
					puts("Decompression is not supported yet.");
					break;
				}
			} else {
				puts("Invalid header.");
				return 11;
			}
		} else puts("Input file does not exist.");
	}
	else	puts("\nUsage: klo2rle input output\n\ncompresses level files using RLE");
	return 0;
}
