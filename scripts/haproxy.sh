#!/bin/bash

# Install nginx
yum install -y haproxy

# Configure haproxy
rm -f /etc/haproxy/haproxy.cfg
cp /vagrant/configs/lb/haproxy.cfg /etc/haproxy/
cp /vagrant/configs/lb/haproxy.cfg.tpl /etc/haproxy/

# Start nginx
systemctl enable haproxy
systemctl start haproxy