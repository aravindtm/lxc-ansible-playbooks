#!/bin/sh

if [ ! -f /usr/local/bin/ansible ]; then
  sudo apt-get install -y curl gcc python-dev
  curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
  sudo pip install ansible
  sudo mkdir -p /etc/ansible
  sudo sh -c "cat <<EOF > /etc/ansible/ansible.cfg
[defaults]
hostfile = /vagrant/provisioning/inventory-lxc.py
EOF"
fi

