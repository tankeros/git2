#Move all certificates from Personal to Remote Desktop 
Get-ChildItem cert:\LocalMachine\My | Select -Property * 
Get-ChildItem 'Cert:\LocalMachine\Remote Desktop' | Select -Property *
Move-Item cert:\LocalMachine\My\D6C792417C81B993A74B95FCEFD8C448DFDBF5FC -Destination 'cert:\LocalMachine\Remote Desktop\D6C792417C81B993A74B95FCEFD8C448DFDBF5FC' 
Move-Item cert:\LocalMachine\My\B3CA24C374584CCE02B2A66781E7065E38F1BA78 -Destination 'cert:\LocalMachine\Remote Desktop\B3CA24C374584CCE02B2A66781E7065E38F1BA78' 
Move-Item cert:\LocalMachine\My\852E87E29ECB9E20141A8EEDCA24B828D39EF041 -Destination 'cert:\LocalMachine\Remote Desktop\852E87E29ECB9E20141A8EEDCA24B828D39EF041' 
Move-Item cert:\LocalMachine\My\5D8F1EF91CABE9447285CA17B9005E79A7F7BAB7 -Destination 'cert:\LocalMachine\Remote Desktop\5D8F1EF91CABE9447285CA17B9005E79A7F7BAB7'

# Option 2, create new self-signed certificate using SHA1 RSA
# Remote powershell to server 
$b = Get-acl 'HKLM:\SOFTWARE\Microsoft\SystemCertificates\Remote Desktop\Certificates' 
$c = New-Object System.Security.AccessControl.RegistryAccessRule ("NT AUTHORITY\System","CreateSubkey","Deny") 
$b.RemoveAccessRule($c) 
$b | Set-Acl -Path 'HKLM:\SOFTWARE\Microsoft\SystemCertificates\Remote Desktop\Certificates'
Restart-Computer -Force