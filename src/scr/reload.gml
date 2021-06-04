
ini_close()

// SETTINGS
ini_open(path_bin+"settings.ini")
{
	realtimesrc = ini_read_real("Debug","RealtimeSrc",0)
	debug_draw = ini_read_real("Debug","DebugDraw",debug_mode)
	lang = ini_read_real("General","Language",0)

	ctrl_left  = ini_read_real("Controls","Left" ,vk_left)
	ctrl_up    = ini_read_real("Controls","Up"   ,vk_up)
	ctrl_right = ini_read_real("Controls","Right",vk_right)
	ctrl_down  = ini_read_real("Controls","Down" ,vk_down)
	ctrl_jump  = ini_read_real("Controls","Jump" ,ord('Z'))
	ctrl_fire  = ini_read_real("Controls","Fire" ,ord('X'))
	ctrl_start = ini_read_real("Controls","Start",vk_return)

	handytitle = ini_read_real("General","HandyTitle",0)
}

if !realtimesrc {
file_text_read_all_scr =
	execute_file(path_src+"scr/file_text_read_all.gml",path_src+"scr/file_text_read_all.gml")
get_code_scr = file_text_read_all(path_src+"scr/get_code.gml")
}
else {
file_text_read_all_scr = path_src+"scr/file_text_read_all.gml"
get_code_scr = path_src+"scr/get_code.gml" }

lobit_scr       = get_code(path_src+"scr/lobit.gml")
lobyte_scr      = get_code(path_src+"scr/lobyte.gml")
hibit_scr       = get_code(path_src+"scr/hibit.gml")
hibyte_scr      = get_code(path_src+"scr/hibyte.gml")
create_obj_scr  = get_code(path_src+"obj/scr/cctor.gml")
create_part_scr = get_code(path_src+"part/scr/cctor.gml")
draw_digit_scr  = get_code(path_src+"scr/draw_digit.gml")
ktkn_scr        = get_code(path_src+"scr/ktkn.gml")
load_level_scr  = get_code(path_src+"scr/load_level.gml")
split_scr       = get_code(path_src+"scr/split.gml")
reload_scr      = get_code(path_src+"scr/reload.gml")
//coll_scr        = get_code(path_src+"scr/coll.gml") WWTFFFF

// CODE ADDING STUFF
{
	object_event_clear(controller,	ev_step,0)
	object_event_clear(controller,	ev_draw,0)
	object_event_clear(player,		ev_step,0)
	object_event_clear(player,		ev_draw,0)
	object_event_clear(tile,		ev_create,0)
	object_event_clear(item,		ev_draw,0)
	object_event_clear(item,		ev_destroy,0)
	object_event_clear(enemy,		ev_step,0)
	object_event_clear(enemy,		ev_draw,0)
	object_event_clear(particle,	ev_draw,0)
	object_event_clear(windbullet,	ev_step,0)
	object_event_clear(windbullet,	ev_draw,0)
	object_event_add(controller,ev_step,	0,get_code(path_src+"ctrl/step.gml",		0))
	object_event_add(controller,ev_draw,	0,get_code(path_src+"ctrl/draw.gml",		0))
	object_event_add(player,	ev_step,	0,get_code(path_src+"klo/step.gml",			0))
	object_event_add(player,	ev_draw,	0,get_code(path_src+"klo/draw.gml",			0))
	object_event_add(tile,		ev_create,	0,get_code(path_src+"tile/create.gml",		0))
	object_event_add(item,		ev_draw,	0,get_code(path_src+"obj/item/draw.gml",	0))
	object_event_add(item,		ev_destroy,	0,get_code(path_src+"obj/item/destroy.gml",	0))
	object_event_add(enemy,		ev_step,	0,get_code(path_src+"obj/ent/step.gml",		0))
	object_event_add(enemy,		ev_draw,	0,get_code(path_src+"obj/ent/draw.gml",		0))
	object_event_add(particle,	ev_draw,	0,get_code(path_src+"part/draw.gml",		0))
	object_event_add(windbullet,ev_step,	0,get_code(path_src+"klo/wndb/step.gml",	0))
	object_event_add(windbullet,ev_draw,	0,get_code(path_src+"klo/wndb/draw.gml",	0))
}

/// SPRITE STUFF
{
	sprite_replace(klospr,path_gfx+"common/player.png",0,1,0,0,0)
	sprite_replace(hudspr,path_gfx+"common/hud.png",0,1,0,0,0)
	sprite_replace(itemspr,path_gfx+"common/item.png",0,1,0,0,0)
	sprite_replace(partspr,path_gfx+"common/particle.png",0,1,0,0,0)
	sprite_replace(enemyspr,path_gfx+"common/enemy.png",0,1,0,0,0)
	sprite_replace(objspr,path_gfx+"common/obj.png",0,1,0,0,0)
	confnt = font_add_sprite(sprite_add(path_gfx+"misc/debug.png",94,0,0,0,0),ord('!'),0,0)
}

/// SOUND STUFF
{
	globalvar snd_jump, snd_land, snd_pause, snd_scroll, snd_heal,
			snd_gem, snd_float, music_part, snd_hurt, snd_fire,
			snd_grab, snd_kill, snd_death, snd_death2, snd_throw,
			snd_confirm;
	snd_jump = sound_add(path_sfx+"jump.wav",0,1)
	snd_land = sound_add(path_sfx+"land.wav",0,1)
	snd_pause = sound_add(path_sfx+"pause.wav",0,1)
	snd_scroll = sound_add(path_sfx+"scroll.wav",0,1)
	snd_gem = sound_add(path_sfx+"gem.wav",0,1)
	snd_float = sound_add(path_sfx+"float.wav",0,1)
	snd_hurt = sound_add(path_sfx+"hurt.wav",0,1)
	snd_fire = sound_add(path_sfx+"fire.wav",0,1)
	snd_heal = sound_add(path_sfx+"heal.wav",0,1)
	snd_grab = sound_add(path_sfx+"grab.wav",0,1)
	snd_kill = sound_add(path_sfx+"kill.wav",0,1)
	snd_death = sound_add(path_sfx+"death.wav",0,1)
	snd_death2 = sound_add(path_sfx+"death2.wav",0,1)
	snd_throw = sound_add(path_sfx+"throw.wav",0,1)
	snd_wahoo = sound_add(path_sfx+"wahoo.wav",0,1)
	snd_confirm = sound_add(path_sfx+"confirm.wav",0,1)
}
