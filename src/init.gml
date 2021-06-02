window_set_visible(false)
globalvar fname,level,lvinfo,filecur,filesz,
themeid,musicid,lvtype,startposraw,debug_draw,
startpos,gems,stars,starmax,frame,handytitle,
levelsize,levelsizeraw,freesize,_tempvar0,base_gravity,
realtimesrc,confnt,pause,levelbounds,gems,stars,noclip,
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
can_get_hurt,
max_gems,
max_stars,
;

/* try implementing constants
types and subtypes for objects
char_index ids
*/

globalvar snd_wahoo;
fname = ""
path_root = program_directory+"/../"
path_src = path_root+"src/"
path_gfx = path_root+"gfx/"
path_sfx = path_root+"sfx/"
path_mus = path_root+"mus/"
path_bin = path_root+"bin/"
if parameter_count() = 0 {
	mus_file = sound_add(path_mus+"file.wav",1,1)
	snd_wahoo = sound_add(path_sfx+"wahoo.wav",0,1)
	sound_loop(mus_file)
	fname = get_open_filename("Klonoa Level File|*.klo|All Files|*.*","")
	if fname != "" {
		sound_play(snd_wahoo)
		sleep(760)
		sound_stop(mus_file)
	}
} else
	fname = parameter_string(1)

depth = 100
base_gravity = 0.21

if fname != "" && file_exists(fname)
{
	execute_file(path_src+"scr/reload.gml")

	load_level(fname)

	// PLAYER STUFF
	{
		health = 3
		lives = 5
		with (player)
		{
			x = startpos[0] * 8
			y = startpos[1] * 8
			xstart = startpos[0] * 8
			ystart = startpos[1] * 8
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
			entcol[2] = 7
			entcol[3] = 0
			depth = -3
			invnc_frames = 0
			draw = true
			grab = noone
			noclip = 0
			player_speed   = 1.5
			view_hspeed[0] = 1.5
			current_speed  = player_speed
			noclip_speed   = 2
		}
	}

	//if !lang
	{
		keystr[vk_left     ] =  "Left Arrow"
		keystr[vk_up       ] =    "Up Arrow"
		keystr[vk_right    ] = "Right Arrow"
		keystr[vk_down     ] =  "Down Arrow"
		keystr[vk_return   ] = "Return"
		keystr[vk_enter    ] = "Enter"
		keystr[vk_space    ] = "Space"
		keystr[vk_nokey    ] = "None"
		keystr[vk_anykey   ] = "*"
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
		keystr[vk_multiply ] = "Multiply"
		keystr[vk_divide   ] = "Divide"
		keystr[vk_add      ] = "Add"
		keystr[vk_subtract ] = "Subtract"
		keystr[vk_decimal  ] = "Decimal"
		for (i=0;i<10;i+=1)
			keystr[ord(string(i))] = string(i)
		for (i=0;i<26;i+=1)
			keystr[ord('A')+i] = chr(i+ord('A'))
		keystr[ord('[')] = 'Start'
		keystr[ord(']')] = 'Menu'
		keystr[192] = 'Grave'
		keystr[189] = 'Minus'
		keystr[187] = 'Equal'
		keystr[219] = '['
		keystr[221] = ']'
		keystr[220] = 'Backslash'
		keystr[186] = 'Semicolon'
		keystr[222] = 'Apostraphe'
		keystr[188] = 'Comma'
		keystr[190] = 'Period'
		keystr[191] = 'Slash'
		keystr[20 ] = 'Caps Lock'
		keystr[144] = 'Num Lock'
		keystr[145] = 'Scroll Lock'
		keystr[19 ] = 'Pause'
		keystr[12 ] = "Numpad 5 Unlocked"

		pause_btns[0] = "Continue Game"
		pause_btns[1] = "unavailable"
		//pause_btns[1] = "Last Checkpoint"
		pause_btns[2] = "Restart Vision"
		pause_btns[3] = "Configuration"
		pause_btns[4] = "Exit"
	}

	if lang
	{
		globalvar __kana_rpms;
		// wtf is this V
		// $A1 to $DD
		// reverse these lines
		// TODO: finish split script

		__kana_rpms[0]="."
		__kana_rpms[1]="["
		__kana_rpms[2]="]"
		__kana_rpms[3]=","
		__kana_rpms[4]=":"
		__kana_rpms[5]="wo"
		__kana_rpms[6]="a"
		__kana_rpms[7]="i"
		__kana_rpms[8]="u"
		__kana_rpms[9]="e"
		__kana_rpms[10]="o"
		__kana_rpms[11]="ya"
		__kana_rpms[12]="yu"
		__kana_rpms[13]="yo"
		__kana_rpms[14]="tu"
		__kana_rpms[15]="-"
		__kana_rpms[16]="A"
		__kana_rpms[17]="I"
		__kana_rpms[18]="U"
		__kana_rpms[19]="E"
		__kana_rpms[20]="O"
		__kana_rpms[21]="KA"
		__kana_rpms[22]="KI"
		__kana_rpms[23]="KU"
		__kana_rpms[24]="KE"
		__kana_rpms[25]="KO"
		__kana_rpms[26]="SA"
		__kana_rpms[27]="SI"
		__kana_rpms[28]="SU"
		__kana_rpms[29]="SE"
		__kana_rpms[30]="SO"
		__kana_rpms[31]="TA"
		__kana_rpms[32]="TI"
		__kana_rpms[33]="TU"
		__kana_rpms[34]="TE"
		__kana_rpms[35]="TO"
		__kana_rpms[36]="NA"
		__kana_rpms[37]="NI"
		__kana_rpms[38]="NU"
		__kana_rpms[39]="NE"
		__kana_rpms[40]="NO"
		__kana_rpms[41]="HA"
		__kana_rpms[42]="HI"
		__kana_rpms[43]="HU"
		__kana_rpms[44]="HE"
		__kana_rpms[45]="HO"
		__kana_rpms[46]="MA"
		__kana_rpms[47]="MI"
		__kana_rpms[48]="MU"
		__kana_rpms[49]="ME"
		__kana_rpms[50]="MO"
		__kana_rpms[51]="YA"
		__kana_rpms[52]="YU"
		__kana_rpms[53]="YO"
		__kana_rpms[54]="RA"
		__kana_rpms[55]="RI"
		__kana_rpms[56]="RU"
		__kana_rpms[57]="RE"
		__kana_rpms[58]="RO"
		__kana_rpms[59]="WA"
		__kana_rpms[60]="N"
		__kana_rpms[61]="`"
		__kana_rpms[62]="'"
	}

	frame = 0

	view_hborder[0] = view_wview[0]
	view_vborder[0] = view_hview[0]

	freesize = ini_read_real("Display","FreeSize",0)
	if !freesize {
		window_set_sizeable(false)
		window_set_region_scale(floor(ini_read_real("Display","Scale",2)),true)
		// TODO: figure out why this prevents downsizing window
	}

	if ini_read_real("Display","FullScreen",0)
	{
		window_set_fullscreen(1)
		window_set_region_scale(-1,true)
	}

	window_set_visible(true)

	window_center()
	posx = window_get_x()
	posy = window_get_y()
}
else
	game_end()
