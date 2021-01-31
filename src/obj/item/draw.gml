char_index += char_speed

if floor(char_index) >= 4
	char_index = 0

switch (subtype)
{
	case 0:
		draw_sprite_part(itemspr,0,floor(char_index)*8,78,8,8,x-4,y-4)
		break
	case 1:
		draw_sprite_part(itemspr,0,floor(char_index)*14,62,14,16,x-7,y-8)
		break
}
