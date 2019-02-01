sudo chattr -i /etc/resolv.conf
sudo ip link set enp0s31f6 down
sudo ip link set enx3c18a0028c50 down
sudo ip link set enp0s31f6 up
sudo ip link set enx3c18a0028c50 up
sudo dhclient enp0s31f6
sudo dhclient enx3c18a0028c50
sudo ip route delete default via 10.193.37.1
sudo ip route add 10.0.0.0/8 dev enx3c18a0028c50
sudo ip route add 161.105.233.0/24 dev enx3c18a0028c50
sudo sed -i '/nameserver 8.8.8.8/d' /etc/resolv.conf
sudo chattr +i /etc/resolv.conf
