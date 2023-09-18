$Items=(Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match "ESET" } | Select-Object -Property DisplayName,UninstallString)
ForEach ($item in $Items){
$id=$item.UninstallString.Replace("MsiExec.exe /I","")
$name=$item.DisplayName
if($name -like "*Agent*"){
Start-Process "C:\Windows\System32\msiexec.exe" -ArgumentList "/x $id /qn /norestart PASSWORD=`"Aa123456`"" -Wait
}else{
Start-Process "C:\Windows\System32\msiexec.exe" -ArgumentList "/x $id /qn /norestart PASSWORD=`"Aa123456`"" -Wait
}

}
