#!/bin/bash



if [ -d "/etc/openhab" ]
then
    echo "openhab is already installed"
else
    echo "installing openhab"
    sudo wget -qO - 'https://openhab.jfrog.io/artifactory/api/gpg/key/public' | sudo apt-key add -
    echo 'deb https://openhab.jfrog.io/artifactory/openhab-linuxpkg stable main' | sudo tee /etc/apt/sources.list.d/openhab.list
    sudo apt-get update
    sudo apt-get install openhab -y
    sudo adduser openhab dialout
    sudo adduser openhab tty
    sudo usermod -a -G dialout openhab
    setcap 'cap_net_raw,cap_net_admin=+eip cap_net_bind_service=+ep' $(realpath /usr/bin/java)
    sudo apt-get -y install iputils-arping
fi


if [ -f "/etc/default/openhab.org" ]
then
    echo "/etc/default/openhab is already extended"
else
    echo "extending /etc/default/openhab"
    cp /etc/default/openhab $tmp_dir/openhab.tmp
    echo 'EXTRA_JAVA_OPTS="-Dgnu.io.rxtx.SerialPorts=/dev/ttyUSB-zwave:/dev/ttyUSB-enocean"' >> $tmp_dir/openhab.tmp
    sudo mv /etc/default/openhab /etc/default/openhab.org
    cp $tmp_dir/openhab.tmp /etc/default/openhab
fi

sudo apt-get install openhab-addons -y
sudo systemctl start openhab.service
sudo systemctl daemon-reload
sudo systemctl enable openhab.service
