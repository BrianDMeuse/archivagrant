#!/usr/bin/env bash

echo "Upgrading to v.1.5.4"
cd /usr/local/
#
echo "Creating full backup"
aspace/scripts/backup.sh --mysqldump --output /tmp/as20170601.zip

echo "Creating new directory structure and installing v1.5.4"
mkdir archivesspace-1.5.4
cd archivesspace-1.5.4/ 
wget https://github.com/archivesspace/archivesspace/releases/download/v1.5.4/archivesspace-v1.5.4.zip
unzip -x archivesspace-v1.5.4.zip

cd ..
echo "Stopping v1.4.1"
aspace/archivesspace.sh stop

echo "Copying files from v1.4.1 to v1.5.4"
cp -a aspace/data/* archivesspace-1.5.4/archivesspace/data/
cp -a aspace/config/* archivesspace-1.5.4/archivesspace/config/
cp -a aspace/lib/mysql-connector* archivesspace-1.5.4/archivesspace/lib/
cp -a aspace/plugins/brandeis archivesspace-1.5.4/archivesspace/plugins
#
echo "Removing exisitg SOLR indexes (force full reindex)"
rm -rf archivesspace-1.5.4/archivesspace/data/indexer_state
rm -rf archivesspace-1.5.4/archivesspace/data/solr_index
#
#echo "Modifying new config.rb"
#sudo vi archivesspace-1.5.4/archivesspace/config/config.rb
#
echo "Updating database schema"
archivesspace-1.5.4/archivesspace/scripts/setup-database.sh
#
echo "Starting conversion process..."
archivesspace-1.5.4/archivesspace/archivesspace.sh start
#
#echo "Tailing log...."
#tail -f archivesspace-1.5.4/archivesspace/logs/archivesspace.out 