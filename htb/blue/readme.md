[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | Blue |
| IP Address | 10.10.10.40 |
| OS | Windows |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.10.40
```
kali@kali:~/Documents/HTB/blue$ nmap -p 1-65535 -T4 -A -v 10.10.10.40
Starting Nmap 7.91 ( https://nmap.org ) at 2020-11-07 12:53 EST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 12:53
Completed NSE at 12:53, 0.00s elapsed
Initiating NSE at 12:53
Completed NSE at 12:53, 0.00s elapsed
Initiating NSE at 12:53
Completed NSE at 12:53, 0.00s elapsed
Initiating Ping Scan at 12:53
Scanning 10.10.10.40 [2 ports]
Completed Ping Scan at 12:53, 0.03s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 12:53
Completed Parallel DNS resolution of 1 host. at 12:53, 0.01s elapsed
Initiating Connect Scan at 12:53
Scanning 10.10.10.40 [65535 ports]
Discovered open port 139/tcp on 10.10.10.40
Discovered open port 135/tcp on 10.10.10.40
Discovered open port 445/tcp on 10.10.10.40
Discovered open port 49153/tcp on 10.10.10.40
Discovered open port 49157/tcp on 10.10.10.40
Discovered open port 49156/tcp on 10.10.10.40
Discovered open port 49154/tcp on 10.10.10.40
Discovered open port 49152/tcp on 10.10.10.40
Discovered open port 49155/tcp on 10.10.10.40
Completed Connect Scan at 12:53, 16.93s elapsed (65535 total ports)
Initiating Service scan at 12:53
Scanning 9 services on 10.10.10.40
Service scan Timing: About 44.44% done; ETC: 12:55 (0:01:08 remaining)
Completed Service scan at 12:54, 59.06s elapsed (9 services on 1 host)
NSE: Script scanning 10.10.10.40.
Initiating NSE at 12:54
Completed NSE at 12:55, 9.35s elapsed
Initiating NSE at 12:55
Completed NSE at 12:55, 0.01s elapsed
Initiating NSE at 12:55
Completed NSE at 12:55, 0.00s elapsed
Nmap scan report for 10.10.10.40
Host is up (0.046s latency).
Not shown: 65526 closed ports
PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Windows 7 Professional 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC
Service Info: Host: HARIS-PC; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 9m55s, deviation: 1s, median: 9m54s
| smb-os-discovery: 
|   OS: Windows 7 Professional 7601 Service Pack 1 (Windows 7 Professional 6.1)
|   OS CPE: cpe:/o:microsoft:windows_7::sp1:professional
|   Computer name: haris-PC
|   NetBIOS computer name: HARIS-PC\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2020-11-07T18:04:51+00:00
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2020-11-07T18:04:50
|_  start_date: 2020-11-07T18:01:22

NSE: Script Post-scanning.
Initiating NSE at 12:55
Completed NSE at 12:55, 0.00s elapsed
Initiating NSE at 12:55
Completed NSE at 12:55, 0.00s elapsed
Initiating NSE at 12:55
Completed NSE at 12:55, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 86.22 seconds
```
