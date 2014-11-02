# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hnakamur/ubuntu-14.04-x64"
  config.vm.network :private_network, ip: "192.168.33.2"
  config.vm.boot_timeout = 120

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "shell", path: "install_ansible.sh"
  config.vm.provision "shell", path: "setup_lxc_host.sh"
  config.vm.provision "shell", path: "setup_containers.sh"
end
