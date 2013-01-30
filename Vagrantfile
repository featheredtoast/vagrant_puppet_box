# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.define :toybox do |toybox|
        toybox.vm.box = "precise32"
        toybox.vm.box_url = "http://files.vagrantup.com/precise32.box"
        toybox.vm.network :hostonly, "22.22.22.22"
        toybox.vm.forward_port 80, 8081
        toybox.vm.host_name = "toybox.test"
     end

    config.vm.define :toybox2 do |toybox2|
        toybox2.vm.box = "precise32"
        toybox2.vm.box_url = "http://files.vagrantup.com/precise32.box"
        toybox2.vm.network :hostonly, "22.22.22.23"
        toybox2.vm.forward_port 80, 8083
        toybox2.vm.host_name = "toybox2.test"
     end

  # Enable the Puppet provisioner
  config.vm.provision :puppet, :module_path => "modules" do |puppet|
	
	puppet.manifest_file = "site.pp"
  end
end
