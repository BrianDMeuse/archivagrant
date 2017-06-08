#!/usr/bin/env bash

yum -y install httpd
yum -y install mod_ssl

# Change Listen port to avoid conflict with localhost
sed -i 's/Listen 80/Listen 8000/' /etc/httpd/conf/httpd.conf

service httpd start