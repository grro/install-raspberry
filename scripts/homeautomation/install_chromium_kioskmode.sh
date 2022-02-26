#!/bin/bash




if command -v chromium-browser &> /dev/null
then
    echo ""
    echo "++++++++++"
    echo "+ chromium browser is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ install chromium browser "
    sudo apt-get install --no-install-recommends xserver-xorg x11-xserver-utils xinit openbox xdotool
    sudo apt-get install --no-install-recommends chromium-browser
fi


