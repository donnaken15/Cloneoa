macro dw op {
   dw 0 or ((op and 0FF00h) shr 8) or \
	   ((op and 000FFh) shl 8)
} ; credit ralph @ fasm board

macro header lv,lt,m,t,lw,lh,px,py
{
    dw $AC1E
    dw lv
    db lt
    db m shl 4 + t
    db 2 dup 0
    dw lw
    dw lh
    dw px
    dw py
}

macro object t,st,p,px,py
{
    db t
    db st
    dw p
    dw px
    dw py
}

OBJ_ITEM = 0
OBJ_ENMY = 1

ITM_GEM  = 0
ITM_DMND = 1
ITM_STAR = 2
ITM_HART = 3
ITM_LIFE = 4

ENT_MU	 = 0
ENT_FLY  = 1
ENT_SPK  = 2
ENT_BOMB = 3
ENT_SPKT = 4
ENT_CPTR = 5
ENT_BALL = 6

DOR_WIN  = 0
DOR_LOCK = 1
DOR_WARP = 2
DOR_SWT  = 3
DOR_PNBL = 4