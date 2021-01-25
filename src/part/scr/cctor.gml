
// READONLY
// WHY WON'T THIS WORK AS A FILE!!!

// arguments:
//  x,y
//	type of particle

// or arguments can be:
	// (width)
	// (height)
	// (frames)
	// (speed)
	// (mirrored, how many sides to draw)

offx   = 0
offy   = 0
cx     = 0
cy     = 0
width  = 0
height = 0
spd    = 0
sides  = 0
timemax= 30

switch (argument2)
{
	// for items
	case 0:
		width = 32
		height = 16
		cx = argument0-16
		cy = argument1-height
		spd = 0.400
		timemax = 15
		break
	default:
		show_error("Invalid particle type: "+string(argument2),false)
		return 0
}

mypart = instance_create(argument0,argument1,particle)

mypart.depth = -2
mypart.offx = offx
mypart.offy = offy
mypart.cx = cx
mypart.cy = cy
mypart.width = width
mypart.height = height
mypart.anispeed = spd
mypart.sides = 0
mypart.time = 0
mypart.timemax = 100000
