
draw_set_alpha(1)

if debug_draw {
	draw_rectangle_color(x+tilecol[1],y+tilecol[0],x+tilecol[2],y+tilecol[3],c_lime,c_lime,c_lime,c_lime,1)
	draw_rectangle_color(x+itemcol[1],y+itemcol[0],x+itemcol[2],y+itemcol[3],c_blue,c_blue,c_blue,c_blue,1)
	draw_rectangle_color(x+entcol[1],y+entcol[0],x+entcol[2],y+entcol[3],c_red,c_red,c_red,c_red,1)
}

// figure out more optimized system for this
// use gfx/maps for this or whatever
if draw
{
	switch (floor(char_index))
	{
    case -1:
      char_speed=1
      break
		// IDLE
    case 0:
      char_speed=0.06
      draw_sprite_part_ext(klospr,0,00,0,25,19,round(x)-13+(flip*34),round(y)-23,1+(flip*-2),1,c_white,1)
      break
    case 1:
      draw_sprite_part_ext(klospr,0,26,0,25,20,round(x)-14+(flip*36),round(y)-24,1+(flip*-2),1,c_white,1)
      break
    case 2:
      draw_sprite_part_ext(klospr,0,52,0,24,20,round(x)-13+(flip*34),round(y)-24,1+(flip*-2),1,c_white,1)
      break
    case 4:
      char_index = 0
    case 3:
      draw_sprite_part_ext(klospr,0,77,1,25,19,round(x)-13+(flip*34),round(y)-23,1+(flip*-2),1,c_white,1)
      break
		// MOVE
    case 10:
      char_speed=0.25
      draw_sprite_part_ext(klospr,0,0,20,27,25,round(x)-12+3+(flip*(33-7)),round(y)-23-2,1+(flip*-2),1,c_white,1)
      break
    case 11:
      draw_sprite_part_ext(klospr,0,28,21,28,24,round(x)-13+3+(flip*(35-7)),round(y)-24-2,1+(flip*-2),1,c_white,1)
      break
    case 12:
      draw_sprite_part_ext(klospr,0,57,21,28,23,round(x)-13+3+(flip*(35-7)),round(y)-23-2,1+(flip*-2),1,c_white,1)
      break
    case 13:
      draw_sprite_part_ext(klospr,0,0,46,27,24,round(x)-12+3+(flip*(33-7)),round(y)-22-2,1+(flip*-2),1,c_white,1)
      break
    case 14:
      draw_sprite_part_ext(klospr,0,28,46,26,25,round(x)-11+3+(flip*(31-7)),round(y)-23-2,1+(flip*-2),1,c_white,1)
      break
    case 15:
      draw_sprite_part_ext(klospr,0,55,47,26,23,round(x)-11+3+(flip*(31-7)),round(y)-24-2,1+(flip*-2),1,c_white,1)
      break
    case 16:
      draw_sprite_part_ext(klospr,0,0,71,26,24,round(x)-11+3+(flip*(31-7)),round(y)-25-2,1+(flip*-2),1,c_white,1)
      break
    case 18:
      char_index = 10
    case 17:
      draw_sprite_part_ext(klospr,0,28,72,26,26,round(x)-11+3+(flip*(31-7)),round(y)-24-2,1+(flip*-2),1,c_white,1)
      break
		// GOING UP
		case 20:
			char_speed = 0.2
			//when holding entity - char_speed = 0.5
      draw_sprite_part_ext(klospr,0,1,151,23,28,round(x)-11+5+(flip*(31-11+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
			break
		case 21:
      draw_sprite_part_ext(klospr,0,25,151,21,28,round(x)-9+5+(flip*(31-15+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
			break
		case 22:
      draw_sprite_part_ext(klospr,0,47,151,23,28,round(x)-11+5+(flip*(31-11+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
			break
		case 24:
			char_index = 20
		case 23:
      draw_sprite_part_ext(klospr,0,71,151,24,28,round(x)-13+5+(flip*(31-7+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
			break
		// FALLING
		case 25:
			char_speed = 0.3
			//when holding entity - char_speed = 0.8
      draw_sprite_part_ext(klospr,0,121,153,24,27,round(x)-13+5+(flip*(31-8+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
			break
		case 26:
      draw_sprite_part_ext(klospr,0,145,153,23,26,round(x)-13+5+(flip*(31-8+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
			break
		case 27:
      draw_sprite_part_ext(klospr,0,168,153,22,30,round(x)-12+5+(flip*(31-10+1)),round(y)-25-3,1+(flip*-2),1,c_white,1)
			break
		case 28:
			char_speed = 0.277
      draw_sprite_part_ext(klospr,0,190,153,21,32,round(x)-12+5+(flip*(31-10+1)),round(y)-27-3,1+(flip*-2),1,c_white,1)
			break
		case 30:
			char_index = 28
		case 29:
      draw_sprite_part_ext(klospr,0,212,153,21,32,round(x)-12+5+(flip*(31-10+1)),round(y)-27-3,1+(flip*-2),1,c_white,1)
			// WHY IS THE SCREEN SHAKING DURING THIS NOW
			break
		case 40:
		// LAND
			char_speed = 0.47
      draw_sprite_part_ext(klospr,0,121,125,21,27,round(x)-15+11+(flip*(31-16+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
			break
		case 41:
      draw_sprite_part_ext(klospr,0,143,128,21,24,round(x)-15+9+(flip*(31-12+1)),round(y)-24,1+(flip*-2),1,c_white,1)
			break
		case 42:
      draw_sprite_part_ext(klospr,0,165,127,22,25,round(x)-15+6+(flip*(31-6+1)),round(y)-25,1+(flip*-2),1,c_white,1)
			break
		case 44:
			char_index = 0
		case 43:
			// resolve position jump difference between this and the original game
      draw_sprite_part_ext(klospr,0,188,127,21,25,round(x)-15+6+(flip*(31-7+1)),round(y)-25,1+(flip*-2),1,c_white,1)
			break
		// FLOATING
		case 45:
			char_speed = 0.13
	    draw_sprite_part_ext(klospr,0,1,180,27,31,round(x)-15+6+(flip*(31-4)),round(y)-28,1+(flip*-2),1,c_white,1)
			break
		case 46:
      draw_sprite_part_ext(klospr,0,29,180,26,23,round(x)-15+7+(flip*(31-6)),round(y)-25,1+(flip*-2),1,c_white,1)
			break
		case 47:
      draw_sprite_part_ext(klospr,0,56,180,26,29,round(x)-15+7+(flip*(31-6)),round(y)-25,1+(flip*-2),1,c_white,1)
			break
		case 49:
			char_index = 45
		case 48:
      draw_sprite_part_ext(klospr,0,83,180,24,25,round(x)-15+8+(flip*(31-8)),round(y)-25,1+(flip*-2),1,c_white,1)
			break
		// WIND BULLET
		case 50:
			char_speed = 0.27
			draw_sprite_part_ext(klospr,0,108,179,26,24,round(x)-14+(flip*(36)),round(y)-24,1+(flip*-2),1,c_white,1)
			break
		case 51:
			draw_sprite_part_ext(klospr,0,135,180,23,25,round(x)-11+(flip*(30)),round(y)-25,1+(flip*-2),1,c_white,1)
			break
		case 52:
			draw_sprite_part_ext(klospr,0,159,184,22,24,round(x)-10+(flip*(28)),round(y)-25,1+(flip*-2),1,c_white,1)
			break
		case 54:
			char_index = last_char_index
		case 53:
			draw_sprite_part_ext(klospr,0,182,186,25,24,round(x)-11+(flip*(30)),round(y)-24,1+(flip*-2),1,c_white,1)
			break
		// HURT
		case 99:
			draw_sprite_part_ext(klospr,0,202,0,32,29,round(x)-15+(flip*(35)),round(y)-32,1+(flip*-2),1,c_white,1)
			break
	}

	if floor(char_index) >= 0 && floor(char_index) < 10
	{
	    draw_sprite_part_ext(klospr,0,86,21,7,4,round(x)-7+(flip*(22)),round(y)-4,1+(flip*-2),1,c_white,1)
	    draw_sprite_part_ext(klospr,0,94,21,8,4,round(x)+3+(flip*(2)),round(y)-4,1+(flip*-2),1,c_white,1)
	}
}

if max_gems || max_stars || can_get_hurt {
draw_sprite_general(hudspr,0,153,0,1,16,view_xview[0],view_yview[0]+view_hview[0]-16,view_wview[0],1,0,c_white,c_white,c_white,c_white,1)
draw_sprite_part(hudspr,0,0,0,153,16,view_xview[0],view_yview[0]+view_hview[0]-16)
draw_sprite_part(hudspr,0,0,0,8,16,view_xview[0]+view_wview[0]-8,view_yview[0]+view_hview[0]-16)
	if can_get_hurt
	{
		for (i = 0; i < 3; i += 1)
		{
			draw_sprite_part(hudspr,0,i*11,17,11,11,view_xview[0]+10+(16*i),view_yview[0]+view_hview[0]-13)
		}
		for (i = 0; i < health; i += 1)
		{
			draw_sprite_part(hudspr,0,0,28,15,15,view_xview[0]+8+(i*16),view_yview[0]+view_hview[0]-15)
		}
		draw_sprite_part(hudspr,0,108,16,16,12,view_xview[0]+200,view_yview[0]+view_hview[0]-14)
		// make script to draw numbers, big and small
		// also make compatible with freesize by changing right leaning sprites to be relative to end of screen
		// position for reference:
		draw_sprite_part(hudspr,0,127,40,7,10,view_xview[0]+224,view_yview[0]+view_hview[0]-12)
	}
	if max_gems
	{
		draw_sprite_part(hudspr,0,100,16,8,12,view_xview[0]+152,view_yview[0]+view_hview[0]-14)
		draw_sprite_part(hudspr,0,122,57,5,7,view_xview[0]+176,view_yview[0]+view_hview[0]-8)
	}
}

if debug_draw
{
	//set px437 font

	//draw_set_font(confont)
	//draw_set_color(c_black)
	//draw_set_color(c_red)
	draw_set_font(confnt)
	draw_set_color(c_white)
	//draw_set_valign(fa_bottom)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_text(view_xview[0],view_yview[0],
	"pos: "+string_format(x,6,1)+" * "+string_format(y,6,1)+chr($D)+
	"grav:  "+string_format(gravity,4,1)+" vs: "+string_format(vspeed,4,1)+" flt: "+string(float)+chr($D)+
	"char idx: "+string_format(char_index,5,2)+" spd: "+string_format(char_speed,5,2)+chr($D)+
	"gems: "+string_format(gems,3,0))
}
