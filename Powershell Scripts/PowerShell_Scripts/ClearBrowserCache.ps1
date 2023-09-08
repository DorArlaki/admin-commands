# Clear browser cache for all user profiles (replace 'Chrome' with 'Firefox' or 'Edge' as needed)
$Browsers = @("Chrome", "Firefox", "Edge")

foreach ($Browser in $Browsers) {
    $CachePath = "C:\Users\$env:USERNAME\AppData\Local\$Browser\User Data\Default\Cache"
    
    if (Test-Path -Path $CachePath -PathType Container) {
        Remove-Item -Path $CachePath\* -Force -Recurse
    }
}
