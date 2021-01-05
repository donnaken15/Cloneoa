//if freesize=1
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

if keyboard_check_pressed(vk_enter)
	if pause
	{
		//room_set_background_color(room,c_white,true)
		instance_activate_all()
		sprite_delete(pausescr)
		pause = false
	}
	else
	{
		// MAKE THIS BETTER SRSLY
		//pausescr = sprite_create_from_screen(0,0,view_wview[0],view_hview[0],false,false,0,0)
		//room_set_background_color(room,c_gray,false)
		screen_save(temp_directory+"/__TMPSURFACE__.PNG")
		pausescr = sprite_add(temp_directory+"/__TMPSURFACE__.PNG",0,0,0,0,0)
		file_delete(temp_directory+"/__TMPSURFACE__.PNG")
		instance_deactivate_all(true)
		pause = true
	}
