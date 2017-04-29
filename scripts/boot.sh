#!/bin/bash

# Install additional tools
yum install -y vim
yum install -y net-tools 

# Disable firewall
systemctl stop firewalld
systemctl disable firewalld

# Enable network interfaces
ifup enp0s8
