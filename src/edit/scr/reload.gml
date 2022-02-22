
{
	
	if !realtimesrc {
		file_text_read_all_scr =
			execute_file(path_src+"../scr/file_text_read_all.gml",path_src+"../scr/file_text_read_all.gml")
		get_code_scr = file_text_read_all(path_src+"../scr/get_code.gml")
	}
	else {
		file_text_read_all_scr = path_src+"../scr/file_text_read_all.gml"
		get_code_scr = path_src+"../scr/get_code.gml"
	}
	
	lobit_scr                = get_code(path_src+"../scr/lobit.gml")
	lobyte_scr               = get_code(path_src+"../scr/lobyte.gml")
	hibit_scr                = get_code(path_src+"../scr/hibit.gml")
	hibyte_scr               = get_code(path_src+"../scr/hibyte.gml")
	ktkn_scr                 = get_code(path_src+"../scr/ktkn.gml")
	split_scr                = get_code(path_src+"../scr/split.gml")
	reload_scr               = get_code(path_src+"scr/reload.gml")
	draw_window_scr          = get_code(path_src+"scr/draw_window.gml")
	show_menu_ext_scr        = get_code(path_src+"scr/show_menu_ext.gml")
	textbox_create_scr       = get_code(path_src+"scr/textbox/create.gml")
	textbox_draw_scr         = get_code(path_src+"scr/textbox/draw.gml")
	get_scrollbarvalue_scr   = get_code(path_src+"scr/scrollbar/get_value.gml")
	scrollbar_create_scr     = get_code(path_src+"scr/scrollbar/create.gml")
	scrollbar_draw_scr       = get_code(path_src+"scr/scrollbar/draw.gml")
	mouse_rectangle_scr      = get_code(path_src+"scr/mouse_rectangle.gml")
	new_level_scr            = get_code(path_src+"scr/new_level.gml")
	
	room_speed=60
	
	for (i=0;i<6;i+=1)
	{
		execute_string(
			// weird to not have . properties even here
			"if propsinput"+string(i)+".object_index = textbox with propsinput"+string(i)+" { instance_destroy() }"+
			"propsinput"+string(i)+" = textbox_create()"+
			"propsinput"+string(i)+".single_line = 0;"+
			"propsinput"+string(i)+".max_chars = 5;"+
			"propsinput"+string(i)+".filter_chars = '0123456789'"+
			"propsinput"+string(i)+".color_selection = make_color_rgb(0,0,191)")
	}
	propsinput2.max_chars = 1
	propsinput3.max_chars = 2
	propsinput4.max_chars = 2
	
	object_event_clear(controller,ev_draw,0)
	object_event_add(controller,ev_draw,0,get_code(path_src+"main.gml",0))
	
	icons = sprite_add(path_gfx+"icons.png",20,1,0,0,0)
	scrollspr = sprite_add(path_gfx+"scroll.png",20,0,0,0,0)
	plyspr = sprite_add(path_gfx+"../common/player.png",0,1,0,0,0)
	itmspr = sprite_add(path_gfx+"../common/item.png",0,1,0,0,0)
	objspr = sprite_add(path_gfx+"../common/obj.png",0,1,0,0,0)
	enmspr = sprite_add(path_gfx+"../common/enemy.png",0,1,0,0,0)
	terrain = sprite_add(path_gfx+"../world/w00/tiles.png",0,1,0,0,0)
	
	if surface_exists(leveldraw)
		surface_free(leveldraw)
	leveldraw = surface_create((1<<8)<<4,(1<<8)<<4)
	levelscrollx = scrollbar_create(0,scrollspr,0)
	levelscrolly = scrollbar_create(1,scrollspr,0)
	
	menucount = 4
	
	toolcount = 12
	toolicon[0] = 0 // New
	toolcode[0] = "execute_code(new_level_scr)"
	toolicon[1] = 1 // Open
	toolcode[1] = "fname=get_open_filename('Klonoa Level File|*.klo','') if fname!='' execute_file(path_src+'scr/load_level.gml',fname)"
	toolicon[2] = 2 // Save
	toolcode[2] = "if fname='' fname=get_save_filename('Klonoa Level File|*.klo','') if fname!='' execute_file(path_src+'scr/save_level.gml',fname)"
	saveas = "fname=get_save_filename('Klonoa Level File|*.klo','') if fname!='' execute_file(path_src+'scr/save_level.gml',fname)"
	toolcode[3] = "|"
	//toolicon[4] = 7
	//toolcode[4] = ""
	toolicon[4] = 9 // New obj
	toolcode[4] = "level.objects_x[level.objectcount] = ((view_wview[0]-184)>>1)+scrollxv
					level.objects_y[level.objectcount] = ((view_hview[0]-80)>>1)+scrollyv
					level.objects_type[level.objectcount] = 0 
					level.objects_subtype[level.objectcount] = 0 
					level.objects_props0[level.objectcount] = 0 
					level.objects_props1[level.objectcount] = 0 
					level.objects_props2[level.objectcount] = 0
					level.objectcount += 1"
	toolicon[5] = 10 // Link tool
	toolcode[5] = "if editmode=2 editmode=0 else if editmode=0 || editmode = 1 editmode=2" // weird
	toolicon[6] = 19 // Object/tile mode
	toolcode[6] = "if editmode=1 editmode=0 else if editmode=0 || editmode = 2 editmode=1"
	toolicon[7] = 6 // Delete object
	toolcode[7] = ""
	toolcode[8] = "|"
	toolicon[9] = 18 // Run level with current changes
	toolcode[9] =	'execute_file(path_src+"scr/save_level.gml",temp_directory+"\tmp.klo",level)
					execute_shell("'+path_bin+'Cloneoa.exe","'+temp_directory+'\tmp.klo'+'")'
	toolcode[10] = "|"
	toolicon[11] = 14 // Help chm, kind of useless right now
	toolcode[11] = "__tmpstr='"+path_bin+"info' if lang __tmpstr+='j' execute_shell(__tmpstr+'.chm','')"
}


