<#
.SYNOPSIS
Opens all machine.config file in Notepad++ for the given framework version

.PARAMETER version
64 or 32 bit version of the machine config to open

.PARAMETER framework
.NET Framework version to open the machine.config for
#>
function Open-MachineConfig()
{
    $notepadppPath = "C:\Program Files (x86)\Notepad++\notepad++.exe"
    gci -path C:\WINDOWS\Microsoft.NET -Include machine.config -recurse | ForEach-Object {
         &$notepadppPath "-lxml" $_.FullName
        }
}