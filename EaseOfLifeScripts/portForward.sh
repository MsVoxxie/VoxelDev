## Minecraft ##
sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dport 25555 -j ACCEPT
sudo iptables -A INPUT -p udp -d 0/0 -s 0/0 --dport 25555 -j ACCEPT

## FreBuild ##
sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dport 27025 -j ACCEPT
sudo iptables -A INPUT -p udp -d 0/0 -s 0/0 --dport 27025 -j ACCEPT

