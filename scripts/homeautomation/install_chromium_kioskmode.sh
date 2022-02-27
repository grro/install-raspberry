#!/bin/bash

if [ -f "/etc/xdg/openbox/autostart.org" ]
then
    echo ""
    echo "++++++++++"
    echo "+ chromium browser is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ install chromium browser "
    sudo apt-get install chromium-browser -y

    echo "+ install unclutter "
    sudo apt-get install unclutter -y


    echo "+ update autostart "
    echo "#!/bin/bash" >> start_browser.sh.tmp
    echo "sleep 90" >> start_browser.sh.tmp
    echo "chromium-browser --kiosk --noerrdialogs  --check-for-update-interval=31536000 --disable-infobars http://0.0.0.0:8080/habpanel/index.html#/view/home" >> start_browser.sh.tmp
    sudo mkdir /etc/kioskbrowser
    sudo mv start_browser.sh.tmp /etc/kioskbrowser/start_browser.sh
    sudo chmod +x /etc/kioskbrowser/start_browser.sh


    echo '  ' >> autostart_extension.tmp
    echo '# disable curser' >> autostart_extension.tmp
    echo '@unclutter' >> autostart_extension.tmp
    echo '  ' >> autostart_extension.tmp
    echo '# start Chromium in full mode' >> autostart_extension.tmp
    echo '@/etc/kioskbrowser/start_browser.sh' >> autostart_extension.tmp
    sudo cp /etc/xdg/lxsession/LXDE-pi/autostart autostart.org
    cat autostart.org >> autostart.extended
    cat autostart_extension.tmp >> autostart.extended
    sudo mv autostart.extended /etc/xdg/lxsession/LXDE-pi/autostart
    sudo mv autostart.org /etc/xdg/lxsession/LXDE-pi/autostart.org
fi


