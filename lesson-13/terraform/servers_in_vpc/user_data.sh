#!/bin/bash
sudo apt -y update
sudo apt -y install apache2
PrivateIP=$(curl -s http://ifconfig.me/ip)
echo "WebServer's ip address is $PrivateIP " > /var/www/html/index.html
sudo service apache2 start