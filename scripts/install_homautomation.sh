#!/bin/bash

sudo apt-get update
curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_python.sh | bash
curl -s -L https://raw.githubusercontent.com/grro/install-raspberry/main/scripts/install_zulu_java_11.sh | bash