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



if  [ -f "/etc/default/openhab" ]; then
    if  grep -q "9080" "/etc/default/openhab"  ; then
        echo "++++++++++"
        echo "+ /etc/default/openhab is already extended"
    else
        echo "++++++++++"
        echo "+ extending /etc/default/openhab"
        echo " " >> openhab_extension.tmp
        echo "OPENHAB_HTTP_PORT=9080" >> openhab_extension.tmp
        echo "OPENHAB_HTTPS_PORT=9443" >> openhab_extension.tmp
        sudo cp /etc/default/openhab openhab.org
        cat openhab.org >> openhab.extended
        cat openhab_extension.tmp >> openhab.extended
        sudo mv openhab.extended /etc/default/openhab
        sudo mv openhab.org /etc/default/openhab.org
    fi
else
    echo "++++++++++"
    echo "+ openhab is not installed"
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






















