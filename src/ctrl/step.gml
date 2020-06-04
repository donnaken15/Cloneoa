if view_wview[0] != window_get_width() ||
   view_hview[0] != window_get_height() ||
   view_wport[0] != window_get_width() ||
   view_hport[0] != window_get_height() {
    view_wview[0] = window_get_width()
    view_hview[0] = window_get_height()
    view_wport[0] = window_get_width()
    view_hport[0] = window_get_height()
    view_hborder[0] = view_wview[0]
    view_vborder[0] = view_hview[0]
	room_restart()
}