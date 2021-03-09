#Makes PS run as admin
param([switch]$Elevated)
function Check-Admin {
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Check-Admin) -eq $false) {
if ($elevated)
{
# could not elevate, quit
}
else {
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
exit
}
#Creates Folder in Designated Local Location
New-Item -Path "C:\" -Name "Folder Name" -ItemType "directory"
#Copies the desired folder to the new folder
Copy-Item "C:\ Original file" -Destination "C:\Folder Name"
#Creates shortcut on public desktop
Copy-Item "C:\Folder Name\file.exe" -Destination "C:\Users\Public\Desktop"

Exit
