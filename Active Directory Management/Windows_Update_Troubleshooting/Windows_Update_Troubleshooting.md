1. Stop the Windows Update service:
```bash
net stop wuauserv
```
This command will halt the Windows Update service, allowing you to perform troubleshooting steps without interference from ongoing updates.

2. Run Windows Update Troubleshooter:
```bash
msdt.exe /id WindowsUpdateDiagnostic
```
Executing this command will launch the Windows Update Troubleshooter, which can identify and fix common issues with Windows updates.

3. Delete the SoftwareDistribution folder:
```bash
rd /s /q %SystemRoot%\SoftwareDistribution
```
This command will remove the SoftwareDistribution folder, which sometimes gets corrupted and causes update failures. Deleting it allows Windows to recreate the folder and download fresh update files.

4. Start the Windows Update service:
```bash
net start wuauserv
```
Finally, this command restarts the Windows Update service, enabling it to resume its normal operations after troubleshooting.

After following these steps, try running Windows Update again to see if the issue persists. If it does, you may need to investigate further or seek additional assistance to diagnose and resolve the underlying problem.


# More - *** Run one by one ***
### Reset Windows Update Components
If Windows Update components are corrupted, resetting them can often resolve issues. Open Command Prompt as an administrator and run the following commands one by one:
```bash
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
```
