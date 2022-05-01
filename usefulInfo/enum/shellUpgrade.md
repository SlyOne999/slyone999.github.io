



Upgrading Shell






$ python3 -c 'import pty;pty.spawn("/bin/bash")'

$ export TERM=xterm

$ ^Z # Press CTRL+Z to background the shell

$ stty raw -echo

$ fg # And press two times enter to foreground the shell


https://github.com/rapid7/metasploit-framework/issues/14369 