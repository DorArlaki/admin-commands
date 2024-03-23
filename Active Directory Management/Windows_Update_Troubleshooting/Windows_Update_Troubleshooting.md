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
