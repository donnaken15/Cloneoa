mkdir InstallPath
cd InstallPath
set folders=
for %%F in (bin gfx lvl mus sfx) do xcopy ..\..\..\..\%%F\ %%F\ /E /Y
for %%F in (ctrl ent klo obj scr) do xcopy ..\..\..\..\src\%%F\ src\%%F\ /E /Y
copy ..\..\..\..\src\*.* src /y
copy ..\..\..\..\Play.bat . /y
del sfx\Sample*.wav
for %%D in (bin\*.*obj bin\*.*pdb bin\enVisioner.exe.config bin\settings.ini) do del %%D
