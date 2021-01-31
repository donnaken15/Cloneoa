
// CREATE OBJECT

// arguments:
	// 0: type
	// 1: subtype
	// 2: property 1
	// 3: property 2
	// 4-5: x, y

myobj=0
myinst=noone
_tempvar_obj_confirmcreate = 1

{
	// TYPE
	switch (argument0)
	{
		// ITEM
		case 0:
			myobj=item
			// SUBTYPE
			switch (argument1)
			{
				// GEM
				case 0:
					max_gems += 1
					break
				// DIAMOND
				case 1:
					max_gems += 5
					break
				// HEART
				case 2:
					
					break
				// STAR
				case 3:

					break
				// LIFE
				case 4:

					break
				default:
					show_error("@ "+string_format(filecur,6,0)+" bytes: Invalid object subtype.",false)
					_tempvar_obj_confirmcreate = 0
					return 0
					break
			}
			break
		// ENEMY
		case 1:
			myobj=enemy
			can_get_hurt=1
			break
		// DOOR
		case 2:
			break
		// (name for things like buttons, boxes, etc)
		case 3:
			break
		default:
			show_error("@ "+string_format(filecur-1,6,0)+" bytes: Invalid object type.",false)
			_tempvar_obj_confirmcreate = 0
			return 0
			break
	}
}

myinst = instance_create(argument4,argument5,myobj)

with myinst
{
	depth = -1
	sprite_index = collision_8x8c
	char_index = 0
	char_speed = 0.13333
	type = argument0
	subtype = argument1
	settings[0] = argument2
	settings[1] = argument3
	tilecol[0] = -14
	tilecol[1] = -10
	tilecol[2] = 9
	tilecol[3] = 0

	if type = 1 && subtype = 0
	while collision_rectangle(x+tilecol[1]+8,y+(tilecol[0]/2),x+tilecol[2]-8,y+tilecol[3],tile,false,true) = noone
	{ y += 1 }
}

return myinst
