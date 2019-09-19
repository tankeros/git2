Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -Properties * | Format-Table Name, OperatingSystem -AutoSize
Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -Properties * | Format-Table Name, OperatingSystem -AutoSize | Measure-Object
Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -Properties Name, OperatingSystem | ConvertTo-Csv | Out-File c:\dccx.csv
Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -Properties OperatingSystem | select -Property Name, OperatingSystem | ConvertTo-Csv | Out-File dccx.csv
Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -SearchBase "DC=dccx-qa,DC=ns2,DC=priv" -Server "dccx-qa.ns2.priv" -Properties OperatingSystem `
| select -Property Name, OperatingSystem |  ConvertTo-Csv | Out-File dccx-qa.csv

Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -SearchBase "DC=dccx,DC=ns2,DC=priv" -Server "dccx.ns2.priv" -Properties * | select -Property Name, OperatingSystem, LastLogonDate |  ConvertTo-Csv | Out-File c:\dccx_windows.csv
Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -SearchBase "DC=dccx-qa,DC=ns2,DC=priv" -Server "dccx-qa.ns2.priv" -Properties OperatingSystem | select -Property Name, OperatingSystem |  ConvertTo-Csv | Out-File dccx-qa_windows.csv
Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -SearchBase "DC=qa,DC=ns2,DC=priv" -Server "qa.ns2.priv" -Properties OperatingSystem | select -Property Name, OperatingSystem |  ConvertTo-Csv | Out-File qa_windows.csv

Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -SearchBase "DC=dccx,DC=ns2,DC=priv" -Server "dccx.ns2.priv" -Properties OperatingSystem | select -Property Name, OperatingSystem, LastLogonDate

Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} -Properties * | Sort LastLogonDate | Format-Table Name, OperatingSystem, LastLogonDate -AutoSize