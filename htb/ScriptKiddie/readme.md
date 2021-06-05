[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)

* TOC
{:toc}

# Info#

| Machine Name | SkiptKiddie |
| IP Address | 10.10.10.226 |
| OS | Windows |

# Recon

## NMap

nmap -p 1-65535 -T4 -A -v 10.10.10.226



## Open Services
| PORT | SERVICE |
| 22 | SSH |
| 5000 | HTTP |

## Port 22
Standard secure port

## Port 5000
This is running Werkzeug httpd 0.16.1 Python 3.8.56
Standard Werkzeug vulnerability isnt valid as no /console url

This appears to be tools to help the owner


## Dirbuster Output
Nothing works or comes back

## Tools on the page
NMAP
Metasploit
searchsploit


## This looks interesting

## Thoughts
Can i upload a reverse shell?
Any vulnerabilites in the underlying system code



