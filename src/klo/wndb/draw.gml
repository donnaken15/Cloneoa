
char_index += 0.3

switch (floor(char_index) mod 2)
{
  case 0:
    draw_sprite_part_ext(partspr,0,139,48,10,9,round(x)-5,round(y)-3,1,1,c_white,1)
    draw_sprite_part_ext(partspr,0,128,55,6,5,round(xprevious2)-3,round(yprevious2)-3+1,1,1,c_white,1)
    break
  case 1:
    draw_sprite_part_ext(partspr,0,128,48,11,7,round(x)-6,round(y)-4+1,1,1,c_white,1)
    draw_sprite_part_ext(partspr,0,134,55,4,3,round(xprevious2)-2,round(yprevious2)-1+1,1,1,c_white,1)
    break
}
