#!/usr/bin/env bash

vagrant up s1 s2 --provider=virtualbox

vagrant up l1 l2 l3 l4 --provider=virtualbox

# S1 configuration
VBoxManage controlvm S1 poweroff
VBoxManage modifyvm S1 --nic2 intnet --intnet2 s1l1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage modifyvm S1 --nic3 intnet --intnet3 s1l2 --nicpromisc3 allow-all --nictype3 82545EM
VBoxManage modifyvm S1 --nic4 intnet --intnet4 s1l3 --nicpromisc4 allow-all --nictype4 82545EM
VBoxManage modifyvm S1 --nic5 intnet --intnet5 s1l4 --nicpromisc5 allow-all --nictype5 82545EM
VBoxManage startvm S1 --type headless
sleep 50
vagrant ssh s1 -c "sudo vppctl enable tap-inject"
vagrant ssh s1 -c "sudo ip addr add 172.16.11.1/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh s1 -c "sudo ip addr add 172.16.12.1/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh s1 -c "sudo ip addr add 172.16.13.1/24 dev vpp2 && sudo ip link set dev vpp2 up"
vagrant ssh s1 -c "sudo ip addr add 172.16.14.1/24 dev vpp3 && sudo ip link set dev vpp3 up"
vagrant ssh s1 -c "sudo ip a"
vagrant ssh s1 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# S2 configuration
VBoxManage controlvm S2 poweroff
VBoxManage modifyvm S2 --nic2 intnet --intnet2 s2l1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage modifyvm S2 --nic3 intnet --intnet3 s2l2 --nicpromisc3 allow-all --nictype3 82545EM
VBoxManage modifyvm S2 --nic4 intnet --intnet4 s2l3 --nicpromisc4 allow-all --nictype4 82545EM
VBoxManage modifyvm S2 --nic5 intnet --intnet5 s2l4 --nicpromisc5 allow-all --nictype5 82545EM
VBoxManage startvm S2 --type headless
sleep 50
vagrant ssh s2 -c "sudo vppctl enable tap-inject"
vagrant ssh s2 -c "sudo ip addr add 172.16.21.1/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh s2 -c "sudo ip addr add 172.16.22.1/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh s2 -c "sudo ip addr add 172.16.23.1/24 dev vpp2 && sudo ip link set dev vpp2 up"
vagrant ssh s2 -c "sudo ip addr add 172.16.24.1/24 dev vpp3 && sudo ip link set dev vpp3 up"
vagrant ssh s2 -c "sudo ip a"
vagrant ssh s2 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# L1 configuration
VBoxManage controlvm L1 poweroff
VBoxManage modifyvm L1 --nic2 intnet --intnet2 s1l1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage modifyvm L1 --nic3 intnet --intnet3 s2l1 --nicpromisc3 allow-all --nictype3 82545EM
VBoxManage modifyvm L1 --nic4 intnet --intnet4 l1h1 --nicpromisc4 allow-all --nictype4 82545EM
VBoxManage modifyvm L1 --nic5 intnet --intnet5 l1h2 --nicpromisc5 allow-all --nictype5 82545EM
VBoxManage startvm L1 --type headless
sleep 50
vagrant ssh l1 -c "sudo vppctl enable tap-inject"
vagrant ssh l1 -c "sudo ip addr add 172.16.11.2/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh l1 -c "sudo ip addr add 172.16.21.2/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh l1 -c "sudo ip addr add 172.16.111.1/24 dev vpp2 && sudo ip link set dev vpp2 up"
vagrant ssh l1 -c "sudo ip addr add 172.16.121.1/24 dev vpp3 && sudo ip link set dev vpp3 up"
vagrant ssh l1 -c "sudo ip a"
vagrant ssh l1 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# L2 configuration
VBoxManage controlvm L2 poweroff
VBoxManage modifyvm L2 --nic2 intnet --intnet2 s1l2 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage modifyvm L2 --nic3 intnet --intnet3 s2l2 --nicpromisc3 allow-all --nictype3 82545EM
VBoxManage modifyvm L2 --nic4 intnet --intnet4 l2h1 --nicpromisc4 allow-all --nictype4 82545EM
VBoxManage modifyvm L2 --nic5 intnet --intnet5 l2h2 --nicpromisc5 allow-all --nictype5 82545EM
VBoxManage startvm L2 --type headless
sleep 50
vagrant ssh l2 -c "sudo vppctl enable tap-inject"
vagrant ssh l2 -c "sudo ip addr add 172.16.12.2/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh l2 -c "sudo ip addr add 172.16.22.2/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh l2 -c "sudo ip addr add 172.16.112.1/24 dev vpp2 && sudo ip link set dev vpp2 up"
vagrant ssh l2 -c "sudo ip addr add 172.16.122.1/24 dev vpp3 && sudo ip link set dev vpp3 up"
vagrant ssh l2 -c "sudo ip a"
vagrant ssh l2 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# L3 configuration
VBoxManage controlvm L3 poweroff
VBoxManage modifyvm L3 --nic2 intnet --intnet2 s1l3 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage modifyvm L3 --nic3 intnet --intnet3 s2l3 --nicpromisc3 allow-all --nictype3 82545EM
VBoxManage modifyvm L3 --nic4 intnet --intnet4 l3h1 --nicpromisc4 allow-all --nictype4 82545EM
VBoxManage modifyvm L3 --nic5 intnet --intnet5 l3h2 --nicpromisc5 allow-all --nictype5 82545EM
VBoxManage startvm L3 --type headless
sleep 50
vagrant ssh l3 -c "sudo vppctl enable tap-inject"
vagrant ssh l3 -c "sudo ip addr add 172.16.13.2/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh l3 -c "sudo ip addr add 172.16.23.2/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh l3 -c "sudo ip addr add 172.16.113.1/24 dev vpp2 && sudo ip link set dev vpp2 up"
vagrant ssh l3 -c "sudo ip addr add 172.16.123.1/24 dev vpp3 && sudo ip link set dev vpp3 up"
vagrant ssh l3 -c "sudo ip a"
vagrant ssh l3 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# L4 configuration
VBoxManage controlvm L4 poweroff
VBoxManage modifyvm L4 --nic2 intnet --intnet2 s1l4 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage modifyvm L4 --nic3 intnet --intnet3 s2l4 --nicpromisc3 allow-all --nictype3 82545EM
VBoxManage modifyvm L4 --nic4 intnet --intnet4 l4h1 --nicpromisc4 allow-all --nictype4 82545EM
VBoxManage modifyvm L4 --nic5 intnet --intnet5 l4h2 --nicpromisc5 allow-all --nictype5 82545EM
VBoxManage startvm L4 --type headless
sleep 50
vagrant ssh l4 -c "sudo vppctl enable tap-inject"
vagrant ssh l4 -c "sudo ip addr add 172.16.14.2/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh l4 -c "sudo ip addr add 172.16.24.2/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh l4 -c "sudo ip addr add 172.16.114.1/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh l4 -c "sudo ip addr add 172.16.124.1/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh l4 -c "sudo ip a"
vagrant ssh l4 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

vagrant up server101 server102 server301 server302 server501 server502 server701 server702 --provider=virtualbox

# server101 configuration
VBoxManage controlvm server101 poweroff
VBoxManage modifyvm server101 --nic2 intnet --intnet2 l1h1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server101 --type headless
sleep 30
vagrant ssh server101 -c "sudo ip addr add 172.16.111.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server101 -c "sudo ip a"
vagrant ssh server101 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# server102 configuration
VBoxManage controlvm server102 poweroff
VBoxManage modifyvm server102 --nic2 intnet --intnet2 l1h2 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server102 --type headless
sleep 30
vagrant ssh server102 -c "sudo ip addr add 172.16.121.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server102 -c "sudo ip a"
vagrant ssh server102 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# server301 configuration
VBoxManage controlvm server301 poweroff
VBoxManage modifyvm server301 --nic2 intnet --intnet2 l2h1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server301 --type headless
sleep 30
vagrant ssh server301 -c "sudo ip addr add 172.16.112.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server301 -c "sudo ip a"
vagrant ssh server301 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# server302 configuration
VBoxManage controlvm server302 poweroff
VBoxManage modifyvm server302 --nic2 intnet --intnet2 l2h2 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server302 --type headless
sleep 30
vagrant ssh server302 -c "sudo ip addr add 172.16.122.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server302 -c "sudo ip a"
vagrant ssh server302 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# server501 configuration
VBoxManage controlvm server501 poweroff
VBoxManage modifyvm server501 --nic2 intnet --intnet2 l3h1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server501 --type headless
sleep 30
vagrant ssh server501 -c "sudo ip addr add 172.16.113.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server501 -c "sudo ip a"
vagrant ssh server501 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# server502 configuration
VBoxManage controlvm server502 poweroff
VBoxManage modifyvm server502 --nic2 intnet --intnet2 l3h2 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server502 --type headless
sleep 30
vagrant ssh server502 -c "sudo ip addr add 172.16.123.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server502 -c "sudo ip a"
vagrant ssh server502 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# server701 configuration
VBoxManage controlvm server701 poweroff
VBoxManage modifyvm server701 --nic2 intnet --intnet2 l4h1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server701 --type headless
sleep 30
vagrant ssh server701 -c "sudo ip addr add 172.16.114.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server701 -c "sudo ip a"
vagrant ssh server701 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# server702 configuration
VBoxManage controlvm server702 poweroff
VBoxManage modifyvm server702 --nic2 intnet --intnet2 l4h2 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage startvm server702 --type headless
sleep 30
vagrant ssh server702 -c "sudo ip addr add 172.16.124.2/24 dev eth1 && sudo ip link set dev eth1 up"
vagrant ssh server702 -c "sudo ip a"
vagrant ssh server702 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

vagrant ssh s1 -c "sudo service frr restart"
vagrant ssh s2 -c "sudo service frr restart"
vagrant ssh l1 -c "sudo service frr restart"
vagrant ssh l2 -c "sudo service frr restart"
vagrant ssh l3 -c "sudo service frr restart"
vagrant ssh l4 -c "sudo service frr restart"
