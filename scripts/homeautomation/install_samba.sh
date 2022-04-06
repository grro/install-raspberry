#!/bin/bash


if [ -d "/etc/samba" ]
then
    echo ""
    echo "++++++++++"
    echo "+ samba is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ installing samba"
    sudo apt update && sudo apt upgrade -y
    sudo apt-get install samba samba-common smbclient -y
fi


if [ -f "/etc/samba/smb.conf.org" ]
then
    echo ""
    echo "++++++++++"
    echo "+ samba config already updated"
else
    echo ""
    echo "++++++++++"
    echo "+ updating samba config"
    sudo curl -o smb.tmp https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/smb.conf
    sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.org
    sudo mv smb.tmp /etc/samba/smb.conf

    sudo chown -R pi:pi /etc/scripts
    sudo chmod -R 700 /etc/scripts
    sudo systemctl restart smbd
    sudo smbpasswd -a pi
fi
