#!/bin/bash


if command -v ffmpeg &> /dev/null
then
    echo ""
    echo "++++++++++"
    echo "+ ffmpeg is already installed"
else
    echo ""
    echo "++++++++++"
    echo "+ installing ffmpeg"
    sudo apt install ffmpeg
fi
