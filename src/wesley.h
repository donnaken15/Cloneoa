#pragma once

typedef unsigned char byte;
typedef int number; // <-- lol
typedef unsigned int plus;
typedef long long max;
typedef unsigned long long maxplus;
typedef unsigned char*data;
typedef char* string;
// in case if i want to change these types later
// forgot LPSTR (no C) existed

struct POINT32 {
	signed int x, y;
};

struct SIZE32 {
	unsigned int cx, cy;
};

#define LOBIT(b) (b & 0xf)
#define HIBIT(b) (b >> 4)

