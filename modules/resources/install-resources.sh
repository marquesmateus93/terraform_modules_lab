#!/bin/bash
yum update -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2 git
yum install -y httpd mariadb-server

systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariadb

usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www

echo "Marques Labs" > /var/www/html/index.php
# mkdir ~/app
# git clone https://github.com/marquesmateus93/php_simple_app.git /app
# cp ~/app/hosts.php /var/www/html/index.php
# chown -R ec2-user:apache /var/www