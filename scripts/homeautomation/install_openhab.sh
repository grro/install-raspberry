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
    echo 'Installed"' > /etc/default/addons_installed.txt
fi


