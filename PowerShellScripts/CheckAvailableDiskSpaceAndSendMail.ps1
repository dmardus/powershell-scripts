$subject = "Available Free Disk Space on PC-NAME (192.168.66.4)"
$smtp = "smtp.office365.com"

$UserName = "PC\Administrator"
$PlainPassword = "Password"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword

$disk = Get-WmiObject Win32_LogicalDisk -ComputerName "192.168.66.4" -Filter "DeviceID='E:'" -Credential $cred

[int]$free = $disk.FreeSpace/1GB

[string]$body = "Available disk space on PC-NAME (192.168.66.4) drive (Files (E:)) less than " + $free + " GB"
[string]$body_wrong = "Something went wrong. Free disk space equal " + $free + " GB"

if ($free -cle 50)
{
	if ($free -eq 0)
	{
		Send-MailMessage -To "mail_to@outlook.com" -From "mail_from@outlook.com" -Subject $subject -Body $body_wrong -SmtpServer $smtp
	}
	else
	{
		Send-MailMessage -To "mail_to@outlook.com" -From "mail_from@outlook.com" -Cc "<mail_cc1@outlook.com>", "<mail_cc2@outlook.com>", "<mail_cc3@outlook.com>" -Subject $subject -Body $body -SmtpServer $smtp
	}
}
else
{
	Send-MailMessage -To "mail_to@outlook.com" -From "mail_from@outlook.com" -Subject $subject -Body $body -SmtpServer $smtp
}