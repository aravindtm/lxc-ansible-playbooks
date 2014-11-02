#!/bin/sh
export PYTHONUNBUFFERED=true
cd /vagrant/provisioning
ansible-playbook lxc_host.yml
