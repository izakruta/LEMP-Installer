#!/bin/bash

echo -e "Starting Arch installer Script..."

#updating packages
echo -e "Updating package lists.."
sudo pacman -Sy --noconfirm

#install Ngnix
echo -e "Installing Ngnix server..."
sudo pacman -S nginx --noconfirm

#install Mysql server
echo -e "Installing Mysql server..."
sudo pacman -S mariadb --noconfirm
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

#install Mysql server
echo -e "Installing PHP-FPM and Mysql extension for PHP..."
sudo pacman -S php-fpm --noconfirm

#install PHP extensions
echo -e "Installing PHP extensions..."
sudo pacman -S php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm libapache2-mod-php7.3 php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-intl

#restart MGINX
sudo systemctl restart nginx
