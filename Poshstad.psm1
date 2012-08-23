#set up the preference objects
$global:Poshstad = @{}
$Poshstad.Preferences = @{}
$Poshstad.Preferences += @{ "ModuleRoot" = $(split-path $MyInvocation.MyCommand.Path) }

foreach ($file in $(gci "$($Poshstad.Preferences.ModuleRoot)\Functions" *ps1)) { ."$($file.FullName)" }

Export-ModuleMember -Function * 

Get-Command -Module Poshstad