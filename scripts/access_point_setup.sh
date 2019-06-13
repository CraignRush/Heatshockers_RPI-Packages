## Update System
sudo apt-get update
sudo apt-get upgrade

## hostapd (Authentication), bridge-utils (WLAN Bridge
sudo apt-get install hostapd bridge-utils

## Setup wlan ap host
sudo echo "# Bridge-Betrieb
bridge=br0

# Schnittstelle und Treiber
interface=wlan0
#driver=nl80211

# WLAN-Konfiguration
ssid=HS_Network
channel=1
hw_mode=g
ieee80211n=1
ieee80211d=1
country_code=DE
wmm_enabled=1

# WLAN-Verschlüsselung
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=1236" > /etc/hostapd/hostapd.conf


## Setup Bridge  (@ToDo: Satatic IP")
sudo echo "# Localhost
auto lo
iface lo inet loopback

# Ethernet
auto eth0
allow-hotplug eth0
iface eth0 inet dhcp

# WLAN
auto wlan0
allow-hotplug wlan0
iface wlan0 inet manual
wireless-power off

# Netzwerkbrücke
auto br0
iface br0 inet dhcp
bridge_ports eth0 wlan0 # build bridge
bridge_fd 0             # no forwarding delay
bridge_stp off          # disable Spanning Tree Protocol" > /etc/network/interfaces



### DO A REBOOT
sudo reboot



