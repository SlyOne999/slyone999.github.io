[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | Breadcrumbs |
| IP Address | 10.10.10.228 |
| OS | Windows |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.10.228

Starting Nmap 7.91 ( https://nmap.org ) at 2021-03-29 19:50 BST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 19:50
Completed NSE at 19:50, 0.00s elapsed
Initiating NSE at 19:50
Completed NSE at 19:50, 0.00s elapsed
Initiating NSE at 19:50
Completed NSE at 19:50, 0.00s elapsed
Initiating Ping Scan at 19:50
Scanning 10.10.10.228 [2 ports]
Completed Ping Scan at 19:50, 0.02s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 19:50
Completed Parallel DNS resolution of 1 host. at 19:50, 0.02s elapsed
Initiating Connect Scan at 19:50
Scanning 10.10.10.228 [65535 ports]
Discovered open port 139/tcp on 10.10.10.228
Discovered open port 80/tcp on 10.10.10.228
Discovered open port 3306/tcp on 10.10.10.228
Discovered open port 443/tcp on 10.10.10.228
Discovered open port 22/tcp on 10.10.10.228
Discovered open port 445/tcp on 10.10.10.228
Discovered open port 135/tcp on 10.10.10.228
Discovered open port 49666/tcp on 10.10.10.228
Discovered open port 49667/tcp on 10.10.10.228
Discovered open port 49669/tcp on 10.10.10.228
Discovered open port 49664/tcp on 10.10.10.228
Discovered open port 49665/tcp on 10.10.10.228
Discovered open port 49668/tcp on 10.10.10.228
Discovered open port 5040/tcp on 10.10.10.228
Discovered open port 7680/tcp on 10.10.10.228
Completed Connect Scan at 19:51, 28.27s elapsed (65535 total ports)
Initiating Service scan at 19:51
Scanning 15 services on 10.10.10.228
Service scan Timing: About 53.33% done; ETC: 19:52 (0:00:37 remaining)
Completed Service scan at 19:54, 156.99s elapsed (15 services on 1 host)
NSE: Script scanning 10.10.10.228.
Initiating NSE at 19:54
Completed NSE at 19:54, 14.75s elapsed
Initiating NSE at 19:54
Completed NSE at 19:54, 1.54s elapsed
Initiating NSE at 19:54
Completed NSE at 19:54, 0.01s elapsed
Nmap scan report for 10.10.10.228
Host is up (0.028s latency).
Not shown: 65520 closed ports
PORT      STATE SERVICE       VERSION
22/tcp    open  tcpwrapped
|_ssh-hostkey: ERROR: Script execution failed (use -d to debug)
80/tcp    open  http          Apache httpd 2.4.46 ((Win64) OpenSSL/1.1.1h PHP/8.0.1)
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.46 (Win64) OpenSSL/1.1.1h PHP/8.0.1
|_http-title: Library
135/tcp   open  msrpc         Microsoft Windows RPC
139/tcp   open  netbios-ssn   Microsoft Windows netbios-ssn
443/tcp   open  ssl/http      Apache httpd 2.4.46 ((Win64) OpenSSL/1.1.1h PHP/8.0.1)
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.46 (Win64) OpenSSL/1.1.1h PHP/8.0.1
|_http-title: Library
| ssl-cert: Subject: commonName=localhost
| Issuer: commonName=localhost
| Public Key type: rsa
| Public Key bits: 1024
| Signature Algorithm: sha1WithRSAEncryption
| Not valid before: 2009-11-10T23:48:47
| Not valid after:  2019-11-08T23:48:47
| MD5:   a0a4 4cc9 9e84 b26f 9e63 9f9e d229 dee0
|_SHA-1: b023 8c54 7a90 5bfa 119c 4e8b acca eacf 3649 1ff6
|_ssl-date: TLS randomness does not represent time
| tls-alpn: 
|_  http/1.1
445/tcp   open  microsoft-ds?
3306/tcp  open  mysql?
| fingerprint-strings: 
|   DNSStatusRequestTCP, DNSVersionBindReqTCP, GenericLines, GetRequest, NULL, SMBProgNeg, SSLSessionReq, giop: 
|_    Host '10.10.14.23' is not allowed to connect to this MariaDB server
5040/tcp  open  unknown
7680/tcp  open  pando-pub?
49664/tcp open  msrpc         Microsoft Windows RPC
49665/tcp open  msrpc         Microsoft Windows RPC
49666/tcp open  msrpc         Microsoft Windows RPC
49667/tcp open  msrpc         Microsoft Windows RPC
49668/tcp open  msrpc         Microsoft Windows RPC
49669/tcp open  msrpc         Microsoft Windows RPC
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port3306-TCP:V=7.91%I=7%D=3/29%Time=606221B0%P=x86_64-pc-linux-gnu%r(NU
SF:LL,4A,"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20allow
SF:ed\x20to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(GenericLines
SF:,4A,"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20allowed
SF:\x20to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(GetRequest,4A,
SF:"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20allowed\x20
SF:to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(DNSVersionBindReqT
SF:CP,4A,"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20allow
SF:ed\x20to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(DNSStatusReq
SF:uestTCP,4A,"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20
SF:allowed\x20to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(SSLSess
SF:ionReq,4A,"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20a
SF:llowed\x20to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(SMBProgN
SF:eg,4A,"F\0\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20allow
SF:ed\x20to\x20connect\x20to\x20this\x20MariaDB\x20server")%r(giop,4A,"F\0
SF:\0\x01\xffj\x04Host\x20'10\.10\.14\.23'\x20is\x20not\x20allowed\x20to\x
SF:20connect\x20to\x20this\x20MariaDB\x20server");
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: 6m53s
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2021-03-29T19:01:00
|_  start_date: N/A

NSE: Script Post-scanning.
Initiating NSE at 19:54
Completed NSE at 19:54, 0.00s elapsed
Initiating NSE at 19:54
Completed NSE at 19:54, 0.00s elapsed
Initiating NSE at 19:54
Completed NSE at 19:54, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 202.68 seconds


## Open Services
| PORT | SERVICE |
| 22 | SSH |
| 80 | http |
| 135 | msrpc |
| 139 | netbios-ssn |
| 443 | ssl/http | 
| 445 | microsoft-ds? |
| 3306 | mysql? |
| 5040 | unknown |
| 7680 | pando-pub? |
| 49664 | msrpc |
| 49665 | msrpc |
| 49666 | msrpc |
| 49667 | msrpc |
| 49668 | msrpc |
| 49669 | msrpc |

## Port 22
Connection refused

## Port 80 & 443 
Library System

dirbuster find the following url exists

https://breadcrumbs/portal/login.php

Add a user and can then login. Nothing useful
Acccess the user management button and find the following users

Username 	Age 	Position
alex	21	Admin
paul	24	Admin
jack	22	Admin
olivia	24	Data Analyst
john	39	Ad Manager
emma	20	Developer
william	20	Developer
lucas	25	Developer
sirine	27	Reception
juliette	20	Server Admin
support	-	Service
mrevil	-	Awaiting approval
test	-	Awaiting approval
slyone	-	Awaiting approval


Under Check Tasks find

Issues
ID 	Type 	Description 	Nuke it
1	Service	Add library checkout 	
2	Service	Store book information in database 	
3	Maintenance	Fix PHPSESSID infinite session duration 	
4	Other	Finish installing password managers on all computers 	
5	URGENT	Fix logout button. Before the weekend if possble. 	


## Dirbuster Output
Really struggled to get DirBuster to complete but did find the following details

DirBuster 1.0-RC1 - Report
http://www.owasp.org/index.php/Category:OWASP_DirBuster_Project
Report produced on Wed Mar 31 12:10:59 BST 2021
--------------------------------

http://breadcrumbs:80
--------------------------------
Directories found during testing:

Dirs found with a 200 response:

/
/icons/
/php/
/js/
/books/
/portal/
/portal/php/
/portal/uploads/
/css/
/includes/
/portal/assets/
/portal/assets/css/
/portal/assets/js/
/portal/assets/webfonts/
/icons/small/
/db/
/portal/includes/
/Books/
/portal/db/
/portal/vendor/
/portal/vendor/comely-io/
/portal/vendor/composer/
/portal/vendor/firebase/
/portal/vendor/comely-io/data-types/
/portal/vendor/furqansiddiqui/
/portal/vendor/firebase/php-jwt/
/portal/vendor/furqansiddiqui/base58check-php/
/portal/vendor/comely-io/data-types/src/
/portal/vendor/comely-io/data-types/src/BcMath/
/portal/vendor/furqansiddiqui/base58check-php/src/
/portal/vendor/firebase/php-jwt/src/
/portal/vendor/comely-io/data-types/src/Buffer/
/portal/vendor/furqansiddiqui/base58check-php/src/Result/
/portal/vendor/comely-io/data-types/src/Buffer/Base16/
/portal/vendor/comely-io/data-types/src/Strings/
/portal/vendor/comely-io/data-types/src/Buffer/Binary/

Dirs found with a 403 response:

/cgi-bin/
/licenses/

Dirs found with a 503 response:

/examples/


--------------------------------
Files found during testing:

Files found with a 200 responce:

/index.php
/php/books.php
/js/main.js
/js/books.js
/books/book3.html
/books/book7.html
/books/book8.html
/books/book9.html
/books/book10.html
/books/book11.html
/books/book12.html
/books/book14.html
/portal/index.php
/portal/php/admins.php
/portal/signup.php
/portal/login.php
/css/all.css
/css/main.css
/includes/bookController.php
/includes/footer.php
/Index.php
/portal/assets/css/all.css
/portal/assets/css/main.css
/portal/assets/js/files.js
/portal/assets/css/style.css
/portal/assets/js/main.js
/portal/assets/webfonts/fa-brands-400.eot
/portal/assets/webfonts/fa-brands-400.svg
/portal/assets/webfonts/fa-brands-400.ttf
/portal/assets/webfonts/fa-brands-400.woff
/portal/assets/webfonts/fa-brands-400.woff2
/portal/assets/webfonts/fa-regular-400.eot
/portal/assets/webfonts/fa-regular-400.svg
/portal/assets/webfonts/fa-regular-400.ttf
/portal/assets/webfonts/fa-regular-400.woff
/portal/assets/webfonts/fa-regular-400.woff2
/portal/assets/webfonts/fa-solid-900.eot
/portal/assets/webfonts/fa-solid-900.svg
/portal/assets/webfonts/fa-solid-900.ttf
/portal/assets/webfonts/fa-solid-900.woff
/portal/assets/webfonts/fa-solid-900.woff2
/db/db.php
/portal/includes/fileController.php
/portal/includes/footer.php
/portal/includes/issuesController.php
/portal/includes/usersController.php
/portal/Index.php
/Books/book3.html
/Books/book7.html
/Books/book8.html
/Books/book9.html
/Books/book10.html
/Books/book11.html
/Books/book12.html
/Books/book14.html
/php/Books.php
/portal/Login.php
/portal/db/db.php
/portal/logout.php
/portal/vendor/autoload.php
/portal/vendor/composer/ClassLoader.php
/portal/vendor/composer/InstalledVersions.php
/portal/vendor/comely-io/data-types/LICENSE
/portal/vendor/composer/LICENSE
/portal/vendor/comely-io/data-types/composer.json
/portal/vendor/composer/autoload_classmap.php
/portal/vendor/composer/autoload_namespaces.php
/portal/vendor/furqansiddiqui/base58check-php/LICENSE
/portal/vendor/firebase/php-jwt/LICENSE
/portal/vendor/composer/autoload_psr4.php
/portal/vendor/furqansiddiqui/base58check-php/composer.json
/portal/vendor/firebase/php-jwt/composer.json
/portal/vendor/composer/autoload_real.php
/portal/vendor/composer/autoload_static.php
/portal/vendor/comely-io/data-types/src/BcNumber.php
/portal/vendor/composer/installed.json
/portal/vendor/comely-io/data-types/src/BcMath/BaseConvert.php
/portal/vendor/composer/installed.php
/portal/vendor/furqansiddiqui/base58check-php/src/Base58.php
/portal/vendor/firebase/php-jwt/src/BeforeValidException.php
/portal/vendor/comely-io/data-types/src/BcMath/BcMath.php
/portal/vendor/composer/platform_check.php
/portal/vendor/furqansiddiqui/base58check-php/src/Base58Check.php
/portal/vendor/firebase/php-jwt/src/ExpiredException.php
/portal/vendor/firebase/php-jwt/src/JWK.php
/portal/vendor/comely-io/data-types/src/DataTypes.php
/portal/vendor/comely-io/data-types/src/Buffer/AbstractBuffer.php
/portal/vendor/firebase/php-jwt/src/JWT.php
/portal/vendor/comely-io/data-types/src/Integers.php
/portal/vendor/comely-io/data-types/src/Buffer/Base16.php
/portal/vendor/furqansiddiqui/base58check-php/src/Result/Base58Encoded.php
/portal/vendor/firebase/php-jwt/src/SignatureInvalidException.php
/portal/vendor/comely-io/data-types/src/Buffer/Base64.php
/portal/vendor/comely-io/data-types/src/Buffer/Binary.php
/portal/vendor/comely-io/data-types/src/Buffer/Base16/Decoder.php
/portal/vendor/comely-io/data-types/src/Strings/ASCII.php
/portal/vendor/comely-io/data-types/src/Buffer/Bitwise.php
/portal/vendor/comely-io/data-types/src/Buffer/Binary/ByteReader.php
/portal/vendor/comely-io/data-types/src/Buffer/Binary/Digest.php
/portal/vendor/comely-io/data-types/src/Buffer/Binary/LenSize.php
/portal/cookie.php

## Checking URLS
Running through URLS that look interesting

### https://breadcrumbs/portal/php/admins.php
This shows the following information

Current Helpers
Name 	Status
Alex 	Offline
Emma 	Offline
Jack 	Snoozing
John 	Active
Lucas 	Offline
Olivia 	Active
Paul 	Active
William 	Snoozing

Can the PhPSession for these users be used?





Cookie: token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7InVzZXJuYW1lIjoic2x5b25lIn19.WZtC5Ehwq66y4899dP_hf57jmSQawaBkMpwP-KX2mkA; PHPSESSID=slyone47200b180ccd6835d25d034eeb6e6390