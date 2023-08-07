# Import the required modules
Import-Module International
Import-Module NetAdapter
Import-Module DnsClient

# Set the time zone
Set-TimeZone -Id "E. Africa Standard Time"

# Set the static IP address, subnet mask and DNS server
New-NetIPAddress -InterfaceAlias "Ethernet1" -IPAddress 192.168.50.50 -PrefixLength 24 -DefaultGateway 192.168.50.1
Set-DnsClientServerAddress -InterfaceAlias "Ethernet1" -ServerAddresses 192.168.50.1

# Set the computer name and description
Rename-Computer -NewName "DC"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "srvcomment" -Value "DC"


# Uninstall windows defender feature
Uninstall-WindowsFeature -Name Windows-Defender

# Wait for 1 minute
Start-Sleep -Seconds 60

# Automatically reboot server
Restart-Computer -Force