## Useful Linux Commands

View Network Connections
```
watch ss -tp
````
Show TCP connections -anu=udp
````
netstat -ant
`````
Show UDP connections -anu=udp
````
netstat -anu
`````
Connections with PIDs
````
netstat -tulpn
````
Established Connections
````
lsof -i
````
Connect to an SMB Share
````
smb:// ip /share
````
Mount Windows share
````
share user x.x.x.x c$
````
SMB connect
````
smbclient -0 user\\\\ ip \\ share
````
Set IP and NetMask
````
ifconfig eth# ip I cidr
````
Set virtual interface
````
ifconfig ethO:l ip I cidr
````
Set Gateway
````
route add default gw gw lp
````
Change the MTU size
````
ifconfig eth# mtu [size]
````
Change MAC
````
export l1AC=xx: XX: XX: XX: XX: XX
````
Change MAC
````
ifconfig int hw ether
````
BackTrack MAC Changer
````
macchanger -m l1AC int
````
Built-in Wifi Scanner
````
iwlist int scan
````
Domain Lookup for IP
````
dig -x ip
````
Domain Lookup fo IP
````
host ip
````
Domain SRV lookup
````
host -t SRV service tcp.url.com
````
DNS Zone transfer
````
dig @ ip domain -t AXrR
````
DNS Zone transfer
````
host -1 domain namesvr
````
Print VPN Keys 
````
ip xfrm state list
````
Adds 'hidden' interface
````
ip addr add ip I cidr aev ethO
````
List DHCP assignments
````
/var/log/messages I grep DHCP
````
Block an IP:Port
````
tcpkill host ip and port port
````
Turn on Ip Forwarding
````
echo "1" /proc/sys/net/ipv4/ip forward
````
Add DNS Server
````
echo ''nameserver x.x.x.x'' /etc7resolv.conf
````
