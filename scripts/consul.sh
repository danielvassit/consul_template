#!/bin/bash

# Install unzip
yum install -y unzip
yum install -y bind-utils

# Download consul
cd /tmp
wget https://releases.hashicorp.com/consul/0.8.0/consul_0.8.0_linux_amd64.zip >/dev/null 2>&1

# Install consul
unzip consul_0.8.0_linux_amd64.zip
mkdir -p /opt/consul
cp consul /opt/consul/
cd /usr/bin
ln -s /opt/consul/consul consul

# Create consul config directory
mkdir /etc/consul.d

# Create consul data directory
mkdir -p /var/consul