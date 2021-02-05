
depth = -1

char_index += char_speed

if respawn_cooldown <= 0
{
	if grabby = noone && !throw
	{
		switch (subtype)
		{
			// DEFAULT MOO
			case 0:
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
				// fix, moos do have gravity but need to figure out how to avoid falling off
				x += (1-(flip*2))/1.7
				break
			// FLYING MOO
			case 1:
				if player.x > x - 7 flip = 0
					else flip = 1
				if (settings[1] > 0)
				{
					if (move_time < settings[1])
						y += 0.5
					if (move_time > settings[1])
						y -= 0.5
					if (move_time > settings[1] * 2)
					{
						y = ystart
						move_time = 0
					}
				}
				move_time += 1
				break
		}
		crashing_ents  = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,enemy,false,true)
		if crashing_ents != noone
		{
			if crashing_ents.grabbed
			{
				grabbed = 0 throw = 0
				//char_index = subtype*1000
				if subtype = 1 move_time = 0
				xdiepart = x
				ydiepart = y
				x = xstart
				y = ystart
				respawn_cooldown = 140
				sound_play(snd_kill)
			}
		}
	}

	if grabbed
	{
		//if x >= floor(player.x)
			//x -= 1.3
		//else if x < floor(player.x)
			//x += 1.3
		//if x >= floor(player.x)-3 &&
				//y < floor(player.x)+3
		if !throw
		{
			x = floor(player.x)+3
			if y > player.y - 24
				y -= 3.6
			if y < player.y - 24
				y = player.y - 24
		}
		else
		{
			if throw = 1
				x += 3
			if throw = 2
				x -= 3
			if throw = 3
				y += 3
			crash_tile  = collision_rectangle(x+tilecol[1]-1,y+tilecol[0],x+tilecol[2]+1,y+tilecol[3]-1,tile,false,true)
			// dont make this thing repetitive
			if crash_tile != noone
			{
				grabbed = 0
				throw = 0
				if subtype = 1 move_time = 0
				xdiepart = x
				ydiepart = y
				x = xstart
				y = ystart
				respawn_cooldown = 140
				sound_play(snd_kill)
			}
		}
		crash_ent  = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,enemy,false,true)
		if crash_ent != noone && crash_ent.respawn_cooldown < 0
		{
			grabby = noone
			grabbed = 0 throw = 0
			if subtype = 1 move_time = 0
			xdiepart = x
			ydiepart = y
			x = xstart
			y = ystart
			respawn_cooldown = 140
			sound_play(snd_kill)
		}
	}
}

if respawn_cooldown > -50
{
	respawn_cooldown -= 1
}

if respawn_cooldown = 0
{
	char_index = subtype*1000
}
