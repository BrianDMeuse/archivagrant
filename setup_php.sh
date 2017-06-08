#!/usr/bin/env bash

yum -y install php
yum -y install php-mysql
yum -y install phpmyadmin

# Tweak conf so we can remotely access
sed -i 's/Allow from 127.0.0.1/Allow from 10.0.2.2/' /etc/httpd/conf.d/phpMyAdmin.conf

echo "Be sure to update /etc/phpMyAdmin/config.inc.php"

service httpd restart