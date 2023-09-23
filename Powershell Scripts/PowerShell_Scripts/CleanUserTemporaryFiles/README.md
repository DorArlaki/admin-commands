# Multi-User Temp Folder Cleanup Script

This PowerShell script is designed to clean the temporary folders (%Temp%) for all user profiles on a Windows computer, ensuring that all temporary files are deleted while skipping files that are currently in use by Windows.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Script Overview](#script-overview)
- [Customization](#customization)
- [Logging](#logging)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- Windows operating system
- PowerShell (the script is compatible with PowerShell 5.1 and later)

## Usage

1. **Download the Script:**
   - Download the `Cleanup-TempFolders.ps1` script from this repository.

2. **Run as Administrator:**
   - Right-click on the script and select "Run as Administrator."

3. **Execution Policy:**
   - Ensure that your PowerShell execution policy allows script execution. You can change the execution policy by running PowerShell as an administrator and using the command:
     ```
     Set-ExecutionPolicy RemoteSigned
     ```

4. **Run the Script:**
   - Run the script. It will automatically clean the temporary folders for all user profiles, skipping files that are currently in use by Windows.

5. **Completion Message:**
   - The script will display a message indicating the completion of the multi-user cleanup.

## Script Overview

The script performs the following actions:

- It identifies all user profiles on the computer (excluding "Default" and "Public" profiles).
- For each user profile, it locates and cleans the respective temporary folder (%Temp%).
- It deletes all files from each user's temporary folder while skipping files in use by Windows.
- Errors encountered during cleanup are logged separately for each user in their respective temporary folder.

## Customization

You can customize the script to suit your needs:

- To add additional cleanup steps that apply to all users, you can modify the script where indicated.
- The script currently targets the `%Temp%` folder for each user profile. If you need to target a different folder, you can modify the `$TempPath` variable within the loop.

## Logging

- The script logs any errors encountered during cleanup in a file named `TempCleanupLog.txt` located within each user's temporary folder. This allows you to review errors specific to each user.

## Contributing

Contributions are welcome! If you have suggestions for improvements or encounter any issues, please open an issue or create a pull request.

## License

This script is provided under the [MIT License](LICENSE).
