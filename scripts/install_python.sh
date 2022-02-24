#!/bin/bash


if command -v pip &> /dev/null
then
    echo "python pip is already installed"
else
    echo "installing python pip"
    sudo apt install python3-pip -y
fi

