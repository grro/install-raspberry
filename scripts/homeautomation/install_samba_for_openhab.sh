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
    sudo apt-get install samba samba-common smbclient -y
    sudo smbpasswd -a openhab
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
    sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.org
    sudo cp /etc/backup/temp/etc/samba/smb.conf /etc/samba/smb.conf
    sudo chown -hR openhab:openhab /etc/openhab /opt/openhab/conf
    sudo systemctl restart smbd
fi
