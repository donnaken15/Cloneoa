window_set_visible(false)
globalvar fname,level,lvinfo,filecur,
themeid,musicid,lvtype,startposraw,
startpos,gems,stars,starmax, frame,
levelsize,levelsizeraw
realtimesrc,
path_root,path_src,
path_gfx,path_sfx,
path_mus,path_bin
;
fname = ""
path_root = program_directory+"/../"
path_src = path_root+"src/"
path_gfx = path_root+"gfx/"
path_sfx = path_root+"sfx/"
path_mus = path_root+"mus/"
path_bin = path_root+"bin/"
if parameter_count() = 0
    fname = get_open_filename("Klonoa Level File|*.klo|All Files|*.*","")
else
    fname = parameter_string(1)
if fname = ""
    game_end()
else
    window_set_visible(true)

realtimesrc = 1

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
			// }
			show_message("everything:#fver: "+string(fvermatch)+
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
    //wd_message_simple(program_directory+"\..\gfx\player.png")
    sprite_replace(klospr,path_gfx+"player.png",0,1,0,0,0)
    sprite_replace(hudspr,path_gfx+"hud.png",0,1,0,0,0)
}

/// PLAYER STUFF
{
    health = 3
    lives = 5
    with (player)
    {
        //var char_index, char_speed, player_speed;
        //player_speed = 3
        x = startpos[0]
        y = startpos[1]
    }
}

frame = 0

//room_set_width(room,2147483648)
//room_set_height(room,2147483648)

//room_restart()

view_hborder[0] = view_wview[0]
view_vborder[0] = view_hview[0]

//view_xport[0] = player.x + (view_wview[0] / 2)
//view_yport[0] = player.y + (view_hview[0] / 2)

//view_xport[0] = (view_wview[0] / 2) * -1
//view_yport[0] = (view_hview[0] / 2) * -1
//view_xview[0] = (view_wview[0] / 2) * -1
//view_yview[0] = (view_hview[0] / 2) * -1

window_center()
posx = window_get_x()
posy = window_get_y()