# Get-UserGroupMembers.ps1

## Overview

The "Get-UserGroupMembers.ps1" PowerShell script is designed to retrieve and store information about user group memberships in a specified domain. It queries Active Directory to gather data on user accounts and the groups they belong to, and then exports this information to a CSV file. This script is useful for administrators who need to manage and analyze user group memberships within their organization.

## Usage

### Pre-Requisites

Before using this script, ensure the following:

1. **PowerShell Environment**: Make sure your PowerShell environment is set up and running.

2. **Active Directory**: The script queries user accounts from the specified domain using Active Directory. Ensure that you have the necessary permissions to query user data.

### Running the Script

1. **Define the Output File Path**: Modify the `$OutputFilePath` variable in the script to specify the location and filename for the CSV output file. For example:

   ```powershell
   $OutputFilePath = "C:\UserGroupMembers.csv"


## Usage

**Running the Script:** 

Execute the script using PowerShell. It will query user group memberships in the specified domain and generate the CSV file.

**Reviewing the Output:** 

Once the script completes, you can find the CSV file at the location specified in `$OutputFilePath`. This file contains user names and their corresponding group memberships.

**CSV Format:** 

The CSV file will have two columns: "Name" (user name) and "GroupsMember" (a comma-separated list of group names to which each user belongs).

## Important Notes

- **Permissions**: Ensure that you have the necessary permissions to query user data from Active Directory.

- **Customization**: Review and customize the `$OutputFilePath` variable to specify where you want to save the CSV output file.

- **Environment**: The script retrieves user group memberships in the specified domain and exports the data to a CSV file. Make sure you run it in an environment with the required permissions.

## License

This script is provided as-is, without any warranty. You are free to modify and distribute it according to your needs.

## Contributing

We welcome contributions! If you have any suggestions or improvements for the script, feel free to open an issue or submit a pull request.

## Contact

If you have any questions or need assistance, don't hesitate to reach out.

Happy Scripting! 😄
