Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64" 

  # VM 1 configuration
  config.vm.define "vm1" do |vm1|
    vm1.vm.hostname = "vm1"
    vm1.vm.network "private_network", ip: "192.168.33.10"
  end

  # VM 2 configuration
  config.vm.define "vm2" do |vm2|
    vm2.vm.hostname = "vm2"
    vm2.vm.network "private_network", ip: "192.168.33.11"
  end

  # VM 3 configuration
  config.vm.define "vm3" do |vm3|
    vm3.vm.hostname = "vm3"
    vm3.vm.network "private_network", ip: "192.168.33.12"
  end
  
end