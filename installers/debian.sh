#!/bin/bash

echo -e "Starting Debian installer Script..."

MYSQL_ROOT_PASSWORD=$1

#updating packages
echo -e "Updating package lists.."
sudo apt-get -y update
sudo apt install software-properties-common

#install Ngnix
echo -e "Installing Ngnix server..."
sudo apt-get -y install nginx

#install Mysql server
echo -e "Installing Mysql server..."
#set password from provided arg
sudo debconf-set-selections <<<"mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
sudo debconf-set-selections <<<"mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"
sudo apt-get -y install mysql-server

#add ondrej PPA
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/nginx -y
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
sudo apt-get update

#install Mysql server
echo -e "Installing PHP-FPM and Mysql extension for PHP..."
sudo apt-get -y install php7.3-fpm php-mysql

#install PHP extensions
echo -e "Installing PHP extensions..."
sudo apt install php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm libapache2-mod-php7.3 php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-intl -y

#install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
composer
