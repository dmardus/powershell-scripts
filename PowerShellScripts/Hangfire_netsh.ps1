netsh http add urlacl url=http://127.0.0.1:9095/ user=Administrators

netsh http add urlacl url=http://localhost:9095/ user=Administrators

netsh http add urlacl url=http://$env:computername`:9095/ user=Administrators