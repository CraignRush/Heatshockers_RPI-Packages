# Raspberry-Pi-Package

Collected software for all Raspberry Pis

If the Raspberry Pi is not recognized via SSH:
    - Check your LAN-Adapter settings -> If there is a text field instead of dropdown: Disable and reenable it.
    - Connect your peripherals and do 
    ```shell
    sudo rm /etc/ssh/ssh_host_*
    sudo dpkg-reconfigure openssh-server
    ```
    - Otherwise I don't know either

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
```shell
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
1. Setup the SD card as in 1. (Use the 3+ Pi for faster processing)
2. Install Qt 5.7 via `sudo apt-get -y install qt5-default`
3. Install modules and documententation:
`sudo apt-get install qtcreator qt5-image-formats-plugins qtmultimedia5-dev qtx11extras5-doc qtgraphicaleffects5-doc`
4. Install QtCharts and compile them for yourself:
```shell
git clone https://github.com/qt/qt5.git -b 5.7


./configure -prefix $PWD/qtbase -opensource -confirm-license

cd <ModuleFolder>/<version>
qmake -r
sudo make -j4 module-<YourModule>
sudo make install
```
5. Install required Modules (use the code from 4. with this link and directory)


#### 1.2.1 "Display-Pi"
---
For the RPi connected to the display continue with:
1. Install the GUI 
`sudo apt-get install -y raspberrypi-ui-mods rpi-chromium-mods`
2. Restart the Pi (sudo restart)



#### 1.2.2 "SPI-Pi"
---
For the RPi connected to the SPI Analog-Digial-Converter continue with:

1. Enable SPI: `sudo raspi-config` , navigate to `Interfaceing options`, enable SPI, reboot (`sudo reboot`) and conenct again (see Step 5)
2. Perform initial setup by running the script `~\raspberry-pi-package\scripts\setup_SPI_Pi.sh`
