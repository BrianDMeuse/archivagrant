#!/usr/bin/env bash

echo "Installing dependencies"
yum -y install java-1.7.0-openjdk
yum -y install unzip
yum -y install git
yum -y install curl

cd /usr/local

git clone https://github.com/BrianDMeuse/archivesspace.git

chown -R vagrant:vagrant archivesspace

mkdir archivesspace-v1.4.1

mv archivesspace archivesspace-v1.4.1/

ln -s /usr/local/archivesspace-v1.4.1/archivesspace aspace

cd aspace

# tweak to point to localhost and not production
sed -i 's/findingaids.brandeis.edu/localhost/' plugins/brandeis/public/views/site/index.html.erb

./archivesspace.sh start

