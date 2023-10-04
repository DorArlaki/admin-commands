## Delta Sync for Azure Active Directory

Delta Sync is a feature used to synchronize changes made in your on-premises Active Directory to Azure AD between the regular scheduled synchronization intervals. This command-line utility is handy when you need to ensure that recent changes, such as user account updates or group membership changes, are quickly and manually replicated to Azure AD without waiting for the next scheduled synchronization cycle.

### Usage

To initiate a Delta Sync, you can use the following PowerShell command:

```powershell
Start-ADSyncSyncCycle -PolicyType Delta
