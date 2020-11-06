[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#
| Machine Name | NetMon |
| IP Address | 10.10.10.152 |
| OS | Windows |

|| Test || Test | Test |
| | | |
| a | a | a |

# Recon

## NMap

nmap -Pn -p 1-65535 -T4 -A -v 10.10.10.152

```
kali@kali:~/Documents/HTB/netmon$ nmap -Pn -p 1-65535 -T4 -A -v 10.10.10.152
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times will be slower.
Starting Nmap 7.91 ( https://nmap.org ) at 2020-11-06 16:04 EST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 16:04
Completed NSE at 16:04, 0.00s elapsed
Initiating NSE at 16:04
Completed NSE at 16:04, 0.00s elapsed
Initiating NSE at 16:04
Completed NSE at 16:04, 0.00s elapsed
Initiating Connect Scan at 16:04
Scanning netmon (10.10.10.152) [65535 ports]
Discovered open port 445/tcp on 10.10.10.152
Discovered open port 135/tcp on 10.10.10.152
Discovered open port 139/tcp on 10.10.10.152
Discovered open port 21/tcp on 10.10.10.152
Discovered open port 47001/tcp on 10.10.10.152
Discovered open port 49664/tcp on 10.10.10.152
Discovered open port 49669/tcp on 10.10.10.152
Discovered open port 5985/tcp on 10.10.10.152
Discovered open port 49667/tcp on 10.10.10.152
Increasing send delay for 10.10.10.152 from 0 to 5 due to max_successful_tryno increase to 5
Increasing send delay for 10.10.10.152 from 5 to 10 due to max_successful_tryno increase to 6
Connect Scan Timing: About 56.48% done; ETC: 16:05 (0:00:30 remaining)
Connect Scan Timing: About 60.84% done; ETC: 16:06 (0:00:44 remaining)
Connect Scan Timing: About 67.30% done; ETC: 16:07 (0:00:55 remaining)
Discovered open port 49668/tcp on 10.10.10.152
Connect Scan Timing: About 75.66% done; ETC: 16:08 (0:00:55 remaining)
Connect Scan Timing: About 84.02% done; ETC: 16:08 (0:00:43 remaining)
Discovered open port 49665/tcp on 10.10.10.152
Discovered open port 49666/tcp on 10.10.10.152
Completed Connect Scan at 16:09, 339.14s elapsed (65535 total ports)
Initiating Service scan at 16:09
Scanning 12 services on netmon (10.10.10.152)
Service scan Timing: About 58.33% done; ETC: 16:11 (0:00:39 remaining)
Completed Service scan at 16:10, 54.04s elapsed (12 services on 1 host)
NSE: Script scanning 10.10.10.152.
Initiating NSE at 16:10
NSE: [ftp-bounce] PORT response: 501 Server cannot accept argument.
Completed NSE at 16:10, 8.23s elapsed
Initiating NSE at 16:10
Completed NSE at 16:10, 0.20s elapsed
Initiating NSE at 16:10
Completed NSE at 16:10, 0.00s elapsed
Nmap scan report for netmon (10.10.10.152)
Host is up (0.024s latency).
Not shown: 65523 closed ports
PORT      STATE SERVICE      VERSION
21/tcp    open  ftp          Microsoft ftpd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
| 02-02-19  11:18PM                 1024 .rnd
| 02-25-19  09:15PM       <DIR>          inetpub
| 07-16-16  08:18AM       <DIR>          PerfLogs
| 02-25-19  09:56PM       <DIR>          Program Files
| 02-02-19  11:28PM       <DIR>          Program Files (x86)
| 02-03-19  07:08AM       <DIR>          Users
|_02-25-19  10:49PM       <DIR>          Windows
| ftp-syst: 
|_  SYST: Windows_NT
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Microsoft Windows Server 2008 R2 - 2012 microsoft-ds
5985/tcp  open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
47001/tcp open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
49664/tcp open  msrpc        Microsoft Windows RPC
49665/tcp open  msrpc        Microsoft Windows RPC
49666/tcp open  msrpc        Microsoft Windows RPC
49667/tcp open  msrpc        Microsoft Windows RPC
49668/tcp open  msrpc        Microsoft Windows RPC
49669/tcp open  msrpc        Microsoft Windows RPC
Service Info: OSs: Windows, Windows Server 2008 R2 - 2012; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 4m50s, deviation: 0s, median: 4m50s
| smb-security-mode: 
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2020-11-06T21:15:43
|_  start_date: 2020-11-06T21:08:47

NSE: Script Post-scanning.
Initiating NSE at 16:10
Completed NSE at 16:10, 0.00s elapsed
Initiating NSE at 16:10
Completed NSE at 16:10, 0.00s elapsed
Initiating NSE at 16:10
Completed NSE at 16:10, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 402.41 seconds
```