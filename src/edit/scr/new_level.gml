if fname != ""
	if !show_question("New file?")
		exit
fname=""
for (j=0;j<level.h;j+=1)
	for (i=0;i<level.w;i+=1)
		level.tiles[i,j]=0
level.w = 72
level.h = 36
level.px = 12
level.py = 20
level.type = 0
level.ver = 0
level.objectcount = 0
level.music = 0
level.theme = 0
objselect=-2
propsinput0.text = string(level.w)
propsinput1.text = string(level.h)
propsinput2.text = string(level.type)
propsinput3.text = string(level.music)
propsinput4.text = string(level.theme)

