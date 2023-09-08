# Enable Windows Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Disable Windows Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
