# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	# Build the dev environment in the vm
	config.vm.define "linux", autostart: true, primary: true do |vmconfig|
		vmconfig.vm.box = "fedora27"
		vmconfig.vm.hostname = "VAGRANT-DEV-BOX"
		vmconfig.vm.network "forwarded_port", guest: 5901, host: 5901
		vmconfig = configureProviders vmconfig,
			cpus: suggestedCPUCores()

		vmconfig.vm.synced_folder ".", "/vagrant", disabled: true
		vmconfig.vm.synced_folder '.', '/share'

		vmconfig.vm.provision "shell",
			privileged: true,
			inline: 'timedatectl set-timezone America/Los_Angeles'

		vmconfig.vm.provision "shell",
			privileged: true,
			path: './scripts/install_chef.sh'

		vmconfig.vm.provision "shell",
			privileged: true,
			path: './scripts/install_docker_kitchen.sh'

		vmconfig.vm.provision "shell",
			privileged: true,
			path: './scripts/install_vnc.sh'

	end

end

def configureProviders(vmconfig, cpus: "2", memory: "4096")
	vmconfig.vm.provider "virtualbox" do |v|
		v.memory = memory
		v.cpus = cpus
	end

	["vmware_fusion", "vmware_workstation"].each do |p|
		vmconfig.vm.provider p do |v|
			v.enable_vmrun_ip_lookup = false
			v.vmx["memsize"] = memory
			v.vmx["numvcpus"] = cpus
		end
	end

	return vmconfig
end

def suggestedCPUCores()
	case RbConfig::CONFIG['host_os']
	when /darwin/
		Integer(`sysctl -n hw.ncpu`) / 2
	when /linux/
		Integer(`cat /proc/cpuinfo | grep processor | wc -l`) / 2
	else
		2
	end
end
