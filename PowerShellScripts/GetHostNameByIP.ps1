$listofIPs = "192.168.66.4", "192.168.66.5"

$ResultList = @() 

foreach ($ip in $listofIPs) 
{ 
	 $result = $null 
	 $currentEAP = $ErrorActionPreference 
	 $ErrorActionPreference = "silentlycontinue" 

	 #Use the DNS Static .Net class for the reverse lookup 

	 # details on this method found here: http://msdn.microsoft.com/en-us/library/ms143997.aspx 

	 $result = [System.Net.Dns]::gethostentry($ip) 
	 $ErrorActionPreference = $currentEAP 
  
	 If ($result) 
	 { 
		  $ResultList += [string]$result.HostName 
	 } 
	 Else 
	 { 
		  $ResultList += "$IP - No HostNameFound" 
	 } 
} 

$ResultList