function  Invoke-Installer([string]$msiName) {

    $installCommand = "cmd /c start /wait msiexec /i " + $msiName + " /quiet /log InstallLog.txt ALLUSERS=2"
    Write-Verbose $installCommand
	invoke-expression $installCommand | Write-Verbose
}