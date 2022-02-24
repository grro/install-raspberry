#!/bin/bash


if [ -d "/etc/samba" ]
then
    echo "samba is already installed"
else
    echo "installing samba"
    sudo apt-get install samba samba-common smbclient -y
    sudo smbpasswd -a openhab
fi


if [ -f "/etc/samba/smb.conf.org" ]
then
    echo "samba config already updated"
else
    echo "updating samba config"
    sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.org
    sudo cp /etc/backup/temp/etc/samba/smb.conf /etc/samba/smb.conf
    sudo chown -hR openhab:openhab /etc/openhab /opt/openhab/conf
    sudo systemctl restart smbd
fi
