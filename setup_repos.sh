#!/usr/bin/env bash

# EPEL
rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# REMI
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# MySQL
rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el6-11.noarch.rpm

# Install yum-config-manager
yum -y install yum-utils

