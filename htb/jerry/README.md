[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#
Machine Name - Jerry
IP Address - 10.10.10.95

# Recon

## NMap

```
nmap -Pn -p 1-65535 -T4 -A -v 10.10.10.95

Starting Nmap 7.80 ( https://nmap.org ) at 2020-10-23 15:46 EDT
NSE: Loaded 151 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 15:46
Completed NSE at 15:46, 0.00s elapsed
Initiating NSE at 15:46
Completed NSE at 15:46, 0.00s elapsed
Initiating NSE at 15:46
Completed NSE at 15:46, 0.00s elapsed
Initiating Parallel DNS resolution of 1 host. at 15:46
Completed Parallel DNS resolution of 1 host. at 15:46, 0.02s elapsed
Initiating Connect Scan at 15:46
Scanning 10.10.10.95 [65535 ports]
Discovered open port 8080/tcp on 10.10.10.95
Connect Scan Timing: About 18.70% done; ETC: 15:49 (0:02:15 remaining)
Connect Scan Timing: About 36.98% done; ETC: 15:49 (0:01:59 remaining)
Connect Scan Timing: About 58.89% done; ETC: 15:49 (0:01:10 remaining)
Connect Scan Timing: About 76.93% done; ETC: 15:49 (0:00:39 remaining)
Completed Connect Scan at 15:49, 156.35s elapsed (65535 total ports)
Initiating Service scan at 15:49
Scanning 1 service on 10.10.10.95
Completed Service scan at 15:49, 6.05s elapsed (1 service on 1 host)
NSE: Script scanning 10.10.10.95.
Initiating NSE at 15:49
Completed NSE at 15:49, 0.98s elapsed
Initiating NSE at 15:49
Completed NSE at 15:49, 0.17s elapsed
Initiating NSE at 15:49
Completed NSE at 15:49, 0.00s elapsed
Nmap scan report for 10.10.10.95
Host is up (0.029s latency).
Not shown: 65534 filtered ports
PORT     STATE SERVICE VERSION
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1
|_http-favicon: Apache Tomcat
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache-Coyote/1.1
|_http-title: Apache Tomcat/7.0.88

NSE: Script Post-scanning.
Initiating NSE at 15:49
Completed NSE at 15:49, 0.00s elapsed
Initiating NSE at 15:49
Completed NSE at 15:49, 0.00s elapsed
Initiating NSE at 15:49
Completed NSE at 15:49, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 164.04 seconds


Port 8080 apache tomcat 7.0.88

```

