function Get-InstallerProductCode([string] $installerFilePath)
{
        $installerFileContent = get-content $installerFilePath
        $productCodeMatch = $installerFileContent | select-string "ProductCode{" -CaseSensitive

        $productCodeMatchString = $productCodeMatch.ToString()

        $sectionStart = $productCodeMatchString.IndexOf("ProductCode")
        $start = $productCodeMatchString.IndexOf("{",$sectionStart)
        $end = $productCodeMatchString.IndexOf("}",$start)

        $productCode = $productCodeMatchString.ToString().Substring($start+1,$end-$start-1)
        
        $productCode
}