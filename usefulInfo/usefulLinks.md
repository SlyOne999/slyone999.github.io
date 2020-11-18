## Useful Links and Resources

### Guides and Documents
[HackTricks](https://book.hacktricks.xyz)

[RTFM Red Team Book](https://doc.lagout.org/rtfm-red-team-field-manual.pdf)

[Windows Privilege Escalation Guide](https://www.absolomb.com/2018-01-26-Windows-Privilege-Escalation-Guide/)

[Scripts for Windows Escalation](https://ivanitlearning.wordpress.com/2019/07/26/scripts-for-windows-privilege-escalation/)

### Tools
[WinPEAs - Privilege Escalation in Windows](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/winPEAS)

[Pimp My Kali - Fixes Black Screen](https://github.com/Dewalt-arch/pimpmykali)

I fixed as follows:

Ctrl + Alt + F2 to bring up tty2 console.

Login to the console.

Insert Guest Additions media.

sudo apt install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)

sudo mount /dev/cdrom /media/cdrom

sudo /media/cdrom/VBoxLinuxAdditions.run

Then I restarted. Now, after logging in, the desktop comes up fine. No more black screen.