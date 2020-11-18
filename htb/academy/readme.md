[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | academy |
| IP Address | 10.10.10.215 |
| OS | Windows |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.10.215

'''
kali@kali:~/Documents/HTB/atp$ nmap -p 1-65535 -T4 -A -v 10.10.10.215
Starting Nmap 7.91 ( https://nmap.org ) at 2020-11-14 13:45 EST
NSE: Loaded 154 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 13:45
Completed NSE at 13:45, 0.00s elapsed
Initiating NSE at 13:45
Completed NSE at 13:45, 0.00s elapsed
Initiating NSE at 13:45
Completed NSE at 13:45, 0.00s elapsed
Initiating Ping Scan at 13:45
Scanning 10.10.10.215 [2 ports]
Completed Ping Scan at 13:45, 0.02s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 13:45
Completed Parallel DNS resolution of 1 host. at 13:45, 0.02s elapsed
Initiating Connect Scan at 13:45
Scanning 10.10.10.215 [65535 ports]
Discovered open port 22/tcp on 10.10.10.215
Discovered open port 80/tcp on 10.10.10.215
Discovered open port 33060/tcp on 10.10.10.215
Completed Connect Scan at 13:46, 16.72s elapsed (65535 total ports)
Initiating Service scan at 13:46
Scanning 3 services on 10.10.10.215
Completed Service scan at 13:46, 22.28s elapsed (3 services on 1 host)
NSE: Script scanning 10.10.10.215.
Initiating NSE at 13:46
Completed NSE at 13:46, 5.97s elapsed
Initiating NSE at 13:46
Completed NSE at 13:46, 0.10s elapsed
Initiating NSE at 13:46
Completed NSE at 13:46, 0.00s elapsed
Nmap scan report for 10.10.10.215
Host is up (0.020s latency).
Not shown: 65532 closed ports
PORT      STATE SERVICE VERSION
22/tcp    open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 c0:90:a3:d8:35:25:6f:fa:33:06:cf:80:13:a0:a5:53 (RSA)
|   256 2a:d5:4b:d0:46:f0:ed:c9:3c:8d:f6:5d:ab:ae:77:96 (ECDSA)
|_  256 e1:64:14:c3:cc:51:b2:3b:a6:28:a7:b1:ae:5f:45:35 (ED25519)
80/tcp    open  http    Apache httpd 2.4.41 ((Ubuntu))
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: Did not follow redirect to http://academy.htb/
33060/tcp open  mysqlx?
| fingerprint-strings: 
|   DNSStatusRequestTCP, LDAPSearchReq, NotesRPC, SSLSessionReq, TLSSessionReq, X11Probe, afp: 
|     Invalid message"
|_    HY000
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port33060-TCP:V=7.91%I=7%D=11/14%Time=5FB025FD%P=x86_64-pc-linux-gnu%r(
SF:NULL,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(GenericLines,9,"\x05\0\0\0\x0b
SF:\x08\x05\x1a\0")%r(GetRequest,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(HTTPO
SF:ptions,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(RTSPRequest,9,"\x05\0\0\0\x0
SF:b\x08\x05\x1a\0")%r(RPCCheck,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(DNSVer
SF:sionBindReqTCP,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(DNSStatusRequestTCP,
SF:2B,"\x05\0\0\0\x0b\x08\x05\x1a\0\x1e\0\0\0\x01\x08\x01\x10\x88'\x1a\x0f
SF:Invalid\x20message\"\x05HY000")%r(Help,9,"\x05\0\0\0\x0b\x08\x05\x1a\0"
SF:)%r(SSLSessionReq,2B,"\x05\0\0\0\x0b\x08\x05\x1a\0\x1e\0\0\0\x01\x08\x0
SF:1\x10\x88'\x1a\x0fInvalid\x20message\"\x05HY000")%r(TerminalServerCooki
SF:e,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(TLSSessionReq,2B,"\x05\0\0\0\x0b\
SF:x08\x05\x1a\0\x1e\0\0\0\x01\x08\x01\x10\x88'\x1a\x0fInvalid\x20message\
SF:"\x05HY000")%r(Kerberos,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(SMBProgNeg,
SF:9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(X11Probe,2B,"\x05\0\0\0\x0b\x08\x05
SF:\x1a\0\x1e\0\0\0\x01\x08\x01\x10\x88'\x1a\x0fInvalid\x20message\"\x05HY
SF:000")%r(FourOhFourRequest,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(LPDString
SF:,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(LDAPSearchReq,2B,"\x05\0\0\0\x0b\x
SF:08\x05\x1a\0\x1e\0\0\0\x01\x08\x01\x10\x88'\x1a\x0fInvalid\x20message\"
SF:\x05HY000")%r(LDAPBindReq,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(SIPOption
SF:s,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(LANDesk-RC,9,"\x05\0\0\0\x0b\x08\
SF:x05\x1a\0")%r(TerminalServer,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(NCP,9,
SF:"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(NotesRPC,2B,"\x05\0\0\0\x0b\x08\x05\x
SF:1a\0\x1e\0\0\0\x01\x08\x01\x10\x88'\x1a\x0fInvalid\x20message\"\x05HY00
SF:0")%r(JavaRMI,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(WMSRequest,9,"\x05\0\
SF:0\0\x0b\x08\x05\x1a\0")%r(oracle-tns,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%
SF:r(ms-sql-s,9,"\x05\0\0\0\x0b\x08\x05\x1a\0")%r(afp,2B,"\x05\0\0\0\x0b\x
SF:08\x05\x1a\0\x1e\0\0\0\x01\x08\x01\x10\x88'\x1a\x0fInvalid\x20message\"
SF:\x05HY000")%r(giop,9,"\x05\0\0\0\x0b\x08\x05\x1a\0");
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 13:46
Completed NSE at 13:46, 0.00s elapsed
Initiating NSE at 13:46
Completed NSE at 13:46, 0.00s elapsed
Initiating NSE at 13:46
Completed NSE at 13:46, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 45.64 seconds
'''

22/tcp    open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 c0:90:a3:d8:35:25:6f:fa:33:06:cf:80:13:a0:a5:53 (RSA)
|   256 2a:d5:4b:d0:46:f0:ed:c9:3c:8d:f6:5d:ab:ae:77:96 (ECDSA)
|_  256 e1:64:14:c3:cc:51:b2:3b:a6:28:a7:b1:ae:5f:45:35 (ED25519)
80/tcp    open  http    Apache httpd 2.4.41 ((Ubuntu))
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: Did not follow redirect to http://academy.htb/
33060/tcp open  mysqlx?
| fingerprint-strings: 
|   DNSStatusRequestTCP, LDAPSearchReq, NotesRPC, SSLSessionReq, TLSSessionReq, X11Probe, afp: 
|     Invalid message"
|_    HY000




The website http://academy.htb has a register page, create an account and login that provides a website, lots of hunting and the webpage does not give anything.

Noticed an admin page login exists at http://academt.htb/admin.php the user I created didn't allow access. Can I make the user into an admin? Couldn't find a way to request better access. What gives the user a role when they register. I inspect the register.php page and find the code below.

'''

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Register</title>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

<style>
html, body {
    background-color: #141D2B;
    color: #7e8396;
    font-family: 'Nunito', sans-serif;
    font-weight: 200;
    height: 100vh;
    margin: 0;
}

.full-height {
    height: 100vh;
}

.flex-center {
    align-items: center;
    display: flex;
    justify-content: center;
}

.position-ref {
    position: relative;
}

.top-right {
    position: absolute;
    right: 10px;
    top: 18px;
}

.content {
    text-align: center;
}

.title {
    font-size: 84px;
}

.links > a:hover {
    color: #fff;
}

.button {
    background-color: #2E6CFF;
    border: none;
    width: 350px;
    color: white;
    padding: 5px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 24px;
    border-radius: 5px;
    position: absolute;
    margin-left: 25px;
}

.login_div {
    position: absolute;
    width: 400px;
    height: 650px;
    top: 50%;
    left: 50%;
    margin-top: -300px;
    margin-left: -200px;
}

.login_form {
    width: 400px;
    height: 650px;
    background: #1A2332;
    padding: 0;
}

.form_text {
    font-weight: bold;
    font-size: 24px;
}

.center {
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.input {
    width: 348px;
    padding: 10px;
    margin-left: 22px;
    font-size: 20px;
}

</style>
</head>
<body>
    <div class="login_div">
        <form class="login_form" method="POST" autocomplete="off">
            <br/>
            <br/>
            <img src="images/logo.png" class="center" width="130" height="130">
            <br/>
            <br/>
            <table>
                <tr>
                    <td class="form_text" align="left">&nbsp;&nbsp;&nbsp;Username</td>
                <tr/>
                <tr>
                    <td align="right"><input class="input" size="40" type="text" id="uid" name="uid" /></td>
                </tr>
                <tr>
                    <td class="form_text" align="left"><br/>&nbsp;&nbsp;&nbsp;Password</td>
                <tr/>
                <tr>
                    <td align="right"><input class="input" size="40" type="password" id="password" name="password" /></td>
                </tr>
                <tr>
                    <td class="form_text" align="left"><br/>&nbsp;&nbsp;&nbsp;Repeat Password</td>
                <tr/>
                <tr>
                    <td align="right"><input class="input" size="40" type="password" id="confirm" name="confirm" /></td>
                </tr>
                <input type="hidden" value="0" name="roleid" />
            </table>
            <br/><br/>
            <input type="submit" class="button" value="Register"/> 
            </p>
        </form>
    </div>

    <br />


    </div>
    </div>
<div class="footer">
</div>
</div>
</body>
</html>
'''
The interestign line is this                 
<input type="hidden" value="0" name="roleid" />

I then cretaed an ID with roleid as 1. This user can access the admin panel. That displays this -

'''
Academy Launch Planner
Item 	Status
Complete initial set of modules (cry0l1t3 / mrb3n) 	done
Finalize website design 	done
Test all modules 	done
Prepare launch campaign 	done
Separate student and admin roles 	done
Fix issue with dev-staging-01.academy.htb 	pending

'''

This url isn't available, added it as a name against the same IP to check for named webserver?????

Get retruned a website.

That contains the following, wonder if I can login with the sql account?

'''
Server/Request Data
HTTP_HOST 	"dev-staging-01.academy.htb"
HTTP_USER_AGENT 	"Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0"
HTTP_ACCEPT 	"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
HTTP_ACCEPT_LANGUAGE 	"en-US,en;q=0.5"
HTTP_ACCEPT_ENCODING 	"gzip, deflate"
HTTP_CONNECTION 	"keep-alive"
HTTP_UPGRADE_INSECURE_REQUESTS 	"1"
PATH 	"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
SERVER_SIGNATURE 	"<address>Apache/2.4.41 (Ubuntu) Server at dev-staging-01.academy.htb Port 80</address>"
SERVER_SOFTWARE 	"Apache/2.4.41 (Ubuntu)"
SERVER_NAME 	"dev-staging-01.academy.htb"
SERVER_ADDR 	"10.10.10.215"
SERVER_PORT 	"80"
REMOTE_ADDR 	"10.10.14.38"
DOCUMENT_ROOT 	"/var/www/html/htb-academy-dev-01/public"
REQUEST_SCHEME 	"http"
CONTEXT_PREFIX 	""
CONTEXT_DOCUMENT_ROOT 	"/var/www/html/htb-academy-dev-01/public"
SERVER_ADMIN 	"admin@htb"
SCRIPT_FILENAME 	"/var/www/html/htb-academy-dev-01/public/index.php"
REMOTE_PORT 	"54280"
GATEWAY_INTERFACE 	"CGI/1.1"
SERVER_PROTOCOL 	"HTTP/1.1"
REQUEST_METHOD 	"GET"
QUERY_STRING 	""
REQUEST_URI 	"/"
SCRIPT_NAME 	"/index.php"
PHP_SELF 	"/index.php"
REQUEST_TIME_FLOAT 	1605471736.034
REQUEST_TIME 	1605471736
APP_NAME 	"Laravel"
APP_ENV 	"local"
APP_KEY 	"base64:dBLUaMuZz7Iq06XtL/Xnz/90Ejq+DEEynggqubHWFj0="
APP_DEBUG 	"true"
APP_URL 	"http://localhost"
LOG_CHANNEL 	"stack"
DB_CONNECTION 	"mysql"
DB_HOST 	"127.0.0.1"
DB_PORT 	"3306"
DB_DATABASE 	"homestead"
DB_USERNAME 	"homestead"
DB_PASSWORD 	"secret"
BROADCAST_DRIVER 	"log"
CACHE_DRIVER 	"file"
SESSION_DRIVER 	"file"
SESSION_LIFETIME 	"120"
QUEUE_DRIVER 	"sync"
REDIS_HOST 	"127.0.0.1"
REDIS_PASSWORD 	"null"
REDIS_PORT 	"6379"
MAIL_DRIVER 	"smtp"
MAIL_HOST 	"smtp.mailtrap.io"
MAIL_PORT 	"2525"
MAIL_USERNAME 	"null"
MAIL_PASSWORD 	"null"
MAIL_ENCRYPTION 	"null"
PUSHER_APP_ID 	""
PUSHER_APP_KEY 	""
PUSHER_APP_SECRET 	""
PUSHER_APP_CLUSTER 	"mt1"
MIX_PUSHER_APP_KEY 	""
MIX_PUSHER_APP_CLUSTER 	"mt1"

Environment Variables
APP_NAME 	"Laravel"
APP_ENV 	"local"
APP_KEY 	"base64:dBLUaMuZz7Iq06XtL/Xnz/90Ejq+DEEynggqubHWFj0="
APP_DEBUG 	"true"
APP_URL 	"http://localhost"
LOG_CHANNEL 	"stack"
DB_CONNECTION 	"mysql"
DB_HOST 	"127.0.0.1"
DB_PORT 	"3306"
DB_DATABASE 	"homestead"
DB_USERNAME 	"homestead"
DB_PASSWORD 	"secret"
BROADCAST_DRIVER 	"log"
CACHE_DRIVER 	"file"
SESSION_DRIVER 	"file"
SESSION_LIFETIME 	"120"
QUEUE_DRIVER 	"sync"
REDIS_HOST 	"127.0.0.1"
REDIS_PASSWORD 	"null"
REDIS_PORT 	"6379"
MAIL_DRIVER 	"smtp"
MAIL_HOST 	"smtp.mailtrap.io"
MAIL_PORT 	"2525"
MAIL_USERNAME 	"null"
MAIL_PASSWORD 	"null"
MAIL_ENCRYPTION 	"null"
PUSHER_APP_ID 	""
PUSHER_APP_KEY 	""
PUSHER_APP_SECRET 	""
PUSHER_APP_CLUSTER 	"mt1"
MIX_PUSHER_APP_KEY 	""
MIX_PUSHER_APP_CLUSTER 	"mt1"

'''