
{
	object_event_clear(controller,	ev_draw,0)
	object_event_add(controller,ev_close_button,0,"game_end()")
	
	if !realtimesrc {
		file_text_read_all_scr =
			execute_file(path_src+"../scr/file_text_read_all.gml",path_src+"../scr/file_text_read_all.gml")
		get_code_scr = file_text_read_all(path_src+"../scr/get_code.gml")
	}
	else {
		file_text_read_all_scr = path_src+"../scr/file_text_read_all.gml"
		get_code_scr = path_src+"../scr/get_code.gml"
	}
	
	lobit_scr       = get_code(path_src+"../scr/lobit.gml")
	lobyte_scr      = get_code(path_src+"../scr/lobyte.gml")
	hibit_scr       = get_code(path_src+"../scr/hibit.gml")
	hibyte_scr      = get_code(path_src+"../scr/hibyte.gml")
	ktkn_scr        = get_code(path_src+"../scr/ktkn.gml")
	split_scr       = get_code(path_src+"../scr/split.gml")
	reload_scr      = get_code(path_src+"scr/reload.gml")
}


