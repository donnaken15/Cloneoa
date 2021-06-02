/// SHIFT-JIS CONVERTER
/// YOU NEED CHARSET APPLIED TO A FONT IN THE GAME
/// THIS WAS APPARENTLY DESIGNED IN A TIME WHERE
/// ASCII WASN'T STANDARDIZED AND WHERE THEY
/// COULDN'T THINK COMPUTERS COULD HANDLE
/// ENOUGH CHARACTERS, WHICH LEAVES 0x40
/// CHARACTERS ONLY KATAKANA, AND 0x40
/// OTHERS UNUSED

if lang
{
	__new_string = argument0;

	{
		__new_string = string_replace_all(__new_string,"NI",chr($A1+37))
		for(i=62;i>=0;i-=1)
			__new_string = string_replace_all(__new_string,__kana_rpms[i],chr($A1+i))
	}

	return __new_string;
}

// example:
// Wesley -> ktkn("UeSURI-"); xB3 xAA xBD xD8 xB0
// Klonoa -> ktkn("KURONOA"); xB8 xDB xC9 xB1
