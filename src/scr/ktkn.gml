/// SHIFT-JIS CONVERTER
/// YOU NEED CHARSET APPLIED TO A FONT IN THE GAME

if lang
{
	__new_string = argument0;
	
	//repeat(20)
	{
		__new_string = string_replace_all(__new_string,"NI",chr($A1+37))
		for(i=62;i>=0;i-=1)
			__new_string = string_replace_all(__new_string,__kana_rpms[i],chr($A1+i))
	}
	
	return __new_string;
}


