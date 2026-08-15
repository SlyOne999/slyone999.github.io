## Tool ##
## Rubber Ducky ##
![A yellow rubber duck with a glossy finish positioned against a plain background, representing the USB Rubber Ducky keystroke injection tool used in cybersecurity testing](/images/RubberDucky.jpg) 

## Description ##
The USB Rubber Ducky is an advanced keystroke injection tool disguised as an innocent, ordinary USB flash drive. Created by Hak5, it is a legendary weapon in a hacker's toolkit used for physical penetration testing, social engineering, and rapid system automation.

## Usage ##
While computers see a normal thumb drive, they treat the Rubber Ducky as a standard human-to-computer keyboard, exploiting an inherent trust flaw in modern operating systems:  
Keystroke Injection: Typings out pre-programmed commands at blistering speeds (thousands of words per minute), far faster than any human.Universal Compatibility: Tricks Windows, macOS, Linux, and Android devices instantly without needing special drivers or administrative privileges.  
Ducky Script 3.0: Utilises a dedicated programming language that allows the device to think, use logic loops, adapt to the specific operating system it is plugged into, and store variables.  
MicroSD Storage: Holds payload scripts and can exfiltrate stolen data directly onto its onboard storage card.

## Attacks ##
1. Credential Stealing & ExfiltrationPassword Harvesting: Extracting saved passwords, Wi-Fi keys, and browser credentials from the target machine and saving them to the Ducky's internal memory card in under three seconds.Session Hijacking: Stealing active login session tokens or browser cookies, allowing attackers to access the victim's online accounts without needing their actual passwords.
2. System Access & BackdoorsReverse Shell Deployment: Typing a silent command line sequence that forces the victim's computer to open a hidden connection back to the attacker's server, giving them permanent remote control.Disabling Security Tools: Quickly navigating system settings via keyboard shortcuts to temporarily switch off local antivirus tools or firewalls before they can scan the device.
3. Social EngineeringThe "Dropped Drive" Attack: Leaving the device in a company car park or lobby. An unsuspecting employee picks it up, plugs it into a work computer out of curiosity, and instantly triggers the malicious payload script.

## Example Scripts ##
Here are three basic examples of Ducky Script. They demonstrate how the USB Rubber Ducky interacts with a computer by mimicking keyboard shortcuts and typing commands.  
Note: For safety and educational clarity, these examples use harmless actions (like opening Notepad or a safe website) to show the underlying mechanics of credential harvesting and command execution.

### Example 1 ###
Example 1: The "Hello World" Basics  
This script mimics a user opening a text editor and typing a message. It teaches the core foundational commands of Ducky Script.text  
```
REM Title: Basic Text Injection
REM Description: Opens Notepad and types a simple message.
DELAY 1000
GUI r
DELAY 500
STRING notepad
ENTER
DELAY 1000
STRING Hello! This is a demonstration of keystroke injection speed.
ENTER
```

Use code with caution.🔍   
What the script is doing:  
REM: Creates a comment line. The computer ignores this; it is just notes for the programmer.  
DELAY 1000: Pauses for 1,000 milliseconds (1 second). This gives the computer's operating system time to recognize the USB device after it is plugged in.  
GUI r: Holds the Windows Key (GUI) and presses r. This opens the Windows "Run" dialog box.  
STRING notepad: Types the word "notepad" into the box at hyper-speed.  
ENTER: Presses the Enter key to launch Notepad.  
STRING Hello!...: Types out the final message inside the newly opened Notepad window.  

### Example 2 ###
Example 2: Simulating Website Redirection (Phishing Concepts)  
In a real cyberattack, hackers use this method to quickly force a browser to open a fake, malicious login page. This safe example opens a standard web browser and navigates to the official DuckDuckGo search engine.

```
REM Title: Browser Redirection Demo
REM Description: Opens the default browser and navigates to a URL.
DELAY 1000
GUI r
DELAY 500
STRING https://duckduckgo.com
ENTER
```

Use code with caution.🔍  
What the script is doing:  
GUI r: Opens the Windows "Run" box.  
STRING https://duckduckgo.com: Enters a specific web address. Modern operating systems automatically launch the user's default web browser (like Chrome or Edge) when a URL link is entered here.  
ENTER: Submits the link, instantly opening the website on the screen.  

### Example 3 ###
Example 3: Simulating Command-Line Exfiltration  
This script mimics how an attacker opens a hidden command terminal (PowerShell) to gather system info. To keep it completely safe, this payload merely types a command that fetches the computer's local system statistics and displays them cleanly on screen.text

```
REM Title: Safe System Audit Simulation
REM Description: Opens PowerShell and displays local system information.
DELAY 1000
GUI r
DELAY 500
STRING powershell
ENTER
DELAY 1500
STRING Get-ComputerInfo | Select-Object OsName, OsVersion, CsProcessors
ENTER
```

Use code with caution.🔍  
What the script is doing:  
STRING powershell: Requests Windows PowerShell, a powerful command-line application used by system administrators (and hackers) to control the computer via text.  
DELAY 1500: Pauses for 1.5 seconds. Terminal windows can sometimes take a moment to load, so this delay prevents the Ducky from typing too early and losing characters.  
STRING Get-ComputerInfo...: Types a specific technical command that fetches the Operating System name, version, and CPU processor data. In a malicious scenario, an attacker would append an extra command here to secretly text or upload those results back to their own server.  
