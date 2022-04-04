#!/bin/bash


if command -v mutt &> /dev/null
then
    echo ""
    echo "++++++++++"
    echo "+ mutt is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ installing mutt"
    sudo apt-get install mutt -y
fi
