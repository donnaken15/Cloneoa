
//draw_rectangle_color(x+entcol[1],y+entcol[0],x+entcol[2],y+entcol[3],c_red,c_red,c_red,c_red,1)
//draw_point(x,y)
//draw_sprite(collision_enemy,0,x,y)

//draw_text(x,y-64,string(floor(((respawn_cooldown+80))/12) mod 4))

if respawn_cooldown > -50
{
	switch (floor(((respawn_cooldown+80))/12) mod 4)
	{
		case 0:
			draw_sprite_part_ext(enemyspr,0,32,489,32,29,xstart-14,ystart-32,1,1,c_white,1)
			break
		case 1:
			draw_sprite_part_ext(enemyspr,0,0,489,32,29,xstart-14,ystart-32,1,1,c_white,1)
			break
		case 2:
			draw_sprite_part_ext(enemyspr,0,32,460,32,29,xstart-14,ystart-32,1,1,c_white,1)
			break
		case 3:
			draw_sprite_part_ext(enemyspr,0,0,460,32,29,xstart-14,ystart-32,1,1,c_white,1)
			break
	}
}

if respawn_cooldown > 90
{
	switch (floor((respawn_cooldown-60)/8)-1)
	{
		case 8:
			draw_sprite_part_ext(enemyspr,0,0,438,20,20,xdiepart-7,ydiepart-27,1,1,c_white,1)
			break
		case 7:
			draw_sprite_part_ext(enemyspr,0,20,436,29,24,xdiepart-12,ydiepart-27,1,1,c_white,1)
			break
		case 6:
			draw_sprite_part_ext(enemyspr,0,49,436,30,23,xdiepart-14,ydiepart-26,1,1,c_white,1)
			break
	}
}

if respawn_cooldown <= 0
{
	switch (floor(char_index))
	{
		// 0: DEFAULT MOO
		// WALKING / IDLE (FRAME 0)
		case 0000:
			char_speed = 0.13333
			draw_sprite_part_ext(enemyspr,0,0,2,25,21,round(x)-12+(flip*(24)),round(y)-21,1+(flip*-2),1,c_white,1)
			break
		case 0001:
			draw_sprite_part_ext(enemyspr,0,25,0,25,23,round(x)-12+(flip*(24)),round(y)-23,1+(flip*-2),1,c_white,1)
			break
		case 0002:
			draw_sprite_part_ext(enemyspr,0,0,2,25,21,round(x)-12+(flip*(24)),round(y)-21,1+(flip*-2),1,c_white,1)
			break
		case 0004:
			char_index = 0
		case 0003:
			draw_sprite_part_ext(enemyspr,0,50,2,22,21,round(x)-12+(flip*(24)),round(y)-21,1+(flip*-2),1,c_white,1)
			break
		// GRABBED
		case 0005:
			char_speed = 0.22
			draw_sprite_part_ext(enemyspr,0,0,23,30,28,round(x)-14,round(y)-31,1,1,c_white,1)
			break
		case 0006:
			draw_sprite_part_ext(enemyspr,0,30,23,29,28,round(x)-12,round(y)-31,1,1,c_white,1)
			break
		case 0007:
			draw_sprite_part_ext(enemyspr,0,59,23,28,28,round(x)-12,round(y)-30,1,1,c_white,1)
			break
		case 0008:
			draw_sprite_part_ext(enemyspr,0,0,51,29,28,round(x)-12,round(y)-29,1,1,c_white,1)
			break
		case 0009:
			draw_sprite_part_ext(enemyspr,0,29,51,28,28,round(x)-13,round(y)-29,1,1,c_white,1)
			break
		case 0010:
			draw_sprite_part_ext(enemyspr,0,0,51,29,28,round(x)-12+26,round(y)-30,-1,1,c_white,1)
			break
		case 0011:
			draw_sprite_part_ext(enemyspr,0,59,23,28,28,round(x)-12+26,round(y)-31,-1,1,c_white,1)
			break
		case 0013:
			char_index = 0005
		case 0012:
			draw_sprite_part_ext(enemyspr,0,30,23,29,28,round(x)-12+26,round(y)-31,-1,1,c_white,1)
			break
		// 1: FLYING MOO
		// FLYING
		case 1000:
			char_speed = 0.13333
			draw_sprite_part_ext(enemyspr,0,0,79,24,25,round(x)-10+(flip*(27)),round(y)-19,1+(flip*-2),1,c_white,1)
			break
		case 1001:
			draw_sprite_part_ext(enemyspr,0,56,131,24,22,round(x)-10+(flip*(27)),round(y)-18,1+(flip*-2),1,c_white,1)
			break
		case 1002:
			draw_sprite_part_ext(enemyspr,0,24,79,25,25,round(x)-10+(flip*(27)),round(y)-21,1+(flip*-2),1,c_white,1)
			break
		case 1004:
			char_index=1000
		case 1003:
			draw_sprite_part_ext(enemyspr,0,49,77,23,27,round(x)-9+(flip*(25)),round(y)-23,1+(flip*-2),1,c_white,1)
			break
		// GRABBED
		case 1005:
			char_speed = 0.22
			draw_sprite_part_ext(enemyspr,0,0,104,32,27,round(x)-16,round(y)-31,1,1,c_white,1)
			break
		case 1006:
			draw_sprite_part_ext(enemyspr,0,32,104,27,27,round(x)-12,round(y)-31,1,1,c_white,1)
			break
		case 1007:
			draw_sprite_part_ext(enemyspr,0,59,104,26,27,round(x)-12,round(y)-30,1,1,c_white,1)
			break
		case 1008:
			draw_sprite_part_ext(enemyspr,0,0,131,26,26,round(x)-12,round(y)-29,1,1,c_white,1)
			break
		case 1009:
			draw_sprite_part_ext(enemyspr,0,26,131,30,26,round(x)-15,round(y)-29,1,1,c_white,1)
			break
		case 1010:
			draw_sprite_part_ext(enemyspr,0,0,131,26,26,round(x)-14+26,round(y)-29,-1,1,c_white,1)
			break
		case 1011:
			draw_sprite_part_ext(enemyspr,0,59,104,26,27,round(x)-14+26,round(y)-30,-1,1,c_white,1)
			break
		case 1013:
			char_index = 1005
		case 1012:
			draw_sprite_part_ext(enemyspr,0,32,104,27,27,round(x)-14+26,round(y)-31,-1,1,c_white,1)
			break
	}
}
