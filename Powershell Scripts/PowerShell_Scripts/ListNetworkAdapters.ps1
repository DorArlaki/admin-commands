# Get a list of network adapters
$NetworkAdapters = Get-NetAdapter

# Display adapter names and details
foreach ($Adapter in $NetworkAdapters) {
    Write-Host "Name: $($Adapter.Name)"
    Write-Host "Status: $($Adapter.Status)"
    Write-Host "MAC Address: $($Adapter.MacAddress)"
    Write-Host "----------------------"
}
