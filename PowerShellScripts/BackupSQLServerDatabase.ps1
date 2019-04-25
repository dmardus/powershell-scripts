[string[]]$res = sqlcmd -U sa -P password -S SQLSERVER_IP -Q "EXEC sp_BackupDatabases @backupLocation='C:\DB_Backups\', @databaseName='DBName', @backupType='F'"

$OFS = "`r`n"
$body = [string]$res

Send-MailMessage -To "mail_to@outlook.com" -From "mail_from@outlook.com" -Cc "<mail_cc1@outlook.com>", "<mail_cc2@outlook.com>" -Subject "Backup Database" -Body $body -SmtpServer "smtp.office365.com"