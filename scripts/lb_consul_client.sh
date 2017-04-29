#!/bin/bash

# Copy server configuration
cp "/vagrant/configs/lb/config.json" /etc/consul.d/

# Add consul to systemd
cp /vagrant/configs/unitfile/consul.service /etc/systemd/system/
chmod 664 /etc/systemd/system/consul.service
systemctl daemon-reload
systemctl start consul.service

 