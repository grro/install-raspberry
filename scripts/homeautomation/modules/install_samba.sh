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
fi

