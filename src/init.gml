window_set_visible(false)
globalvar fname,level,lvinfo,filecur,filesz,
themeid,musicid,lvtype,startposraw,debug_draw,
startpos,gems,stars,starmax,frame,handytitle,
levelsize,levelsizeraw,freesize,_tempvar0,
realtimesrc,confnt,pause,levelbounds,
path_root,path_src,
path_gfx,path_sfx,
path_mus,path_bin,
hud_enable_base,
hud_enable_hearts,
hud_enable_gems,
hud_enable_stars,
pause,pausescr,
keystr,lang,
ctrl_left,
ctrl_up,
ctrl_right,
ctrl_down,
ctrl_jump,
ctrl_fire,
ctrl_start,
pause_btns,
_tempvar_obj_type,_tempvar_obj_subtype,
_tempvar_obj_props,
;
globalvar snd_wahoo;
fname = ""
path_root = program_directory+"/../"
path_src = path_root+"src/"
path_gfx = path_root+"gfx/"
path_sfx = path_root+"sfx/"
path_mus = path_root+"mus/"
path_bin = path_root+"bin/"
if parameter_count() = 0 {
	//mus_file = sound_add(path_mus+"file.wav",1,1)
	mus_file = sound_add(path_mus+"file.mp3",3,1)
	snd_wahoo = sound_add(path_sfx+"wahoo.wav",0,1)
	sound_play(mus_file)
	fname = get_open_filename("Klonoa Level File|*.klo|All Files|*.*","")
	if fname != "" {
		sound_play(snd_wahoo)
		sleep(760)
		sound_stop(mus_file)
	}
} else
    fname = parameter_string(1)

depth = 100

if fname != ""
{
	
	/// SETTINGS
	ini_open(path_bin+"settings.ini")
	{
		realtimesrc = ini_read_real("Debug","RealtimeSrc",0)
		debug_draw = ini_read_real("Debug","DebugDraw",0)
		lang = ini_read_real("General","Language",0)
		
		ctrl_left  = ini_read_real("Controls","Left" ,vk_left)
		ctrl_up    = ini_read_real("Controls","Up"   ,vk_up)
		ctrl_right = ini_read_real("Controls","Right",vk_right)
		ctrl_down  = ini_read_real("Controls","Down" ,vk_down)
		ctrl_jump  = ini_read_real("Controls","Jump" ,vk_space)
		ctrl_fire  = ini_read_real("Controls","Fire" ,vk_lshift)
		ctrl_start = ini_read_real("Controls","Start",vk_return)
		
		handytitle = ini_read_real("General","HandyTitle",0)
	}
	
	debug_draw |= debug_mode

	if !realtimesrc {
	file_text_read_all_scr =
		execute_file(path_src+"scr/file_text_read_all.gml",path_src+"scr/file_text_read_all.gml")
	get_code_scr = file_text_read_all(path_src+"scr/get_code.gml")
	}
	else {
	file_text_read_all_scr = path_src+"scr/file_text_read_all.gml"
	get_code_scr = path_src+"scr/get_code.gml" }

	printf_scr = get_code(path_src+"scr/printf.gml")
	clear_scr = get_code(path_src+"scr/clear.gml")
	conlines_scr = get_code(path_src+"scr/conlines.gml")
	lobit_scr = get_code(path_src+"scr/lobit.gml")
	lobyte_scr = get_code(path_src+"scr/lobyte.gml")
	hibit_scr = get_code(path_src+"scr/hibit.gml")
	hibyte_scr = get_code(path_src+"scr/hibyte.gml")
	create_obj_scr = get_code(path_src+"obj/scr/cctor.gml")

	{
		object_event_add(controller,ev_step,0,get_code(path_src+"ctrl/step.gml",0))
		object_event_add(controller,ev_draw,0,get_code(path_src+"ctrl/draw.gml",0))
		object_event_add(player,ev_step,0,get_code(path_src+"klo/step.gml",0))
		object_event_add(player,ev_draw,0,get_code(path_src+"klo/draw.gml",0))
		object_event_add(tile,ev_create,0,get_code(path_src+"tile/create.gml",0))
		object_event_add(item,ev_draw,0,get_code(path_src+"obj/item/draw.gml",0))
		//object_event_add(particle,ev_draw,0,get_code(path_src+"part/draw.gml",0))
	}
	
	globalvar log,logmax,logfull,posx,posy;
	log = chr($D)
	logmax = 2048

	/// LEVEL STUFF
	{
		lvinfo = file_bin_open(fname,0)
		
		// START OF FILE
		filecur = 0
		file_bin_seek(lvinfo,filecur)
		
		if file_bin_read_byte(lvinfo) = $AC
		{
			filecur += 1
			if file_bin_read_byte(lvinfo) = $1E
			{
				// 0x02 - filever {
				filecur += 1
				file_bin_seek(lvinfo,filecur)
				var fvermatch;
				fvermatch = file_bin_read_byte(lvinfo) * 256
				filecur += 1
				file_bin_seek(lvinfo,filecur)
				fvermatch += file_bin_read_byte(lvinfo)
				if fver != fvermatch {
					show_error("FILE ERROR!"+chr($D)+"Unmatching level version"+chr($D)+
								string(fver)+" != "+string(fvermatch)+chr($D)+
								"This level may not be compatible"+chr($D),true)
				}
				/* }
				   0x04 - level type, music, theme id {
				*/
				filecur += 1
				file_bin_seek(lvinfo,filecur)
				lvtype = file_bin_read_byte(lvinfo)
				filecur += 1
				file_bin_seek(lvinfo,filecur)
				var musthe;
				musthe = file_bin_read_byte(lvinfo)
				themeid = HIBIT(musthe)
				musicid = LOBIT(musthe)
				filecur += 2
				worldstr="w"+string_replace(string_format(themeid,2,0),' ','0')
				background_replace(tiles,path_gfx+"world/"+worldstr+"/tiles.png",true,false)
				worldstr="w"+string_replace(string_format(musicid,2,0),' ','0')
				if musicid {
					sound_replace(mus_int,path_mus+worldstr+"_int.mp3",3,1)
					sound_replace(mus_lp ,path_mus+worldstr+"_lp.mp3" ,3,1)
				}
				/* }
				   0x08 - level size and start position {
				*/
				for (i=0;i<4;i+=1)
				{
					filecur += 1
					file_bin_seek(lvinfo,filecur)
					levelsizeraw[i] = file_bin_read_byte(lvinfo)
				}
				for (i=0;i<4;i+=1)
				{
					filecur += 1
					file_bin_seek(lvinfo,filecur)
					startposraw[i] = file_bin_read_byte(lvinfo)
				}
				var k;
				for (i=0;i<2;i+=1)
				{
					for (j=0;j<2;j+=1)
					{
						switch (j)
						{
							case 0:
							k = 256
							break
							case 1:
							k = 1
							break
						}
						startpos[i] += startposraw[j+(i*2)] * k
						levelsize[i] += levelsizeraw[j+(i*2)] * k
					}
				}
				levelbounds[0] = 0					//top
				levelbounds[1] = 0					//left
				levelbounds[2] = levelsize[0]*4		//right
				levelbounds[3] = levelsize[1]*8		//bottom
				/* }
					0x10 - bitmap to tiles {
				*/
				for (j=0;j<levelsize[1];j+=1)
				{
					for (i=0;i<levelsize[0];i+=2)
					{
						filecur += 1
						filesz = file_bin_size(lvinfo)
						if (filecur < filesz) {
							file_bin_seek(lvinfo,filecur)
							_tempvar0 = file_bin_read_byte(lvinfo)
							if (_tempvar0)
							{
								instance_create(i*4,j*8,tile)
								tile_add(tiles,(((_tempvar0-1)*8)mod 128),((floor(_tempvar0/16))*8),8,8,i*4,j*8,0)
							}
						} else {
							abortload=1
							show_error(
								"File loading ended prematurely."+chr($D)+"Expected level size: "+
									string(levelsize[0])+"x"+string(levelsize[1])+" | "+string(levelsize[0]*levelsize[1])+chr($D)+
									"EOF position:        "+string(i+1)+"x"+string(j+1)+" | "+string((i+1)*(j+1)),false)
							break;
						}
					}
					if abortload { break; abortload = 0 }
				}
				while (filecur mod 16 != 0)
					filecur += 1
				file_bin_seek(lvinfo,filecur)
				/* }
					0xXX - objects {
				*/
				while (filecur < filesz)
				{
					// reading process
					// x0 - type
					_tempvar_obj_confirmcreate = 1
					_tempvar_obj_type = file_bin_read_byte(lvinfo)
					// x1 - subtype
					filecur += 1
					_tempvar_obj_subtype = file_bin_read_byte(lvinfo)
					// x2 - properties
					filecur += 2
					_tempvar_obj_props[0] = file_bin_read_byte(lvinfo)
					_tempvar_obj_props[1] = file_bin_read_byte(lvinfo)
					_tempvar_obj_pos[0] = 0
					_tempvar_obj_pos[1] = 0
					{
						switch (_tempvar_obj_type)
						{
							// ITEM
							case 0:
								switch (_tempvar_obj_subtype)
								{
									// GEM
									case 0:
										
										break
									// DIAMOND
									case 1:
									
										break
									// HEART
									case 2:
									
										break
									// STAR
									case 3:
									
										break
									// LIFE
									case 4:
										break
									default:
										show_error("@ "+string_format(filecur,6,0)+" bytes: Invalid object subtype.",false)
										_tempvar_obj_confirmcreate = 0
										break
								}
								break
							// ENEMY
							case 1:
								break
							// DOOR
							case 2:
								break
							default:
								show_error("@ "+string_format(filecur-1,6,0)+" bytes: Invalid object type.",false)
								_tempvar_obj_confirmcreate = 0
								break
						}
					}
					// x4 - position
					for (i=0;i<4;i+=1)
					{
						//file_bin_seek(lvinfo,filecur)
						_tempvar_obj_rawpos[i] = file_bin_read_byte(lvinfo)
						filecur += 1
					}
					for (i=0;i<2;i+=1)
					{
						for (j=0;j<2;j+=1)
						{
							switch (j)
							{
								case 0:
								k = 256
								break
								case 1:
								k = 1
								break
							}
							_tempvar_obj_pos[i] += _tempvar_obj_rawpos[j+(i*2)] * k
						}
					}
					/*show_message(string(_tempvar_obj_type)+","+string(_tempvar_obj_subtype)+","+
								string(_tempvar_obj_props[0])+","+string(_tempvar_obj_props[1])+","+
								string(_tempvar_obj_rawpos[0])+","+string(_tempvar_obj_rawpos[1])+","+
								string(_tempvar_obj_rawpos[2])+","+string(_tempvar_obj_rawpos[3]))
					show_message(string(_tempvar_obj_pos[0])+","+string(_tempvar_obj_pos[1]))*/
					if filecur > filesz
					{
						show_error("@ "+string_format(filesz,6,0)+" bytes: Invalid object length, reached EOF.",false)						
						_tempvar_obj_confirmcreate = 0
					}
					if _tempvar_obj_confirmcreate
					{
						// TODO: CREATE SCRIPT FOR THIS TYPE OF THING
						with instance_create(_tempvar_obj_pos[0],_tempvar_obj_pos[1],item)
						{
							sprite_index=collision_8x8c
							char_index = 0
							char_speed = 0.13333
							type = _tempvar_obj_type
							subtype = _tempvar_obj_subtype
							settings[0] = _tempvar_obj_props[0]
							settings[1] = _tempvar_obj_props[1]
						}
					}
					filecur += 1
				}
				/* } 0xXX - EOF */
			}
			else {
				show_error("Invalid file signature.",false)
				game_end()
			}
		}
		else {
			show_error("Invalid file signature.",false)
			game_end()
		}
		
		file_bin_close(lvinfo)
	}

	/// SPRITE STUFF
	{
		sprite_replace(klospr,path_gfx+"common/player.png",0,1,0,0,0)
		sprite_replace(hudspr,path_gfx+"common/hud.png",0,1,0,0,0)
		sprite_replace(itemspr,path_gfx+"common/item.png",0,1,0,0,0)
		sprite_replace(partspr,path_gfx+"common/particle.png",0,1,0,0,0)
		confnt = font_add_sprite(sprite_add(path_gfx+"misc/debug.png",94,0,0,0,0),ord('!'),0,0)
	}
	
	/// SOUND STUFF
	{
		globalvar snd_jump, snd_land, snd_pause, snd_scroll,
				snd_gem;
		snd_jump = sound_add(path_sfx+"jump.wav",0,1)
		snd_land = sound_add(path_sfx+"land.wav",0,1)
		snd_pause = sound_add(path_sfx+"pause.wav",0,1)
		snd_scroll = sound_add(path_sfx+"scroll.wav",0,1)
		snd_gem = sound_add(path_sfx+"gem.wav",0,1)
		
		sound_play(mus_int)
	}

	/// PLAYER STUFF
	{
		health = 3
		lives = 5
		with (player)
		{
			x = startpos[0] * 8
			y = startpos[1] * 8
			image_xoffset = 0
			image_yoffset = 0
			tilecol[0] = -20
			tilecol[1] = -7
			tilecol[2] = 14
			tilecol[3] = 0
			itemcol[0] = -19
			itemcol[1] = -2
			itemcol[2] = 8
			itemcol[3] = 0
			entcol[0] = -17
			entcol[1] = 0
			entcol[2] = 2
			entcol[3] = 0
			depth = -1
		}
	}
	
	//if lang (implement switch)
	{
		keystr[vk_left     ] =  "Left Arrow"
		keystr[vk_up       ] =    "Up Arrow"
		keystr[vk_right    ] = "Right Arrow"
		keystr[vk_down     ] =  "Down Arrow"
		keystr[vk_return   ] = "Return"
		keystr[vk_enter    ] = "Enter"
		keystr[vk_space    ] = "Space"
		keystr[vk_nokey    ] = "None" // ???
		keystr[vk_anykey   ] = "*"    // ???
		keystr[vk_escape   ] = "Escape"
		keystr[vk_control  ] = "Control"
		keystr[vk_lcontrol ] = "Left Control"
		keystr[vk_rcontrol ] = "Right Control"
		keystr[vk_shift    ] = "Shift"
		keystr[vk_lshift   ] = "Left Shift"
		keystr[vk_rshift   ] = "Right Shift"
		keystr[vk_alt      ] = "Alt"
		keystr[vk_lalt     ] = "Left Alt"
		keystr[vk_ralt     ] = "Right Alt"
		keystr[vk_backspace] = "Backspace"
		keystr[vk_tab      ] = "Tab"
		keystr[vk_home     ] = "Home"
		keystr[vk_end      ] = "End"
		keystr[vk_insert   ] = "Insert"
		keystr[vk_delete   ] = "Delete"
		keystr[vk_pageup   ] = "Page Up"
		keystr[vk_pagedown ] = "Page Down"
		keystr[vk_pause    ] = "Pause"
		keystr[vk_printscreen] = "Print Screen"
		keystr[vk_f1       ] = "F1"
		keystr[vk_f2       ] = "F2"
		keystr[vk_f3       ] = "F3"
		keystr[vk_f4       ] = "F4"
		keystr[vk_f5       ] = "F5"
		keystr[vk_f6       ] = "F6"
		keystr[vk_f7       ] = "F7"
		keystr[vk_f8       ] = "F8"
		keystr[vk_f9       ] = "F9"
		keystr[vk_f10      ] = "F10"
		keystr[vk_f11      ] = "F11"
		keystr[vk_f12      ] = "F12"
		keystr[vk_numpad0  ] = "Numpad 0"
		keystr[vk_numpad1  ] = "Numpad 1"
		keystr[vk_numpad2  ] = "Numpad 2"
		keystr[vk_numpad3  ] = "Numpad 3"
		keystr[vk_numpad4  ] = "Numpad 4"
		keystr[vk_numpad5  ] = "Numpad 5"
		keystr[vk_numpad6  ] = "Numpad 6"
		keystr[vk_numpad7  ] = "Numpad 7"
		keystr[vk_numpad8  ] = "Numpad 8"
		keystr[vk_numpad9  ] = "Numpad 9"
		keystr[vk_multiply ] = "Multiplay"
		keystr[vk_divide   ] = "Divide"
		keystr[vk_add      ] = "Add"
		keystr[vk_subtract ] = "Subtract"
		keystr[vk_decimal  ] = "Decimal"
		for (i=0;i<10;i+=1)
			keystr[ord(string(i))] = string(i)
		for (i=0;i<26;i+=1)
			keystr[ord('A')+i] = chr(i+ord('A'))
		
		pause_btns[0] = "Continue Game"
		pause_btns[1] = "Last Checkpoint"
		pause_btns[2] = "Restart Vision"
		pause_btns[3] = "Select Vision"
		pause_btns[4] = "Configuration"
	}

	frame = 0

	view_hborder[0] = view_wview[0]
	view_vborder[0] = view_hview[0]
	
	window_set_region_scale(floor(ini_read_real("Display","Scale",2)),true)
	//fix not being able to downsize window
	//because it worked before on x1 scale
	freesize = ini_read_real("Display","FreeSize",0)
	if !freesize window_set_sizeable(false)
	
	window_set_visible(true)

	window_center()
	posx = window_get_x()
	posy = window_get_y()
}
else
	game_end()
