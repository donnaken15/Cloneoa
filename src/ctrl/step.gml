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

if keyboard_check_pressed(ctrl_start) && (health > 0 && !player.cantmove)
	if pause
	{
		depth = 100
		instance_activate_all()
		sprite_delete(pausescr)
		sound_volume(mus_int,0.87)
		sound_volume(mus_lp,0.87)
		pause = false
		pause_menu = 0
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
	switch pause_menu
	{
		case 0:
			if pause_jp_fix < 2 && lang // HATE THIS DUSHFGJBRUWFOI ENGINE
			{
				pause_jp_fix += 1
				pause_btns[0] = ktkn("YUNTEiNIyu-:KE`-MU")
				//pause_btns[1] = ktkn("RA-SUTO:TIeKUHO'ITO")
				pause_btns[2] = ktkn("RI-SUTA-TO:REHE`RU") // why are extra chars appearing
				pause_btns[3] = ktkn("SETEINKU`SU`")
				pause_btns[4] = ktkn("KUITUTO") //itu
					//chr($DA)+chr($CC)+chr($C4)+chr($A5)+
					//chr($B1)+chr($DB)+chr($B0)
				keystr[vk_left     ] = ktkn("REHUTO:ARO-")
				keystr[vk_up       ] = ktkn("AtuHU':ARO-")
				keystr[vk_right    ] = ktkn("RAITO:ARO-")
				keystr[vk_down     ] = ktkn("TA`UN:ARO-")
				keystr[vk_return   ] = ktkn("RETA-N")
				keystr[vk_enter    ] = ktkn("ENTA-")
				keystr[vk_space    ] = ktkn("SUHE'-SUKI-")
				keystr[vk_nokey    ] = ktkn("NAN")
				keystr[vk_anykey   ] = "*"
				keystr[vk_escape   ] = ktkn("ESUKE-HU'")
				keystr[vk_control  ] = ktkn("KONTORO-RU")
				keystr[vk_lcontrol ] = ktkn("REHUTO:KONTORO-RU")
				keystr[vk_rcontrol ] = ktkn("RAITO:KONTORO-RU")
				keystr[vk_shift    ] = ktkn("SIHUTO")
				keystr[vk_lshift   ] = ktkn("REHUTO:SIHUTO")
				keystr[vk_rshift   ] = ktkn("RAITO:SIHUTO")
				keystr[vk_alt      ] = "ALT"
				keystr[vk_lalt     ] = ktkn("REHUTO")+"ALT"
				keystr[vk_ralt     ] = ktkn("RAITO")+"ALT"
				keystr[vk_backspace] = ktkn("HA`tuKUSUHE'-SU")
				keystr[vk_tab      ] = ktkn("TAHU`")
				keystr[vk_home     ] = ktkn("HOME")
				keystr[vk_end      ] = ktkn("ENTO'")
				keystr[vk_insert   ] = ktkn("INSA-TO")
				keystr[vk_delete   ] = ktkn("TE'RI-TO")
				keystr[vk_pageup   ] = ktkn("HE'-SI':AtuHU'")
				keystr[vk_pagedown ] = ktkn("HE'-SI':TA`UN")
				keystr[vk_pause    ] = ktkn("HO'-SU`")
				keystr[vk_printscreen] = ktkn("HU'RINTO:SUKURI-N")
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
			}
				 if keyboard_check_pressed(ctrl_up)   { pause_scroll -= 1 sound_play(snd_scroll) }
			else if keyboard_check_pressed(ctrl_down) { pause_scroll += 1 sound_play(snd_scroll) }
			if pause_scroll = -1 pause_scroll = 4
			if pause_scroll =  5 pause_scroll = 0
			if keyboard_check_pressed(ctrl_jump)
			{
				switch pause_scroll
				{
					case 1:
						break
					case 2:
						level_load_pending = 1
					case 0:
						depth = 100
						instance_activate_all()
						sprite_delete(pausescr)
						sound_volume(mus_int,0.87)
						sound_volume(mus_lp,0.87)
						pause = false
						pause_menu = 0
						keyboard_clear(ctrl_jump)
						break
					case 4:
						ini_close()
						game_end()
						break
					case 3:
						change_key = 0
						config_scroll = 0
						if !lang
						{
							config_str[0] = "Jump"
							config_str[1] = "Shoot"
							config_str[2] = "Move Left"
							config_str[3] = "Move Right"
							config_str[4] = "Move In"
							config_str[5] = "Move Out"
							config_str_key = "Keys"
							config_str_head = "Configuration"
						} else {
							config_str[0] = ktkn("SI`yaSOHU'")
							config_str[1] = ktkn("SIyotuTO")
							config_str[2] = ktkn("REHUTO")
							config_str[3] = ktkn("RAITO")
							config_str[4] = "Move In"
							config_str[5] = "Move Out"
							config_str_key = ktkn("KONTORO-RU")
							config_str_head = pause_btns[3]
						}
						sound_play(snd_confirm)
					default:
						pause_menu = pause_scroll
						pause_scroll = 0
						break
				}
			}
			break
		case 3:
				 if keyboard_check_pressed(ctrl_up)   { config_scroll -= 1 sound_play(snd_scroll) }
			else if keyboard_check_pressed(ctrl_down) { config_scroll += 1 sound_play(snd_scroll) }
			if config_scroll = -1 config_scroll = 3
			if config_scroll =  4 config_scroll = 0
			if keyboard_check_pressed(ctrl_fire)
			{
				pause_menu = 0
			}
			if change_key
			{
				change_key = 2
			}
			if keyboard_check_pressed(ctrl_jump) && !change_key
			{
				if config_scroll < 5
					change_key = 1
				sound_play(snd_confirm)
			}
			if change_key = 2
			{
				keyboard_wait()
				switch config_scroll
				{
					case 0:
						ctrl_jump = keyboard_lastkey
						ini_write_real("Controls","Jump" ,ctrl_jump )
						break
					case 1:
						ctrl_fire = keyboard_lastkey
						ini_write_real("Controls","Fire" ,ctrl_fire )
						break
					case 2:
						ctrl_left = keyboard_lastkey
						ini_write_real("Controls","Left" ,ctrl_left )
						break
					case 3:
						ctrl_right = keyboard_lastkey
						ini_write_real("Controls","Right",ctrl_right)
						break
				}
				keyboard_lastkey = 0
				change_key = 0
			}
			break
	}
}

x = player.x
y = player.y-10

// figure this out to reduce CPU usage
if !pause
{
	if frame mod 30 = 1
		instance_deactivate_object(tile)
	instance_activate_region(player.x-12,player.y-28,28,28,true)
	for(i=0;i<instance_number(enemy);i+=1)
	{
		with instance_find(enemy,i)
		{
			if (subtype = 0) || grabby = noone
				instance_activate_region(x-12,y-28,28,32,true)
		}
	}
}
/*or scrap when you figure out ACTUAL TILE BASED COLLISION YOU STUPID KID
*/

if level_load_pending {
	health = 3
	lives = 5
	level_load_pending = 0
	load_level(fname)
}
