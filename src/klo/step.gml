
player_speed = 1.5
view_hspeed[0] = 1.5

if !ground && gravity = 0 { gravity = 0.21 }

if vspeed >= 3 gravity = 0

if keyboard_check(vk_right) && !keyboard_check(vk_left) { flip = 0 x += player_speed moving = 1 }
if keyboard_check(vk_left) { flip = 1 if x > 0 x -= player_speed moving = 1 }

if !keyboard_check(vk_right) && !keyboard_check(vk_left) moving = 0

char_index += char_speed

if (keyboard_check_pressed(vk_left) ||
    keyboard_check_pressed(vk_right)) && ground char_index = 10
if ((keyboard_check_released(vk_left) ||
    keyboard_check_released(vk_right)) && ground && !moving) char_index = 0

if vspeed != 0 { ground = 0 }

if vspeed = 0 && gravity = 0 && ground && keyboard_check_pressed(vk_space)
{ jump = 1 ground = 0 sound_play(snd_jump) last_char_index = char_index char_index = 20 vspeed = -4.36 }

if vspeed >= 0 && jump { char_index = 25 jump = 0 }

if moving { if slide < 6 slide += 0.5 }
else { if slide > 0 { slide -= 1 if !flip x += 1 else x -= 1 } }

{
	touching_left  = collision_rectangle(x+collision[1]-1,y+collision[0],x,y+collision[3]-1,tile,false,true)
	touching_right = collision_rectangle(x,y+collision[0],x+collision[2]+1,y+collision[3]-1,tile,false,true)
	touching_up    = collision_rectangle(x+collision[1]+1,y+collision[0]-2,x+collision[2]-1,y-1,tile,false,true)
	touching_down  = collision_rectangle(x+collision[1]+1,y+(collision[0]/2),x+collision[2]-1,y+collision[3]+1,tile,false,true)
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
			if moving char_index = 10 else char_index = 40
		}
	}
	else {
		if ground
			char_index = 25
		ground = 0
		falling = 1
		y += 0.105
	}
	touching = collision_rectangle(x+collision[1],y+collision[0],x+collision[2],y+collision[3],all,false,true)
	if touching != tile && touching != noone
	{
		
	}
}

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


