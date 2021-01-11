window_set_visible(false)
globalvar fname,level,lvinfo,filecur,
themeid,musicid,lvtype,startposraw,
startpos,gems,stars,starmax,frame,
levelsize,levelsizeraw,freesize,
realtimesrc,confnt,pause,_tempvar0,
path_root,path_src,
path_gfx,path_sfx,
path_mus,path_bin,
levelbounds,
hud_enable_base,
hud_enable_hearts,
hud_enable_gems,
hud_enable_stars,
pause,pausescr,
worldstr
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
	fname = get_open_filename("Klonoa Level File|*.klo|All Files|*.*","..\lvl")
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
	window_set_visible(true)
	
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
		object_event_add(tile,ev_create,0,get_code(path_src+"tile/create.gml",0))
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
					show_error("FILE ERROR:"+chr($D)+"Unmatching level version"+chr($D)+string(fver)+" != "+string(fvermatch)+chr($D)+"Aborting immediately...",true)
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
				background_replace(tiles,path_gfx+"world/"+worldstr+"/tiles.png",false,false)
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
						//k = sqrt(k)
						startpos[i] += startposraw[j+(i*2)] * k
						levelsize[i] += levelsizeraw[j+(i*2)] * k
					}
				}
				levelbounds[0] = 0					//top
				levelbounds[1] = 0					//left
				levelbounds[2] = levelsize[0]*4		//right
				levelbounds[3] = levelsize[1]*8		//bottom
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
								"File loading ended prematurely."+chr($D)+"Current level size: "+
									string(levelsize[0])+"x"+string(levelsize[1])+chr($D)+"EOF position:       "+
									string(i+1)+"x"+string(j+1),false)
							break;
						}
					}
					if abortload { break; abortload = 0 }
				}
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
		confnt = font_add_sprite(sprite_add(path_gfx+"misc/debug.png",94,0,0,0,0),ord('!'),0,0)
	}
	
	/// SOUND STUFF
	{
		globalvar snd_jump, snd_land, snd_pause, snd_scroll;
		snd_jump = sound_add(path_sfx+"jump.wav",0,1)
		snd_land = sound_add(path_sfx+"land.wav",0,1)
		snd_pause = sound_add(path_sfx+"pause.wav",0,1)
		snd_scroll = sound_add(path_sfx+"scroll.wav",0,1)
		
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
			collision[0] = -20
			collision[1] = -7
			collision[2] = 14
			collision[3] = 0
			depth = -1
		}
	}

	frame = 0

	view_hborder[0] = view_wview[0]
	view_vborder[0] = view_hview[0]
	
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
