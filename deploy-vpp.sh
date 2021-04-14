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
vagrant ssh s1 -c "sudo ip addr add 172.16.11.90/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh s1 -c "sudo ip addr add 172.16.12.90/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh s1 -c "sudo ip addr add 172.16.13.90/24 dev vpp2 && sudo ip link set dev vpp2 up"
vagrant ssh s1 -c "sudo ip addr add 172.16.14.90/24 dev vpp3 && sudo ip link set dev vpp3 up"
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
vagrant ssh s2 -c "sudo ip addr add 172.16.21.90/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh s2 -c "sudo ip addr add 172.16.22.90/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh s2 -c "sudo ip addr add 172.16.23.90/24 dev vpp2 && sudo ip link set dev vpp2 up"
vagrant ssh s2 -c "sudo ip addr add 172.16.24.90/24 dev vpp3 && sudo ip link set dev vpp3 up"
vagrant ssh s2 -c "sudo ip a"
vagrant ssh s2 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"

# L1 configuration
VBoxManage controlvm L1 poweroff
VBoxManage modifyvm L1 --nic2 intnet --intnet2 s1l1 --nicpromisc2 allow-all --nictype2 82545EM
VBoxManage modifyvm L1 --nic3 intnet --intnet3 s2l1 --nicpromisc3 allow-all --nictype3 82545EM
VBoxManage startvm L1 --type headless
sleep 50
vagrant ssh l1 -c "sudo vppctl enable tap-inject"
vagrant ssh l1 -c "sudo ip addr add 172.16.11.100/24 dev vpp0 && sudo ip link set dev vpp0 up"
vagrant ssh l1 -c "sudo ip addr add 172.16.21.100/24 dev vpp1 && sudo ip link set dev vpp1 up"
vagrant ssh l1 -c "sudo ip a"
vagrant ssh l1 -c "sudo chmod +x net_provisioning-vpp && ./net_provisioning-vpp"
