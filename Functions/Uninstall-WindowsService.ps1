<#
.SYNOPSIS
Uninstalls and deletes a Windows Service

.DESCRIPTION
Given a windows service name, the service will be uninstalled as a registered service and its components deleted from the disk

.PARAMETER serviceName
Name of the service to delete

.PARAMETER waitAfterStop
The number of seconds to wait after the service is stopped.  This allows the service to shut down gracefully before deleting it

.EXAMPLE
Uninstall the service 'Chronos1'

Uninstall-WindowsService Chronos

.EXAMPLE
Uninstall the service 'MyBigService' and allow it 30 seconds to shut down before deleting
Uninstall-WindowsService MyBigService 30
#>
function Uninstall-WindowsService([string] $serviceName, [int] $waitAfterStop = 2)
{
    # Get the Service reference   
    $svc = gwmi win32_service -filter ("name='{0}'" -f $serviceName)
    
    if($svc -eq $null)
    {
        throw ("Unable to find service with name '{0}'" -f $serviceName)
    }
    else
    {
        # Stop the service and delete it
        Write-Host("Stopping the service")
        [void] $svc.StopService()
        start-sleep -s $waitAfterStop
        Write-Host("Deleting the service")
        [void] $svc.Delete()

        # Remove the service components
        $serviceDirectory = split-path $svc.PathName
        Write-Host("Deleting service components at {0}" -f $serviceDirectory)
        Remove-Item -path $serviceDirectory -force -recurse
    }
}