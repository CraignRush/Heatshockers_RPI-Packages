# Raspberry-Pi-Package

Collected software for all Raspberry Pis


## 1. Installing the Raspberry Pi 
1. Flash with [Rasbian](https://www.raspberrypi.org/downloads/raspbian/) (use [Rufus](https://rufus.ie/) for example)
2. Create empty file `ssh` on boot drive (`cd /boot/ & echo "" > ssh`)
3. For the Zero W: Create `wpa_supplicant.conf` on boot drive with the content 
```
country=DE 
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev 
update_config=1 
network={
    ssid="HS_Network"
    scan_ssid=1
    psk="1236"
    key_mgmt=WPA-PSK
}
```
4. Insert SD-Card into Pi and start
5. Connect to Pi over SSH (Either use Putty or `ssh`)
6. Enable (bridge) internet conenction from PC to Raspberry Pi: Go to the Windows Network Setting, Find out with Ethernet# the Raspberry Pi is, go the the Setting of the Internet-Network (usially the first one) and enable in the 'Freigabe'-Tab the sharing of this connection to the Raspberry Ethernet#
7. Update packages: `sudo apt-get -y update && sudo apt-get -y upgrade`
8. Install git: `sudo apt-get -y install git-all`
9. Clone this repository:
```
cd ~
git clone https://gitlab.lrz.de/heatshockers/raspberry-pi-package.git
cd raspberry-pi-package
```

### 1.1 Raspberry Pi 3
---

#### 1.1.1 Setup WiFi Access Point
---



### 1.2 Installing the Raspberry Pi Zero W
---


#### 1.2.1 "Display-Pi"
---
For the RPi connected to the display continue with:
1. 


#### 1.2.2 "SPI-Pi"
---
For the RPi connected to the SPI Analog-Digial-Converter continue with:

1. Enable SPI: `sudo raspi-config` , navigate to `Interfaceing options`, enable SPI, reboot (`sudo reboot`) and conenct again (see Step 5)
2. Perform initial setup by running the script `~\raspberry-pi-package\scripts\setup_SPI_Pi.sh`
