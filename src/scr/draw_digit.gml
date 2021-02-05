
// READONLY
// WHY ISNT THIS WORKING EITHER!!!!!!!!!!

// arguments:
// 0,1: x,y
// 2: number

mynum = string(floor(argument2))
j = string_length(mynum)

xx = 127
yy = 50
ww = 7
hh = 7

if argument_count > 3
	if argument[3]
	{
		hh += 3
	}

for (i = 0; i < j; i += 1)
{
	digit = real(string_char_at(mynum,i+1))
	
	xx = 127
	yy = 50
	xx += (digit mod 5) * ww
	if digit >= 5
		yy += hh
	if argument_count > 3
		if argument[3]
		{
			yy -= 20
		}
	//show_message("draw_digit(hudspr,0,"
		//+string(xx)+","+string(yy)+","
		//+string(ww)+","+string(hh)+",",
		//+string(argument0)+","+string(argument1)+",")
	draw_sprite_part(hudspr,0,xx,yy,ww,hh,floor(argument0+(i*ww)),floor(argument1))
	
}

