
//draw_rectangle_color(x+entcol[1],y+entcol[0],x+entcol[2],y+entcol[3],c_red,c_red,c_red,c_red,1)
//draw_point(x,y)
draw_sprite(collision_enemy,0,x,y)

switch (floor(char_index))
{
	// WALKING / IDLE (FRAME 0)
	case 0:
		char_speed = 0.1
		draw_sprite_part_ext(enemyspr,0,0,2,25,21,round(x)-12+(flip*(24)),round(y)-21,1+(flip*-2),1,c_white,1)
		break
	case 1:
		draw_sprite_part_ext(enemyspr,0,25,0,25,23,round(x)-12+(flip*(24)),round(y)-23,1+(flip*-2),1,c_white,1)
		break
	case 2:
		draw_sprite_part_ext(enemyspr,0,0,2,25,21,round(x)-12+(flip*(24)),round(y)-21,1+(flip*-2),1,c_white,1)
		break
	case 4:
		char_index = 0
	case 3:
		draw_sprite_part_ext(enemyspr,0,50,2,22,21,round(x)-12+(flip*(24)),round(y)-21,1+(flip*-2),1,c_white,1)
		break
}
