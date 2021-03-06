function Invoke-Uninstall(
    [string]$exeName,
    [string]$applicationProductCode)
{

    Write-Verbose "Closing Application down (if running)..."
	$currenterroractionpreference = $erroractionpreference
    $erroractionpreference="SilentlyContinue"
    $killTaskCommand = "cmd /c taskkill /F /IM " + $exeName
    invoke-expression $killTaskCommand
    $erroractionpreference = $currenterroractionpreference
	
	Write-Verbose "Uninstalling..."
    $uninstallCommand = "cmd /c start /wait msiexec /x '`{" + $applicationProductCode + "`}' /quiet /log UninstallLog.txt ALLUSERS=2"
    Write-Verbose $uninstallCommand
	invoke-expression $uninstallCommand
}