//window_set_visible(false)
globalvar fname,level,lvinfo,filecur,
themeid,musicid,lvtype,startposraw,
startpos,gems,stars,starmax,frame,
levelsize,levelsizeraw,freesize
realtimesrc,confnt,pause,
path_root,path_src,
path_gfx,path_sfx,
path_mus,path_bin,
levelbounds
;
fname = ""
path_root = program_directory+"/../"
path_src = path_root+"src/"
path_gfx = path_root+"gfx/"
path_sfx = path_root+"sfx/"
path_mus = path_root+"mus/"
path_bin = path_root+"bin/"
if parameter_count() = 0 {
	//mus_file = sound_add(path_mus+"file.wav",1,1)
	mus_file = sound_add(path_mus+"file.wma",3,1)
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

if fname != ""
{
	//window_set_visible(true)
	
	/// SETTINGS
	ini_open(path_bin+"settings.ini")
	{
		realtimesrc = ini_read_real("Debug","RealtimeSrc",0)
	}

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

	{
		object_event_add(controller,ev_step,0,get_code(path_src+"ctrl/step.gml",0))
		object_event_add(controller,ev_draw,0,get_code(path_src+"ctrl/draw.gml",0))
		object_event_add(player,ev_step,0,get_code(path_src+"klo/step.gml",0))
		object_event_add(player,ev_draw,0,get_code(path_src+"klo/draw.gml",0))
		object_event_add(tile,ev_step,0,get_code(path_src+"tile/step.gml",0))
		object_event_add(tile,ev_draw,0,get_code(path_src+"tile/draw.gml",0))
	}
	
	globalvar log,logmax,logfull,posx,posy;
	log = chr($D)
	logmax = 2048
	
	//with console y = view_hview[0]

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
					show_message("FILE ERROR:#Unmatching level version#"+string(fver)+" != "+string(fvermatch)+"#Aborting immediately...")
					game_end()
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
				musicid = LOBIT(musthe)
				themeid = HIBIT(musthe)
				filecur += 2
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
					//k = 4294967296
					for (j=0;j<2;j+=1)
					{
						switch (j)
						{
							/*case 0:
							k = 16777216
							break
							case 1:
							k = 65536
							break*/
							case 0:
							k = 256
							break
							case 1:
							k = 1
							break
						}
						//k = sqrt(k)
						startpos[i] += startposraw[j+(i*2)] * k
						levelsize[i] += levelsizeraw[j+(i*2)] * k
					}
				}
				levelbounds[0] = 0					//top
				levelbounds[1] = 0					//left
				levelbounds[2] = levelsize[0]*16	//right
				levelbounds[3] = levelsize[1]*16	//bottom
				
				//room_set_width(room_first,levelsize[0]*16)
				//room_set_height(room_first,levelsize[1]*16)
				//room_goto_next()
				//room_set_width(room_first,2048)
				//room_set_height(room_first,2048)
				//room_goto_previous()
				//room_restart()
				// }
				/*show_message("everything:#fver: "+string(fvermatch)+
					"#type: "+string(lvtype)+"#music: "+string(musicid)+
					"#theme: "+string(themeid)+"#level size: "+string(levelsize[0])+
					"x"+string(levelsize[1])+"#start pos: "+string(startpos[0])+
					"x"+string(startpos[1]))
				/*for (i=0;i<2;i+=1)
				{
					//startpos[i] = signed32(startpos[i])
					if startpos[i] > $7FFFFFFF
						startpos[i] = startpos[i] * -1 + 2147483647
				}*/
				//show_message(string(startpos[0]))
			}
		}
		
		file_bin_close(lvinfo)
	}

	/// SPRITE STUFF
	{
		//wd_message_simple(program_directory+"\..\gfx\common\player.png")
		sprite_replace(klospr,path_gfx+"common/player.png",0,1,0,0,0)
		sprite_replace(hudspr,path_gfx+"common/hud.png",0,1,0,0,0)
		confnt = font_add_sprite(sprite_add(path_gfx+"misc/debug.png",94,0,0,0,0),ord('!'),0,0)
	}

	/// PLAYER STUFF
	{
		health = 3
		lives = 5
		with (player)
		{
			//var char_index, char_speed, player_speed;
			//player_speed = 3
			x = startpos[0] * 16
			y = startpos[1] * 16
			image_xoffset = 0
			image_yoffset = 0
			collision=0
			collision[0] = -20
			collision[1] = -7
			collision[2] = 14
			collision[3] = 0
			depth = -1
		}
	}
	
	with instance_create(24,240,tile) { solid=1 }

	frame = 0

	//room_set_width(room,2147483648)
	//room_set_height(room,2147483648)

	//room_restart()

	view_hborder[0] = view_wview[0]
	view_vborder[0] = view_hview[0]
	
	//why isnt this working with ini vars window_set_size(test0,test0)
	
	//decimals break code
	//also looks ugly with non-AA anyway
	window_set_region_scale(floor(ini_read_real("Display","Scale",2)),true)
	//fix not being able to downsize window
	//because it worked before on x1 scale
	freesize = ini_read_real("Display","FreeSize",0)
	if !freesize window_set_sizeable(false)

	window_center()
	posx = window_get_x()
	posy = window_get_y()
}
else
	game_end()
