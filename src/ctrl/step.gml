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

//resolve, run when player reaches position close to bounds of level
/*if (player.x + (view_wview[0]/2) > levelbounds[2]) {
	view_object[0] = -1
	view_yview[0] = player.y - (view_hview[0]/2)
} else if (player.y + (view_hview[0]/2) > levelbounds[3]) {
	view_object[0] = -1
	view_xview[0] = player.x - (view_wview[0]/2)
} else if (player.x - (view_wview[0]/2) < levelbounds[0]) {
	view_object[0] = -1
	view_yview[0] = player.y - (view_hview[0]/2)
} else if (player.x - (view_hview[0]/2) < levelbounds[1]) {
	view_object[0] = -1
	view_xview[0] = player.x - (view_wview[0]/2)
} else view_object[0] = player*/

//if player.x > room_width || player.y > room_height
//{ view_xview[0] = player.x - (view_wview[0]/2)
//view_yview[0] = player.y - (view_hview[0]/2) }
