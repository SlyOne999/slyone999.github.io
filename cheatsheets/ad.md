## AD



### Dump Users from DCE/RPC SAMR


#### rpcclient

```
root@kali:$ rpcclient -U '' -N 127.0.0.1
root@kali:$ rpcclient -U 'snovvcrash%Passw0rd!' 127.0.0.1

rpcclient $> enumdomusers
rpcclient $> enumdomgroups
```


#### enum4linux

```
root@kali:$ enum4linux -v -a 127.0.0.1 | tee enum4linux.txt
```


#### nullinux.py

* [github.com/m8r0wn/nullinux](https://github.com/m8r0wn/nullinux)

```
$ git clone https://github.com/m8r0wn/nullinux ~/tools/nullinux && cd ~/tools/nullinux && sudo bash setup.sh && ln -s ~/tools/nullinux/nullinux.py /usr/local/bin/nullinux.py && cd -
$ nullinux.py 127.0.0.1
```


#### samrdump.py

```
root@kali:$ samrdump.py 127.0.0.1
```



### Tricks

List all domain users:

```
PS > Get-ADUser -Filter * -SearchBase "DC=megacorp,DC=local" | select Name,SID
Or
PS > net user /DOMAIN
```

List all domain groups:

```
PS > Get-ADGroup -Filter * -SearchBase "DC=megacorp,DC=local" | select Name,SID
Or
PS > net group /DOMAIN
```

List all user's groups:

```
PS > Get-ADPrincipalGroupMembership snovvcrash | select Name
```

Create new domain user:

```
PS > net user snovvcrash qwe321456 /ADD /DOMAIN
Or
PS > New-ADUser -Name snovvcrash -SamAccountName snovvcrash -Path "CN=Users,DC=megacorp,DC=local" -AccountPassword(ConvertTo-SecureString 'qwe321456' -AsPlainText -Force) -Enabled $true
```

List deleted AD objects (AD recycle bin):

```
PS > Get-ADObject -filter 'isDeleted -eq $true -and name -ne "Deleted Objects"' -includeDeletedObjects
PS > Get-ADObject -LDAPFilter "(objectClass=User)" -SearchBase '<DISTINGUISHED_NAME>' -IncludeDeletedObjects -Properties * |ft
```

* [activedirectorypro.com/enable-active-directory-recycle-bin-server-2016/](https://activedirectorypro.com/enable-active-directory-recycle-bin-server-2016/)
* [blog.stealthbits.com/active-directory-object-recovery-recycle-bin/](https://blog.stealthbits.com/active-directory-object-recovery-recycle-bin/)


#### Misc

* [activedirectorypro.com/active-directory-user-naming-convention/](https://activedirectorypro.com/active-directory-user-naming-convention/)



