#!/bin/bash

yum update -y --exclude=kernel

yum install -y nano git unzip screen

yum install -y httpd httpd-devel httpd-tools

sudo sytemctl enable httpd
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

sudo systemctl start httpd
service httpd start

yum install -y pho php-cli php-common php-devel php-mysql

sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum install -y mysql myswl-server mysql-devel
sudo systemctl start mysqld
sudo service mysqld start

mysql -u root -e "SHOW DATABASES";

service httpd restart
