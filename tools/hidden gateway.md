## Server-Side Hidden Gateways: An Introduction to Single Packet Authorization (SPA)
This repository documents the concept and implementation of a server-side "hidden gateway" using Single Packet Authorization (SPA).
Traditional hidden gateways—like obscure URLs or custom HTTP headers—rely on security through obscurity at the application layer. If an attacker discovers the URL or intercepts the header, the gateway is compromised. SPA solves this by shifting the gateway to the network firewall layer, rendering the server completely invisible to unauthorized users.
------------------------------
## What is Single Packet Authorization (SPA)?
SPA is a next-generation evolution of traditional "port knocking." Instead of requiring a user to send a sequence of connection attempts to multiple ports, SPA allows a user to gain access by sending a single, heavily encrypted, and cryptographically signed network packet (usually via UDP or ICMP).
A background daemon on the server silently sniffs raw network traffic. When it intercepts a valid, signed packet, it dynamically modifies the server's firewall rules to grant the sender’s specific IP address access to the hidden service for a limited window of time. To the rest of the public internet, the server behaves like a "black hole"—dropping all traffic and appearing completely offline.
------------------------------
## Real-World Examples & Historical Context
The concepts behind SPA and network-level hidden gateways have deep roots in both military communication and enterprise-grade Zero Trust architecture:

* The Cold War "Blinker" Systems (Conceptual Roots): In espionage history, operatives would use specific, pre-arranged light signals (like blinking a flashlight three times rapidly, pausing, then twice slowly) to signal safety or identity to handlers before meeting. SPA is the modern digital equivalent: a secret, un-broadcasted signal that proves identity before physical access is granted.
* The Evolution from Port Knocking (2003): Port knocking was originally popularized around 2003. However, it was vulnerable to "replay attacks" if a hacker was sniffing the network and recorded the exact sequence of ports. SPA was created by security researchers (such as Michael Rash, creator of fwknop) to fix this by using modern cryptography (like AES or GPG keys) inside the packet, ensuring the "knock" cannot be intercepted or reused.
* Modern Zero Trust & SDP (Software-Defined Perimeters): Today, high-security enterprise networks and military infrastructure use variations of SPA. For example, the U.S. Department of Defense heavily references Software-Defined Perimeters that utilize "black cloud" architectures—where servers have no listening ports open to the public internet until a cryptographic authentication token is verified.

------------------------------
## Why Use an SPA Hidden Gateway?

   1. Zero Network Footprint: Standard automated vulnerability scanners (like Shodan or Nmap) look for open ports. Because your server drops all unsolicited packets, it will not show up on scanning registries.
   2. Immunity to Zero-Day Vulnerabilities: If your hidden application has an unpatched flaw, an attacker still cannot exploit it because they cannot even establish a TCP connection to the port hosting the app.
   3. Protection Against DoS Attacks: Because the firewall drops unauthorized packets immediately without processing full TCP handshakes, the server consumes virtually zero CPU or memory resources when under a Denial of Service attack.

------------------------------
## Basic Steps to Build an SPA Hidden Gateway
Implementing a basic SPA gateway generally involves four core steps using an open-source tool like fwknop (FireWall KNock OPerator) alongside a standard Linux firewall (iptables or nftables).
## Step 1: Default-Deny Firewall Configuration
You configure your server's firewall to block all incoming traffic to the protected service (e.g., Port 443 for HTTPS or Port 22 for SSH).

* Result: If you attempt to visit the website or log in, the request will time out. The server remains silent.

## Step 2: Set Up the Server Daemon (fwknopd)
Install and configure a silent background daemon on the server. This daemon does not open a port. Instead, it hooks into the server’s network interface using packet-capturing libraries (libpcap) to passively watch raw network traffic passing by.

* Generate a shared symmetric key (or a public/private GPG key pair) between the server and the authorized client.

## Step 3: Configure Access Rights
In the server's configuration files (e.g., access.conf), define exactly what happens when a valid packet is received.

* Specify which ports should be opened (e.g., ALLOW_PORTS: TCP/443).
* Set an automatic expiration timer (e.g., OPEN_LIMIT: 30), which instructs the firewall to automatically close the port after 30 seconds once the connection is established.

## Step 4: The Client "Knock" and Connection
To access the hidden gateway, the authorized user runs a local client tool before opening their browser:

   1. The client tool packages the user's current public IP address, a timestamp (to prevent replay attacks), and a random string.
   2. It encrypts this payload using the pre-shared cryptographic key and sends it as a single UDP packet to the server.
   3. The server daemon intercepts the packet, decrypts it, validates the timestamp, and dynamically adds a temporary rule to the firewall: "Allow traffic from Client IP to Port 443 for 30 seconds."
   4. The user refreshes their browser, the website successfully loads, and the firewall closes the door behind them—leaving the established connection open while blocking everyone else.

