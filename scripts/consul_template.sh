#!/bin/bash

# Download consul
cd /tmp
wget https://releases.hashicorp.com/consul-template/0.18.2/consul-template_0.18.2_linux_amd64.zip >/dev/null 2>&1

# Install consul
unzip consul-template_0.18.2_linux_amd64.zip
mkdir -p /opt/consul-template
cp consul-template /opt/consul-template/
cd /usr/bin
ln -s /opt/consul-template/consul-template consul-template

# Add consul-template to systemd
cp /vagrant/configs/unitfile/consul-template.service /etc/systemd/system/
chmod 664 /etc/systemd/system/consul-template.service
systemctl daemon-reload
systemctl start consul-template.service