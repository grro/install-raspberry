#!/bin/bash


tmp_dir=$(mktemp -d -t installation-XXXXXXXXXX)
cd $tmp_dir

echo "temp dir $tmp_dir created"

JAVA_VER=$(java -version 2>&1 >/dev/null | grep 'Zulu11')
echo $JAVA_VER
if [ -n "$JAVA_VER" ]
then
    echo "java is already installed"
else
    java_package="zulu11.52.13-ca-jdk11.0.13-linux_aarch32hf"
    echo "installing zulu java"
    sudo mkdir /opt/jdk
    cd /opt/jdk
    sudo dpkg --print-architecture
    sudo wget https://cdn.azul.com/zulu-embedded/bin/$java_package.tar.gz
    sudo tar -xzvf $java_package.tar.gz
    sudo rm $java_package.tar.gz
    sudo update-alternatives --install /usr/bin/java java /opt/jdk/$java_package/bin/java 1
    sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/$java_package/bin/javac 1
    sudo java -version
fi