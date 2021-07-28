#!/bin/bash

sudo echo dtoverlay=dwc2 >> /boot/config.txt
sudo echo  modules-load=dwc2,g_ether >> /boot/cmdline.txt
echo -e "allow-hotplug usb0 \niface usb0 inet static \naddress=192.168.7.2 \nnetmask 255.255.255.0 \nnetwork 192.168.7.0 \nbroadcast 192.168.7.255 \ngateway 192.168.7.1" | sudo tee -a etc/network/interfaces
sudo ifdown usb0
sudo ifup usb0
ifconfig usb0
sudo raspi-config nonint do_serial 1
sudo systemctl enable getty@ttyGS0.service
sudo reboot
