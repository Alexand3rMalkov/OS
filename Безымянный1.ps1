Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$Form = New-Object System.Windows.Forms.Form
$Form.Text = 'Список разрешений подраздела реестра'
$Form.Size = New-Object System.Drawing.Size(1350, 320)
$Form.StartPosition = 'CenterScreen'

$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Multiline = $true
$TextBox.Size = New-Object System.Drawing.Size(1290, 200)
$TextBox.Location = New-Object System.Drawing.Point(20, 20)
$TextBox.ScrollBars = "Vertical"
$TextBox.Font = "Lucida console, 9 pt"
$Form.Controls.Add($TextBox)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(100, 230)
$Button.Size = New-Object System.Drawing.Size(500, 50)
$Button.Text = "Получить список"
$Button.Add_Click({
$regPath = "HKLM:\Software\Microsoft"
$regKey = Get-Acl $regPath
$regKey.Access | Format-Table | Out-String | Set-Content -Path C:\script\output.txt
$TextBox.Text = $regKey.Access | Format-Table | Out-String
})
$Form.Controls.Add($Button)

$Form.ShowDialog()