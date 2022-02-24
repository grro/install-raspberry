#!/bin/bash




if [ -d "/etc/openhab" ]
then
    echo ""
    echo "++++++++++"
    echo "+ openhab is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ installing iputils"
    sudo apt-get -y install iputils-arping

    echo "++++++++++"
    echo "+ installing openhab"
    sudo wget -qO - 'https://openhab.jfrog.io/artifactory/api/gpg/key/public' | sudo apt-key add -
    echo 'deb https://openhab.jfrog.io/artifactory/openhab-linuxpkg stable main' | sudo tee /etc/apt/sources.list.d/openhab.list
    sudo apt-get update
    sudo apt-get install openhab -y
    sudo adduser openhab dialout
    sudo adduser openhab tty
    sudo usermod -a -G dialout openhab
    setcap 'cap_net_raw,cap_net_admin=+eip cap_net_bind_service=+ep' $(realpath /usr/bin/java)
fi



if [ -f "/etc/udev/rules.d/50-usb-serial.rules" ]
then
    echo "/etc/udev/rules.d/50-usb-serial.rules is already created"
else
    echo "create /etc/udev/rules.d/50-usb-serial.rules"
    echo 'SUBSYSTEM=="tty", ATTRS{idVendor}=="0658", ATTRS{idProduct}=="0200", SYMLINK+="ttyUSB-zwave", GROUP="dialout", MODE="0666"' >> 50-usb-serial.tmp
    echo 'SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", SYMLINK+="ttyUSB-enocean", GROUP="dialout", MODE="0666"' >> 50-usb-serial.tmp
    sudo mv 50-usb-serial.tmp /etc/udev/rules.d/50-usb-serial.rules
fi


if [ -f "/etc/default/openhab.org" ]
then
    echo ""
    echo "++++++++++"
    echo "+ /etc/default/openhab is already extended"
else
    echo ""
    echo "++++++++++"
    echo "+ extending /etc/default/openhab"
    sudo cp /etc/default/openhab /etc/default/openhab.tmp
    echo 'EXTRA_JAVA_OPTS="-Dgnu.io.rxtx.SerialPorts=/dev/ttyUSB-zwave:/dev/ttyUSB-enocean"' >> /etc/default/openhab.tmp
    sudo mv /etc/default/openhab /etc/default/openhab.org
    sudo cp /etc/default/openhab.tmp /etc/default/openhab
    sudo rm /etc/default/openhab.tmp
fi



if [ -f "/etc/default/addons_installed.txt" ]
then
    echo ""
    echo "++++++++++"
    echo "+ openhab-addons already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ install openhab-addons"
    sudo apt-get install openhab-addons -y
    sudo systemctl start openhab.service
    sudo systemctl daemon-reload
    sudo systemctl enable openhab.service
    echo 'this is a marker file"' >> addons_installed.txt
    sudo mv addons_installed.txt /etc/default/addons_installed.txt
fi

