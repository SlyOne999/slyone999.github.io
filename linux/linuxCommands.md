## Useful Linux Commands

### Basic Commands

#### 1. Prints the current working directory.
````
pwd
````
#### 2.	Lists files and directories in the current directory.
````
ls
````
#### 3.	Changes the current directory to the specified one.
````
cd [directory]
````
4.	mkdir [directory] – Creates a new directory.
5.	rmdir [directory] – Removes an empty directory.
6.	rm [file] – Deletes a file.
7.	rm -r [directory] – Deletes a directory and its contents.
8.	cp [source] [destination] – Copies a file or directory.
9.	mv [source] [destination] – Moves or renames a file/directory.
10.	touch [file] – Creates an empty file or updates the timestamp.
````
File Viewing Commands
````
11.	cat [file] – Displays the content of a file.
12.	less [file] – Views a file page by page.
13.	more [file] – Similar to less, but with fewer features.
14.	head -n [number] [file] – Shows the first N lines of a file.
15.	tail -n [number] [file] – Shows the last N lines of a file.
16.	tail -f [file] – Continuously displays the last lines of a log file.
````
Permissions and Ownership
````
17.	chmod [permissions] [file] – Changes file permissions.
18.	chown [user]:[group] [file] – Changes file ownership.
````
Process Management
````
19.	ps aux – Displays all running processes.
20.	top – Shows real-time system resource usage.
21.	htop – Enhanced version of top (requires installation).
22.	kill [PID] – Terminates a process by its Process ID.
23.	killall [process_name] – Terminates all processes with the given name.
24.	pkill [pattern] – Kills processes by matching a name pattern.
````
Networking Commands
````
25.	ping [hostname/IP] – Checks network connectivity.
26.	ifconfig – Displays network interfaces (deprecated, use ip a).
27.	ip a – Shows network addresses and interfaces.
28.	netstat -tulnp – Lists open ports and connections.
29.	ss -tulnp – Alternative to netstat.
30.	curl [URL] – Fetches a webpage or data from a URL.
31.	wget [URL] – Downloads files from the internet.
````
Disk and Storage Management
````
32.	df -h – Displays disk usage in a human-readable format.
33.	du -sh [directory] – Shows the size of a directory.
34.	mount [device] [directory] – Mounts a filesystem.
35.	umount [device] – Unmounts a filesystem.
36.	lsblk – Lists information about available storage devices.
````
User Management
````
37.	whoami – Displays the current logged-in user.
38.	who – Shows currently logged-in users.
39.	id – Displays the user ID (UID) and group ID (GID).
40.	sudo [command] – Runs a command as a superuser.
41.	su [user] – Switches to another user account.
42.	passwd – Changes the user password.
43.	adduser [username] – Adds a new user.
44.	deluser [username] – Deletes a user.
````
Searching and Finding Files
````
45.	find [directory] -name "[filename]" – Searches for a file by name.
46.	locate [filename] – Quickly finds a file (needs updatedb to be run first).
47.	grep "[pattern]" [file] – Searches for a pattern in a file.
48.	grep -r "[pattern]" [directory] – Searches recursively in a directory.
````
Compression and Archiving
````
49.	tar -cvf archive.tar [files] – Creates a tar archive.
50.	tar -xvf archive.tar – Extracts a tar archive.
51.	tar -czvf archive.tar.gz [files] – Creates a compressed tar archive.
52.	tar -xzvf archive.tar.gz – Extracts a compressed tar archive.
53.	zip archive.zip [files] – Creates a zip archive.
54.	unzip archive.zip – Extracts a zip archive.
````
Package Management
Debian-based (Ubuntu, Debian)
````
55.	apt update – Updates package lists.
56.	apt upgrade – Installs updates for all packages.
57.	apt install [package] – Installs a package.
58.	apt remove [package] – Removes a package.
59.	dpkg -i [package.deb] – Installs a .deb package.
````
Red Hat-based (Fedora, CentOS)
````
60.	dnf update – Updates all packages.
61.	dnf install [package] – Installs a package.
62.	dnf remove [package] – Removes a package.
63.	rpm -i [package.rpm] – Installs an .rpm package.
````
Text Processing
````
64.	echo "Hello" – Prints text to the terminal.
65.	cat file | sort – Sorts the contents of a file.
66.	cat file | uniq – Removes duplicate lines.
67.	awk '{print $1}' file – Extracts the first column from a file.
68.	sed 's/old/new/g' file – Replaces text in a file.
````
System Monitoring
````
69.	uptime – Shows how long the system has been running.
70.	free -h – Displays memory usage.
71.	vmstat – Shows system performance statistics.
72.	iostat – Displays CPU and disk usage statistics.
````
Logs and Debugging
````
73.	dmesg – Displays system boot messages.
74.	journalctl -xe – Views system logs.
75.	tail -f /var/log/syslog – Monitors system logs in real-time.
````
Shell & Scripting
````
76.	alias ll='ls -la' – Creates a shortcut for a command.
77.	unalias ll – Removes an alias.
78.	history – Shows previously executed commands.
79.	!! – Repeats the last command.
80.	!n – Repeats the nth command from history.

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
