#pragma once

typedef unsigned char byte;
typedef unsigned short ushort;
typedef int number; // <-- lol
typedef unsigned int plus;
typedef long long max;
typedef unsigned long long maxplus;
typedef unsigned char*data;
typedef char* string;
// in case if i want to change these types later
// forgot LPSTR (no C) existed

/*struct POINT32 {
	signed int x, y;
};

struct SIZE32 {
	unsigned int cx, cy;
};

struct POINT16 {
	signed short x, y;
};

struct POINTU16 {
	unsigned short x, y;
};

struct SIZE16 {
	unsigned short cx, cy;
};*/

struct XY32
{
	unsigned int x, y;
};

struct XY16
{
	unsigned short x, y;
};

#define LOBIT(b) (b & 0xf)
#define HIBIT(b) (b >> 4)

