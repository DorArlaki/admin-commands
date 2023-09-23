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

# Function to run the script on a list of computers
function Run-ScriptOnComputers {
    param (
        [string[]]$ComputerNames
    )

    $usersAndHostnames = @()

    foreach ($computer in $ComputerNames) {
        $lastLoggedUser = Get-LastLoggedUser -ComputerName $computer

        if ($lastLoggedUser) {
            $usersAndHostnames += [PSCustomObject]@{
                User = $lastLoggedUser
                Hostname = $computer
            }
        }
    }

    $usersAndHostnames | Export-Csv -Path "UserHostnames.csv" -NoTypeInformation
    Write-Host "User and hostname information has been saved to UserHostnames.csv."
}

# Query computer names from Active Directory
$computerNames = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name

# Run the script on the retrieved computer names
Run-ScriptOnComputers -ComputerNames $computerNames
