VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

require 'yaml'
servers = YAML.load_file('servers.yaml')
 
  servers.each do |servers|
    config.vm.define servers["name"] do |serv|
	serv.vm.box = "hashicorp/precise64"
        serv.vm.network "private_network", ip: servers["ip"]
        serv.vm.hostname = servers["name"]
	
	if servers["role"] == "app"
		serv.vm.network "forwarded_port", guest: 8080, host: servers["fwdport"].to_i
	else
	end
	serv.vm.provider "virtualbox" do |v|
         v.customize  ["modifyvm", :id,
          "--cpus", "1",
          "--memory", "1024",
          "--name", servers["name"],
       ]
        end
        serv.vm.provision "shell",
     	inline: "sudo apt-get update > /dev/null"

  	serv.vm.provision "puppet" do |puppet|
    	  puppet.manifests_path = "puppet/manifests"
          puppet.manifest_file = "site.pp"
          puppet.module_path = "puppet/modules"
         # puppet.options = "--verbose --debug" # for debugging purposes
  	end
      end
    end
end 
