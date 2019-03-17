Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |v|
    # Basic configuration
    v.memory = 4096
    v.cpus = 2
    v.name = "vmdocker"

    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--audio", "none"]
    v.customize ["modifyvm", :id, "--usb", "off"]
    v.customize ["modifyvm", :id, "--usbehci", "off"]
    v.customize ["modifyvm", :id, "--vrde", "off"]
  end

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "Europe/Paris"
  end

  config.vm.define "vmdocker" do |v|
    v.vm.box = "debian/stretch64"

    if Vagrant.has_plugin?("vagrant-disksize") then
      config.disksize.size = '80GB'
    end

    #v.vm.network "forwarded_port", guest: 80, host: 8086
    v.vm.network "private_network", ip: "192.168.10.10",
	  nic_type: "virtio"

    v.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
    v.vm.hostname = "vmdocker.local"
  end

  #config.vm.provision "shell", inline: <<-SHELL
  #  apt update
  #SHELL
  config.vm.provision "shell" do |s|
  	ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
  	s.inline = <<-SHELL
    	echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
  	SHELL
  end

  ####### Provision #######
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision/playbook.yml"
    ansible.galaxy_role_file = 'provision/requirements.yml'
  	ansible.galaxy_roles_path = 'provision/roles'
  	ansible.galaxy_command = "ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
    ansible.verbose = true
    ansible.install_mode = "pip"
    ansible.version = "2.7.5"
  end
end
