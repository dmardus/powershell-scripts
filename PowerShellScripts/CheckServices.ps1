$array = @()
$computers = "192.168.66.4" #, "192.168.66.10", "192.168.66.11", "192.168.66.12"
$UserName = "PC\Administrator"
$PlainPassword = "Password"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword

foreach($comp in $computers) {
    $svc = Get-WMIObject Win32_Service -Filter "Name like 'ServiceName1' or Name like 'ServiceName2' or Name like 'ServiceName3' " -ComputerName $comp -Credential $cred
    $obj = New-Object psobject -Property @{
        Name = $svc.Name
        Status = $svc.State
        Computer = $comp
    }
    $array += $obj

}
$array | Select Computer, Name, Status | FT -AutoSize