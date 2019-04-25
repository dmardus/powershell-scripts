$vms = "Domain Server", "Confluence", "Exchange Server", "MSSQL 2008 R2 (SQL_Latin1_General_CP1_CI_AS)", "MSSQL 2017"

foreach($vm in $vms) {
    
    $vm_prop = Get-VM $vm
    
    if ($vm_prop.State -eq 'Running')
    {
        Restart-VM $vm -AsJob
        if ($vm -eq "Domain Server")
        {
            Start-Sleep -Seconds 30
        }
    }
    else
    {
        Start-VM $vm -AsJob
        if ($vm -eq "Domain Server")
        {
            Start-Sleep -Seconds 30
        }
    }
}
