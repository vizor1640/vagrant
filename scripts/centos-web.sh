#!/bin/bash

yum install -y httpd httpd-devel httpd-tools

sudo systemctl enable httpd
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

sudo systemctl start httpd
service httpd start

yum install -y php php-cli php-common php-devel php-mysql

cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/vizor1640/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/vizor1640/vagrant/master/files/info.php
service httpd restart
