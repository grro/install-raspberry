#!/bin/bash


if command -v mutt &> /dev/null
then
    echo "mutt is already installed"
else
    echo "installing mutt"
    sudo apt-get install mutt -y
fi

