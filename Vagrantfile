# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.network :private_network, type: :dhcp
    config.vm.hostname = "rbc6"
    config.omnibus.chef_version = "11.12.2"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
    end

    config.vm.provision :chef_solo do |chef|
        chef.log_level = "info"
        chef.cookbooks_path = ["site-cookbooks", "cookbooks" ]
        chef.add_recipe "apt"
        chef.add_recipe "timezone"
        chef.add_recipe "build-essential"
        chef.add_recipe "node"

        # You may also specify custom JSON attributes:
        chef.json = {
            :tz => 'Europe/Moscow',
        }
    end

end
