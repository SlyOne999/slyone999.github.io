## Proxmox Commands – cheat sheet

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

### Proxmox Node Commands (Proxmox Commands Cheat Sheet):
This Proxmox commands cheat sheet provides the most essential Proxmox CLI commands for system administrators working with Proxmox VE.

1. Display Node Status:
```bash 
pveversion
```
2. Check Node Resources:
```bash 
pvesh get /nodes//status
```
3. List Virtual Machines:
```bash
qm list
```
4. Start/Stop/Shutdown a VM:
```bash
qm start  qm stop  qm shutdown 
```
5. Create a Virtual Machine:
```bash
qm create  --name  --memory  --net0 virtio,bridge=vmbr0 --cores  --sockets  --virtio0 local::
```
6. Show VM Configuration:
```bash
qm config 
```
7. Delete a Virtual Machine:
```bash
qm destroy 
```
8. Clone a Virtual Machine:
```bash
qm clone   --name 
```bash
9. Snapshot a Virtual Machine:
```bash
qm snapshot  
```
10. Restore VM from Snapshot:
```bash
qm rollback  
```
### Storage Commands:
11. List Storage:
```bash
pvesh get /storage
```
12. Show Storage Configuration:
```bash
pvesh get /storage/
```
13. Create Storage:
```bash
pvesh create /storage --storage  --type  --content  --path 
```
14. Remove Storage:
```bash
pvesh delete /storage/
```
### Networking Commands:
15. List Network Interfaces:
```bash
ifconfig -a
```
16. List Bridges:
```bash
brctl show
```List Firewall Rules:
iptables -L -n
```Configure Network:
nano /etc/network/interfaces
###Cluster Commands:
```Display Cluster Status:
pvecm status
```Join a Node to the Cluster:
pvecm add 
```Remove a Node from the Cluster:
pvecm delnode 
Show Quorum Status:
pvecm quorum
Display CIB (Cluster Information Base):
corosync-cmapctl
Maintenance Commands:
Update Proxmox VE:
apt update apt dist-upgrade
Reboot Node:
reboot
Check for Updates:
pveupdate check
Backup VM:
vzdump  --compress  --storage 
Restore VM from Backup:
vzrestore  
These commands should help you perform various tasks and manage your Proxmox environment from the command line. Adjust the parameters based on your specific configurations and requirements.