__fname = argument0
//__level = argument1


lfile = file_bin_open(__fname,1)
file_bin_rewrite(lfile)
/* 0x00 */ file_bin_write_byte(lfile,$AC)
/* 0x01 */ file_bin_write_byte(lfile,$1E)
/* 0x02 */ file_bin_write_byte(lfile,HIBYTE(fver))
/* 0x03 */ file_bin_write_byte(lfile,LOBYTE(fver))
/* 0x04 */ file_bin_write_byte(lfile,0)
/* 0x05 */ file_bin_write_byte(lfile,(level.theme<<4)|level.music)
/* 0x06 */ file_bin_write_byte(lfile,0)
/* 0x07 */ file_bin_write_byte(lfile,0)
/* 0x0C */ file_bin_write_byte(lfile,HIBYTE(level.w))
/* 0x0D */ file_bin_write_byte(lfile,LOBYTE(level.w))
/* 0x0E */ file_bin_write_byte(lfile,HIBYTE(level.h))
/* 0x0F */ file_bin_write_byte(lfile,LOBYTE(level.h))
/* 0x08 */ file_bin_write_byte(lfile,HIBYTE(level.px))
/* 0x09 */ file_bin_write_byte(lfile,LOBYTE(level.px))
/* 0x0A */ file_bin_write_byte(lfile,HIBYTE(level.py))
/* 0x0B */ file_bin_write_byte(lfile,LOBYTE(level.py))
for (j=0;j<level.h;j+=1)
	for (i=0;i<level.w;i+=1)
		file_bin_write_byte(lfile,level.tiles[i,j])
__fpad = 16 - (file_bin_position(lfile) & $F)
if __fpad != 16
	for (i=0;i<__fpad;i+=1)
		file_bin_write_byte(lfile,0)
// write objects
for (i=0;i<level.objectcount;i+=1)
{
	/* 0x00 */ file_bin_write_byte(lfile,(level.objects_type[i]<<4)|level.objects_subtype[i])
	/* 0x01 */ file_bin_write_byte(lfile,level.objects_props0[i])
	/* 0x02 */ file_bin_write_byte(lfile,level.objects_props1[i])
	/* 0x03 */ file_bin_write_byte(lfile,level.objects_props2[i])
	/* 0x04 */ file_bin_write_byte(lfile,level.objects_x[i] >> 8)
	/* 0x05 */ file_bin_write_byte(lfile,level.objects_x[i] & $FF)
	/* 0x06 */ file_bin_write_byte(lfile,level.objects_y[i] >> 8)
	/* 0x07 */ file_bin_write_byte(lfile,level.objects_y[i] & $FF)
}
file_bin_close(lfile)

