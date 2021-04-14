Vagrant.configure("2") do |config|
# Spine Switch 1  
  config.vm.define "s1" do |s1|
      s1.vm.box = "vpasias/unf"
      s1.vm.hostname = "S1"
      s1.vm.provider "virtualbox" do |vbox|
            vbox.name = "S1"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      s1.vm.provision "file", source: "gen_frr_config-vpp.py", destination: "gen_frr_config-vpp.py"
      s1.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Spine Switch 2  
  config.vm.define "s2" do |s2|
      s2.vm.box = "vpasias/unf"
      s2.vm.hostname = "S2"
      s2.vm.provider "virtualbox" do |vbox|
            vbox.name = "S2"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      s2.vm.provision "file", source: "gen_frr_config-vpp.py", destination: "gen_frr_config-vpp.py"
      s2.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Leaf Switch 1
  config.vm.define "l1" do |l1|
      l1.vm.box = "vpasias/unf"
      l1.vm.hostname = "L1"
      l1.vm.provider "virtualbox" do |vbox|
            vbox.name = "L1"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      l1.vm.provision "file", source: "gen_frr_config-vpp.py", destination: "gen_frr_config-vpp.py"
      l1.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Leaf Switch 2
  config.vm.define "l2" do |l2|
      l2.vm.box = "vpasias/unf"
      l2.vm.hostname = "L2"
      l2.vm.provider "virtualbox" do |vbox|
            vbox.name = "L2"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      l2.vm.provision "file", source: "gen_frr_config-vpp.py", destination: "gen_frr_config-vpp.py"
      l2.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Leaf Switch 3  
  config.vm.define "l3" do |l3|
      l3.vm.box = "vpasias/unf"
      l3.vm.hostname = "L3"
      l3.vm.provider "virtualbox" do |vbox|
            vbox.name = "L3"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      l3.vm.provision "file", source: "gen_frr_config-vpp.py", destination: "gen_frr_config-vpp.py"
      l3.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Leaf Switch 4  
  config.vm.define "l4" do |l4|
      l4.vm.box = "vpasias/unf"
      l4.vm.hostname = "L4"
      l4.vm.provider "virtualbox" do |vbox|
            vbox.name = "L4"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      l4.vm.provision "file", source: "gen_frr_config-vpp.py", destination: "gen_frr_config-vpp.py"
      l4.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 1  
  config.vm.define "server101" do |ce1|
      ce1.vm.box = "generic/ubuntu2004"
      ce1.vm.hostname = "server101"
      ce1.vm.provider "virtualbox" do |vbox|
            vbox.name = "server101"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce1.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 2  
  config.vm.define "server102" do |ce2|
      ce2.vm.box = "generic/ubuntu2004"
      ce2.vm.hostname = "server102"
      ce2.vm.provider "virtualbox" do |vbox|
            vbox.name = "server102"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce2.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 3  
  config.vm.define "server301" do |ce3|
      ce3.vm.box = "generic/ubuntu2004"
      ce3.vm.hostname = "server301"
      ce3.vm.provider "virtualbox" do |vbox|
            vbox.name = "server301"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce3.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 4  
  config.vm.define "server302" do |ce4|
      ce4.vm.box = "generic/ubuntu2004"
      ce4.vm.hostname = "server302"
      ce4.vm.provider "virtualbox" do |vbox|
            vbox.name = "server302"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce4.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 5  
  config.vm.define "server501" do |ce5|
      ce5.vm.box = "generic/ubuntu2004"
      ce5.vm.hostname = "server501"
      ce5.vm.provider "virtualbox" do |vbox|
            vbox.name = "server501"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce5.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 6   
  config.vm.define "server502" do |ce6|
      ce6.vm.box = "generic/ubuntu2004"
      ce6.vm.hostname = "server502"
      ce6.vm.provider "virtualbox" do |vbox|
            vbox.name = "server502"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce6.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 7    
  config.vm.define "server701" do |ce7|
      ce7.vm.box = "generic/ubuntu2004"
      ce7.vm.hostname = "server701"
      ce7.vm.provider "virtualbox" do |vbox|
            vbox.name = "server701"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce7.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end
# Server Node 8  
  config.vm.define "server702" do |ce8|
      ce8.vm.box = "generic/ubuntu2004"
      ce8.vm.hostname = "server702"
      ce8.vm.provider "virtualbox" do |vbox|
            vbox.name = "server702"
            vbox.memory = 16384
            vbox.cpus = 4
            vbox.customize ["modifyvm", :id, "--chipset", "ich9"]
            vbox.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end
      ce8.vm.provision "file", source: "net_provisioning-vpp", destination: "net_provisioning-vpp"
  end  
  
end
