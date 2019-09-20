#creating a new dns record with PTR (Reverse Lookup Zone mst be enable)
dnscmd dc1 /recordadd jcloud.com ws3 /createptr A 192.168.1.145

#creating a new dns record without PTR
dnscmd dc1 /recordadd jcloud.com ws5 A 192.168.1.147

#Create DNS A Record with PTR -Name <hostname> -ComputerName <DNS Server> 
Add-DnsServerResourceRecordA -IPv4Address "10.65.1.34" -Name "c20sapx02" -ComputerName "WIN-6ATN1VD6GLB" -ZoneName "hcm.cre.ns2.priv" -CreatePtr

#Create DNS A Record with PTR -Name <hostname> -ComputerName <DNS Server> -TimeToLive <01:00:00> 3600 seconds 
Add-DnsServerResourceRecordA -IPv4Address "10.65.1.34" -Name "c20sapx02" -ComputerName "WIN-6ATN1VD6GLB" -ZoneName "hcm.cre.ns2.priv" -TimeToLive 01:00:00 -CreatePtr

#Create DNS CNAME Record -Name <alias> -ComputerName(optioanl and required for managed AD) <DNS Server> 
Add-DnsServerResourceRecordCName -Name "proxy-stg" -HostNameAlias "proxy-stg-a259c22e1cd2dc55.elb.us-gov-west-1.amazonaws.com" -ComputerName "WIN-6ATN1VD6GLB" -ZoneName "hcm.cre.ns2.priv"
