# consul_template


# Side Project: Service discovery with consul-template

The gole of this project is to create simple POC that would show how service discovery and consul-templates work.

# How it works

There are 2 nginx servers (web1 and web2) that are simulating simple app. Each nginx server has consul agent installed and joined to consul server running on "consul" vm. Each agent discovers nginx service and reports its availability to consul server. 
There is also haproxy vm that load balances traffic to app servers based on availability. This machine has consul agnet installed and connected to consul server so that consul template can check app status by querying localhost. Consul template service listens to app status and changes haproxy configuration when any of app servers are down.

# Prerequisites

Virtualbox and Vagrant needs to be installed.

```
brew cask install virtualbox
brew cask install vagrant
```

# How to run lab

Start vagrant 
```
vagrant up
```

In web browser go to localhost:8081, this should show first app. Try to reload the page and see if requests are load balanced. After checking that LB works stop one of nginx services and check that LB can see the change.

# Helpful commands
Check all registered applications "app" in consul
```
dig @127.0.0.1 -p 8600 app.service.consul 
```

Check all consul cluster members
```
consul members
```