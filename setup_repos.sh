#!/usr/bin/env bash

# Fetch RPM for EPEL Repo
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install repo
rpm -ivh epel-release-6-8.noarch.rpm
