## LDAP

* [book.hacktricks.xyz/pentesting/pentesting-ldap](https://book.hacktricks.xyz/pentesting/pentesting-ldap)



### ldapsearch

Basic syntax:

```
$ ldapsearch -h 127.0.0.1 -x -s <SCOPE> -b <BASE_DN> <QUERY> <FILTER> <FILTER> <FILTER>
```

Get base naming contexts:

```
$ ldapsearch -h 127.0.0.1 -x -s base namingcontexts
```

Extract data for the whole domain catalog and then grep your way through:

```
$ ldapsearch -h 127.0.0.1 -x -s sub -b "DC=megacorp,DC=local" |tee ldap.out
$ cat ldap.out |grep -i memberof
```

Or filter out only what you need:

```
$ ldapsearch -h 127.0.0.1 -x -b "DC=megacorp,DC=local" '(objectClass=User)' sAMAccountName sAMAccountType
```

Get `Remote Management Users` group:

```
$ ldapsearch -h 127.0.0.1 -x -b "DC=megacorp,DC=local" '(memberOf=CN=Remote Management Users,OU=Groups,OU=UK,DC=megacorp,DC=local)' |grep -i memberof
```

Dump LAPS passwords:

```
$ ldapsearch -h 127.0.0.1 -x -b "dc=megacorp,dc=local" '(ms-MCS-AdmPwd=*)' ms-MCS-AdmPwd
```

Simple authentication with ldapsearch:

```
$ ldapsearch -H ldap://127.0.0.1:389/ -x -D 'CN=username,CN=Users,DC=megacorp,DC=local' -w 'Passw0rd!' -s sub -b 'DC=megacorp,DC=local' |tee ldapsearch.log
```

Analyze large output for anomalies by searching for unique strings:

```
$ cat ldapsearch.log | awk '{print $1}' | sort | uniq -c | sort -nr
```



### LDAPPER.py

* [https://github.com/shellster/LDAPPER](https://github.com/shellster/LDAPPER)

```
$ git clone https://github.com/shellster/LDAPPER
$ sudo python3 -m pip install -r requirements.txt
```



### windapsearch

* [github.com/ropnop/windapsearch](https://github.com/ropnop/windapsearch)

Enumerate all AD Computers:

```
./windapsearch.py -u 'megacorp.local\snovvcrash' -p 'Passw0rd!' --dc 127.0.0.1 -C
```



### ldapdomaindump

* [github.com/dirkjanm/ldapdomaindump](https://github.com/dirkjanm/ldapdomaindump)



### ad-ldap-enum

* [github.com/CroweCybersecurity/ad-ldap-enum](https://github.com/CroweCybersecurity/ad-ldap-enum)



### Nmap NSE

```
$ nmap -n -Pn --script=ldap-rootdse 127.0.0.1 -p389
$ nmap -n -Pn --script=ldap-search 127.0.0.1 -p389
$ nmap -n -Pn --script=ldap-brute 127.0.0.1 -p389
$ nmap -p 139,445 --script=/usr/share/nmap/scripts/smb-os-discovery --script-args=unsafe=1 127.0.0.1
```



