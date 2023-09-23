# User and Hostname Mapping Script

This script is designed for network administrators who want to map user names to their corresponding PC hostnames. It's particularly useful for managing remote connections, such as VNC sessions, where you need to connect to specific users' computers.

## Prerequisites

Before running the script, make sure you have the following prerequisites in place:

1. PowerShell: Ensure that PowerShell is installed on the computer where you plan to run this script.

2. Administrator Privileges: You need administrative privileges on the target computers to enable PowerShell Remoting and retrieve user information.

## Usage

1. Define an array of computer names (hostnames) that you want to query. Edit the `$computers` array in the script to include the hostnames of the computers you want to target.

```powershell
$computers = @("PC-000", "PC-001", ...)  # Add all the computer names you want to query
```
    Run the script. It will perform the following actions:
        - Enable PowerShell Remoting on the remote computers (if not already enabled).
        - Retrieve the last logged-in user on each remote computer.
        - Create an array containing user and hostname information.
        - Save this information to a CSV file named "UserHostnames.csv" in the same directory as the script.

    After running the script, you'll have a CSV file ("UserHostnames.csv") that contains two columns: "User" and "Hostname." The "User" column lists the last logged-in user for each PC, and the "Hostname" column lists the corresponding computer name.

Example

Suppose you have a network with computers named "PC-000," "PC-001," and so on. After running the script with these computer names, you'll get a CSV file with entries like this:

python

User,Hostname
User1,PC-000
User2,PC-001
...

Now, you can easily reference this CSV file to connect to specific users' PCs by their hostnames, making remote administration tasks more efficient.
Troubleshooting

    If you encounter connection issues or have trouble retrieving information, please ensure that PowerShell Remoting is enabled on the target computers and that you have the necessary administrative privileges.

    In case of errors, the script will provide error messages to help identify and resolve issues.

