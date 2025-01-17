# Useful Linux Commands


## Basic Commands

### Prints the current working directory

```bash
pwd
```

### Lists files and directories in the current directory

```bash
ls
```

### Changes the current directory to the specified one

```bash
cd [directory] 
```

### Creates a new directory

```bash
mkdir [directory] 
```

### Removes an empty directory

```bash
rmdir [directory] 
```

### Deletes a file

```bash
rm [file] 
```

### Deletes a directory and its contents

```bash
rm -r [directory] 
```

### Copies a file or directory

```bash
cp [source] [destination] 
```

### Moves or renames a file/directory

```bash
mv [source] [destination] 
```

### Creates an empty file or updates the timestamp

```bash
touch [file] 
```

## File Viewing Commands

### Displays the content of a file

```bash
cat [file] 
```

### Views a file page by page

```bash
less [file] 
```

### Similar to less, but with fewer features

```bash
more [file] 
```

### Shows the first N lines of a file

```bash
head -n [number] [file] 
```

### Shows the last N lines of a file

```bash
tail -n [number] [file] 
```

### Continuously displays the last lines of a log file

```bash
tail -f [file] 
```

## Permissions and Ownership

### Changes file permissions

```bash
chmod [permissions] [file] 
```

### Changes file ownership

```bash
chown [user]:[group] [file] 
```

## Process Management

### Displays all running processes

```bash
ps aux 
```

### Shows real-time system resource usage

```bash
top
```

### Enhanced version of top (requires installation)

```bash
htop
```

### Terminates a process by its Process ID

```bash
kill [PID] 
```

### Terminates all processes with the given name

```bash
kilal [processname] 
```

### Kills processes by matching a name pattern

```bash
pkill [pattern] 
```

## Networking Commands

### Checks network connectivity

```bash
ping [hostname/IP] 
```

### Displays network interfaces (deprecated, use ip a)

```bash
ifconfig
```

### Shows network addresses and interfaces

```bash
ip a
```

### Lists open ports and connections

```bash
netstat -tulnp
```

### Alternative to netstat

```bash
ss -tulnp
```

### Fetches a webpage or data from a URL

```bash
curl [URL] 
```

### Downloads files from the internet

```bash
wget [URL] 
```

## Disk and Storage Management

### Displays disk usage in a human-readable format

```bash
df -h
```

### Shows the size of a directory

```bash
du -sh
```

### Mounts a filesystem

```bash
mount [device] [directory] 
```

### Unmounts a filesystem

```bash
unmount [device] 
```

### Lists information about available storage devices

```bash
lsblk
```

## User Management

### Displays the current logged-in user

```bash
whoami
```

### Shows currently logged-in users

```bash
who
```

### Displays the user ID (UID) and group ID (GID)

```bash
id
```

### Runs a command as a superuser

```bash
sudo [command] 
```

### Switches to another user account

```bash
su [user] 
```

### Changes the user password

```bash
passwd
```

### Adds a new user

```bash
adduser [username] 
```

### Deletes a user

```bash
deluser [username] 
```

## Searching and Finding Files

### Searches for a file by name

```bash
find [directory] -name "[filename]" 
```

### Quickly finds a file (needs updatedb to be run first)

```bash
locate [filename] 
```

### Searches for a pattern in a file

```bash
grep "[pattern]" [file] 
```

### Searches recursively in a directory

```bash
grep -r "[pattern]" [directory] 
```

## Compression and Archiving

### Creates a tar archive

```bash
tar -cvf archive.tar [files] 
```

### Extracts a tar archive

```bash
tar -xvf archive.tar
```

### Creates a compressed tar archive

```bash
tar -czvf archive.tar.gz [files]
```

### Extracts a compressed tar archive

```bash
tar -xzvf archive.tar.gz
```

### Creates a zip archive

```bash
zip archive.zip [files]
```

### Extracts a zip archive

```bash
unzip archive.zip
```

## Package Management

### Updates package lists - Debian-based (Ubuntu, Debian)

```bash
apt update
```

### Installs updates for all packages - Debian-based (Ubuntu, Debian)

```bash
apt upgrade
```

### Installs a package - Debian-based (Ubuntu, Debian)

```bash
apt install [package]
```

### Removes a package - Debian-based (Ubuntu, Debian)

```bash
apt remove [package]
```

### Installs a .deb package - Debian-based (Ubuntu, Debian)

```bash
dpkg -i [package.deb]
```

### Updates all packages - Red Hat-based (Fedora, CentOS)

```bash
dnf update
```

### Installs a package - Red Hat-based (Fedora, CentOS)

```bash
dnf install [package]
```

### Removes a package - Red Hat-based (Fedora, CentOS)

```bash
dnf remove [package]
```

### Installs an .rpm package - Red Hat-based (Fedora, CentOS)

```bash
rpm -i [package.rpm]
```

## Text Processing

### Prints text to the terminal

```bash
echo "Hello"
```

### Sorts the contents of a file

```bash
cat file | sort
```

### Removes duplicate lines

```bash
cat file | uniq
```

### Extracts the first column from a file

```bash
awk '[print $1}'
```

### Replaces text in a file

```bash
sed 's/old/new/g' file
```

## System Monitoring

### Shows how long the system has been running

```bash
uptime
```

### Displays memory usage

```bash
free -h
```

### Shows system performance statistics

```bash
vmstat
```

### Displays CPU and disk usage statistics

```bash
iostat
```

## Logs and Debugging

### Displays system boot messages

```bash
dmesg
```

### Views system logs

```bash
journalctl -xe
```

### Monitors system logs in real-time

```bash
tail -f /var/log/syslog 
```

## Shell & Scripting

### Creates a shortcut for a command

```bash
alias ll='ls -la'
```

### Removes an alias

```bash
unalias 1l
```

### Shows previously executed commands

```bash
history
```

### Repeats the last command

```bash
!!
```

### Repeats the nth command from history

```bash
!n
```

### View Network Connections

```bash
watch ss -tp
```

### Show TCP connections -anu=udp

```bash
netstat -ant
```

### Show UDP connections -anu=udp

```bash
netstat -anu
```

### Connections with PIDs

```bash
netstat -tulpn
```

### Established Connections

```bash
lsof -i
```

### Connect to an SMB Share

```bash
smb:// ip /share
```

### Mount Windows share

```bash
share user x.x.x.x c$
```

### SMB connect

```bash
smbclient -0 user\\\\ ip \\ share
```

### Set IP and NetMask

```bash
ifconfig eth# ip I cidr
```

### Set virtual interface

```bash
ifconfig ethO:l ip I cidr
```

### Set Gateway

```bash
route add default gw gw lp
```

### Change the MTU size

```bash
ifconfig eth# mtu [size]
```

### Change MAC 1

```bash
export l1AC=xx: XX: XX: XX: XX: XX
```

### Change MAC 2

```bash
ifconfig int hw ether
```

### BackTrack MAC Changer

```bash
macchanger -m l1AC int
```

### Built-in Wifi Scanner

```bash
iwlist int scan
```

### Domain Lookup for IP

```bash
dig -x ip
```

### Domain Lookup fo IP

```bash
host ip
```

### Domain SRV lookup

```bash
host -t SRV service tcp.url.com
```

### DNS Zone transfer 1

```bash
dig @ ip domain -t AXrR
```

### DNS Zone transfer 2

```bash
host -1 domain namesvr
```

### Print VPN Keys

```bash
ip xfrm state list
```

### Adds 'hidden' interface

```bash
ip addr add ip I cidr aev ethO
```

### List DHCP assignments

```bash
/var/log/messages I grep DHCP
```

### Block an IP:Port

```bash
tcpkill host ip and port port
```

### Turn on Ip Forwarding

```bash
echo "1" /proc/sys/net/ipv4/ip forward
```

### Add DNS Server

```bash
echo ''nameserver x.x.x.x'' /etc7resolv.conf
```
