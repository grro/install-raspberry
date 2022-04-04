#!/bin/bash


if command -v frontail &> /dev/null
then
    echo ""
    echo "++++++++++"
    echo "+ frontail is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ installing frontail"
    sudo wget -O - https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v9.11.2.sh | bash
    sudo apt-get install npm -y
    npm install frontail -g
fi
