Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "./sites", "/home/vagrant/sites/", :nfs => true
  config.vm.synced_folder "./sites-enabled", "/home/vagrant/sites-enabled/", :nfs => true
  config.vm.synced_folder "./misc", "/tmp/misc/", :nfs => true
  config.vm.hostname = "devbox"
  config.vm.network :private_network, ip: "10.0.1.2"
  config.vm.network "forwarded_port", guest: 22, host: 2200
  
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet"
    puppet.manifest_file = "default.pp"
  end
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
end


