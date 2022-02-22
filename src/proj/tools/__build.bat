@tcc    klo2rle.c -o ..\..\..\bin\klo2rle.exe -nostdlib ^
		-v -bench -funsigned-char -fno-common ^
		-fno-common -fdollars-in-identifiers -mno-sse ^
		-m32 -nostdlib -lmsvcrt
@tcc    fileassoc.c -Wl=gui -ladvapi32 -o ..\..\..\bin\fileassoc.exe ^
		-v -bench -funsigned-char -fno-common ^
		-fno-common -fdollars-in-identifiers -mno-sse ^
		-m32 -nostdlib -lmsvcrt -lkernel32 -luser32 -lgdi32
IF ERRORLEVEL 1 PAUSE
:# add manifest script to fileassoc using resource hacker after
