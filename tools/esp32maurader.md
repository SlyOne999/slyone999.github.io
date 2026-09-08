## Tool ##
## ESP32 Marauder ##
![alt text](/images/ESP32.jpg)

## Description ##
The ESP32 Marauder is a specialised, open-source wireless network auditing tool. It consists of custom firmware running on an ESP32 microcontroller, often housed in standalone hardware units featuring touchscreens, battery packs, and external antennas. It serves as a portable device for frame capture, traffic monitoring, and penetration testing.

## Usage ##
The device is engineered specifically to interact with 2.4 GHz wireless spectra:Packet Sniffing: Captures raw Wi-Fi network traffic data over the air and saves them as PCAP files to an internal microSD card for future analysis.Integrated Interface: Features standalone hardware versions (like the Marauder v6 or v8) equipped with a touch display or hardware navigation joystick for computer-free operations.GPS Tracking & Wardriving: Pairs with GPS modules to log the exact geographical coordinates of discovered Wi-Fi networks and Bluetooth devices.Modular Companion: Operates as an independent unit or plugs directly into a Flipper Zero's GPIO headers to give the Flipper advanced Wi-Fi sniffing features.

## Attacks ##
1. Wi-Fi Reconnaissance & Credential Harvesting
    Handshake Capturing (EAPOL/PMKID): Sniffing the wireless authentication data exchanged when a phone or laptop connects to a router. Security testers save this handshake to an SD card and later use brute-force decryption software to reveal weak Wi-Fi passwords.
    Probe Request Sniffing: Scanning for silent wireless signals that smartphones constantly broadcast looking for familiar networks (like "Home Wi-Fi"), which allows an auditor to map out a target device's history and MAC address.
2. Signal & Service Disruption
    Wi-Fi Deauthentication Attacks: Sending forged disconnect frames to a router or target machine. This instantly kicks a phone or computer off the Wi-Fi network, usually forcing the device to re-authenticate so the Marauder can steal its handshake packet.
    Beacon Flooding / AP Spamming: Broadcasting hundreds of fake, phantom Wi-Fi network names simultaneously. This clutters the Wi-Fi settings page of nearby smartphones, creating confusion or a denial-of-service state for the user interface.
3. Network Manipulation
    Evil Twin / Captive Portal Cloning: Mimicking the name and network characteristics of a legitimate public access point. It forces target devices to connect to the Marauder hardware instead, redirecting victims to a fake, lookalike login screen designed to steal account details.