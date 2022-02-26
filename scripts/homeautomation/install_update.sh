#!/bin/bash



if [ -f "deleteme.tmp" ]
then
    echo ""
    echo "++++++++++"
    echo "+ already updated "
else
    echo ""
    echo "++++++++++"
    echo "+ perform update "
    sudo apt-get update -y
    echo 'marker file' >> deleteme.tmp
fi
