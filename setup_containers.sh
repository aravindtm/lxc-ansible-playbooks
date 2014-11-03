#!/bin/sh
export PYTHONUNBUFFERED=true
cd /vagrant/provisioning
# NOTE: sudo is needed because inventory-lxc.py must be executed with root user.
sudo ansible-playbook containers.yml
