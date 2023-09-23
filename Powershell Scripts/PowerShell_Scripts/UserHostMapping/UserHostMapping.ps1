# Define an array to store computer names (hostnames)
$computers = @("PC-000", "PC-001")  # Add all the computer names you want to query

# Create an empty array to store user and hostname information
$usersAndHostnames = @()

# Function to get the last logged-in user on a remote computer
function Get-LastLoggedUser {
    param (
        [string]$ComputerName
    )
    
    try {
        $scriptBlock = {
            $lastLoggedUser = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName
            $lastLoggedUser
        }

        $result = Invoke-Command -ComputerName $ComputerName -ScriptBlock $scriptBlock -ErrorAction Stop
        $result
    } catch {
        Write-Host "Computer: $ComputerName | Unable to retrieve information. Error: $_"
        $null
    }
}

# Loop through each computer
foreach ($computer in $computers) {
    # Get the last logged-in user on the remote computer
    $lastLoggedUser = Get-LastLoggedUser -ComputerName $computer

    if ($lastLoggedUser) {
        # Add user and hostname information to the array
        $usersAndHostnames += [PSCustomObject]@{
            User = $lastLoggedUser
            Hostname = $computer
        }
    }
}

# Save the user and hostname information to a CSV file
$usersAndHostnames | Export-Csv -Path "UserHostnames.csv" -NoTypeInformation

Write-Host "User and hostname information has been saved to UserHostnames.csv."
