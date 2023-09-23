# Get a list of all user profiles on the computer
$UserProfiles = Get-ChildItem -Path 'C:\Users\' | Where-Object { $_.PSIsContainer -and $_.Name -ne 'Default' -and $_.Name -ne 'Public' }

foreach ($UserProfile in $UserProfiles) {
    # Define the path to the user's Temp folder
    $TempPath = Join-Path -Path $UserProfile.FullName -ChildPath "AppData\Local\Temp"

    # Check if the Temp folder exists for the user
    if (Test-Path -Path $TempPath -PathType Container) {
        try {
            # Get a list of files to be deleted (excluding those currently in use)
            $FilesToDelete = Get-ChildItem -Path $TempPath -File | Where-Object { !$_.IsReadOnly }

            # Set up a log file for errors specific to each user
            $LogFile = Join-Path -Path $TempPath -ChildPath "TempCleanupLog.txt"

            # Loop through files in the user's Temp folder
            foreach ($File in $FilesToDelete) {
                try {
                    # Try to delete the file, skip if in use
                    Remove-Item -Path $File.FullName -Force -ErrorAction Stop
                } catch {
                    # Log any errors specific to each user
                    $ErrorMessage = $_.Exception.Message
                    "Error: $ErrorMessage" | Out-File -Append -FilePath $LogFile
                }
            }

            # Optionally, you can display a message indicating cleanup completion for each user
            # Write-Host "Cleanup completed for $($UserProfile.Name)."

        } catch {
            # Log any unexpected errors specific to each user
            $ErrorMessage = $_.Exception.Message
            "Error: $ErrorMessage" | Out-File -Append -FilePath $LogFile
        }
    } else {
        Write-Host "Temp folder not found for $($UserProfile.Name) at the specified path: $TempPath"
    }
}

# Optionally, you can add cleanup steps here that apply to all users.

Write-Host "Multi-user cleanup completed."
