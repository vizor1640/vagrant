#!/bin/bash

yum update -y --exclude=kernel

yum install -y nano git unzip screen

yum install -y httpd httpd-devel httpd-tools

sudo systemctl enable httpd
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

sudo systemctl start httpd
service httpd start

yum install -y php php-cli php-common php-devel php-mysql

sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum install -y mysql mysql-server mysql-devel
sudo systemctl start mysqld
sudo service mysqld start

mysql -u root -e "SHOW DATABASES";

cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/vizor1640/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/vizor1640/vagrant/master/files/info.php
service httpd restart
