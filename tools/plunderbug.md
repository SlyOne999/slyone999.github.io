# Plunder Bug #
![alt text](/images/WiFi-Pineapple-Review.jpg?raw=true)

## Description ##
The Plunder Bug is a pocket-sized, intelligent LAN tap designed for security auditors, system administrators, and network engineers. Developed by Hak5, it sits inline between two wired devices (like a workstation and a switch port) to passively intercept network traffic or actively scan the target network infrastructure via a convenient USB-C port.

## Usage ##
Unlike older, bulky LAN taps that require additional Ethernet cables and custom configurations, the Plunder Bug streamlines network diagnostics into a single physical unit:USB-C Mirroring: Clones all network frames flowing between its two physical RJ45 ports and pumps them straight into a laptop or monitoring host over a single USB-C connection.

- Cross-Platform Compatibility: Bundled with dedicated connection scripts for Windows, macOS, and Linux, allowing standard packet sniffers like Wireshark to recognize the tap instantly as an extra network interface.Mobile 

- Packet Capture: Supports a dedicated companion Android root app, allowing users to plug the tap directly into a smartphone to record live network PCAP data on the move.

- Active/Passive Dual Modes: Can be configured via software to act as a purely passive, silent listener (Muted) or as an active participant on the network segment (Unmuted).Multipurpose Utility: Outside of security auditing, it functions natively as a standard USB-to-Ethernet adapter or as a simple 3-port unmanaged micro-switch.

## Attacks ##
1. Passive Packet Sniffing & Eavesdropping

Credential Harvesting: Sitting silently inline to mirror unencrypted data flowing between an endpoint and the local router. Security testers capture these packets to scrape raw credentials, unencrypted database queries, and private communications.Session Hijacking: Recording active browser session authentication tokens or unencrypted cookies directly out of the network stream, allowing an auditor to spoof a user's web account.
2. Network Reconnaissance (In Active Mode)Simultaneous Active Scanning: 

When flipped into active/unmuted mode, the device acts as a gateway bridge. This enables an operator to silently watch network traffic while concurrently running high-speed network map scans (nmap) to identify open ports or legacy infrastructure vulnerabilities.
3. Man-in-the-Middle (MitM) InfiltrationTargeted Traffic Injection: 

Because the USB-C interface can act as a standard network interface card on the host network, an attacker can leverage it to inject custom, malicious network frames directly into the active traffic pool while monitoring the response frames.4. Hardwired Asset SurveillancePhysical Line Bugging: Because of its remarkably small form factor, an attacker can easily hide it among messy workspace cable routing or within an open server rack patch panel, covertly "bugging" a high-value physical connection indefinitely.