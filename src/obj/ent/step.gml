
sprite_index=collision_enemy

depth = -1

char_index += char_speed

{
	touching_left  = collision_rectangle(x+tilecol[1]-1,y+tilecol[0],x,y+tilecol[3]-1,tile,false,true)
	touching_right = collision_rectangle(x,y+tilecol[0],x+tilecol[2]+1,y+tilecol[3]-1,tile,false,true)
	touching_down  = collision_rectangle(x+tilecol[1]+8,y+(tilecol[0]/2),x+tilecol[2]-8,y+tilecol[3]+1,tile,false,true)
	if touching_right != noone || touching_left != noone
	{
		x = xprevious
		flip = !flip
	}
	if touching_down != noone
	{
		if ((y > touching_down.y) && (!ground || falling))
		{
			y = touching_down.y
			gravity = 0 vspeed = 0
			ground = 1 //falling = 0
		}
	}
	else {
		flip = !flip
		/*
		if ground {
			y += base_gravity
		}
		ground = 0
		falling = 1*/
	}
}

x += (1-(flip*2))/1.7
