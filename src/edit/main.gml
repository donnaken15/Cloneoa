
cursor = cr_default

/////////////////////
/////////////////////
//  Resize window  //
/////////////////////
/////////////////////

scrollxv = get_scrollbarvalue(levelscrollx)
scrollyv = get_scrollbarvalue(levelscrolly)

ini_write_real("Editor","PosX",window_get_x())
ini_write_real("Editor","PosY",window_get_y())

if resized {
window_set_position(old_x, old_y)
window_set_size(view_wport[0],view_hport[0])
ini_write_real("Editor","ResX",old_width)
ini_write_real("Editor","ResY",old_height)
resized = 0 }

if old_width != window_get_width() {
old_width = window_get_width()
view_wview[0] = (window_get_width()>>1)<<1
view_wport[0] = view_wview[0]
if view_wview[0] < 400 { view_wview[0] = 400 view_wport[0] = 400 }
old_x = window_get_x()
old_y = window_get_y()
resized = 1 room_restart() }
if old_height != window_get_height() {
old_height = window_get_height()
view_hport[0] = (window_get_height()>>1)<<1
view_hview[0] = view_hport[0]
if view_hview[0] < 384 { view_hview[0] = 384 view_hport[0] = 384 }
old_x = window_get_x()
old_y = window_get_y()
resized = 1 room_restart() }

if !window_get_sizeable() window_set_sizeable(true)

if !lang
	draw_set_font(font_en)
else
	draw_set_font(font_jp)

/////////////////////
/////////////////////
//  Draw menubar   //
/////////////////////
/////////////////////

// still messy and weird but definitely better than bit trip designer
// it just wokrs - steep job sdecline
draw_set_halign(fa_center)
draw_set_valign(fa_top)
j=0
for(i=0;i<menucount;i+=1)
{
	k=menusize[i]+3
	if mouse_rectangle(j,0,k,16)
	{
		if a=0 draw_set_color(16777215)
		if a=2 draw_set_color(8421504)
		draw_line(j,0,j+k,0)
		draw_line(j,0,j,15)
		if a=0 draw_set_color(8421504)
		if a=2 draw_set_color(16777215)
		draw_line(j,15,j+k,15)
		draw_line(j+k,0,j+k,16)
		if mouse_check_button_pressed(mb_left) a=2
		if mouse_check_button_released(mb_left) && a=2
		{
			a=3
			b=i
		}
	}
	draw_set_color(c_black)
	draw_text((j>>1<<1)+(j>>5)+(k>>1),1,menuname[i])
	j += 1+k
}

/////////////////////
/////////////////////
//    Left bar     //
/////////////////////
/////////////////////

draw_set_color(c_gray)
draw_line(0,37,view_wview[0],37)
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_halign(fa_top)
l=(view_hview[0]/1.6) // ratio lol
if !lang
	__tmpstr = "Objects"
else
	__tmpstr = ktkn("OHU`SI`eKUTO")
draw_text(5,42,__tmpstr+":")
draw_set_color(c_white)
draw_rectangle(5,58,150,l-20,false)
draw_set_color(c_black)
draw_rectangle(5,58,150,l-20,true)
if !lang
	__tmpstr = "Properties"
else
	__tmpstr = ktkn("HU'ROHA'TEi")
draw_text(5,l-16,__tmpstr+":")
draw_set_color(c_white)
draw_rectangle(5,l,150,view_hview[0]-7,false)
draw_set_color(c_black)
draw_rectangle(5,l,150,view_hview[0]-7,true)

/////////////////////
/////////////////////
//   Object list   //
/////////////////////
/////////////////////

draw_set_color(make_color_rgb(0,0,191))
draw_rectangle(6,59+((objselect+2)*14),149,73+((objselect+2)*14),false)
if objselect = -2
	draw_set_color(c_white)
else
	draw_set_color(c_black)
if !lang
	__tmpstr = "Level"
else
	__tmpstr = ktkn("REHE`RU")
draw_text(9,60,"---- "+__tmpstr)
if objselect = -1
	draw_set_color(c_white)
else
	draw_set_color(c_black)
if !lang
	__tmpstr = "Player"
else
	__tmpstr = ktkn("HU`RE-RA-")
draw_text(9,74,"  -- "+__tmpstr)
for (i=0;i<level.objectcount&&i<((l+9)/14)-9;i+=1)
{
	draw_set_color(c_black)
	if objselect = i
		draw_set_color(c_white)
		
	draw_text(9,60+((i+2)*14),"  -- Test")
}
if mouse_check_button_pressed(mb_left)
	if mouse_rectangle(5,59,150,l-20-58-15)
	{
		objselectlast = objselect
		objselect = floor((mouse_y-59)/14)-2
		if (objselect >= level.objectcount)
			objselect = objselectlast
		switch (objselect)
		{
			case -2:
				propsinput0.text = string(level.w)
				propsinput1.text = string(level.h)
				propsinput2.text = string(level.type)
				propsinput3.text = string(level.music)
				propsinput4.text = string(level.theme)
				break
			case -1:
				propsinput0.text = string(level.px)
				propsinput1.text = string(level.py)
				break
		}
	}

/////////////////////
/////////////////////
// Properties tab  //
/////////////////////
/////////////////////

draw_set_color(c_black)
switch (objselect)
{
	// world props
	case -2:
		// make this in a loop????
		draw_text(9,l+2,"Information")
		draw_line(6,l+1+(14*1),150,l+1+(14*1))
		draw_text(9,l+2+(14*1)," Level Size:")
		draw_text(9,l+2+(14*2),"  Width:")
		textbox_draw(propsinput0,100,l+2+(14*2),142,l+2+(14*2)+13)
		draw_text(9,l+2+(14*3),"  Height:")
		textbox_draw(propsinput1,100,l+2+(14*3),142,l+2+(14*3)+13)
		draw_text(9,l+2+(14*4)," Level Type:")
		draw_text(100,l+2+(14*4),string(level.type))
		//textbox_draw(propsinput2,100,l+2+(14*4),124,l+2+(14*4)+13)
		draw_line(6,l+1+(14*5),150,l+1+(14*5))
		draw_text(9,l+2+(14*5),"Miscellaneous")
		draw_line(6,l+1+(14*6),150,l+1+(14*6))
		draw_text(9,l+2+(14*6)," Music ID:")
		textbox_draw(propsinput3,100,l+2+(14*6),128,l+2+(14*6)+13)
		draw_text(9,l+2+(14*7)," Theme ID:")
		textbox_draw(propsinput4,100,l+2+(14*7),128,l+2+(14*7)+13)
		if textbox_focus != -1
		{ // mESSSSSSSSSSSS
			// width
			if propsinput0.text != ""
			{
				if real(propsinput0.text) > 65535
					//show_message("Error: Value too big.")
					propsinput0.text = string(level.w)
				else if real(propsinput0.text) = 0
					//show_message("Error: Value too small.")
					propsinput0.text = string(level.w)
				else if propsinput0.text != string(level.w)
					level.w = real(propsinput0.text)
			}
			else
				//show_message("Error: Invalid value.")
				propsinput0.text = string(level.w)
			
			// height
			if propsinput1.text != ""
			{
				if real(propsinput1.text) > 65535
					propsinput1.text = string(level.h)
				else if real(propsinput1.text) = 0
					propsinput1.text = string(level.h)
				else if real(propsinput1.text) != level.h
					level.h = real(propsinput1.text)
			}
			else
				propsinput1.text = string(level.h)
			
			// TODO: make dropdown for this one
			// type
			
			/*if propsinput2.text != ""
			{
				if real(propsinput2.text) > 2
					propsinput2.text = string(level.type)
				else if real(propsinput2.text) != level.type
					level.type = real(propsinput2.text)
			}
			else
				propsinput2.text = string(level.type)*/
			
			// music
			if propsinput3.text != ""
			{
				if real(propsinput3.text) > 15
					propsinput3.text = string(level.music)
				else if real(propsinput3.text) != level.music
					level.music = real(propsinput3.text)
			}
			else
				propsinput3.text = string(level.music)
			
			// theme
			if propsinput4.text != ""
			{
				if real(propsinput4.text) > 15
					propsinput4.text = string(level.theme)
				else if real(propsinput4.text) != level.theme
				{
					level.theme = real(propsinput4.text)
					sprite_replace(terrain,
						path_gfx+"../world/w"+string_replace(string_format(level.theme,2,0)," ","0")+"/tiles.png",
						0,1,0,0,0)
				}
			}
			else
				propsinput4.text = string(level.theme)
		}
		// Scrap?
		/*switch textbox_focus
		{
			case propsinput2:
				draw_set_color(c_black)
				draw_line(6,view_hview[0]-64,150,view_hview[0]-64)
				draw_set_color(c_white)
				draw_rectangle(6,view_hview[0]-63,149,view_hview[0]-8,false)
				draw_set_color(c_black)
				draw_text(9,view_hview[0]-60,"0 = Normal#1 = Scrolling#2 = Board")
				
				break
		}*/
		break
	// player props
	case -1:
		draw_text(9,l+2,"Information")
		draw_line(6,l+1+(14*1),150,l+1+(14*1))
		draw_text(9,l+2+(14*1),"X:")
		textbox_draw(propsinput0,100,l+2+(14*1),142,l+2+(14*1)+13)
		draw_text(9,l+2+(14*2),"Y:")
		textbox_draw(propsinput1,100,l+2+(14*2),142,l+2+(14*2)+13)
		if dragging!=-1
		{
			if propsinput0.text != ""
			{
				if real(propsinput0.text) > 65535 || real(propsinput0.text) > level.w << 3
					propsinput0.text = string(level.px)
				else if propsinput0.text != string(level.px)
					level.px = real(propsinput0.text)
			}
			else
				propsinput0.text = string(level.px)
			
			if propsinput1.text != ""
			{
				if real(propsinput1.text) > 65535 || real(propsinput1.text) > level.h << 3
					propsinput1.text = string(level.py)
				else if real(propsinput1.text) != level.py
					level.py = real(propsinput1.text)
			}
			else
				propsinput1.text = string(level.py)
		}
		else
		{
			propsinput0.text = string(level.px)
			propsinput1.text = string(level.py)
		}
		break
	// any objects
	default:
		break
}

/////////////////////
/////////////////////
//   Draw world    //
/////////////////////
/////////////////////

// TODO: set values based on most used numbers to reduce resource intensity somehow
// AKA ASSIGN VIEW_WVIEW-32 TO A VARIABLE AND INSTEAD OF USING IT OVER AND OVER
// or scrollbar
draw_set_color(c_white)
draw_rectangle(162,58,view_wview[0]-7,view_hview[0]-7,false)

surface_set_target(leveldraw)
draw_set_color(make_color_rgb(31,0,0))
draw_rectangle(
	scrollxv,
	scrollyv,
	scrollxv+view_wview[0],
	scrollyv+view_hview[0],false)
draw_set_color(c_white)
draw_rectangle(0,0,level.w<<3,level.h<<3,false)
// Tiles
px16=(level.px<<3)
py16=(level.py<<3)
for (j=0;j<level.h;j+=1)
{
	if (j<<3)<scrollyv-8
		continue
	if (j<<3)>view_hview[0]-80+scrollyv
		break
	// TODO: reduce lag with setting i< to how many tiles will reach the edge of the screen?
	for (i=0;i<level.w;i+=1)
	{
		if (i<<3)<scrollxv-8
			continue
		if (i<<3)>view_wview[0]-184+scrollxv
			break
		if level.tiles[i,j]
		{
			draw_sprite_part(terrain,0,
				((level.tiles[i,j]-1)&15)<<3,((level.tiles[i,j]-1)>>4)<<3,8,8,
				(i<<3)+1,
				(j<<3)+1)
		}
	}
}
draw_set_color(c_black)
// Mouse stuff
if mouse_rectangle(162,58,-162+view_wview[0]-7-16,-58+view_hview[0]-7-16)
{
	cursor = cr_cross
	switch editmode
	{
		case 0:
			if mouse_rectangle(
				162+px16-12-scrollxv,
				58+py16-19-2-scrollyv,
				25,23)
			{
				cursor = cr_size_all
				if mouse_check_button_pressed(mb_left)
				{
					dragx=(px16+162)-mouse_x
					dragy=(py16+58)-mouse_y
					dragging=-1
				}
			}
			break
		case 1:
			curtile -= mouse_wheel_up()
			curtile += mouse_wheel_down()
			if curtile < 0 curtile = 254
			if curtile > 254 curtile = 0
			i=((mouse_x-3+scrollxv)>>3)-21+1
			j=((mouse_y-3+scrollyv)>>3)-8+1
			draw_set_alpha(0.3)
			draw_sprite_part(terrain,0,
				(curtile&15)<<3,(curtile>>4)<<3,8,8,(i<<3)+1,(j<<3)+1)
			draw_set_alpha(1)
			if mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)
				a=6
			break
	}
}
if (a=6)
{
	if	mouse_x-162 < level.w << 3 &&
		mouse_y-58 < level.h << 3
	{
		if (i<0 || j<0) break
		if mouse_check_button(mb_left)
			level.tiles[i,j] = curtile+1
		else if mouse_check_button(mb_right)
			level.tiles[i,j] = 0
	}
}
if mouse_check_button_released(mb_left)&&a=6 a=0
if dragging=-1
{
	level.px = (mouse_x - 162 + dragx) >> 3
	level.py = (mouse_y - 58  + dragy) >> 3
	if mouse_x - 162 + dragx < 0 level.px = 0
	if mouse_y - 58  + dragy < 0 level.py = 0
	if level.px>level.w level.px = level.w
	if level.py>level.h level.py = level.h
}
if dragging>=0
{
	level.objects_x[dragging] = (mouse_x - 162 + dragx)
	level.objects_y[dragging] = (mouse_y - 58  + dragy)
	if mouse_x - 162 + dragx < 0 level.objects_x[dragging] = 0
	if mouse_y - 58  + dragy < 0 level.objects_y[dragging] = 0
	if level.objects_x[dragging]>(level.w<<3) level.objects_x[dragging] = (level.w<<3)
	if level.objects_y[dragging]>(level.h<<3) level.objects_y[dragging] = (level.h<<3)
}
if mouse_check_button_released(mb_left)
{
	dragx = 0
	dragy = 0
	dragging = noone
}
// Draw player
draw_sprite_part	(plyspr,0,0,0,25,19,px16-12, py16-19-3)
draw_sprite_part_ext(plyspr,0,86,21,7,4,px16-7+1,py16-3,1,1,c_white,1)
draw_sprite_part_ext(plyspr,0,94,21,8,4,px16+3+1,py16-3,1,1,c_white,1)
// Draw objects and mouse check
for(i=0;i<level.objectcount;i+=1)
{
	switch(level.objects_type[i])
	{
		case 0:
			_tmph=itmspr
			switch(level.objects_subtype[i])
			{
				case 0:
					_tmpi[0]=8
					_tmpi[1]=78
					_tmpi[2]=8
					_tmpi[3]=8
					_tmpj[0]=-4
					_tmpj[1]=-4
					break
				case 1:
					_tmpi[0]=0
					_tmpi[1]=62
					_tmpi[2]=14
					_tmpi[3]=16
					_tmpj[0]=-7
					_tmpj[1]=-8
					break
				case 2:
					_tmpi[0]=0
					_tmpi[1]=15
					_tmpi[2]=16
					_tmpi[3]=15
					_tmpj[0]=-7
					_tmpj[1]=-8
					break
			}
			break
		case 1:
			_tmph=enmspr
			switch(level.objects_subtype[i])
			{
				case 0:
					_tmpi[0]=0
					_tmpi[1]=2
					_tmpi[2]=25
					_tmpi[3]=21
					_tmpj[0]=-12
					_tmpj[1]=-21
					break
				case 1:
					_tmpi[0]=0
					_tmpi[1]=79
					_tmpi[2]=24
					_tmpi[3]=25
					_tmpj[0]=-12
					_tmpj[1]=-23
					break
			}
			break
	}
	if !editmode
	{
		if mouse_rectangle(162,58,-162+view_wview[0]-7-16,-58+view_hview[0]-7-16)
			if mouse_rectangle(
				162+level.objects_x[i]+_tmpj[0]-scrollxv,
				58+level.objects_y[i]+_tmpj[0]-scrollyv,
				_tmpi[2],_tmpi[3])
			{
				cursor = cr_size_all
				if mouse_check_button_pressed(mb_left)
				{
					dragx=(level.objects_x[i]+162)-mouse_x
					dragy=(level.objects_y[i]+58)-mouse_y
					dragging=i
					objselect=i
				}
			}
	}
	if (level.objects_y[i])<(scrollyv)-16 ||
		(level.objects_y[i])>view_hview[0]-60+scrollyv ||
		(level.objects_x[i])<(scrollxv)-16 ||
		(level.objects_x[i])>view_wview[0]-184+scrollxv
		continue
	draw_sprite_part(_tmph,0,
		_tmpi[0],_tmpi[1],_tmpi[2],_tmpi[3],
		level.objects_x[i]+_tmpj[0],
		level.objects_y[i]+_tmpj[1])
}
surface_reset_target()

draw_surface_part(leveldraw,
	scrollxv,
	scrollyv,
	view_wview[0]-7-162,
	view_hview[0]-7-58-16,
	162,58)
if editmode=1 {
	draw_set_color(c_white)
	draw_rectangle(162,view_hview[0]-7-16-33-30,162+160,view_hview[0]-7-16,false)
	draw_set_color(c_white)
	draw_rectangle(162,view_hview[0]-7-16-33-33-30,162+160,view_hview[0]-7-16-33-30,false)
	draw_set_color(c_black)
	draw_text(166,view_hview[0]-7-16-30-33-30,
		"Left/right mouse = Set/clear tile#Mouse wheel = Cycle tiles")
}
if ((mouse_x-162) >= 0 &&
	(mouse_y-58) >= 0)
{
	draw_set_color(c_white)
	draw_rectangle(162,view_hview[0]-7-16-33-30,162+90,view_hview[0]-7-16,false)
	draw_set_color(c_black)
	draw_text(166,view_hview[0]-7-16-60,
		"Mouse X: "+string(mouse_x-162)+chr($D)+
		"Mouse Y: "+string(mouse_y-58)+chr($D)+//)
		//draw_text(166,view_hview[0]-7-16-30,
			"Tile X: "+string((mouse_x-162)>>3)+chr($D)+
			"Tile Y: "+string((mouse_y-58)>>3)+chr($D))
}


/////////////////////
/////////////////////
//   Scrollbars    //
/////////////////////
/////////////////////

draw_set_color(16777215)
draw_set_color(make_color_rgb(216,208,212))
// is this resource intensive
// especially when i could use a whole image
// but at the same time look stupid
for(i=0;i<(scrollh>>1)+16;i+=1)
	draw_sprite(scrollspr,19,view_wview[0]-16-7,58+17+(i<<1))
for(i=0;i<(scrollw>>1);i+=1)
	draw_sprite(scrollspr,15,163+16+(i<<1),view_hview[0]-23)
scrollw=view_wview[0]-202-16
scrollh=view_hview[0]-16-98
scrollbar_draw(levelscrollx,163,view_hview[0]-23,scrollw,(level.w<<3)-32)
scrollbar_draw(levelscrolly,view_wview[0]-16-7,59,scrollh,(level.h<<3)-32)
draw_set_color(c_black)


draw_rectangle(162,58,view_wview[0]-7,view_hview[0]-7,true)



/////////////////////
/////////////////////
//    wack mafia works wootshack toolbars
/////////////////////
/////////////////////

j=4
draw_set_color(c_gray)
draw_set_alpha(1)
for(i=0;i<toolcount;i+=1)
{
	if (toolcode[i] != "|")
	{
		if mouse_rectangle(j,18,16,16)
		{
			if c=0 draw_set_color(16777215)
			if c=i+1 draw_set_color(8421504)
			if c!=i+1 draw_set_alpha(0)
			if c=0 draw_set_alpha(1)
			draw_line(j-2,16,j+17,16)
			draw_line(j-2,16,j-2,35)
			if c=0 draw_set_color(8421504)
			if c=i+1 draw_set_color(16777215)
			draw_line(j-2,35,j+18,35)
			draw_line(j+17,16,j+17,35)
			draw_set_alpha(1)
			if mouse_check_button_pressed(mb_left) c=i+1
			if mouse_check_button_released(mb_left) && c=i+1
			{
				b=i
				c=0
				a=4
			}
		}
		draw_sprite(icons,toolicon[i],j,18)
		j+=20
	}
	else
	{
		draw_set_color(c_gray)
		draw_line(j+1,17,j+1,35)
		j+=6
	}
}
if a=4
{
	execute_string(toolcode[b])
	a=0
}
if mouse_check_button_released(mb_left) c=0


/////////////////////
/////////////////////
//  Menubar code   //
/////////////////////
/////////////////////

if a=3
{
	e=0
	for(i=0;i<b;i+=1)
	{
		e+=menusize[i]+4
	}
	switch (b)
	{
		case 0:
			switch show_menu_ext(e,16,
				"0#"+menustr[0]+"&Ctrl+N|"+
				"1#"+menustr[1]+"&Ctrl+O|"+
				"2#"+menustr[2]+"&Ctrl+S|"+
				"2#"+menustr[3]+"|-|"+
				"2#"+menustr[4]+"|-|"+
				"6#"+menustr[5]+"&Alt+F4",-1)
			{
				case 0:
					execute_code(new_level_scr)
					break
				case 2:
					execute_string(toolcode[2])
					break
				case 3:
					execute_string(saveas)
					break
				case 4:
					fname=get_save_filename('Klonoa Level File|*.klo','')
					if fname!=''
					{
						execute_file(path_src+'scr/save_level.gml',temp_directory+"\tmp.klo")
						execute_shell(path_bin+'klo2rle.exe','"'+temp_directory+"\tmp.klo"+'" "'+fname+'"')
					}
					break
				case 5:
					game_end()
					break
			}
			break
		case 3:
			switch show_menu_ext(e,16,
				"14#"+menustr[300]+"|"+
				""+menustr[301]+"|\|"+
				"16#"+menustr[302]+"|"+
				"17#"+menustr[303]+"|",-1)
			{
				case 0:
					execute_string(toolcode[11])
					break
				case 2:
					lang=0
					break
				case 3:
					lang=1
					break
			}
			break
	}
	a=0
	d=0
}
if mouse_check_button_released(mb_left) a=0

// Outline current editing mode icon (obj/tiles/link)
if editmode {
	switch editmode
	{
		case 1:
			i=0
			break
		case 2:
			i=-20
			break
	}
	draw_set_color(8421504)
	draw_line(110-2+i, 16,110+17+i,16)
	draw_line(110-2+i, 16,110-2 +i,35)
	draw_set_color(16777215)
	draw_line(110-2+i,35, 110+18+i,35)
	draw_line(110+17+i,16,110+17+i,35)
}

if keyboard_check_pressed(vk_f12) execute_string(get_string("Enter code:",""))
//if keyboard_check_pressed(vk_escape) { ini_close() game_end() }
//if keyboard_check_pressed(vk_tab) room_speed=120
//if keyboard_check_released(vk_tab) room_speed=60

if langlast != lang || once < 8 // stupid
{
	langlast = lang
	if !once
	{
		ini_write_real("General","Language",lang)
		once = 1
	}
	if !lang
	{
		menuname[0] = "File"
		menusize[0] = 24
		menuname[1] = ""//"Edit" // NOT IMPLEMENTED YET...
		menusize[1] = -4//25
		menuname[2] = "Level"
		menusize[2] = 34
		menuname[3] = "Help"
		menusize[3] = 28
		menustr[0] = "New"
		menustr[1] = "Open"
		menustr[2] = "Save"
		menustr[3] = "Save as"
		menustr[4] = "Compress level"
		menustr[5] = "Exit"
		menustr[300] = "Guide"
		menustr[301] = "Language"
		menustr[302] = "English"
		menustr[303] = "Japanese"
	}
	else
	{
		if once < 8
		{
			menunamej[0] = ktkn("HUAIRU")
			menusizej[0] = 36
			menunamej[1] = ktkn("ETE`iTO")
			menusizej[1] = 42
			menunamej[2] = ktkn("REHE`RU")
			menusizej[2] = 36
			menunamej[3] = ktkn("HERUHU`")
			menusizej[3] = 32
			menustrj[0] = ktkn("NIYU-")
			menustrj[1] = ktkn("O-HE`N")
			menustrj[2] = ktkn("SE-HU`") // it's a cebu!
			menustrj[3] = ktkn("SE-HU`:ASU`")
			menustrj[4] = ktkn("EKUSItuTO")
			menustrj[300] = ktkn("KA`ITO`")
			once += 1
		}
		menuname[0] = menunamej[0]
		menusize[0] = menusizej[0]
		menuname[1] = menunamej[1]
		menusize[1] = menusizej[1]
		menuname[2] = menunamej[2]
		menusize[2] = menusizej[2]
		menuname[3] = menunamej[3]
		menusize[3] = menusizej[3]
		menustr[0] = menustrj[0]
		menustr[1] = menustrj[1]
		menustr[2] = menustrj[2]
		menustr[3] = menustrj[3]
		menustr[4] = menustrj[4]
		menustr[300] = menustrj[300]
	}
}

if !textbox_mouseover // why david
	window_set_cursor(cursor)
