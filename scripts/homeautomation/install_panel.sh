#!/bin/bash

##################################################
#
# run this script by executing
# sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_panel.sh | bash
#
###################################################

cd ~

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_update.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_python.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_mutt.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_samba.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/modules/install_chromium_kioskmode.sh | bash

#sudo apt autoremove