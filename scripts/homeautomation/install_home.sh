#!/bin/bash

##################################################
#
# run this script by executing
# sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_home.sh | bash
#
###################################################

cd ~

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_update.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_python.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_unifi_controller.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_zulu_java_11.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_mutt.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_samba_for_openhab.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_openhab.sh | bash

echo 'please execute the commands below'
echo 'sudo update-alternatives --config java'
echo 'sudo smbpasswd -a openhab'


#sudo apt autoremove