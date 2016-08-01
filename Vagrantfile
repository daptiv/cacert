Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true
  config.vm.box_url = 'http://artrepo.daptiv.com:8081/artifactory/installs/vagrant/boxes/vbox_windows-2008r2_chef-11.12.4.box'
  config.vm.box = 'vbox_windows-2008r2_chef-11.12.4'
  config.vm.communicator = :winrm

#  config.vm.provider :virtualbox do |v, override|
#    v.gui = true
#  end

  config.vm.provision :chef_zero do |chef|
    chef.file_cache_path = 'c:\\\chef\\\cache'
    chef.log_level = :debug
    chef.add_recipe 'cacert'
    chef.add_recipe 'minitest-handler'
  end

#  config.vm.provision :serverspec do |spec|
#    spec.pattern = 'test/integration/default/serverspec/*_spec.rb'
#  end
end
