
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
{ jump = 1 ground = 0 sound_play(snd_jump) last_char_index = char_index char_index = 20 vspeed = -4.4 }

if vspeed >= 0 && jump { char_index = 25 jump = 0 }

if moving { if slide < 6 slide += 0.5 }
else { if slide > 0 { slide -= 1 if !flip x += 1 else x -= 1 } }

view_xview[0] = round(x) - round(view_wview[0]/2)
view_yview[0] = floor(y) - floor(view_hview[0]/2)
//fix, run when player reaches position close to bounds of level
if (view_xview[0] + view_wview[0] > levelbounds[2])
	view_xview[0] = levelbounds[2] - view_wview[0]
if (view_xview[0] < levelbounds[0])
	view_xview[0] = levelbounds[0]
if (view_yview[0] + view_hview[0] > levelbounds[3])
	view_yview[0] = levelbounds[3] - view_hview[0]
if (view_yview[0] < levelbounds[1])
	view_yview[0] = levelbounds[1]

//if player.x > room_width || player.y > room_height
//{ view_xview[0] = player.x - (view_wview[0]/2)
//view_yview[0] = player.y - (view_hview[0]/2) }

/*instance_activate_region(
	view_xview[0]-(view_wview[0]/2),
	view_yview[0]-(view_hview[0]/2),
	view_xview[0]+(view_wview[0]*1.5),
	view_yview[0]+(view_hview[0]*1.5),
	true
)

instance_deactivate_region(
	view_xview[0]-(view_wview[0]/2),
	view_yview[0]-(view_hview[0]/2),
	view_xview[0]+(view_wview[0]*1.5),
	view_yview[0]+(view_hview[0]*1.5),
	false,true
)*/

/*if x + collision[1] < levelbounds[0] ||
	x + collision[2] > levelbounds[2] x = xprevious

if y + collision[3] > levelbounds[3] { sound_play(snd_land)
y = levelbounds[3] gravity = 0 vspeed = 0 ground = 1
if moving char_index = 10 else char_index = 40 }*/

repeat (64)
{
	touching = collision_rectangle(x+collision[1],y+collision[0],x+collision[2],y+collision[3],all,false,true)
	if touching != noone
	{
		if (x > touching.x || x < touching.x + 16) && y < touching.y
		{
			x = xprevious
			y = yprevious
			slide = 0
		}
		if (y > touching.y && y < touching.y + 3 && (x >= touching.x && x <= touching.x + 16) && (!ground || falling))
		{
			sound_play(snd_land)
			y = touching.y gravity = 0 vspeed = 0 ground = 1 falling = 0
			if moving char_index = 10 else char_index = 40
		}
	}
	else {
		if ground
			char_index = 25
		ground = 0
		falling = 1
	}
}

