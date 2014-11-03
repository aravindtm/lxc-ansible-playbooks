lxc-ansible-playbooks
=====================

Ansible playbooks for setup lxc host and containers on Ubuntu 14.04 or CentOS 6
I tested these playbooks in two Vagrant boxes below.

```
  config.vm.box = "hnakamur/ubuntu-14.04-x64"
```

```
  config.vm.box = "hnakamur/centos6.5-x64"
```

## What will be created

1. Ansible is installed with the Vagrant shell provisioner.
2. The lxc host is configured.
3. Two lxc containers is created.

Nginx will be installed in the lxc hosts and containers.
The nginx in the lxc host proxys to nginx in containers.
You can access nginx in containers with urls:

* http://c1.192.168.33.2.xip.io
* http://c1.192.168.33.3.xip.io


## Under the hood

* The lxc host accesses containers using [Ansible Connection Plugin for lxc containers]( https://github.com/Mic92/ansible-lxc ) instead of ssh.
* IP Addresses of containers are determined by DHCP.
