if freesize
if(view_wview[0] != window_get_width()/window_get_region_scale() ||
   view_hview[0] != window_get_height()/window_get_region_scale() ||
   view_wport[0] != window_get_width()/window_get_region_scale() ||
   view_hport[0] != window_get_height()/window_get_region_scale()) {
    view_wview[0] = window_get_width()/window_get_region_scale()
    view_hview[0] = window_get_height()/window_get_region_scale()
    view_wport[0] = window_get_width()/window_get_region_scale()
    view_hport[0] = window_get_height()/window_get_region_scale()
    view_hborder[0] = view_wview[0]
    view_vborder[0] = view_hview[0]
	room_restart()
}