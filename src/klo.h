#pragma once
#include "wesley.h"

static const USHORT VISVER = 0;

struct OBJDATA {
	BYTE ID, PROPS[7];
	POINT32 POS;
};

class OBJECT {
private:
	void init(OBJDATA OBJ)
	{
		id = OBJ.ID;
		for (int i = 0; i < 8; i++)
			props[i] = OBJ.PROPS[i];
		startpos = OBJ.POS;
		pos = startpos;
	}
public:
	BYTE id, props[7];
	POINT32 startpos, pos;
	maxplus clockstart, clock;
	OBJECT(OBJDATA OBJ)
	{
		init(OBJ);
	}
	OBJECT(OBJDATA OBJ, maxplus CURTIME)
	{
		init(OBJ);
		clockstart = CURTIME;
	}
	void step()
	{

	}
	void draw()
	{

	}
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
