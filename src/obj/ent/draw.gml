
//draw_rectangle_color(x+entcol[1],y+entcol[0],x+entcol[2],y+entcol[3],c_red,c_red,c_red,c_red,1)
//draw_point(x,y)
draw_sprite(collision_enemy,0,x,y)

switch (floor(char_index))
{
	// 0: DEFAULT MOO
	// WALKING / IDLE (FRAME 0)
	case 0000:
		char_speed = 0.1
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
}
