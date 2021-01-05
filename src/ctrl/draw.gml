frame+=1
//draw_rectangle_color(view_xview[0],view_yview[0],
					//view_wview[0],view_hview[0],
		//c_white,c_white,c_white,c_white,false)
if pause {
	draw_set_alpha(1)
	draw_sprite(pausescr,0,view_xview[0],view_yview[0])
	draw_set_alpha(.5)
	draw_rectangle_color(view_xview[0],view_yview[0],
						view_wview[0],view_hview[0],
			c_black,c_black,c_black,c_black,false)
	draw_sprite_part(hudspr,0,40,43,60,22,
		view_xview[0]+(view_wview[0]/4)+30,view_yview[0]+(view_hview[0]/10))
	for (i = 0; i < 4; i += 1) {
		draw_sprite_part(hudspr,0,0,43,12,14,
			view_xview[0]+(view_wview[0]/4)+10,view_yview[0]+(view_hview[0]/3)-10+(i*20))
		draw_sprite_part_ext(hudspr,0,11,43,1,14,
			view_xview[0]+(view_wview[0]/4)+22,view_yview[0]+(view_hview[0]/3)-10+(i*20),
			78,1,c_white,1)
		draw_sprite_part(hudspr,0,12,43,12,14,
			view_xview[0]+(view_wview[0]/4)+98,view_yview[0]+(view_hview[0]/3)-10+(i*20))
		if (i=0)
		{
			draw_sprite_part_ext(hudspr,0,24,43,16,16,
				view_xview[0]+(view_wview[0]/4)-16,view_yview[0]+(view_hview[0]/3)-10+(i*20)-1,
				1,1,c_white,1)
			draw_sprite_part_ext(hudspr,0,24,43,16,16,
				view_xview[0]+(view_wview[0]/4)+134,view_yview[0]+(view_hview[0]/3)-10+(i*20)-1,
				-1,1,c_white,1)
		}
	}
	
}
