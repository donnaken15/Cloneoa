@echo off
echo Running extraction phase...
cd tmp
x
cd ..
tmp\x
DEL /F/Q/S tmp\*.*
rmdir /Q/S tmp
del tmp.bat