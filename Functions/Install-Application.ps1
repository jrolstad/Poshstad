function Install-Application([string] $installerFilePath)
{
    $productCode =  Get-InstallerProductCode $installerFilePath
    $applicationName = Get-InstallerApplicationName  $installerFilePath
    
    Write-Host("Uninstalling {0} with Product Code {1}" -f (split-path $installerFilePath -leaf), $productCode)
    Invoke-Uninstall $applicationName $productCode
    Write-Host("Installing {0}" -f $installerFilePath)
    Invoke-Installer $installerFilePath
            
            
}