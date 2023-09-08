# Get and display system information
$ComputerInfo = Get-ComputerInfo

Write-Host "Computer Name: $($ComputerInfo.ComputerName)"
Write-Host "Operating System: $($ComputerInfo.OSName)"
Write-Host "Architecture: $($ComputerInfo.OSArchitecture)"
