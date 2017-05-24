#!/usr/bin/env bash

# Use 5.1.73 for now
yum-config-manager --disable mysql57-community

yum -y install mysql-server

service mysqld start

# Don't do this!
mysql -uroot -e "create database archivesspace"
mysql -uroot -e "grant all on archivesspace.* to 'as'@'localhost' identified by 'as123'"

# load whatever mysqldump file we added
mysql -uas -pas123 archivesspace < sql/mysqldump.sql