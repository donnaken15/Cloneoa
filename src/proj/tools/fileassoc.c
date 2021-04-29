
#include <Windows.h>

HKEY CLASS, EXT, TMP;
LPSTR  CLASSV = "Cloneoa.KLO",
       EXTV   = "Klonoa Level",
       DOOR   = "\\klo2rle.exe,1",
       DEFICO = "\\DefaultIcon",
       SOC    = "\\shell\\open\\command",
       CLOEX  = "\\Cloneoa",
       EDIEX  = "\\enViSiONer",
       EXE    = ".exe",
       SHPAR  = " \"%1\"",
       EDIT   = "edit"
       ;
char   TMPSTR2[MAX_PATH], TMPSTR[30];
int    curdirlen;

//int main(int argc, char*argv[])
int WINAPI WinMain(HINSTANCE hInstance,
	HINSTANCE hPrevInstance,
	LPSTR lpCmdLine,
	int nCmdShow)
{
  /// create .klo key
  if(!RegCreateKey(HKEY_CLASSES_ROOT, ".klo", &CLASS))
    if(!RegSetValue(CLASS, 0, REG_SZ, CLASSV, 12))
  /// create class key
  if(!RegCreateKey(HKEY_CLASSES_ROOT, CLASSV, &EXT))
    if(!RegSetValue(EXT, 0, REG_SZ, EXTV, 13))
  if(memcpy(TMPSTR,CLASSV,11))
    if(memcpy(TMPSTR+11,DEFICO,12))
      if(!RegCreateKey(HKEY_CLASSES_ROOT, TMPSTR, &TMP))
  /// defaulticon {
  if(GetCurrentDirectory(MAX_PATH,TMPSTR2))
  {
    curdirlen = strlen(TMPSTR2);
      if(curdirlen)
        if(memcpy(TMPSTR2+curdirlen,DOOR,14))
          if(!RegSetValue(TMP,0,REG_SZ,TMPSTR2,13))
  /// }
  /// shell {
  if(ZeroMemory(TMPSTR+11,30-11))
    if(memcpy(TMPSTR+11,SOC,19))
      if(!RegCreateKey(HKEY_CLASSES_ROOT, TMPSTR, &TMP))
        if(ZeroMemory(TMPSTR2+curdirlen,MAX_PATH-curdirlen))
        {
          memcpy(TMPSTR2+1,TMPSTR2,MAX_PATH-1);
          TMPSTR2[0] = '"';
          TMPSTR2[curdirlen+13] = '"';
          if(memcpy(TMPSTR2+curdirlen+1,CLOEX,8))
            if(memcpy(TMPSTR2+curdirlen+9,EXE,4))
              if(memcpy(TMPSTR2+curdirlen+14,SHPAR,5))
                if(!RegSetValue(TMP, 0, REG_SZ, TMPSTR2, 13))
    if(memcpy(TMPSTR+18,EDIT,4))
      if(memcpy(TMPSTR2+curdirlen+3,TMPSTR2+curdirlen,MAX_PATH-curdirlen-3))
        if(memcpy(TMPSTR2+curdirlen+1,EDIEX,11))
          if(!RegCreateKey(HKEY_CLASSES_ROOT, TMPSTR, &TMP))
            if(!RegSetValue(TMP, 0, REG_SZ, TMPSTR2, 13))
              return 0;
          }
  }
  /// }
  return 1;
}
