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

    if /usr/bin/lsusb | grep -q "0403:600"; then
       echo "ttyUSB-enocean detected"
    else
       echo "ttyUSB-enocean seems not to be detected !!!"
    fi

    if /usr/bin/lsusb | grep -q "0658:0200"; then
       echo "ttyUSB-zwave detected"
    else
       echo "ttyUSB-zwave seems not to be detected !!!"
    fi
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


if [ -f "/etc/openhab/services/runtime.cfg.save" ]
then
    echo "/etc/openhab/services/runtime.cfg is already extended"
else
    echo "extending /etc/openhab/services/runtime.cfg"
    cp /etc/openhab/services/runtime.cfg /etc/openhab/services/runtime.cfg.save
    echo 'org.openhab.restauth:allowBasicAuth=true' >> /etc/openhab/services/runtime.cfg
fi


sudo apt-get install openhab-addons -y
sudo systemctl start openhab.service
sudo systemctl daemon-reload
sudo systemctl enable openhab.service
