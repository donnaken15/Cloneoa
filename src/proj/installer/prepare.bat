:# BUILD WITH INSTALLFORGE 1.3.2
rmdir InstallPath /s/q
mkdir InstallPath
cd InstallPath
set folders=
for %%F in (bin gfx lvl mus sfx) do xcopy ..\..\..\..\%%F\ %%F\ /E/Y
for %%F in (ctrl ent klo obj scr tile part) do xcopy ..\..\..\..\src\%%F\ src\%%F\ /E/Y
copy ..\..\..\..\src\*.* src /y
copy ..\..\..\..\Play.bat . /y
del sfx\Sample*.wav
:#del lvl\*.* /q
for %%D in (bin\*.*obj bin\*.*pdb bin\enVisioner.exe.config bin\settings.ini src\reg.reg) do del %%D
echo now build this, you poopy
cd ..
:# start "" Cloneoa.ifp
:# USE rcx86 or Resource Hacker TO REPLACE ICON GENERATED BY IF132
:# sleep 500
:# powershell batchchangemoddates.ps1
