Vagrant.configure("2") do |config|
  #config.vm.box = "ubuntu/trusty64"
  config.vm.box = "package.box"
  config.vm.synced_folder ".", "/vagrant/", :nfs => true
  config.vm.network :private_network, ip: "10.0.1.2"

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet"
    puppet.manifest_file = "default.pp"
  end
end
