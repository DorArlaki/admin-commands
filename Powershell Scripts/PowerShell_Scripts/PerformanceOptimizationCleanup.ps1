# Disable Windows Search service
Set-Service -Name "wsearch" -StartupType Disabled

# Disable Superfetch service
Set-Service -Name "sysmain" -StartupType Disabled

# Clear Windows Temp folder
Remove-Item -Path "$env:TEMP\*" -Force -Recurse

# Clear Internet Explorer cache
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

# Specify the correct registry path for user-specific startup programs
$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

# Get a list of startup items
$StartupItems = Get-ItemProperty -Path $RegistryPath

# Define a list of startup items to keep (Windows Defender and OneDrive)
$ItemsToKeep = @("WindowsDefender", "OneDrive")

# Remove unnecessary startup items
foreach ($Item in $StartupItems.PSObject.Properties) {
    $Name = $Item.Name
    if ($ItemsToKeep -notcontains $Name) {
        Remove-ItemProperty -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue
    }
}

# Optimize Windows for best performance
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name UserPreferencesMask -Value 90

# Restart the computer to apply changes (optional)
# Restart-Computer -Force
