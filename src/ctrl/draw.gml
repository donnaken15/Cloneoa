frame+=1
draw_rectangle_color(levelbounds[1],levelbounds[0],
					levelbounds[1]+levelbounds[2]-1,
					levelbounds[0]+levelbounds[3]-1,
		c_white,c_white,c_white,c_white,false)

if pause {
	switch pause_menu
	{
		case 0:
			draw_set_color(c_white)
			if !lang
				draw_set_font(menufont)
			else
				draw_set_font(japanfont)
			draw_set_halign(fa_center)
			draw_set_alpha(1)
			draw_sprite(pausescr,0,view_xview[0],view_yview[0])
			draw_set_alpha(.5)
			draw_rectangle_color(view_xview[0],view_yview[0],
								view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],
					c_black,c_black,c_black,c_black,false)
			draw_set_alpha(1)
			draw_sprite_part(hudspr,0,40,42,60,22,
				view_xview[0]+(view_wview[0]/4)+30,view_yview[0]+(view_hview[0]/10))
			for (i = 0; i < 5; i += 1) {
				draw_sprite_part(hudspr,0,0,43,12,14,
					view_xview[0]+(view_wview[0]/4)+10,view_yview[0]+(view_hview[0]/3)-10+(i*20))
				draw_sprite_part_ext(hudspr,0,11,43,1,14,
					view_xview[0]+(view_wview[0]/4)+22,view_yview[0]+(view_hview[0]/3)-10+(i*20),
					78,1,c_white,1)
				draw_sprite_part(hudspr,0,12,43,12,14,
					view_xview[0]+(view_wview[0]/4)+98,view_yview[0]+(view_hview[0]/3)-10+(i*20))
				draw_text(view_xview[0]+(view_wview[0]/2)-1,view_yview[0]+(view_hview[0]/3)-9+(i*20),pause_btns[i])
				if (i=pause_scroll)
				{
					for (j = 0; j < 2; j += 1)
					draw_sprite_part_ext(hudspr,0,24,43,16,17,
						view_xview[0]+(view_wview[0]/4)-16+(152*j),view_yview[0]+(view_hview[0]/3)-10+(i*20)-1,
						1-(2*j),1,c_white,1)
					//draw_sprite_part_ext(hudspr,0,24,43,16,17,
						//view_xview[0]+(view_wview[0]/4)+134,view_yview[0]+(view_hview[0]/3)-10+(i*20)-1,
						//-1,1,c_white,1)
				}
			}
			break
		case 3:
			draw_set_color(c_white)
			if !lang
				draw_set_font(menufont)
			else
				draw_set_font(japanfont)
			draw_set_halign(fa_center)
			draw_set_alpha(1)
			draw_sprite(pausescr,0,view_xview[0],view_yview[0])
			draw_set_alpha(.5)
			draw_rectangle_color(view_xview[0],view_yview[0],
								view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],
					c_black,c_black,c_black,c_black,false)
			draw_set_alpha(1)
			draw_sprite_part(hudspr,0,0,43,12,14,
				view_xview[0]+(view_wview[0]/4)+10,view_yview[0]+20)
			draw_sprite_part_ext(hudspr,0,11,43,1,14,
				view_xview[0]+(view_wview[0]/4)+22,view_yview[0]+20,
				78,1,c_white,1)
			draw_sprite_part(hudspr,0,12,43,12,14,
				view_xview[0]+(view_wview[0]/4)+98,view_yview[0]+20)
			draw_text(view_xview[0]+(view_wview[0]/2)-1,view_yview[0]+20,config_str_head)
			draw_text(view_xview[0]+(view_wview[0]/2),view_yview[0]+40,config_str_key)
			for (j = 0; j < 2; j += 1)
			draw_sprite_part_ext(hudspr,0,24,43,16,17,
						view_xview[0]+(view_wview[0]/4)-48+(216*j),
						view_yview[0]+(view_hview[0]/3)+5+(config_scroll*20)-1,
						1-(2*j),1,c_white,1)
			// is there a better way to do this
			for (i = 0; i < 4; i += 1)
			{
				if change_key && i = config_scroll
					draw_set_color(c_yellow)
				draw_set_halign(fa_left)
				draw_text(view_xview[0]+(view_wview[0]/7),view_yview[0]+60+(i*20),config_str[i])
				draw_set_halign(fa_center)
				draw_text(view_xview[0]+(view_wview[0]/2),view_yview[0]+60+(i*20),"--")
				draw_set_halign(fa_right)
				switch (i)
				{
					case 0:
						__TMP_KEYSTR = keystr[ctrl_jump]
						break
					case 1:
						__TMP_KEYSTR = keystr[ctrl_fire]
						break
					case 2:
						__TMP_KEYSTR = keystr[ctrl_left]
						break
					case 3:
						__TMP_KEYSTR = keystr[ctrl_right]
						break
					case 4:
						__TMP_KEYSTR = keystr[ctrl_up]
						break
					case 5:
						__TMP_KEYSTR = keystr[ctrl_down]
						break
				}
				draw_text(view_xview[0]+(view_wview[0]/1.17),view_yview[0]+60+(i*20),__TMP_KEYSTR)
				draw_set_color(c_white)
			}
			//draw_text(view_xview[0]+(view_wview[0]/2)-1,view_yview[0]+80,config_menu_key0)
			break
	}
}
