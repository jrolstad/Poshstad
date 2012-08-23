function Invoke-ComputerManager([string] $machineName)
{
    if([string]::IsNullOrEmpty($machineName)){
         invoke-expression("C:\Windows\system32\compmgmt.msc")
    }
    else {
         invoke-expression("C:\Windows\system32\compmgmt.msc /computer:{0}" -f $machineName)
    }
   
}