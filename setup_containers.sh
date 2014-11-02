#!/bin/sh
export PYTHONUNBUFFERED=true
cd /vagrant/provisioning
ansible-playbook containers.yml
