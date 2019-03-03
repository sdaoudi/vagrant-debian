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

- MariaDB Database Access:
	- Username: root
	- Password: pouf

- SSH Access:

```
$ vargrant ssh
```

You can also use the ssh command line:

```
$ ssh vagrant@192.168.10.10
```

# Docker container services

You can access to docker container list from ``http://traefik.local``:

Add this line to your local etc/hosts file:

```
127.0.0.1 traefik.local
```
