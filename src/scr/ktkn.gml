/// SHIFT-JIS CONVERTER
/// YOU NEED CHARSET APPLIED TO A FONT IN THE GAME

if lang
{
	__new_string = argument0;

	for(i=0;i<63;i+=1)
		__new_string = string_replace_all(__new_string,__kana_rpms[62-i],chr($DF-i))
	
	return __new_string;
}


