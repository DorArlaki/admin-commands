# User-Hostname Mapper Script

## Overview
The User-Hostname Mapper script is a PowerShell script designed to help network administrators of  domain map users to their corresponding PC hostnames. This mapping is useful for remote administration tasks, such as connecting to users' PCs using their hostnames.

## Prerequisites
Before using the script, ensure that the following prerequisites are met:
1. PowerShell is installed on the computer where you plan to run the script.
2. You have appropriate administrative access to the target PCs in the Soreq domain.
3. The PCs in the Soreq domain have PowerShell Remoting (WinRM) enabled.

## Usage
1. Clone or download the script to your local machine.

2. Open the script in a text editor or PowerShell Integrated Scripting Environment (ISE).

3. Modify the `$computers` array to include the computer names (hostnames) you want to query. For example:
   ```powershell
   $computers = Get-Content -Path "ComputerNames.txt"

You can replace "ComputerNames.txt" with the path to a text file containing a list of computer names, one per line.

    Run the script in PowerShell.

    The script will connect to each computer, retrieve the last logged-in user, and create a CSV file named "UserHostnames.csv" with two columns: "User" and "Hostname." This file will contain the mapping of users to their respective PC hostnames.

    You can now use the "UserHostnames.csv" file for remote administration tasks, such as connecting to users' PCs using their hostnames.

Notes

    The script automatically handles errors and timeouts when connecting to remote PCs. If a PC is unreachable or encounters an error during retrieval, it will be noted in the PowerShell output, and the script will continue to the next PC.

    Ensure that PowerShell Remoting (WinRM) is enabled on the target PCs in the Soreq domain. You can use Group Policy or other methods to enable WinRM across your network.
