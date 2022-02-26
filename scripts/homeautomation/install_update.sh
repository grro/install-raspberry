#!/bin/bash



if [ -f "deleteme.tmp" ]
then
    echo ""
    echo "++++++++++"
    echo "+ repo is already updated "
else
    echo ""
    echo "++++++++++"
    echo "+ perform repo update "
    sudo apt-get update -y
    echo 'marker file' >> deleteme.tmp
fi
