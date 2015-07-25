# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure('2') do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/digital_ocean'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.vm.hostname = 'thingie'

    provider.token = '666e2371be8c39f3ba42e8ba8f3b2674ed7b7122cb67999422cb2fc1453c9264'
    provider.image = 'centos-7-0-x64'
    provider.region = 'sfo1'
    provider.size = '2gb'
  end
  config.vm.provider :vmware_fusion do |provider, override|
    override.vm.box = 'chef/centos-7.0'

  end

  ## For masterless, mount your salt file root
  config.vm.synced_folder "salt/roots/", "/srv/salt/"
    ## Use all the defaults:
    config.vm.provision :salt do |salt|
      salt.minion_config = "salt/minion"
      salt.run_highstate = true

    end

  # setup salt on our own terms
  # config.vm.provision "shell", path: "script.sh"

end
