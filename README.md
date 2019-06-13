# Raspberry-Pi-Package

Collected software for all Raspberry Pis


## Installing the Raspberry Pi 3
1. Flash with Rasbian Lite (use Rufus for example)
2. Create empty file `ssh` on boot drive (`cd /boot/ & echo "" > ssh`)


## Installing the Raspberry Pi Zero W
1. Flash with Rasbian Lite (use Rufus for example)
2. Create empty file `ssh` on boot drive (`cd /boot/ & echo "" > ssh`)
3. Create `wpa_supplicant.conf` on boot drive with the content 
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
6. Update packages: `sudo spt-get update & sudo apt-get upgrade`
7. Install git: `sudo apt-get install git-all`
8. Clone this repository:
```
cd ~
git clone https://gitlab.lrz.de/heatshockers/raspberry-pi-package.git
cd raspberry-pi-package
```
9. Continue with either "Display-Pi" or "SPI-Pi"

#### > "Display-Pi"
---
For the RPi connected to the display continue with:
10. 


#### > "SPI-Pi"
---
For the RPi connected to the SPI Analog-Digial-Converter continue with:

10. Enable SPI: `sudo raspi-config` , navigate to `Interfaceing options`, enable SPI, reboot (`sudo reboot`) and conenct again (see Step 5)
11. Perform initial setup by running the script `~\raspberry-pi-package\scripts\setup_SPI_Pi.sh`
