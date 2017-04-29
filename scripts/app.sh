#!/bin/bash

# Install nginx
yum install -y epel-release
yum install -y nginx

# Configure web page
echo "$1" > /usr/share/nginx/html/index.html

# Start nginx
systemctl enable nginx
systemctl start nginx