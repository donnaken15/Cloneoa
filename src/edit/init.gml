globalvar fname, lang;
//fname = ""
path_root = program_directory+"/../"
path_src = path_root+"src/edit/"
path_gfx = path_root+"gfx/"
path_sfx = path_root+"sfx/"
path_mus = path_root+"mus/"
path_bin = path_root+"bin/"
//if parameter_count() > 0
	//fname = parameter_string(1)

ini_close()

// SETTINGS
ini_open(path_bin+"settings.ini")
{
	lang = ini_read_real("General","Language",0)
}

// KATAKANA
if lang
{
	draw_set_font(font_jp)
	globalvar __kana_rpms;
	// wtf is this V
	// $A1 to $DD

	__kana_rpms[0]="."
	__kana_rpms[1]="["
	__kana_rpms[2]="]"
	__kana_rpms[3]=","
	__kana_rpms[4]=":"
	__kana_rpms[5]="wo"
	__kana_rpms[6]="a"
	__kana_rpms[7]="i"
	__kana_rpms[8]="u"
	__kana_rpms[9]="e"
	__kana_rpms[10]="o"
	__kana_rpms[11]="ya"
	__kana_rpms[12]="yu"
	__kana_rpms[13]="yo"
	__kana_rpms[14]="tu"
	__kana_rpms[15]="-"
	__kana_rpms[16]="A"
	__kana_rpms[17]="I"
	__kana_rpms[18]="U"
	__kana_rpms[19]="E"
	__kana_rpms[20]="O"
	__kana_rpms[21]="KA"
	__kana_rpms[22]="KI"
	__kana_rpms[23]="KU"
	__kana_rpms[24]="KE"
	__kana_rpms[25]="KO"
	__kana_rpms[26]="SA"
	__kana_rpms[27]="SI"
	__kana_rpms[28]="SU"
	__kana_rpms[29]="SE"
	__kana_rpms[30]="SO"
	__kana_rpms[31]="TA"
	__kana_rpms[32]="TI"
	__kana_rpms[33]="TU"
	__kana_rpms[34]="TE"
	__kana_rpms[35]="TO"
	__kana_rpms[36]="NA"
	__kana_rpms[37]="NI"
	__kana_rpms[38]="NU"
	__kana_rpms[39]="NE"
	__kana_rpms[40]="NO"
	__kana_rpms[41]="HA"
	__kana_rpms[42]="HI"
	__kana_rpms[43]="HU"
	__kana_rpms[44]="HE"
	__kana_rpms[45]="HO"
	__kana_rpms[46]="MA"
	__kana_rpms[47]="MI"
	__kana_rpms[48]="MU"
	__kana_rpms[49]="ME"
	__kana_rpms[50]="MO"
	__kana_rpms[51]="YA"
	__kana_rpms[52]="YU"
	__kana_rpms[53]="YO"
	__kana_rpms[54]="RA"
	__kana_rpms[55]="RI"
	__kana_rpms[56]="RU"
	__kana_rpms[57]="RE"
	__kana_rpms[58]="RO"
	__kana_rpms[59]="WA"
	__kana_rpms[60]="N"
	__kana_rpms[61]="`"
	__kana_rpms[62]="'"
}
else
	draw_set_font(font_en)

{
	execute_file(path_src+"scr/reload.gml")

}

