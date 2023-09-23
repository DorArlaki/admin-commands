# Define the output file path
$OutputFilePath = "C:\UserGroupMembers.csv"

# Initialize an array to store user data
$UserDetails = @()

# Get all user accounts in the "soreq.local" domain
$Users = Get-ADUser -Filter * -Properties MemberOf

# Iterate through each user and their group memberships
foreach ($User in $Users) {
    $Username = $User.Name
    $GroupMemberships = Get-ADPrincipalGroupMembership -Identity $User.DistinguishedName |
        Where-Object { $_.ObjectClass -eq 'Group' } |
        ForEach-Object { $_.Name }

    $GroupMembershipsString = $GroupMemberships -join ", "

    $UserData = [PSCustomObject]@{
        Name = $Username
        GroupsMember = $GroupMembershipsString
    }

    $UserDetails += $UserData
}

# Export the list of user details to a CSV file
if ($UserDetails.Count -gt 0) {
    $UserDetails | Export-Csv -Path $OutputFilePath -NoTypeInformation
    Write-Host "User group memberships have been saved to $OutputFilePath."
} else {
    Write-Host "No user accounts found in the specified domain."
}