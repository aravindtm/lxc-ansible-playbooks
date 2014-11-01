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

  # NOTE: Enable this line to run the provisioning on the lxc host with vagrant up.
  # However I recommend you to run this command manually after vagrant ssh, since
  # you can see outputs as provision is progressing.
  #config.vm.provision "shell", inline: "cd /vagrant/provisioning && ansible-playbook lxc_host.yml"
  #config.vm.provision "shell", inline: "cd /vagrant/provisioning && ansible-playbook containers.yml"
end
