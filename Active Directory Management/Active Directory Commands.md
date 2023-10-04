# System Information and Hardware Details

**Description:**
Retrieve essential system information and hardware details with a single command. Discover your computer's hostname, operating system name, total physical memory, system boot time, system uptime, logical disk information (including free space), and CPU specifications. Gain valuable insights into your system's configuration and performance effortlessly.

### Command:
```shell
systeminfo | findstr /C:"Host Name" /C:"OS Name" /C:"Total Physical Memory" /C:"System Boot Time" /C:"System Up Time" & wmic logicaldisk get caption,description,freespace,size & wmic cpu get name, maxclockspeed & ipconfig /all | findstr /C:"DNS Servers" /C:"NetBIOS over Tcpip" /C:"IPv4 Address" /C:"Subnet Mask" /C:"DHCP Enabled" /C:"Autoconfiguration Enabled" /C:"Connection-specific DNS Suffix" & whoami
```
### Check for Windows Updates
```shell
wuauclt /detectnow
```
### Check Disk Utility
```shell
chkdsk C: /f
```
- [README_chkds_C.md](Management_README/README_chkds_C.md)
### System File Checker
```
sfc /scannow
```
- [README_sfc_scannow.md](Management_README/README_sfc_scannow.md)
## Windows System File Repair Tool
```
DISM /Online /Cleanup-Image /RestoreHealth
```
- [Windows_DISM_RestoreHealth_Guide.md](Management_README/Windows_System_File_Repair_Tool.md)
### Restart or Shutdown the Computer
```shell
shutdown /r /t 0
```
### Command Prompt as Administrator
```shell
runas /user:Administrator cmd
```
### Control Panel
```shell
control
```
### Task Manager
```shell
taskmgr
```
### System Properties
```shell
sysdm.cpl
```
### Network Connections
```shell
ncpa.cpl
```
### Display Properties
```shell
desk.cpl
```
### Sound Properties
```shell
mmsys.cpl
```
### Mouse Properties
```shell
main.cpl
```
### Printers and Devices
```shell
control printers
```
### Windows Firewall Settings
```shell
firewall.cpl
```
### Power Options
```shell
powercfg.cpl
```
### System Config
```shell
msconfig.exe
```
### File Explorer (Open Current Directory)
```shell
start .
```
### Notepad (Open a Text File)
```shell
notepad filename.txt
```
### Add User to Administrator Group
```shell
net localgroup administrators username /add
```
### Find Files or Directories Containing a Specific Term
```shell
dir C:\ /s /b | findstr /i "search_term"
```
### Find Path of Specific Process by Name
```shell
wmic process where "name='process_name'" get executablepath
```

### List groups of user "UserName"
```powershell
Get-ADPrincipalGroupMembership -Identity "UserName" | Select-Object Name
```
### Start Delta Sync cycle
```powershell
Start-ADSyncSyncCycle -PolicyType Delta
```
