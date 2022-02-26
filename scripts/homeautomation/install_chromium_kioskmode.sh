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
    sudo apt-get install chromium-browser -y
    sudo apt-get install unclutter -y

    sudo cp /etc/xdg/openbox/autostart autostart.tmp
    echo 'xset s noblank        # turn off screen blanking' >> autostart.tmp
    echo 'xset s off            # turn off screen saver' >> autostart.tmp
    echo '@unclutter' >> autostart.tmp
    echo '# Remove exit errors from the config files that could trigger a warning' >> autostart.tmp
    echo "sed -i 's/\"exited_cleanly\":false/\"exited_cleanly\":true/' ~/.config/chromium/\'Local State'" >> autostart.tmp
    echo "sed -i 's/\"exited_cleanly\":false/\"exited_cleanly\":true/; s/\"exit_type\":\"[^\"]\+\"/\"exit_type\":\"Normal\"/' ~/.config/chromium/Default/Preferences" >> autostart.tmp
    sudo cp /etc/xdg/openbox/autostart /etc/xdg/openbox/autostart.org
    sudo cp autostart.tmp /etc/xdg/openbox/autostart

    # add to chron
    # chromium-browser  --noerrdialogs --check-for-update-interval=31536000 --disable-infobars --kiosk http://localhost:8080/habpanel/index.html# &

fi


