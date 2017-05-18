#!/usr/bin/env bash

yum -y install mysql-server

service mysqld start

# Don't do this!
mysql -uroot -e "create database archivesspace"
mysql -uroot -e "grant all on archivesspace.* to 'as'@'localhost' identified by 'as123'"

#yum -y install phpmyadmin

#service httpd restart

# load whatever mysqldump file we added
mysql -uas -pas123 archivesspace < sql/mysqldump.sql