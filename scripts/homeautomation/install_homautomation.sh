#!/bin/bash

##################################################
#
# run this script by executing
# sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_homautomation.sh | bash
#
###################################################


sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_update.sh | bash


# will be removed
sudo apt-get install xrdp -y


#sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_python.sh | bash

#sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_zulu_java_11.sh | bash

#sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_mutt.sh | bash

#sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_openhab.sh | bash

#sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_samba_for_openhab.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_chromium_kioskmode.sh | bash