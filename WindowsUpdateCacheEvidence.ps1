﻿#Displays cached Windows updates
Invoke-Command -ComputerName c02pcjh03,c02pcjh02,c02pcjh04,c02pcau01,c02pcau02 -ScriptBlock { Get-ChildItem C:\Windows\SoftwareDistribution\Download } -Credential admin_i871233