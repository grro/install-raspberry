#!/bin/bash

##################################################
#
# run this script by executing
# sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/bootstrap.sh | bash
#
###################################################

sudo mkdir /etc/scripts
sudo mkdir /etc/scripts/modules

sudo curl -s -L  --output /etc/scripts/modules/install_samba.sh https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/homeautomation/install_samba.sh

sudo chmod +x /etc/scripts/modules/install_samba.sh
sudo chmod -R 777 /etc/scripts/

sudo /etc/scripts/modules/install_samba.sh

