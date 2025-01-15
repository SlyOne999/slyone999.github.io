# Useful Linux Commands

## Basic Commands

### 1. Prints the current working directory.
````
pwd
````
### 2.	Lists files and directories in the current directory.
````
ls
````
### 3.	Changes the current directory to the specified one.
````
cd [directory] 
````
### 4.	Creates a new directory.
````
mkdir [directory] 
````
### 5.	Removes an empty directory.
````
rmdir [directory] 
````
### 6.	Deletes a file.
````
rm [file] 
````
### 7.	Deletes a directory and its contents.
````
rm -r [directory] 
````
### 8.	Copies a file or directory.
````
cp [source] [destination] 
`````
### 9.	Moves or renames a file/directory.
````
mv [source] [destination]
````
### 10. Creates an empty file or updates the timestamp.
````
touch [file]
````
### File Viewing Commands
### 11. Displays the content of a file.
````
cat [file] 
````
###
12.	Views a file page by page.
````
less [file] 
````
13.	Similar to less, but with fewer features.
````
more [file] 
````
14.	Shows the first N lines of a file.
````
head -n [number] [file] 
````
15.	 Shows the last N lines of a file.
````
tail -n [number] [file]
````
16.	Continuously displays the last lines of a log file.
````
tail -f [file]
````
### Permissions and Ownership
### 17. Changes file permissions.
````
chmod [permissions] [file]
````
### 18.	Changes file ownership.
````
chown [user]:[group] [file] 
````

### Process Management
### 19. Displays all running processes.
````
ps aux 
````
20.	Shows real-time system resource usage.
````
top
````
21. Enhanced version of top (requires installation).
````
htop
````
22.	Terminates a process by its Process ID.
````
kill [PID]
````
23.	Terminates all processes with the given name.
````
kilal [processname]
````
24. Kills processes by matching a name pattern.
````
pkill [pattern]
````
### Networking Commands
25.	Checks network connectivity.
````
ping [hostname/IP]
````
26.	Displays network interfaces (deprecated, use ip a).
````
ifconfig
````
27.	Shows network addresses and interfaces.
````
ip a
````
28.	Lists open ports and connections.
````
netstat -tulnp
````
29.	Alternative to netstat.
````
ss -tulnp
````
30.	Fetches a webpage or data from a URL.
````
curl [URL]
````
31.	Downloads files from the internet.
````
wget [URL]
````

### Disk and Storage Management
32.	Displays disk usage in a human-readable format.
````
df -h
````
33.	Shows the size of a directory.
````
du -sh
````
34.	Mounts a filesystem.
````
mount [device] [directory]
````
35.	Unmounts a filesystem.
````
unmount [device]
````
36.	Lists information about available storage devices.
````
lsblk
````

### User Management
37.	Displays the current logged-in user.
````
whoami
````
38.	Shows currently logged-in users.
````
who
````
39.	Displays the user ID (UID) and group ID (GID).
````
id
````
40.	Runs a command as a superuser.
````
sudo [command]
````
41.	Switches to another user account.
````
su [user]
````
42.	Changes the user password.
````
passwd
````
43.	Adds a new user.
````
adduser [username]
````
44.	Deletes a user.
````
deluser [username]
````

### Searching and Finding Files

45.	Searches for a file by name.
````
find [directory] -name "[filename]"
````
46.	Quickly finds a file (needs updatedb to be run first).
````
locate [filename]
````
47.	Searches for a pattern in a file.
````
grep "[pattern]" [file]
````
48.	Searches recursively in a directory.
````
grep -r "[pattern]" [directory]
````
### Compression and Archiving
49.	Creates a tar archive.
````
tar -cvf archive.tar [files]
````
50.	Extracts a tar archive.
````
tar -xvf archive.tar
````
51.	Creates a compressed tar archive.
````
tar -czvf archive.tar.gz [files]
````
52.	Extracts a compressed tar archive.
````
tar -xzvf archive.tar.gz
````
53.	Creates a zip archive.
````
zip archive.zip [files]
````
54.	Extracts a zip archive.
````
unzip archive.zip
````
### Package Management
#### Debian-based (Ubuntu, Debian)
55.	Updates package lists.
````
apt update
````
56.	Installs updates for all packages.
````
apt upgrade
````
57.	Installs a package.
````
apt install [package]
````
58.	Removes a package.
````
apt remove [package]
````
59.	Installs a .deb package.
````
dpkg -i [package.deb]
````
#### Red Hat-based (Fedora, CentOS)
60.	Updates all packages.
````
dnf update
````
61.	Installs a package.
````
dnf install [package]
````
62.	Removes a package.
````
dnf remove [package]
````
63.	Installs an .rpm package.
````
rpm -i [package.rpm]
````
### Text Processing
64.	Prints text to the terminal.
````
echo "Hello"
````
65.	Sorts the contents of a file.
````
cat file | sort
````
66.	Removes duplicate lines.
````
cat file | uniq
````
67.	Extracts the first column from a file.
````
awk '[print $1}'
````
68.	Replaces text in a file.
````
sed 's/old/new/g' file
````

### System Monitoring
70.	Shows how long the system has been running.
````
uptime
````
70.	Displays memory usage.
````
free -h
````
71.	Shows system performance statistics.
````
vmstat
````
72.	Displays CPU and disk usage statistics.
````
iostat
````
### Logs and Debugging
73.	Displays system boot messages.
````
dmesg
````
74.	Views system logs.
````
journalctl -xe
````
75. Monitors system logs in real-time.
````
tail -f /var/log/syslog 
````
### Shell & Scripting
76.	Creates a shortcut for a command.
````
alias ll='ls -la'
````
77. Removes an alias.
````
unalias 1l
````
78. Shows previously executed commands.
````
history
````
79. Repeats the last command.
````
!!
````
80. Repeats the nth command from history.
````
!n
````

View Network Connections
```
watch ss -tp
````
Show TCP connections -anu=udp
````
netstat -ant
`````
Show UDP connections -anu=udp
````
netstat -anu
`````
Connections with PIDs
````
netstat -tulpn
````
Established Connections
````
lsof -i
````
Connect to an SMB Share
````
smb:// ip /share
````
Mount Windows share
````
share user x.x.x.x c$
````
SMB connect
````
smbclient -0 user\\\\ ip \\ share
````
Set IP and NetMask
````
ifconfig eth# ip I cidr
````
Set virtual interface
````
ifconfig ethO:l ip I cidr
````
Set Gateway
````
route add default gw gw lp
````
Change the MTU size
````
ifconfig eth# mtu [size]
````
Change MAC
````
export l1AC=xx: XX: XX: XX: XX: XX
````
Change MAC
````
ifconfig int hw ether
````
BackTrack MAC Changer
````
macchanger -m l1AC int
````
Built-in Wifi Scanner
````
iwlist int scan
````
Domain Lookup for IP
````
dig -x ip
````
Domain Lookup fo IP
````
host ip
````
Domain SRV lookup
````
host -t SRV service tcp.url.com
````
DNS Zone transfer
````
dig @ ip domain -t AXrR
````
DNS Zone transfer
````
host -1 domain namesvr
````
Print VPN Keys 
````
ip xfrm state list
````
Adds 'hidden' interface
````
ip addr add ip I cidr aev ethO
````
List DHCP assignments
````
/var/log/messages I grep DHCP
````
Block an IP:Port
````
tcpkill host ip and port port
````
Turn on Ip Forwarding
````
echo "1" /proc/sys/net/ipv4/ip forward
````
Add DNS Server
````
echo ''nameserver x.x.x.x'' /etc7resolv.conf
````
