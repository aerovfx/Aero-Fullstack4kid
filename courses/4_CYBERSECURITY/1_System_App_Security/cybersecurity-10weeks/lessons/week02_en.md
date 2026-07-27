# Week 2: Network Reconnaissance & Port Scanning

## Objectives

In week 2, we enter the first phase of any penetration test: Reconnaissance. Students will build a Port Scanner using Python to find open "doors" on a system, thereby assessing potential vulnerabilities.

**Specific Objectives:**
1. Understand the working principles of Port Scanning (TCP Connect).
2. Master the list of common Ports and their associated services (80, 443, 21, 22, 3306).
3. Program a Scanner using Python across 3 levels: Single port scan -> Port range scan (Loop) -> High-speed multi-threaded scan (Multi-threading).
4. Deepen Ethical principles: Strictly scan only Localhost systems.

---

## Theory (with definitions and examples)

### 1. What is Network Reconnaissance?
- It's like a detective surveying a house before deciding how to break in. Hackers (or security experts) probe to see what operating system the target is running, what ports are open, and what software is listening behind those ports.
- Purpose: To find vulnerabilities (For example: Finding an open port 21 - FTP that does not require a password).

### 2. Port Scanning Techniques
- A computer has **65,535** ports.
- A Scanner tool sequentially knocks on each port.
- **TCP Connect Scan**: The most basic method (which we will code today). Your machine attempts to complete a "3-way handshake" with the target machine.
    - If port is OPEN: The target replies with `SYN-ACK`. Connection succeeds.
    - If port is CLOSED: The target replies with `RST` (Reset). Connection fails.
- *Note:* This technique is very noisy and easily logged by Firewalls or Intrusion Detection Systems (IDS).

### 3. What is Multi-threading?
- If you use a normal loop to scan 65,535 ports, and each port takes 1 second to wait for a response (timeout), it will take you over 18 hours!
- **Threading** allows Python to open tens or hundreds of "workers" (threads) to knock on ports simultaneously, reducing scanning time to just a few minutes or seconds.

---

## Safety Warnings and Ethical Notices

> [!WARNING]
> **LEGAL & ETHICAL WARNING:**
> 1. Port Scanning an unknown target **can be considered a reconnaissance attack behavior**, severely violating the security policies of organizations and Cyber Security laws.
> 2. Nmap tools or scripts you write are **ONLY PERMITTED** to run against the destination `127.0.0.1` (Localhost) or virtual machines you set up for learning purposes.
> 3. Absolutely do not attempt to scan the IPs of schools, companies, or any public websites.

---

## Hands-On Coding (From Basic to Complex)

We will go through 3 levels to build a complete Scanner machine. In this practice, before scanning, you should open a few Servers (like the `basic_server.py` file from week 1) to have an open port for the Scanner to find!

### Level 1: Basic Scanner (Single Port Scan)
Goal: Use the `connect_ex()` function instead of `connect()`. This function doesn't crash the program when a port is closed; it simply returns an error code.

**`basic_scanner.py`**
```python
import socket

# Declare a safe target (Always localhost)
target_ip = "127.0.0.1"
port_to_scan = 9999

# Create TCP socket
scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
scanner.settimeout(1) # Wait a maximum of 1 second for a response

print(f"Knocking on port {port_to_scan} at {target_ip}...")

# connect_ex returns 0 if connection is successful (Port OPEN)
# Returns other numbers (e.g., 61, 111) if Port CLOSED
result = scanner.connect_ex((target_ip, port_to_scan))

if result == 0:
    print(f"[+] PORT {port_to_scan}: OPEN")
else:
    print(f"[-] PORT {port_to_scan}: CLOSED")

scanner.close()
```

---

### Level 2: Loop Scanner (Port Range Scan)
Goal: Automatically scan from port 1 to 100 using a `for` loop.

**`loop_scanner.py`**
```python
import socket
import time

target_ip = "127.0.0.1"

print(f"=== START SCANNING SYSTEM: {target_ip} ===")
start_time = time.time()

# Scan common ports from 1 to 100
for port in range(1, 101):
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.1) # Wait 0.1s per port to scan faster
    
    result = scanner.connect_ex((target_ip, port))
    if result == 0:
        print(f"[+] OPEN PORT DETECTED: {port}")
        
    scanner.close()

end_time = time.time()
print(f"Scan completed in {round(end_time - start_time, 2)} seconds.")
```

---

### Level 3: High-Speed Scanner (Multi-threading)
Goal: Use the `threading` library to scan thousands of ports extremely fast.

**`fast_scanner.py`**
```python
import socket
import threading
import time

target_ip = "127.0.0.1"
open_ports = [] # List to store open ports

def scan_port(port):
    """Function to scan a single port, to be called by workers (threads)."""
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.5)
    
    try:
        result = scanner.connect_ex((target_ip, port))
        if result == 0:
            print(f"[+] OPEN: Port {port}")
            open_ports.append(port)
    except Exception:
        pass # Ignore errors
    finally:
        scanner.close()

print(f"=== MULTI-THREAD SCANNER RUNNING ON {target_ip} ===")
start_time = time.time()
threads = [] # List to manage workers

# Scan the first 1000 ports (1 - 1000)
for port in range(1, 1001):
    # Create a new thread and assign it to run the scan_port function
    t = threading.Thread(target=scan_port, args=(port,))
    threads.append(t)
    t.start() # Command the worker to start working

# Wait for all workers to finish before ending the program
for t in threads:
    t.join()

end_time = time.time()
print("\n" + "="*40)
print(f"REPORT:")
print(f"- Total open ports: {len(open_ports)} {open_ports}")
print(f"- Completion time: {round(end_time - start_time, 2)} seconds")
print("="*40)
```

---

## Homework

### Assignment: Banner Detective (Banner Grabbing)
Banner Grabbing is a technique to collect information about the software running behind an open port. For example: Port 80 is open, but is Nginx or Apache running behind it?
Based on Level 3, write an additional feature: When an OPEN port is detected, instead of just printing "[+] OPEN", try to send a random text string to that port (e.g., `"HELLO\r\n"`), then use `recv(1024)` to see what content the software behind it replies with. Print that reply to the screen (Note: use `try...except` because some services are open but won't respond).

**Technical Requirements:**
1. Multi-threaded code runs smoothly.
2. Has a Banner gathering function `grab_banner(ip, port)`.
3. Practice scanning ONLY on `127.0.0.1`.

**How to Submit:**
Submit the `banner_scanner.py` file to the LMS system along with a screenshot of the Terminal clearly displaying a service that returned a Banner (Hint: Run `secure_server.py` from Week 1 as "bait" to scan, because it has logic set up to reply to the Client).

---

## Assessment Rubric Table

| Criteria | Excellent (90-100%) | Good (70-89%) | Needs Improvement (<70%) |
| :--- | :--- | :--- | :--- |
| **1. Safety Compliance** | Scans only `127.0.0.1`. (30 points) | Uses localhost but carelessly. (20 points) | Scans external/LAN IPs. (0 points, FAIL). |
| **2. Speed & Multi-threading** | Scans thousands of ports quickly without freezing thanks to `threading`. Closes threads neatly with `join()`. (30 points) | Uses normal loop or Thread freezes due to wrong structure. (15 points) | Cannot scan multiple ports. (0 points) |
| **3. Banner Grabbing** | Sends message, catches target software's response, handles `recv()` exceptions smoothly. (40 points) | Catches data but doesn't handle Timeout exceptions, causing threads to jam. (25 points) | Port open but fails to catch Banner. (10 points) |

---

## Extension: Building Network Management & Defensive Auditing Tools

Instead of using the Scanner to attack, we can use this same tool with a **Defensive mindset (Blue Team)** to audit device security. The goal is to detect unintentionally open ports and provide recommendations to close unnecessary services to mitigate risks.

A secure management process includes:
1. Scan the device (Localhost).
2. Check common ports.
3. Display the meaning of each port.
4. Assess the risk level.
5. Print instructions (Windows Firewall, ufw, router, etc.) to close the port.

### Tool Source Code: `defensive_auditor.py`
This tool is designed to scan safely only on `127.0.0.1` (per course rules), list running services, and automatically provide security advice. You can view the source code in the `week02_code` folder.

### Port Closing Instructions (Remediation)

After the tool points out open ports, users need to manually close the ports on their device:

| Port   | Defensive Recommendation                  |
| ------ | -------------------------------------- |
| 21     | Turn off FTP service if not in use      |
| 22     | Allow SSH only via public key   |
| 23     | Should be completely disabled (Obsolete service)   |
| 80/443 | Check if a web server is truly necessary |
| 445    | Turn off file sharing if not in use        |
| 3389   | Limit access using a firewall/VPN    |

**Example of closing a port on Windows (Powershell):**
```powershell
New-NetFirewallRule `
    -DisplayName "Block RDP" `
    -Direction Inbound `
    -Protocol TCP `
    -LocalPort 3389 `
    -Action Block
```

**Example of closing a port on Ubuntu (Linux):**
```bash
sudo ufw deny 3389
sudo ufw deny 23
sudo ufw status
```

**Standard Process for an Auditor:**
```text
Scan device
      ↓
Display open ports
      ↓
Explain functions
      ↓
Assess risk level
      ↓
Provide port closing instructions (Remediation)
```
This approach helps students self-check and proactively enhance the security of their own devices responsibly!

---

### Appendix: In-Depth Analysis of System Processes (macOS Services)

When you run the command `lsof -i -P | grep LISTEN`, aside from PostgreSQL, you might encounter other open ports. Below is a detailed analysis of common services on macOS to help you identify what is a risk and what is normal:

#### Sample Result Classification

| Port        | Process         | Scope     | Evaluation    |
| ----------- | --------------- | --------- | ------------- |
| 5000        | ControlCenter   | `*`       | macOS AirPlay |
| 7000        | ControlCenter   | `*`       | macOS AirPlay |
| 49152       | rapportd        | `*`       | Apple Service |
| 54999       | rapportd        | `*`       | Apple Service |
| 55000       | rapportd        | `*`       | Apple Service |
| 5432        | postgres        | localhost | Safe          |
| 8080        | node            | localhost | Safe          |
| 49196-49992 | language_server | localhost | Safe          |
| 61034       | VS Code         | localhost | Safe          |

---

#### 1. `ControlCenter` (Port 5000, 7000)
This is a macOS process related to AirPlay and Screen Mirroring.
If you see `TCP *:5000 (LISTEN)`, the `*` means it is open to the entire Wi-Fi network.
- **Action:** If you don't use AirPlay, go to `System Settings > General > AirDrop & Handoff` and turn off `AirPlay Receiver`.

#### 2. `rapportd` (Random ports > 49000)
This is an official Apple service used for Handoff and Universal Clipboard (Copy on one device, Paste on another). It continuously connects between MacBook, iPhone, and iPad.
- **Action:** This is not malware. If you use the Apple ecosystem, leave it as is.

#### 3. Internal Programming Processes (`node`, `language_server`, `Code H`)
When using VS Code (or Cursor), it automatically spins up Language Servers (like Python, TypeScript) to analyze code, opening random ports (e.g., 61034) on `localhost`.
- **Action:** Completely normal and safe because they are tightly bound to `localhost`.

### Ideal Security Topology

```text
                 Internet
                     X (Blocked by Network Firewall)
                     |
              macOS Firewall
                     |
          -----------------------
          |                     |
      localhost              Wi-Fi
          |                     |
5432,8080,VSCode       AirPlay,Apple
```

**Conclusion:** There are no signs of malware or abnormal services. The ports open to the internal network belong to Apple's system services, while all programming services (Database, Web server, Editor) are restricted to `localhost`. This is a textbook secure setup!
