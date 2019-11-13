# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/ubuntu1804"

  config.ssh.private_key_path = File.expand_path('~/.vagrant.d/insecure_private_key')
  config.ssh.insert_key = false

  config.vbguest.auto_update = false
  config.vbguest.no_remote = true

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  config.vm.define "server" do |server|
    server.vm.network "private_network", ip: "10.10.0.2"
    server.vm.hostname = "borg.eccenca.local"
  end

  config.vm.define "client" do |client|
    client.vm.network "private_network", ip: "10.10.0.3"
    client.vm.hostname = "client.eccenca.local"
  end

  config.vm.define "app" do |app|
    app.vm.network "private_network", ip: "10.10.0.4"
    app.vm.hostname = "app.eccenca.local"
  end

  config.vm.define "web" do |web|
    web.vm.network "private_network", ip: "10.10.0.5"
    web.vm.hostname = "web.eccenca.local"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end

end
