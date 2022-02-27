#!/bin/bash



if [ -f "/tmp/__installation_homeautomation_repo_updated_marker.tmp" ]
then
    echo ""
    echo "++++++++++"
    echo "+ repo is already updated "
else
    echo ""
    echo "++++++++++"
    echo "+ perform repo update "
    sudo apt update && sudo apt upgrade -y
    echo 'marker file' >> __installation_homeautomation_repo_updated_marker.tmp
    sudo mv __installation_homeautomation_repo_updated_marker.tmp /tmp/__installation_homeautomation_repo_updated_marker.tmp
fi
