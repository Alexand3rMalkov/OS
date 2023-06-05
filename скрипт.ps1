$regPath = "HKLM:\Software\Microsoft"
$regKey = Get-Acl $regPath
$regKey.Access | Format-Table -AutoSize | Out-File -FilePath C:\script\output.txt
