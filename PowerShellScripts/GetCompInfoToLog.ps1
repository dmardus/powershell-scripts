. .\Functions\Get-MachineType.ps1
. .\Functions\Get-Uptime.ps1
. .\Functions\Write-Log.ps1

$msgMachineType = 'Machine Type: {0}' -f (Get-MachineType -ComputerName DMNUC-PC).Type

Write-Log -Message $msgMachineType -Path .\Logs\GetCompInfoToLog.log -Level Info

$upTimeRes = Get-Uptime -ComputerName DMNUC-PC

$msgBootTime = 'BootTime: {0}' -f $upTimeRes.BootTime

$msgUpTime = 'UpTime: {0}' -f $upTimeRes.UpTime

Write-Log -Message $msgBootTime -Path .\Logs\GetCompInfoToLog.log -Level Info
Write-Log -Message $msgUpTime -Path .\Logs\GetCompInfoToLog.log -Level Info