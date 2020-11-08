[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# RPC #

| Protocol | Ports |
| RPC | 111 |
| RPC | 135 |

## rpcbind ##
The rpcbind utility is a server that converts RPC program numbers into universal addresses. It must be running on the host to be able to make RPC calls on a server on that machine.
rpcbind -p 192.168.1.101

## rpcinfo ##
Probe rpcbind on host using version 2 of the rpcbind protocol, and display a list of all registered RPC programs. If host is not specified, it defaults to the local host. Note that version 2 of the rpcbind protocol was previously known as the portmapper protocol.
rpcinfo -p 192.168.1.101

## rpcclient ##
rpcclient is a utility initially developed to test MS-RPC functionality in Samba itself. It has undergone several stages of development and stability. Many system administrators have now written scripts around it to manage Windows NT clients from their UNIX workstation.
rpcclient --I 192.168.1.101

## showmount ##
Enumerate NFS Shares:
showmount -e 192.168.1.101

## mount ##
Mount NFS Share:
mount -t nfs 192.168.1.101:/home/machine /tmp/mnt -nolock


Initial Enum should attempt the following

srvinfo
netshareenum
netshareenumall
netsharegetinfo
netfileenum
netsessenum
netdiskenum
netconnenum
getanydcname
getdcname
dsr_getdcname
dsr_getdcnameex
dsr_getdcnameex2
dsr_getsitename

enumdata
enumjobs
enumports
enumdomuser
enumdomgroups
enumdomains


