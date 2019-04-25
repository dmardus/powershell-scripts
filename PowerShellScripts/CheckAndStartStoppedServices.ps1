$array = @()
$arrayRes = @()
$computers = "192.168.66.4" #, "192.168.66.10", "192.168.66.11", "192.168.66.12"
$UserName = "PC\Administrator"
$PlainPassword = "Password"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword

$needSecondCheck = 0

foreach($comp in $computers) {
	$svcs = Get-WMIObject Win32_Service -Filter "Name like 'ServiceName1' or Name like 'ServiceName2' or Name like 'ServiceName3' " -ComputerName $comp -Credential $cred
	$obj = New-Object psobject -Property @{
		Name = $svcs.Name
		Status = $svcs.State
		Computer = $comp
	}
	$array += $obj
	foreach($svc in $svcs) {
		if ($svc.State -eq 'Stopped')
		{
			$needSecondCheck = 1
			$svc.StartService()
		}
	}

	if ($needSecondCheck -eq 1)
	{
		$svcs = Get-WMIObject Win32_Service -Filter "Name like 'ServiceName1' or Name like 'ServiceName2' or Name like 'ServiceName3' " -ComputerName $comp -Credential $cred
		$obj = New-Object psobject -Property @{
			Name = $svcs.Name
			Status = $svcs.State
			Computer = $comp
		}
		$arrayRes += $obj
	}
}
$array | Select Computer, Name, Status | FT -AutoSize

$arrayRes | Select Computer, Name, Status | FT -AutoSize