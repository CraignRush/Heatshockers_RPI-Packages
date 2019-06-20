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
git clone https://github.com/qt/qtcharts.git -b 5.7
cd qtcharts
qmake -r
sudo make -j4
sudo make install
```

```shell
git clone https://github.com/qt/qt5.git -b 5.7
./configure -prefix $PWD/qtbase -opensource -confirm-license
cd <ModuleFolder>/<version>
qmake -r
sudo make -j4 module-<YourModule>
sudo make install
```
5. Install required Modules (use the code from 4. with this link and directory)

TODO: QtCreator Resolution
Kits? 
compiler and qt?



#### 1.2.1 "Display-Pi"
---
For the RPi connected to the display continue with:
1. Install the GUI 
`sudo apt-get install -y raspberrypi-ui-mods rpi-chromium-mods`
#2. Install another Display Manager (LightDM doesn't supply you with a virtual keyboard)
https://askubuntu.com/questions/829108/what-is-gdm3-kdm-lightdm-how-to-install-and-remove-them
3. Install Display Drivers
 ```shell
git clone https://github.com/pimoroni/hyperpixel4
cd hyperpixel4
sudo ./install.sh
```
180 Degree Rotation
Note: You must build the latest dtoverlay file to enable rotation support:
Go into src
run make to build a new hyperpixel4.dtbo with rotation support
copy the overlay with sudo cp hyperpixel4.dtbo /boot/overlays/

To rotate your HyperPixel4 you must edit /boot/config.txt and change the following lines:

  ```
    Change dtoverlay=hyperpixel4 to dtoverlay=hyperpixel4:rotate
    Change display_rotate=3 to display_rotate=1
    ```
This will rotate both the display and the touchscreen input to match.

If you're using a non-touchscreen HyperPixel4 you need only change display_rotate.
2. Restart the Pi (sudo restart)
x. Clone Guiproject from `https://gitlab.lrz.de/philipdachs/heatshockersgui.git`



#### 1.2.2 "SPI-Pi"
---
For the RPi connected to the SPI Analog-Digial-Converter continue with:

1. Enable SPI: `sudo raspi-config` , navigate to `Interfaceing options`, enable SPI, reboot (`sudo reboot`) and conenct again (see Step 5)
2. Perform initial setup by running the script `~\raspberry-pi-package\scripts\setup_SPI_Pi.sh`
