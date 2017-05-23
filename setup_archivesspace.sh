#!/usr/bin/env bash

echo "Installing dependencies"
yum -y install java-1.7.0-openjdk
yum -y install unzip
yum -y install git
yum -y install curl

cd /usr/local
git clone https://github.com/BrianDMeuse/archivesspace.git

chown -R vagrant:vagrant archivesspace

cd archivesspace

./archivesspace.sh start

