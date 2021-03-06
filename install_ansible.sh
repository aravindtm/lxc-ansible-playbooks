#!/bin/sh

get_distribution() {
  if [ -f /etc/lsb-release ]; then
    awk -F= '$1=="DISTRIB_ID" {print tolower($2)}' /etc/lsb-release
  elif [ -f /etc/system-release-cpe ]; then
    awk -F: '{print $3}' /etc/system-release-cpe
  else
   echo 'unknown'
  fi
}

get_os_family() {
  case `get_distribution` in
  redhat|centos|amazon)
    echo 'redhat'
    ;;
  debian|ubuntu)
    echo 'debian'
    ;;
  *)
    echo 'unknown'
    ;;
  esac
}

os_family=`get_os_family`
case $os_family in
debian)
  ansible_path=/usr/local/bin/ansible
  ;;
redhat)
  ansible_path=/usr/bin/ansible
  ;;
*)
  echo 'Unsupported OS family' 1>&2
  exit 1
  ;;
esac

if [ ! -f $ansible_path ]; then
  case $os_family in
  debian)
    sudo apt-get install -y curl gcc python-dev
    ;;
  redhat)
    sudo yum install -y curl gcc python-devel
    ;;
  esac
  curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
  sudo pip install ansible
  sudo mkdir -p /etc/ansible
  sudo sh -c "cat <<EOF > /etc/ansible/ansible.cfg
[defaults]
hostfile = /vagrant/provisioning/inventory-lxc.py
EOF"
fi

