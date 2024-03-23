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

    net stop wuauserv: Stops Windows Update service.
    net stop cryptSvc: Stops Cryptographic Services.
    net stop bits: Stops Background Intelligent Transfer Service.
    net stop msiserver: Stops Windows Installer service.
    ren C:\Windows\SoftwareDistribution SoftwareDistribution.old: Renames SoftwareDistribution folder.
    ren C:\Windows\System32\catroot2 catroot2.old: Renames catroot2 folder.
    net start wuauserv: Starts Windows Update service.
    net start cryptSvc: Starts Cryptographic Services.
    net start bits: Starts Background Intelligent Transfer Service.
    net start msiserver: Starts Windows Installer service.
