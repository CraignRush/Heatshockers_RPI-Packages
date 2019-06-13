sudo apt-get update
sudo apt-get upgrade

# Install WiringPi
cd /tmp
wget https://lion.drogon.net/wiringpi-2.50-1.deb
sudo dpkg -i wiringpi-2.50-1.deb

gpio -v
gpio readall

# Alternative:
# git clone git://git.drogon.net/wiringPi
# cd ~/wiringPi
# git pull origin
# cd ~/wiringPi
# ./build


## Build software
cd ~/rpi-spi-adc
chmod a+x build.sh
./build.sh

# Setup SQL Support
# sudo apt-get install libmysqlclient-dev
