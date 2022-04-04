#!/bin/bash


if [ -f "/tmp/__installation_unifi_marker.tmp" ]
then
    echo ""
    echo "++++++++++"
    echo "+ unifi controller is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ install unifi controller "
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
    echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | sudo tee -a /etc/apt/sources.list.d/ubnt.list > /dev/null
    sudo apt-get update
    sudo apt-get install unifi -y
fi
