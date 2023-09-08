# List of service names to disable
$ServicesToDisable = @("Spooler")

foreach ($Service in $ServicesToDisable) {
    Set-Service -Name $Service -StartupType Disabled
}
