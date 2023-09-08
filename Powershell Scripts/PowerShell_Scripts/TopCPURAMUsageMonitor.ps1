# Get the top N processes consuming CPU and RAM
$TopN = 10  # You can change this number to get more or fewer processes

# Get top CPU-consuming processes
$TopCPU = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First $TopN

# Get top RAM-consuming processes
$TopRAM = Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First $TopN

# Display top CPU-consuming processes
Write-Host "Top $TopN CPU-Consuming Processes:"
