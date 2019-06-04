$vms = "VM NAME1", "VM NAME2", "VM NAME3", "VM NAME4", "VM NAME5"

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
