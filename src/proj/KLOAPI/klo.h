#pragma once
#include "wesley.h"

static const USHORT VISVER = 0;

struct OBJDATA {
	BYTE ID, PROPS[7];
	POINT32 POS;
};

struct PLAYERINFO {
	POINT32 pos;
	byte ctrl//; //fast8
		, keys[8];
	//byte*keys;
	number lives, gems, stars, health; //fast32
	FLOAT speed;
};

struct VISION {
	USHORT magicno, settings;
	BYTE type[2];
	POINT32 start;
	OBJDATA*objects;
	//SIZE32 size;
};

#define LEVEL VISION

enum objtype {
	item,
	entity,
	door,
	sign,
	fore = 0xF,
	back = 0xE
};

enum item {
	gem,
	diamond,
	heart,
	star,
	life
};

enum entity {
	mu,
	mufly,
	box,
	ball
};

enum door {
	goal,
	locked0,
	locked1,
	warp
};

enum lvlfore {
	ground,
	damage,
	turbulance
};

enum lvlback {
	fence
};
