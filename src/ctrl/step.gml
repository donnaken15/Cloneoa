if freesize
{
	winw = window_get_width()
	winh = window_get_height()
	wins = window_get_region_scale()
	if wins > 0.5
	{
		winw /= wins
		winh /= wins
	}

	if(view_wview[0] != winw ||
	   view_hview[0] != winh ||
	   view_wport[0] != winw ||
	   view_hport[0] != winh) {
		view_wview[0] = winw
		view_hview[0] = winh
		view_wport[0] = winw
		view_hport[0] = winh
		view_hborder[0] = view_wview[0]
		view_vborder[0] = view_hview[0]
		room_restart()
	}
}

if !sound_isplaying(mus_int) && !sound_isplaying(mus_lp)
		&& frame > 8 && !music_part {
	sound_loop(mus_lp)
	music_part = 1
}

if keyboard_check_pressed(vk_tab) room_speed = 1000000
else if keyboard_check_released(vk_tab) room_speed = 60

if keyboard_check_pressed(ctrl_start)
	if pause
	{
		depth = 100
		instance_activate_all()
		sprite_delete(pausescr)
		sound_volume(mus_int,0.87)
		sound_volume(mus_lp,0.87)
		pause = false
	}
	else
	{
		depth = -100
		pause_scroll = 0
		// MAKE THIS BETTER SRSLY
		//pausescr = sprite_create_from_screen(0,0,view_wview[0],view_hview[0],false,false,0,0)
		//room_set_background_color(room,c_gray,false)
		screen_save(temp_directory+"/__TMPSURFACE__.PNG")
		pausescr = sprite_add(temp_directory+"/__TMPSURFACE__.PNG",0,0,0,0,0)
		file_delete(temp_directory+"/__TMPSURFACE__.PNG")
		instance_deactivate_all(true)
		sound_play(snd_pause)
		sound_volume(mus_int,0.78)
		sound_volume(mus_lp,0.78)
		pause = true
	}

if pause
{
		 if keyboard_check_pressed(ctrl_up)   { pause_scroll -= 1 sound_play(snd_scroll) }
	else if keyboard_check_pressed(ctrl_down) { pause_scroll += 1 sound_play(snd_scroll) }
	if pause_scroll = -1 pause_scroll = 4
	if pause_scroll =  5 pause_scroll = 0
	if keyboard_check_pressed(ctrl_jump)
	{
		switch pause_scroll
		{
			case 0:
				depth = 100
				instance_activate_all()
				sprite_delete(pausescr)
				sound_volume(mus_int,0.87)
				sound_volume(mus_lp,0.87)
				pause = false
				break
			case 1:
				break
			case 2:
				break
			case 3:
				break
			case 4:
				break
		}
	}
}

x = player.x
y = player.y-10

if frame mod 30 = 1
	instance_deactivate_object(tile)
instance_activate_region(player.x-36,player.y-28,player.x+36,player.y+16,true)
