
draw_sprite_part(partspr,0,offx+(width*floor(time)),offy,width,height,cx,cy)
switch (sides)
{
	case 1:
		draw_sprite_part_ext(partspr,0,offx+(width*floor(time)),offy,width,height,cx+32,cy+32,-1,-1,c_white,1)
		break
	case 2:
		//draw_sprite_part_ext(partspr,0,offx+(width*floor(time)),offy,width,height,cx+32,cy+32,1,-1,c_white,1)
		draw_sprite_general(partspr,0,offx+(width*floor(time)),offy,width,height,cx,cy+31,1,1,90,
			c_white,c_white,c_white,c_white,1)
		draw_sprite_part_ext(partspr,0,offx+(width*floor(time)),offy,width,height,cx+32,cy+32,-1,-1,c_white,1)
		draw_sprite_general(partspr,0,offx+(width*floor(time)),offy,width,height,cx+32,cy-1,-1,-1,90,
			c_white,c_white,c_white,c_white,1)
		break
}

time+=anispeed
if time>timemax
	instance_destroy()

