if file_exists(argument0)
{
	lvinfo = file_bin_open(argument0,0)

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
			fvermatch += file_bin_read_byte(lvinfo)
			if fver != fvermatch {
				show_error("FILE ERROR!"+chr($D)+"Unmatching level version"+chr($D)+
							string(fver)+" != "+string(fvermatch)+chr($D)+
							"This level may not be compatible"+chr($D),true)
			}
			/* }
			   0x04 - level type, music, theme id {
			*/
			lvflags = file_bin_read_byte(lvinfo)
			filecur += 3
			var musthe;
			musthe = file_bin_read_byte(lvinfo)
			themeid = HIBIT(musthe)
			musicid = LOBIT(musthe)
			filecur += 2
			worldstr="w"+string_replace(string_format(themeid,2,0),' ','0')
			background_replace(tiles,path_gfx+"world/"+worldstr+"/tiles.png",true,false)
			worldstr="w"+string_replace(string_format(musicid,2,0),' ','0')
			if musicid {
				sound_replace(mus_int,path_mus+worldstr+"_int.wav",1,1)
				sound_replace(mus_lp ,path_mus+worldstr+"_lp.wav" ,1,1)
			}
			/* }
			   0x08 - level size and start position {
			*/
			startpos[0]=0
			startpos[1]=0
			levelsize[0]=0
			levelsize[1]=0
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
			levelbounds[2] = levelsize[0]*8		//right
			levelbounds[3] = levelsize[1]*8		//bottom
			/* }
				0x10 - bitmap to tiles {
			*/
			instance_activate_object(tile)
			while instance_number(tile) > 0 {
				with (tile) { instance_destroy() }
			}
			tile_layer_delete(0)
			filesz = file_bin_size(lvinfo)
			// get compression flag
			switch ((lvflags & $30) >> 4)
			{
				case 0:
					for (j=0;j<levelsize[1];j+=1)
					{
						for (i=0;i<levelsize[0];i+=1)
						{
							filecur += 1
							if (filecur < filesz) {
								file_bin_seek(lvinfo,filecur)
								_tempvar0 = file_bin_read_byte(lvinfo)
								if (_tempvar0)
								{
									with instance_create(i*8,j*8,tile) { visible = 0 }
									tile_add(tiles,(((_tempvar0-1)*8)mod 128),((floor(_tempvar0/16))*8),8,8,i*8,j*8,0)
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
					break
				case 1:
					tilecur = 0 // cursor in file
					tilearr = 0 // tile array
					tileal  = (levelsize[0] * levelsize[1])
					tileid  = 0 // current tile byte
					tileln  = 0 // current tile length
					tileby  = 0
					while (tilecur < tileal)
					{
						if (file_bin_position(lvinfo) < file_bin_size(lvinfo)) {
							//show_error(string(file_bin_position(lvinfo)),false)
							tileid=file_bin_read_byte(lvinfo)
							tileln=file_bin_read_byte(lvinfo)
							tileby+=2
							//show_error(string(file_bin_position(lvinfo)),false)
							//if(tileid)
							{
								for (i=0;i<tileln+1;i+=1)
								{
									tilearr[tilecur] = tileid
									tilecur+=1
								}
							}
							//else
								//tilecur += tileln
						} else {
							abortload=1
							show_error(
								"File loading ended prematurely."+chr($D)+"Expected amount of tiles: "+chr($D)+
									"     "+string(levelsize[0]*levelsize[1])+chr($D)+
									"Got: "+chr($D)+"     "+string(tilecur),false)
							break;
						}
						
					}
					for (i=0;i<(tilecur);i+=1)
					{
						if (tilearr[i])
						{
							with instance_create((i mod levelsize[0])*8,floor(i/(levelsize[0]))*8,tile) { visible = 0 }
							tile_add(tiles,(((tilearr[i]-1)mod 128)*8),((floor(tilearr[i]/16))*8),8,8,(i mod levelsize[0])*8,floor(i/levelsize[0])*8,0)
						}
					}
					filecur += tileby
					break
			}
			while (filecur mod 16 != 0)
				filecur += 1
			file_bin_seek(lvinfo,filecur)
			/* }
				0xXX - objects {
			*/
			max_gems = 0
			can_get_hurt = 0
			with (item) { type=99; subtype=99; instance_destroy() }
			with (enemy) { instance_destroy() }
			while (filecur < filesz)
			{
				// reading process
				// x0 - type & subtype
				_tempvar_obj_confirmcreate = 1
				_tempvar_obj_type = file_bin_read_byte(lvinfo)
				_tempvar_obj_subtype = _tempvar_obj_type & 15
				_tempvar_obj_type = (_tempvar_obj_type & $F0) >> 4
				// x1 - properties
				_tempvar_obj_props[0] = file_bin_read_byte(lvinfo)
				_tempvar_obj_props[1] = file_bin_read_byte(lvinfo)
				_tempvar_obj_props[2] = file_bin_read_byte(lvinfo)
				filecur += 3
				// x4 - position
				_tempvar_obj_pos[0] = 0
				_tempvar_obj_pos[1] = 0
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
				if filecur > filesz
				{
					show_error("@ "+string_format(filesz,6,0)+" bytes: Invalid object length, reached EOF.",false)
					_tempvar_obj_confirmcreate = 0
				}
				create_object(_tempvar_obj_type,_tempvar_obj_subtype,
					_tempvar_obj_props[0],	_tempvar_obj_props[1],
					_tempvar_obj_pos[0],	_tempvar_obj_pos[1])
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
	
	with (player)
	{
		x = startpos[0] * 8
		y = startpos[1] * 8
		xstart = x
		ystart = y
		vspeed = 0
		hspeed = 0
		gravity = 0
		float = 0
		jump = 0
		gems = 0
		grab = noone
		char_index = 0
		cantmove = 0
		flip = 0
		slide = 0
	}
	
	sound_stop_all()
	sound_play(mus_int)
	sound_volume(mus_int,0.87)
	sound_volume(mus_lp,0.87)
	music_part = 0
	frame = 0
} else {
	show_error("That file does not exist:"+chr($D)+argument0,false)
	game_end()
}
