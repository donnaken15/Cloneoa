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
