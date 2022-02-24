#!/bin/bash

##################################################
#
# run this script by executing
# sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_homautomation.sh | bash
#
###################################################


#sudo apt-get update

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_python.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_zulu_java_11.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_mutt.sh | bash

# sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_openhab.sh | bash

sudo curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_samba_for_openhab.sh | bash