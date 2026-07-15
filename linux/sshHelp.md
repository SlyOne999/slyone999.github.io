```
ssh-keygen -R server-name
ssh-keygen -R server.ip.addre.ss
ssh-keygen -R 202.54.1.5
ssh-keygen -R server1.example.com
## for non-standard ssh port ##
ssh-keygen -R 'server1.example.com:PORT'
ssh-keygen -R 'server1.example.com:4122'
```
```
ssh user@server1.example.com
ssh -p user@server1.example.com
```