
Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/centos-7.2-64-nocm"

  config.vm.define "consul" do |consul|
    consul.vm.hostname = "consul"
    consul.vm.provision "shell", path: "scripts/boot.sh"
    consul.vm.provision "shell", path: "scripts/consul.sh"
    consul.vm.provision "shell", path: "scripts/consul_server.sh"
    consul.vm.provision "shell", path: "scripts/consul_template.sh"
    consul.vm.network "private_network", ip: "10.0.0.44"
    consul.vm.network "forwarded_port", guest: 8500, host: 8500
  end

  config.vm.define "web1" do |web1|
    web1.vm.hostname = "web1"
    web1.vm.provision "shell", path: "scripts/boot.sh"
    web1.vm.provision "shell", path: "scripts/consul.sh"
    web1.vm.provision "shell", path: "scripts/consul_client.sh", args: "1"
    web1.vm.provision "shell", path: "scripts/app.sh", args: "web1"
    web1.vm.network "private_network", ip: "10.0.0.45"
    web1.vm.network "forwarded_port", guest: 80, host: 81
  end

  config.vm.define "web2" do |web2|
    web2.vm.hostname = "web2"
    web2.vm.provision "shell", path: "scripts/boot.sh"
    web2.vm.provision "shell", path: "scripts/consul.sh"
    web2.vm.provision "shell", path: "scripts/consul_client.sh", args: "2"
    web2.vm.provision "shell", path: "scripts/app.sh", args: "web2"
    web2.vm.network "private_network", ip: "10.0.0.46"
    web2.vm.network "forwarded_port", guest: 80, host: 82
  end

  config.vm.define "lb" do |lb|
    lb.vm.hostname = "lb"
    lb.vm.provision "shell", path: "scripts/boot.sh"
    lb.vm.provision "shell", path: "scripts/consul.sh"
    lb.vm.provision "shell", path: "scripts/haproxy.sh"
    lb.vm.provision "shell", path: "scripts/lb_consul_client.sh"
    lb.vm.provision "shell", path: "scripts/consul_template.sh"
    lb.vm.network "private_network", ip: "10.0.0.47"
    lb.vm.network "forwarded_port", guest: 8080, host: 8081
  end

end
