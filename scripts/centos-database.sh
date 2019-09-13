#!/bin/bash

sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum install -y mysql mysql-server mysql-devel
sudo systemctl start mysqld
sudo service mysqld start

mysql -u root -e "SHOW DATABASES";

