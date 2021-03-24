
(Get-Item ‘E:\Cloneoa\src\proj\installer\InstallPath\Play.bat’).LastWriteTime = (Get-Date)
foreach($file in Get-ChildItem -Path ‘E:\Cloneoa\src\proj\installer\InstallPath\’ -Recurse) {
#Write $file.FullName
$file = Get-Item $file.FullName
$file.LastWriteTime = (Get-Date)
}
