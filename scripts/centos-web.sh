#!/bin/bash

sudo yum install -y httpd httpd-devel httpd-tools

sudo systemctl enable httpd
sudo service httpd stop

sudp rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo systemctl start httpd
sudo service httpd start

sudo yum install -y php php-cli php-common php-devel php-mysql

cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/vizor1640/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/vizor1640/vagrant/master/files/info.php
sudo service httpd restart
