# Disable Sound Enhancements

# Requires key permissions
# Launch SetACL.bat
Start-Process -FilePath "$PSScriptRoot\SetACL.bat" -Wait

$Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render'
Get-ChildItem $Key -Recurse | Where-Object {(Get-ItemProperty -Path $_.PSPath -Name '{1da5d803-d492-4edd-8c23-e0c0ffee7f0e},5' -ErrorAction SilentlyContinue)} | ForEach-Object {Set-ItemProperty -Path $_.PSPath -Name '{1da5d803-d492-4edd-8c23-e0c0ffee7f0e},5' -Value '1'}

cmd /k 'pause'