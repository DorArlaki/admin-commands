# Get-UserGroupMembers.ps1

## Overview

The "Get-UserGroupMembers.ps1" PowerShell script is designed to `retrieve and store information about user group memberships in a specified domain`. It queries Active Directory to gather data on user accounts and the groups they belong to, and then `exports this information to a CSV file`. This script is useful for administrators who need to manage and analyze user group memberships within their organization.

## Usage

### Pre-Requisites

Before using this script, ensure the following:

1. **PowerShell Environment**: Make sure your PowerShell environment is set up and running.

2. **Active Directory**: The script queries user accounts from the specified domain using Active Directory. Ensure that you have the necessary permissions to query user data.

### Running the Script

Step 1. **Define the Output File Path**: Open the script file, `Get-UserGroupMembers.ps1`, in a text editor of your choice. Modify the `$OutputFilePath` variable to specify the location and filename for the CSV output file. For example:

   ```powershell
   $OutputFilePath = "C:\UserGroupMembers.csv"
   ```

Step2. Execute the Script: Run the script using PowerShell by entering:
```
. .\Get-UserGroupMembers.ps1   # in the PowerShell console. It will query user group memberships in the specified domain and generate the CSV file.
```
>[!warning]
>Once the script completes its execution, you can find the CSV file at the location specified in the $OutputFilePath variable.
>This CSV file contains user names and their corresponding group memberships.CSV Format



The CSV file generated by the script adheres to the following format:

      Name: This column contains the user's name.
      GroupsMember: This column contains a comma-separated list of group names to which each user belongs.

>[!Note]
>Please consider the following important notes before using the script:
> - Permissions: Ensure that you have the necessary permissions to query user data from Active Directory. You must have the required access rights to retrieve user group membership information.
> - Customization: You have the flexibility to customize the $OutputFilePath variable within the script to specify where you want to save the CSV output file. Modify this variable according to your preferred destination.
> - Environment: To successfully run the script, ensure that you execute it in an environment with the required permissions and access to the target Active Directory domain.


License

This script is provided as-is, without any warranty. You are free to modify and distribute it according to your needs.
Contributing

We welcome contributions! If you have any suggestions or improvements for the script, feel free to open an issue or submit a pull request.
Contact

If you have any questions, encounter issues, or need assistance with the script, don't hesitate to reach out.

Happy Scripting! 😄