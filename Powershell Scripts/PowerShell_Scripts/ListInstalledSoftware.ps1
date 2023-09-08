# Get a list of installed software
$InstalledSoftware = Get-WmiObject -Class Win32_Product

# Display a list of software names and versions
foreach ($Software in $InstalledSoftware) {
    Write-Host "Name: $($Software.Name)"
    Write-Host "Version: $($Software.Version)"
    Write-Host "----------------------"
}
