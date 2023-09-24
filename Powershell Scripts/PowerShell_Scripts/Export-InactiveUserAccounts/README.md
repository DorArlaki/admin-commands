# PowerShell Active Directory Inactive User Report

## Overview

This PowerShell script is designed to generate a report of inactive user accounts in an Active Directory domain. It identifies users who have not logged in for a specified number of days (default is 1 day) and exports the results to a CSV file for further analysis.

## Prerequisites

Before running this script, make sure you have the following prerequisites in place:

- PowerShell is installed on your computer.
- You have the necessary permissions to query Active Directory for user account information.

## Usage

1. **Open PowerShell with administrative privileges.**

2. **Copy and paste the script provided in the script file (e.g., `inactive_user_report.ps1`) into your PowerShell window.**

3. **Customize the script if needed:**

   - You can change the `$InactiveDaysThreshold` variable to set the number of days to consider an account as inactive.
   - Modify the `$CSVDirectoryPath` and `$CSVFileName` variables to specify where you want to save the CSV file.

4. **Execute the script by pressing Enter.**

5. **Review the Results:**

   - The script will query Active Directory and generate a CSV report named "InactiveUserAccounts.csv" with the following columns:
     - Name: User's name
     - LastLogonDate: The date and time of the last logon
     - DaysSinceLastLogon: The number of days since the last logon

6. **Troubleshooting:**

   - If there are inactive user accounts found, the script will display a message indicating where the CSV file has been saved. Otherwise, it will inform you that no inactive user accounts were found.

### Troubleshooting

If you encounter issues or need to troubleshoot, consider the following steps:

- Ensure that you are running PowerShell as an administrator.

- Check your permissions to query Active Directory. Make sure you have the necessary rights to access user account information.

- Verify the accuracy of the domain name in the script (soreq.local). Modify it to match your specific domain if needed.

- Review the `$InactiveDaysThreshold` variable and adjust it according to your organization's requirements.

- Check the directory path and filename where the CSV file is saved (variables `$CSVDirectoryPath` and `$CSVFileName`).

- If the LastLogonDate attribute appears outdated, follow the steps mentioned in the script comments to refresh it, such as logging out and back in or forcing a network update using `gpupdate /force`.

Please note that LastLogonDate updates may not be instant and can depend on various factors, including Active Directory replication schedules.

Feel free to modify and enhance this script to meet your specific needs and requirements.

**Disclaimer:** Use this script responsibly and in accordance with your organization's policies and guidelines.


---

[Back to Top](#powershell-active-directory-inactive-user-report)
