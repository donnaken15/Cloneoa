if file_exists(argument0)
{
	lvinfo = file_bin_open(argument0,0)
	
	textbox_focus=0
	
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
			fvermatch = file_bin_read_byte(lvinfo) << 8
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
			// ^ skip because other level types arent implemented yet
			// except RLE flag
			filecur += 3
			var musthe;
			musthe = file_bin_read_byte(lvinfo)
			__level.theme = HIBIT(musthe)
			__level.music = LOBIT(musthe)
			filecur += 2
			worldstr="w"+string_replace(string_format(themeid,2,0),' ','0')
			sprite_replace(terrain,path_gfx+"world/"+worldstr+"/tiles.png",0,1,0,0,0)
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
						k = 8
						break
						case 1:
						k = 0
						break
					}
					startpos[i] += startposraw[j+(i<<1)] << k
					levelsize[i] += levelsizeraw[j+(i<<1)] << k
				}
			}
			/*while (level.px != startpos[0] &&
					level.py != startpos[1] &&
					level.w > 0 &&
					level.h > 0)
			{
				level.px = startpos[0]
				level.py = startpos[1]
				level.w = levelsize[0]
				level.h = levelsize[1]
				show_message(level.px)
				show_message(level.py)
				show_message(level.w)
				show_message(level.h)
				show_message(startpos[0])
				show_message(startpos[1])
				show_message(levelsize[0])
				show_message(levelsize[1])
			}*/
			level.px = startpos[0]
			level.py = startpos[1]
			level.w = levelsize[0]
			level.h = levelsize[1]
			objselect=-2
			propsinput0.text = string(level.w)
			propsinput1.text = string(level.h)
			propsinput2.text = string(level.type)
			propsinput3.text = string(level.music)
			propsinput4.text = string(level.theme)
			/* }
				0x10 - bitmap to tiles {
			*/
			//file_bin_close(lvinfo)
			//exit
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
								level.tiles[i,j] = _tempvar0
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
							tileid=file_bin_read_byte(lvinfo)
							tileln=file_bin_read_byte(lvinfo)
							tileby+=2
							if(tileid)
							{
								for (i=0;i<tileln+1;i+=1)
								{
									tilearr[tilecur] = tileid
									tilecur+=1
								}
							}
							else
								tilecur += tileln+1
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
						//with instance_create((i mod levelsize[0])<<3,floor(i/(levelsize[0]))<<3,tile) { visible = 0 }
						//tile_add(tiles,((((tilearr[i]-1))<<3)& 127),((floor(tilearr[i]/16))<<3),8,8,(i mod levelsize[0])<<3,floor(i/levelsize[0])<<3,0)
						level.tiles[i mod levelsize[0],floor(i/levelsize[0])] = tilearr[i]
					}
					filecur += tileby
					break
			}
			while (filecur & 15 != 0)
				filecur += 1
			// found a weird glitch where the first two objects arent created
			file_bin_seek(lvinfo,filecur)
			/* }
				0xXX - objects {
			*/
			level.objectcount=0
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
							k = 8
							break
							case 1:
							k = 0
							break
						}
						_tempvar_obj_pos[i] += _tempvar_obj_rawpos[j+(i<<1)] << k
					}
				}
				if filecur > filesz
				{
					show_error("@ "+string_format(filesz,6,0)+" bytes: Invalid object length, reached EOF.",false)
					_tempvar_obj_confirmcreate = 0
				}
				level.objects_type[level.objectcount] = _tempvar_obj_type
				level.objects_subtype[level.objectcount] = _tempvar_obj_subtype
				level.objects_props0[level.objectcount] = _tempvar_obj_props[0]
				level.objects_props1[level.objectcount] = _tempvar_obj_props[1]
				level.objects_props2[level.objectcount] = _tempvar_obj_props[2]
				level.objects_x[level.objectcount] = _tempvar_obj_pos[0]
				level.objects_y[level.objectcount] = _tempvar_obj_pos[1]
				level.objectcount += 1
				filecur += 1
			}
			/* } 0xXX - EOF */
		}
		else {
			show_error("Invalid file signature.",false)
		}
	}
	else {
		show_error("Invalid file signature.",false)
	}

	file_bin_close(lvinfo)
} else {
	show_error("That file does not exist:"+chr($D)+argument0,false)
}
