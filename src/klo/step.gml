

if !noclip
{
	if !cantmove
	{
		current_player = player_speed
		
		if !ground && gravity = 0 && floattime = 0 { gravity = base_gravity }

		if vspeed >= 3 gravity = 0

		if floattime > 0 current_player = player_speed / 2

		if (ground)
		{
			if ((keyboard_check(ctrl_left) ||
					keyboard_check(ctrl_right)) && !moving) char_index = 10
			if ((!keyboard_check(ctrl_left) &&
					!keyboard_check(ctrl_right)) && moving) char_index = 0
		}

		if keyboard_check(ctrl_right) && !keyboard_check(ctrl_left) { flip = 0 x += current_player moving = 1 }
		if keyboard_check(ctrl_left) { flip = 1 if x > 0 x -= current_player moving = 1 }

		if !keyboard_check(ctrl_right) && !keyboard_check(ctrl_left) moving = 0

		if vspeed != 0 && !cantfloat { ground = 0 }

		if vspeed = 0 && gravity = 0 && ground && keyboard_check_pressed(ctrl_jump)
		{ jump = 1 ground = 0 sound_play(snd_jump) last_char_index = char_index char_index = 20 vspeed = -4.28 }

		if vspeed >= 0 && jump { char_index = 25 jump = 0 float = 1 }

		if moving { if slide < 6 slide += 0.5 }
		else { if slide > 0 && x > 0 { slide -= 1 if !flip x += 1 else x -= 1 } }

		if grab = noone
		{
			if float && keyboard_check(ctrl_jump)
			{
				float = 0
				floattime = 71
				gravity = 0
				vspeed = 0
				char_index = 45
				float_ylast = y
			}

			if keyboard_check(ctrl_jump)
			{
				if floattime = 1
				{
					char_index = 25
					cantfloat = 1
					y = float_ylast
				}
				if floattime
					floattime -= 1
			}

			if (floattime mod 15) = 1 && !sound_isplaying(snd_float)
				sound_play(snd_float)

			if floattime && (keyboard_check_released(ctrl_jump) || !keyboard_check(ctrl_jump))
			{
				floattime = 0
				float = 0
				char_index = 25
				cantfloat = 1
			}

			if floattime > 55 && floattime < 70
				y += 1

			if floattime > 1 && floattime < 16
				y -= 1

			if keyboard_check_pressed(ctrl_fire) && !fired
			{
				sound_play(snd_fire)
				last_char_index = char_index
				char_index = 50
				float = 0
				floattime = 0
				fired = 1
				/*_tmpobj =*/ with instance_create(x,y-15,windbullet)
				/*with _tmpobj*/ { timemax = 16 depth = -2 flip = other.flip }
				with controller {
					with create_particle(
						floor(player.x)+19-(player.flip*6),
						floor(player.y)-15,3)
					{ flip = player.flip }
				}
			}
		}
		else {
			if char_index < 60 && char_index != 99 &&
				!(char_index >= 40 && char_index < 60)
					char_index += 60
		
			if keyboard_check_pressed(ctrl_fire)
			{
				//char_index = 
				with grab { throw = 1+other.flip grabby = noone y = other.y }
				grab = noone
				last_char_index = char_index
				char_index = 94
				sound_play(snd_throw)
			}
		
			if keyboard_check_pressed(ctrl_jump) && (gravity != 0 || vspeed >= 3)
			{
				if vspeed >= 0
					float = 0
				jump = 1
				vspeed = -4.28
				cantfloat = 0
				char_index = 20
				// figure this out
				with grab { throw = 3 grabby = noone y = other.y }
				grab = noone
				sound_play(snd_wahoo)
			}
		}

		char_index += char_speed
	}

	if invnc_frames > 0
	{
		invnc_frames -= 1
		if (invnc_frames > 0 &&
				((invnc_frames > 70 && invnc_frames mod 5 > 0 && invnc_frames mod 5 < 3)
					|| (invnc_frames < 70 && invnc_frames mod 10 > 0 && invnc_frames mod 10 < 5)))
			draw = false
		else draw = true
	}

	if hurt_time > 0
	{
		char_index = 99
		hurt_time -= 1
		x -= 0.8-(flip*2)
		y -= 0.8
		vspeed=0
		if hurt_time = 0 && health != 0
		{
			cantmove = 0
			char_index = 25
			if grab != noone char_index += 60
		}
	}

	if invnc_frames = 0 && !draw
		draw = true

	{
		touching_left	= collision_rectangle(x+tilecol[1]-1,y+tilecol[0],x,y+tilecol[3]-1,tile,false,true)
		touching_right = collision_rectangle(x,y+tilecol[0],x+tilecol[2]+1,y+tilecol[3]-1,tile,false,true)
		touching_up		= collision_rectangle(x+tilecol[1]+1,y+tilecol[0]-2,x+tilecol[2]-1,y-1,tile,false,true)
		touching_down	= collision_rectangle(x+tilecol[1]+1,y+(tilecol[0]/2),x+tilecol[2]-1,y+tilecol[3]+1,tile,false,true)
		if touching_right != noone || touching_left != noone
		{
			x = xprevious
			slide = 0
		}
		if touching_up != noone
		{
			y = yprevious
			vspeed = 0
		}
		if touching_down != noone
		{
			if ((y > touching_down.y) && (!ground || falling))
			{
				sound_play(snd_land)
				y = touching_down.y gravity = 0 vspeed = 0 ground = 1 falling = 0
				if moving { char_index = 10 if grab != noone char_index += 60 }
				else char_index = 40 float = 0 floattime = 0
			}
		}
		else {
			if ground {
				char_index = 25
				if grab != noone char_index += 60
				y += base_gravity
				float = 1
			}
			ground = 0
			falling = 1
		}
		touching_item = collision_rectangle(x+itemcol[1],y+itemcol[0],x+itemcol[2],y+itemcol[3],item,false,true)
		if touching_item != noone
		{
			switch (touching_item.subtype)
			{
				case 0:
				case 1:
					sound_play(snd_gem)
					break
				case 2:
					sound_play(snd_heal)
					break
			}
			with touching_item { instance_destroy() }
		}
		touching_ent = collision_rectangle(x+entcol[1],y+entcol[0],x+entcol[2],y+entcol[3],enemy,false,true)
		if touching_ent != noone && !invnc_frames &&
			touching_ent.grabby = noone && !touching_ent.throw &&
			touching_ent.respawn_cooldown <= 0
		{
			invnc_frames = 180
			health-=1
			hurt_time=16
			cantmove=1
			if health = 0
				sound_play(snd_death)
			else
				sound_play(snd_hurt)
			//godmode effect xd -> y-=1
		}
	}

	if y > levelbounds[3]+32 && health > 0
	{
		health = 0
		invnc_frames = 180
		cantmove = 1
		sound_play(snd_death)
	}
} else {
	hspeed = 0
	vspeed = 0

	if keyboard_check(ctrl_right)  { x += noclip_speed }
	if keyboard_check(ctrl_left)   { x -= noclip_speed }
	if keyboard_check(ctrl_down)   { y += noclip_speed }
	if keyboard_check(ctrl_up)     { y -= noclip_speed }
}

if debug_mode
	if keyboard_check_pressed(ord("N"))
		noclip = !noclip

view_xview[0] = round(x) - round(view_wview[0]/2)
view_yview[0] = floor(y) - floor(view_hview[0]/2)
if (view_xview[0] + view_wview[0] > levelbounds[2])
	view_xview[0] = levelbounds[2] - view_wview[0]
if (view_xview[0] < levelbounds[0])
	view_xview[0] = levelbounds[0]
if (view_yview[0] + view_hview[0] > levelbounds[3])
	view_yview[0] = levelbounds[3] - view_hview[0]
if (view_yview[0] < levelbounds[1])
	view_yview[0] = levelbounds[1]

if handytitle
	if !(frame mod 30)
		room_caption = "Cloneoa - "+string(fps)+" FPS - "+fname
