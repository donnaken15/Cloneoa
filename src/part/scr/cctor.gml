
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
cx     = argument0
cy     = argument1
width  = 16
height = 16
spd    = 0.400
sides  = 0
timemax= 15

switch (argument2)
{
 // for items
 case 0:
  width = 32
  cx = argument0-16
  cy = argument1-height
  sides = 1
  break
 case 1:
  offy = 16
  cx = argument0-width
  cy = argument1-height
  sides = 2
  break
 case 2:
  offx = 240
  offy = 16
  cx = argument0-width
  cy = argument1-height
  sides = 2
  break
 case 3:
  offx = 160
  offy = 32
  width = 12
  height = 16
  cx = argument0-width
  cy = argument1-height
  sides = 3
  spd = 0.3
  timemax = 3
  break
 default:
  show_error("Invalid particle type: "+string(argument2),false)
  return 0
}

mypart =
   instance_create(
floor(argument0),
floor(argument1),
   particle)

mypart.depth = -2
mypart.offx = offx
mypart.offy = offy
mypart.cx = cx
mypart.cy = cy
mypart.width = width
mypart.height = height
mypart.anispeed = spd
mypart.sides = sides
mypart.time = 0
mypart.timemax = timemax
mypart.flip = flip

return mypart
