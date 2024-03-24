# Define the number of days to consider an account as inactive
$InactiveDaysThreshold = 30  # Adjust as needed

# Get the current date
$CurrentDate = Get-Date

# Calculate the date threshold for inactive accounts
$ThresholdDate = $CurrentDate.AddDays(-$InactiveDaysThreshold)

# Query Active Directory for user accounts in the "soreq.local" domain
$UserAccounts = Get-ADUser -Filter {Enabled -eq $true} -Properties Name, LastLogonDate | Where-Object {
    $_.LastLogonDate -eq $null -or $_.LastLogonDate -lt $ThresholdDate
}

# Specify the directory path where you want to save the CSV file
$CSVDirectoryPath = "C:\Users\dor\Desktop\Dor\users"

# Specify the name of the CSV file
$CSVFileName = "InactiveUserAccounts.csv"

# Combine the directory path and filename to create the full path
$CSVFilePath = Join-Path -Path $CSVDirectoryPath -ChildPath $CSVFileName

# Initialize an array to store user data
$InactiveUsers = @()

# Loop through user accounts and identify inactive users
foreach ($User in $UserAccounts) {
    $LastLogonDate = $User.LastLogonDate
    $DaysSinceLastLogon = if ($LastLogonDate) { ($CurrentDate - $LastLogonDate).Days } else { "Never logged in" }

    $UserData = [PSCustomObject]@{
        Name = $User.Name
        LastLogonDate = $LastLogonDate
        DaysSinceLastLogon = $DaysSinceLastLogon
    }
    $InactiveUsers += $UserData
}

# Export the list of inactive users to a CSV file with UTF-8 encoding
if ($InactiveUsers.Count -gt 0) {
    $InactiveUsers | Export-Csv -Path $CSVFilePath -NoTypeInformation -Encoding UTF8

    Write-Host "Inactive user accounts (not logged in for $InactiveDaysThreshold days or more) have been saved to $CSVFilePath."
} else {
    Write-Host "No inactive user accounts found in the specified period."
}
