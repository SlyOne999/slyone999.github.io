[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Protocol Name #

| Protocol | Ports |
| XXX | 111 |
| XXX | 135 |

## relevant command##

## xxxxxx ##

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


