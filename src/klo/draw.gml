
//if !place_free(x,y+1) { vspeed = 0 move_contact_solid(0,player_speed) }

//if collision_rectangle(x+collision[1],y+collision[0],x+collision[2],y+collision[3],tile,true,true)
//show_message("")

if x + collision[1] < levelbounds[0] || x + collision[2] > levelbounds[2] x = xprevious //move_contact_solid(0,player_speed)

if y + collision[3] > levelbounds[3] { y = levelbounds[3] gravity = 0 vspeed = 0 ground = 1 char_index = 0 }

draw_line_color(x,y,x+8+(flip*-16),y,c_lime,c_lime)
draw_line_color(x,y+1,x,y+8,c_blue,c_blue)

draw_line_color(320,0,320,640,c_red,c_red)

draw_rectangle_color(x+collision[1],y+collision[0],x+collision[2],y+collision[3],c_red,c_red,c_red,c_red,1)

// figure out more optimized system for this
switch (floor(char_index))
{
    case -1:
        char_speed=1
        break
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
	case 20:
		char_speed = 0.22
        draw_sprite_part_ext(klospr,0,1,181,23,28,round(x)-11+5+(flip*(31-11+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
		break
	case 21:
        draw_sprite_part_ext(klospr,0,25,181,21,28,round(x)-9+5+(flip*(31-15+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
		break
	case 22:
        draw_sprite_part_ext(klospr,0,47,181,23,28,round(x)-11+5+(flip*(31-11+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
		break
	case 24:
		char_index = 20
	case 23:
        draw_sprite_part_ext(klospr,0,71,181,24,28,round(x)-13+5+(flip*(31-7+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
		break
	case 25:
		char_speed = 0.22
        draw_sprite_part_ext(klospr,0,96,181,24,27,round(x)-13+5+(flip*(31-8+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
		break
	case 26:
        draw_sprite_part_ext(klospr,0,121,183,23,26,round(x)-13+5+(flip*(31-8+1)),round(y)-25-2,1+(flip*-2),1,c_white,1)
		break
	case 27:
        draw_sprite_part_ext(klospr,0,145,183,22,26,round(x)-12+5+(flip*(31-10+1)),round(y)-25-3,1+(flip*-2),1,c_white,1)
		break
	case 28:
        draw_sprite_part_ext(klospr,0,168,183,21,30,round(x)-12+5+(flip*(31-10+1)),round(y)-27-3,1+(flip*-2),1,c_white,1)
		break
	case 29:
        draw_sprite_part_ext(klospr,0,190,183,21,32,round(x)-11+5+(flip*(31-12+1)),round(y)-31-3,1+(flip*-2),1,c_white,1)
		break
	case 31:
		char_index = 29
	case 30:
        draw_sprite_part_ext(klospr,0,212,183,21,32,round(x)-11+5+(flip*(31-12+1)),round(y)-31-3,1+(flip*-2),1,c_white,1)
		break
}

if floor(char_index) >= 0 && floor(char_index) < 10
    draw_sprite_part_ext(klospr,0,86,21,16,4,round(x)-5+(flip*18),round(y)-4,1+(flip*-2),1,c_white,1)

draw_set_color(c_black)
draw_line(0,80,100,80)
draw_line(0,128,100,128)
draw_line(0,256,100,256)
draw_line(0,384,100,384)
draw_line(0,480,100,480)
draw_line(0,512,100,512)

draw_sprite_general(hudspr,0,153,0,1,16,view_xview[0],view_yview[0]+view_hview[0]-16,view_wview[0],1,0,c_white,c_white,c_white,c_white,1)
draw_sprite_part(hudspr,0,0,0,153,16,view_xview[0],view_yview[0]+view_hview[0]-16)
draw_sprite_part(hudspr,0,0,0,8,16,view_xview[0]+view_wview[0]-8,view_yview[0]+view_hview[0]-16)

//set px437 font
//draw_set_font(confont)
//draw_set_color(c_red)
draw_set_font(confnt)
draw_set_color(c_white)
//draw_set_valign(fa_bottom)
draw_set_valign(fa_top)
//draw_text(view_xview[0],view_yview[0],
draw_text(view_xview[0],view_yview[0]/* +view_hview[0] */,
"pos: "+string_format(x,6,1)+" * "+string_format(y,6,1)+"
grav:  "+string_format(gravity,4,1)+
" vsp: "+string_format(vspeed,3,1)+"
scale: "+string(window_get_region_scale())+"
res:"+string(view_wview[0])+"*"+string(view_hview[0])/* +"
lvsz:"+string(levelsize[0])+"*"+string(levelsize[1])+"
bounds:"+string(levelbounds[2])+"*"+string(levelbounds[3])+"
view:"+string(view_xview[0]+view_wview[0]) */
)
