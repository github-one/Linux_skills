```
iproute2 is the Linux networking toolkit that replaced net-tools (ifconfig, vconfig, route, arp etc.). 
It has been a standard Linux tool since the early 2000's. It's been included in every distro by default.
Old style network utilities like ifconfig and route are still there just for backwards compatibility.

https://www.baturin.org/docs/iproute2/


iproute2 tools list:
 Address management
 Neighbor (ARP and NDP) table management
 Link management
 Link group management
 Tun and Tap devices
 Tunnel management
 L2TPv3 pseudowire management
 VXLAN management
 Route management
 Policy-based routing
 VRF management
 Network namespace management
 Multicast management
 Network event monitoring
 netconf (sysctl configuration viewing)


Examples:
ip address show
ip address show eth0
ip neighbor show
ip link show
ip link list
ip route
ip route show
ip route add 192.0.2.128/25 via 192.0.2.1
ip route add 2001:db8:1::/48 via 2001:db8:1::1
ip route add 192.0.2.0/25 dev ppp0
ip route add 192.0.2.0/27 via 203.0.113.1 table 10
ip route add 0.0.0.0/0 via 192.168.0.1 table ISP2
ip route add 2001:db8::/48 dev eth1 table 100
ip monitor
ip monitor all
ip -4 monitor route
ip -6 monitor neigh
ip -4 monitor address
ip netconf show dev eth0

```


