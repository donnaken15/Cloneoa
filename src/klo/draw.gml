draw_sprite_general(hudspr,0,153,0,1,16,view_xview[0],view_yview[0]+view_hview[0]-16,view_wview[0],1,0,c_white,c_white,c_white,c_white,1)
draw_sprite_part(hudspr,0,0,0,153,16,view_xview[0],view_yview[0]+view_hview[0]-16)
draw_sprite_part(hudspr,0,0,0,8,16,view_xview[0]+view_wview[0]-8,view_yview[0]+view_hview[0]-16)

switch (floor(char_index))
{
    case -1:
        char_speed=1
        break
    case 0:
        char_speed=0.06
        draw_sprite_part_ext(klospr,0,0,0,25,19,floor(x)-13+(flip*33),floor(y)-23,1+(flip*-2),1,c_white,1)
        break
    case 1:
        draw_sprite_part_ext(klospr,0,26,0,25,20,floor(x)-14+(flip*35),floor(y)-24,1+(flip*-2),1,c_white,1)
        break
    case 2:
        draw_sprite_part_ext(klospr,0,52,0,24,20,floor(x)-13+(flip*33),floor(y)-24,1+(flip*-2),1,c_white,1)
        break
    case 4:
        char_index = 0
    case 3:
        draw_sprite_part_ext(klospr,0,77,1,25,19,floor(x)-13+(flip*33),floor(y)-23,1+(flip*-2),1,c_white,1)
        break
    case 10:
        char_speed=0.22
        draw_sprite_part_ext(klospr,0,0,20,27,25,floor(x)-12+3+(flip*(33-7)),floor(y)-23-2,1+(flip*-2),1,c_white,1)
        break
    case 11:
        draw_sprite_part_ext(klospr,0,28,21,28,24,floor(x)-13+3+(flip*(35-7)),floor(y)-24-2,1+(flip*-2),1,c_white,1)
        break
    case 12:
        draw_sprite_part_ext(klospr,0,57,21,28,23,floor(x)-13+3+(flip*(35-7)),floor(y)-23-2,1+(flip*-2),1,c_white,1)
        break
    case 13:
        draw_sprite_part_ext(klospr,0,0,46,27,24,floor(x)-12+3+(flip*(33-7)),floor(y)-22-2,1+(flip*-2),1,c_white,1)
        break
    case 14:
        draw_sprite_part_ext(klospr,0,28,46,26,25,floor(x)-11+3+(flip*(31-7)),floor(y)-23-2,1+(flip*-2),1,c_white,1)
        break
    case 15:
        draw_sprite_part_ext(klospr,0,55,47,26,23,floor(x)-11+3+(flip*(31-7)),floor(y)-24-2,1+(flip*-2),1,c_white,1)
        break
    case 16:
        draw_sprite_part_ext(klospr,0,0,71,26,24,floor(x)-11+3+(flip*(31-7)),floor(y)-25-2,1+(flip*-2),1,c_white,1)
        break
    case 18:
        char_index = 10
    case 17:
        draw_sprite_part_ext(klospr,0,28,72,26,26,floor(x)-11+3+(flip*(31-7)),floor(y)-24-2,1+(flip*-2),1,c_white,1)
        break
}

if floor(char_index) >= 0 && floor(char_index) < 10
    draw_sprite_part_ext(klospr,0,86,21,16,4,floor(x)-5+(flip*18),floor(y)-4,1+(flip*-2),1,c_white,1)
