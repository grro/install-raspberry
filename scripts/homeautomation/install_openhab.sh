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
    sudo setcap 'cap_net_raw,cap_net_admin=+eip cap_net_bind_service=+ep' $(realpath /usr/bin/java)
fi



if [ -z "$(find /usr/share/openhab/addons/* -name '*kar' -print -quit)" ]
then
    echo ""
    echo "++++++++++"
    echo "+ install openhab-addons"
    sudo apt-get install openhab-addons -y
    sudo systemctl start openhab.service
    sudo systemctl daemon-reload
    sudo systemctl enable openhab.service
else
    echo ""
    echo "++++++++++"
    echo "+ openhab-addons already installed"
fi






















