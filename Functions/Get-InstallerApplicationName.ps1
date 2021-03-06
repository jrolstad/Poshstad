function Get-InstallerApplicationName([string] $installerFilePath)
{
    $installerFileContent = get-content $installerFilePath
    $applicationNameMatch = $installerFileContent | select-string ".exe#" -CaseSensitive
    
    $applicationName = $null
    if($applicationNameMatch -ne $null)
    {
        $applicationNameMatchString = $applicationNameMatch.ToString()
        
        $sectionEnd = $applicationNameMatchString.LastIndexOf(".exe")
        $sectionStart = $applicationNameMatchString.LastIndexOf("EXE|")
        $length = $sectionEnd-$sectionStart

        $applicationName = $applicationNameMatchString.Substring( $sectionStart+4, $length)
    }
    
    $applicationName
    
}