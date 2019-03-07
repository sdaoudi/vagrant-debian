# Requirements

 - [Download](https://git-scm.com/downloads) and install GIT
 - [Download](https://www.virtualbox.org/wiki/Downloads) and install Virtualbox
 - [Download](https://www.vagrantup.com/downloads.html) and install Vagrant
 
# Startup

- Clone the repo:

```
$ git clone https://github.com/sdaoudi/vagrant-debian.git
```

- Install Vagrant Proxy Plugin, if you have a proxy

```
$ vagrant plugin install vagrant-proxyconf
```

- Install Vagrant Disksize plugin if you want to increase your disk size

```
$ vagrant plugin install vagrant-disksize
```

- Start Vagrant

```
$ cd vagrant-debian && vagrant up
```

That's all.

# VM Access

- OS:  **Debian Stretch** 64bits from vagrant box debian/stretch64

- VM ip:  **192.168.10.10**

- Samba Access:
	- Path: \\\\192.168.10.10\\vagrant
	- Username: vagrant
	- Password: vagrant

- SSH Access:

```
$ vargrant ssh
```

You can also use the ssh command line:

```
$ ssh vagrant@192.168.10.10
```

# AWESOME DOCKER CONTAINERS

If you want to initialize some containers, we offer you a list of awesome containers:

- MariaDB database:
  - port: 3306
  - username: root
  - password: pouf
- phpMyAdmin
- Traefik:
  - network: bridge
- portainer

To get this list, you have to execute this command in your new VM:

``
$ bash /vagrant/config/scripts/init.sh
``
