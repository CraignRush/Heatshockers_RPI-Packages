## Check bridge
brctl show

## Start hostap
echo "Close with CRTL + C to continue...."
sudo hostapd /etc/hostapd/hostapd.conf
# For dedug mode:
#sudo hostapd -dd /etc/hostapd/hostapd.conf

## CLOSE WITH CRTL+C

sudo echo "RUN_DAEMON=yes
DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"
" >> /etc/default/hostapd


## Reboot
sudo reboot