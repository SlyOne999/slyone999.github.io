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
| PORT      | SERVICE |
| 135/tcp   | Microsoft Windows RPC |
| 139/tcp   | Microsoft Windows netbios-ssn |
| 445/tcp   | Windows 7 Professional 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP) |
| 49152/tcp | Microsoft Windows RPC |
| 49153/tcp | Microsoft Windows RPC |
| 49154/tcp | Microsoft Windows RPC |
| 49155/tcp | Microsoft Windows RPC |
| 49156/tcp | Microsoft Windows RPC |
| 49157/tcp | Microsoft Windows RPC |

SMBMap

SMB is open so try an SMBMap

```
kali@kali:~/Documents/HTB/blue$ smbmap -H 10.10.10.40 -u anonymous -R
[+] Guest session       IP: 10.10.10.40:445     Name: 10.10.10.40                                       
        Disk                                                    Permissions     Comment
        ----                                                    -----------     -------
        ADMIN$                                                  NO ACCESS       Remote Admin
        C$                                                      NO ACCESS       Default share
        IPC$                                                    NO ACCESS       Remote IPC
        Share                                                   READ ONLY
        .\Share\*
        dr--r--r--                0 Fri Jul 21 02:44:22 2017    .
        dr--r--r--                0 Fri Jul 21 02:44:22 2017    ..
        Users                                                   READ ONLY
        .\Users\*
        dw--w--w--                0 Fri Jul 21 02:56:23 2017    .
        dw--w--w--                0 Fri Jul 21 02:56:23 2017    ..
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Default
        fr--r--r--              174 Fri Jul 14 18:32:23 2017    desktop.ini
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Public
        .\Users\Default\*
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    .
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    AppData
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Desktop
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Documents
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Downloads
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Favorites
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Links
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Music
        fr--r--r--           262144 Sun Jul 16 16:22:24 2017    NTUSER.DAT
        fr--r--r--             1024 Fri Jul 14 18:32:24 2017    NTUSER.DAT.LOG
        fr--r--r--           189440 Sun Jul 16 16:22:24 2017    NTUSER.DAT.LOG1
        fr--r--r--                0 Fri Jul 14 18:37:45 2017    NTUSER.DAT.LOG2
        fr--r--r--            65536 Fri Jul 14 18:32:24 2017    NTUSER.DAT{016888bd-6c6f-11de-8d1d-001e0bcde3ec}.TM.blf
        fr--r--r--           524288 Fri Jul 14 18:32:24 2017    NTUSER.DAT{016888bd-6c6f-11de-8d1d-001e0bcde3ec}.TMContainer00000000000000000001.regtrans-ms
        fr--r--r--           524288 Fri Jul 14 18:32:23 2017    NTUSER.DAT{016888bd-6c6f-11de-8d1d-001e0bcde3ec}.TMContainer00000000000000000002.regtrans-ms
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Pictures
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Saved Games
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Videos
        .\Users\Default\AppData\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Local
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Roaming
        .\Users\Default\AppData\Local\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Microsoft
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Temp
        .\Users\Default\AppData\Local\Microsoft\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Windows
        .\Users\Default\AppData\Local\Microsoft\Windows\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    GameExplorer
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    History
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Temporary Internet Files
        .\Users\Default\AppData\Roaming\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Media Center Programs
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Microsoft
        .\Users\Default\AppData\Roaming\Microsoft\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Internet Explorer
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Windows
        .\Users\Default\AppData\Roaming\Microsoft\Internet Explorer\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Quick Launch
        .\Users\Default\AppData\Roaming\Microsoft\Windows\*
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    .
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    ..
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Cookies
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Network Shortcuts
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Printer Shortcuts
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Recent
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    SendTo
        dw--w--w--                0 Fri Jul 14 18:37:45 2017    Start Menu
        dr--r--r--                0 Fri Jul 14 18:37:45 2017    Templates
        .\Users\Public\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              174 Fri Jul 21 02:40:38 2017    desktop.ini
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Documents
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Downloads
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Favorites
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Libraries
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Music
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Pictures
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Recorded TV
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Videos
        .\Users\Public\Documents\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              278 Fri Jul 21 02:40:38 2017    desktop.ini
        .\Users\Public\Downloads\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              174 Fri Jul 21 02:40:38 2017    desktop.ini
        .\Users\Public\Libraries\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--               88 Fri Jul 21 02:40:38 2017    desktop.ini
        fr--r--r--              876 Fri Jul 21 02:40:38 2017    RecordedTV.library-ms
        .\Users\Public\Music\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              380 Fri Jul 21 02:40:38 2017    desktop.ini
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Sample Music
        .\Users\Public\Music\Sample Music\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              586 Fri Jul 21 02:40:38 2017    desktop.ini
        fr--r--r--          8414449 Fri Jul 21 02:40:38 2017    Kalimba.mp3
        fr--r--r--          4113874 Fri Jul 21 02:40:38 2017    Maid with the Flaxen Hair.mp3
        fr--r--r--          4842585 Fri Jul 21 02:40:38 2017    Sleep Away.mp3
        .\Users\Public\Pictures\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              380 Fri Jul 21 02:40:38 2017    desktop.ini
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Sample Pictures
        .\Users\Public\Pictures\Sample Pictures\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--           879394 Fri Jul 21 02:40:38 2017    Chrysanthemum.jpg
        fr--r--r--           845941 Fri Jul 21 02:40:38 2017    Desert.jpg
        fr--r--r--             1120 Fri Jul 21 02:40:38 2017    desktop.ini
        fr--r--r--           595284 Fri Jul 21 02:40:38 2017    Hydrangeas.jpg
        fr--r--r--           775702 Fri Jul 21 02:40:38 2017    Jellyfish.jpg
        fr--r--r--           780831 Fri Jul 21 02:40:38 2017    Koala.jpg
        fr--r--r--           561276 Fri Jul 21 02:40:38 2017    Lighthouse.jpg
        fr--r--r--           777835 Fri Jul 21 02:40:38 2017    Penguins.jpg
        fr--r--r--           620888 Fri Jul 21 02:40:38 2017    Tulips.jpg
        .\Users\Public\Recorded TV\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--               80 Fri Jul 21 02:40:38 2017    desktop.ini
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Sample Media
        .\Users\Public\Recorded TV\Sample Media\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              171 Fri Jul 21 02:40:38 2017    desktop.ini
        fr--r--r--          9699328 Fri Jul 21 02:40:38 2017    win7_scenic-demoshort_raw.wtv
        .\Users\Public\Videos\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              380 Fri Jul 21 02:40:38 2017    desktop.ini
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    Sample Videos
        .\Users\Public\Videos\Sample Videos\*
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    .
        dw--w--w--                0 Fri Jul 21 02:40:38 2017    ..
        fr--r--r--              326 Fri Jul 21 02:40:38 2017    desktop.ini
        fr--r--r--         26246026 Fri Jul 21 02:40:38 2017    Wildlife.wmv
```
Doesn't appear to be anything here. 

