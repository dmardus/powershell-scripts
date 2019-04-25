Remove-VMSnapshot –VMName VM-Name
Checkpoint-VM -Name VM-Name

foreach ($snap in Get-VMSnapshot -VMName VM-Name)
{
    $body = "Snapshot name: '" + $snap.Name + "' successfully created"
}

Send-MailMessage -To "mail_to@outlook.com" -From "mail_from@outlook.com" -Cc "<mail_cc1@outlook.com>", "<mail_cc2@outlook.com>" -Subject "Backup Database" -Body $body -SmtpServer "smtp.office365.com"