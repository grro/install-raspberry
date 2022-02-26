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
    sudo apt-get install chromium-browser --y
    sudo apt-get install unclutter -y
fi



if [ -f "/etc/chromium-browser/customizations/01-disable-update-check" ]
then
    echo ""
    echo "++++++++++"
    echo "+ chromium update check is already disabled "
else
    echo ""
    echo "++++++++++"
    echo "+ disable chromium update check "
    echo 'content  CHROMIUM_FLAGS="${CHROMIUM_FLAGS} --check-for-update-interval=31536000"' >> 01-disable-update-check.tmp
    sudo mv01-disable-update-check.tmp /etc/chromium-browser/customizations/01-disable-update-check
fi


# files+=" /etc/xdg/lxsession/LXDE-pi/autostart"

