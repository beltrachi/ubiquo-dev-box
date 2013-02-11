# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.forward_port 3000, 3000
  config.vm.host_name = 'ubiquo-dev-box'

  # Configure nfs to speedup disk access. Otherways the server gets REALLY slow.
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)

  # Prepare with rvm and so on 
  config.vm.provision :shell, :inline => "su vagrant -c \"/vagrant/scripts/vagrant_guest_init.sh\""
end
