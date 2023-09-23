# Active Directory Inactive User Finder

## Overview

This PowerShell script identifies inactive user accounts in an Active Directory domain based on a specified threshold of inactivity days. It generates a CSV report containing the names and logon statuses of inactive users.

## Prerequisites

Before using this script, ensure you have the following prerequisites in place:

- **Windows Environment:** This script is designed to run in a Windows environment.
- **PowerShell:** Ensure you have PowerShell installed on your system.
- **Active Directory Module:** You need the Active Directory PowerShell module to query Active Directory user accounts. Install it using the following command:

  ```powershell
  Install-WindowsFeature RSAT-AD-PowerShell
```
# Usage

## Getting Started

1. **Clone or Download the Script:** Clone this repository or download the script file to your local machine.

2. **Open PowerShell:** Open a PowerShell console with administrative privileges.

3. **Navigate to the Script Directory:** Use `cd` to navigate to the directory where you saved the script.

4. **Modify Script Parameters (Optional):** Open the script file in a text editor and modify the following parameters as needed:
   - `$InactiveDaysThreshold`: Set the number of days to consider an account as inactive.
   - `$CSVDirectoryPath`: Specify the directory path where you want to save the CSV report.
   - `$CSVFileName`: Specify the name of the CSV report file.

5. **Run the Script:** Execute the script by running the following command:
   ```powershell
   .\InactiveUserFinder.ps1
```

# Processing and CSV Report

Upon running the script, it will initiate processing and generate a CSV report in the specified directory.

# Viewing the CSV Report

After the script completes its processing, you can access and view the CSV report. This report provides valuable insights into the list of inactive user accounts.

# Script Details

- **`$InactiveDaysThreshold`:** This parameter is used to set the number of days required to consider an account as inactive.

- **`$CSVDirectoryPath`:** You can specify the directory path where the resulting CSV report will be saved.

- **`$CSVFileName`:** Customize the name of the CSV report file according to your preferences.

- **Script Output:** The script generates a CSV report that includes the names and logon statuses of inactive users.

# Customization

Feel free to customize the script by modifying the parameters mentioned above. Moreover, you have the flexibility to further tailor the script to your specific requirements, such as including additional data or altering the output format.

# Handling Users Who Never Logged In

By default, the script is designed to identify and indicate "Never logged in" for users who have no logon date available. This feature is particularly useful for identifying users who have never logged in to the domain.

