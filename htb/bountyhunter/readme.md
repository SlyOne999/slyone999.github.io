[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | BountyHunter |
| IP Address | 10.10.11.100 |
| OS | Android |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.11.100

```
nmap -Pn -p 1-65535 -T4 -A -v 10.10.11.100
Starting Nmap 7.92 ( https://nmap.org ) at 2021-12-04 23:12 GMT
NSE: Loaded 155 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 23:12
Completed NSE at 23:12, 0.00s elapsed
Initiating NSE at 23:12
Completed NSE at 23:12, 0.00s elapsed
Initiating NSE at 23:12
Completed NSE at 23:12, 0.00s elapsed
Initiating Parallel DNS resolution of 1 host. at 23:12
Completed Parallel DNS resolution of 1 host. at 23:12, 0.01s elapsed
Initiating Connect Scan at 23:12
Scanning 10.10.11.100 [65535 ports]
Discovered open port 80/tcp on 10.10.11.100
Discovered open port 22/tcp on 10.10.11.100
Connect Scan Timing: About 33.12% done; ETC: 23:14 (0:01:03 remaining)
Completed Connect Scan at 23:13, 73.00s elapsed (65535 total ports)
Initiating Service scan at 23:13
Scanning 2 services on 10.10.11.100
Completed Service scan at 23:13, 6.13s elapsed (2 services on 1 host)
NSE: Script scanning 10.10.11.100.
Initiating NSE at 23:13
Completed NSE at 23:14, 1.65s elapsed
Initiating NSE at 23:14
Completed NSE at 23:14, 0.18s elapsed
Initiating NSE at 23:14
Completed NSE at 23:14, 0.01s elapsed
Nmap scan report for 10.10.11.100
Host is up (0.063s latency).
Not shown: 65533 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 d4:4c:f5:79:9a:79:a3:b0:f1:66:25:52:c9:53:1f:e1 (RSA)
|   256 a2:1e:67:61:8d:2f:7a:37:a7:ba:3b:51:08:e8:89:a6 (ECDSA)
|_  256 a5:75:16:d9:69:58:50:4a:14:11:7a:42:c1:b6:23:44 (ED25519)
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))
|_http-title: Bounty Hunters
|_http-favicon: Unknown favicon MD5: 556F31ACD686989B1AFCF382C05846AA
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.41 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 23:14
Completed NSE at 23:14, 0.00s elapsed
Initiating NSE at 23:14
Completed NSE at 23:14, 0.00s elapsed
Initiating NSE at 23:14
Completed NSE at 23:14, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 81.75 seconds

