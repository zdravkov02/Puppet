# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  # WEB - CentOS Stream 8
  config.vm.define "web" do |web|
    web.vm.box = "shekeriev/centos-stream-8"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.99.101"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.synced_folder "shared/web", "/shared"
    web.vm.provision "shell", path: "initial-config/add_hosts.sh"
    web.vm.provision "shell", path: "initial-config/install_puppet_redhat.sh", privileged: false
    web.vm.provision "shell", path: "initial-config/modules_web.sh", privileged: false

    web.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "web.pp"
      puppet.options = "--verbose --debug"
    end

    web.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 512
      v.cpus = 1
    end
  end

  # DB - Debian 11
  config.vm.define "db" do |db|
    db.vm.box = "shekeriev/debian-11"
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.99.102"
    db.vm.synced_folder "shared/db", "/shared"
    db.vm.provision "shell", path: "initial-config/add_hosts.sh"
    db.vm.provision "shell", path: "initial-config/install_puppet_debian.sh", privileged: false
    db.vm.provision "shell", path: "initial-config/modules_db.sh", privileged: false

    db.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "db.pp"
      puppet.options = "--verbose --debug"
    end

    db.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 512
      v.cpus = 1
    end
  end
  
  
end
