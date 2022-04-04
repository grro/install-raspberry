#!/bin/bash


if [ -f "/tmp/__installation_unifimarker.tmp" ]
then
    echo ""
    echo "++++++++++"
    echo "+ unifi controller is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ install unifi controller "
    echo 'deb http://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
    echo 'deb http://archive.raspbian.org/raspbian stretch main contrib non-free rpi' | sudo tee /etc/apt/sources.list.d/raspbian_stretch_for_mongodb.list
    sudo wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ubnt.com/unifi/unifi-repo.gpg
    sudo apt-get install openjdk-8-jre-headless -y
    sudo apt-get update; sudo apt-get install unifi -y
    sudo systemctl stop mongodb
    sudo systemctl disable mongodb
fi
