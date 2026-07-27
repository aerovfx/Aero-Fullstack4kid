# Week 1: Introduction to Python for Security & Basic Socket Programming

## Objectives

In this first week, we will lay a solid foundation for the entire course by exploring the role of Python in Cybersecurity and grasping the core principles of network programming through Sockets. Hands-on coding will progress from basic to complex.

**Specific Objectives:**
1. Understand why Python is the #1 "weapon" for hackers and security experts.
2. Master the concepts of IP Address, Port, TCP/UDP, and Localhost.
3. Practice Socket programming across 3 levels: Basic (Echo) -> Intermediate (Continuous Chat) -> Complex (Security & Error Handling).
4. Instill the White Hat Ethics principle and strictly practice only on Localhost (127.0.0.1).

---

## Theory (with definitions and examples)

### 1. Why does Python dominate Cybersecurity?
- **Clear syntax:** Helps experts read and understand malware quickly.
- **Massive library ecosystem:** `socket` (basic networking), `Scapy` (packet analysis), `Requests` (web hacking), `Cryptography` (encryption).
- **Cross-platform:** Runs smoothly on Kali Linux, macOS, and Windows.

### 2. Basic Networking Concepts
- **IP Address & Port:** If the IP (e.g., `192.168.1.5`) is the building address, then the Port (e.g., `80`, `443`, `9999`) is the room number.
- **Localhost (127.0.0.1):** The Loopback address. Sending data to this address means "sending it to yourself." This is the safest isolated environment (Sandbox) for learning security.
- **TCP vs UDP:** TCP is like a phone call (3-way handshake, ensures reliability, no dropped packets). UDP is like sending a letter (sent without knowing if the other side received it, high speed but unreliable).

### 3. What is a Socket?
- A socket is an endpoint for two software applications to communicate with each other.
- **Server:** Creates socket -> `bind` (attaches IP/Port) -> `listen` -> `accept` (accepts connection).
- **Client:** Creates socket -> `connect` (calls the Server).

---

## Safety Warnings and Ethical Notices

> [!WARNING]
> **LEGAL & ETHICAL WARNING:**
> 1. Intentionally scanning or connecting to someone else's system without permission is **illegal**.
> 2. This course only permits practice on **localhost (127.0.0.1)**. Any assignment submission using a public IP or LAN IP (e.g., 192.168.x.x) for unauthorized attacks/connections will receive a score of 0.

---

## Hands-On Coding (From Basic to Complex)

We will go through 3 levels of coding. At each level, create new Python files, open 2 Terminal windows (1 for Server, 1 for Client), and run the tests.

### Level 1: Basic Communication (Basic Echo Server)
Goal: Write the shortest code possible to connect successfully. The server receives 1 message and prints it to the screen.

**1. `basic_server.py` (Open port and listen)**
```python
import socket

# Initialize Socket (IPv4, TCP)
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind to port 9999 on your own machine (Localhost)
server.bind(('127.0.0.1', 9999))

# Start listening (maximum 1 connection waiting)
server.listen(1)
print("Server is waiting for connection on port 9999...")

# Accept when a client calls (The program will pause here and wait)
client, address = server.accept()
print(f"Someone connected from: {address}")

# Receive message (maximum 1024 bytes)
msg = client.recv(1024).decode('utf-8')
print(f"Message received: {msg}")

# Close connection
client.close()
server.close()
```

**2. `basic_client.py` (Connect and send)**
```python
import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Call the Server
client.connect(('127.0.0.1', 9999))

# Send message (must encode to bytes)
client.send("Hello, I am the Client!".encode('utf-8'))

client.close()
```
*(Run the server first, then run the client. Both will exit immediately after sending/receiving 1 message).*

---

### Level 2: Continuous Chat
Goal: Put the receive/send features inside a `while True` loop to chat continuously. Add an `EXIT` command.

**1. `chat_server.py`**
```python
import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) # Prevents "Port in use" error when restarting
server.bind(('127.0.0.1', 9999))
server.listen(1)
print("Chat Server is running...")

client, address = server.accept()
print(f"Connected to {address}")

while True:
    # Wait to receive message
    data = client.recv(1024).decode('utf-8')
    if not data or data == 'EXIT':
        print("Client disconnected.")
        break
        
    print(f"Client: {data}")
    
    # Server inputs reply
    reply = input("Server replies: ")
    client.send(reply.encode('utf-8'))

client.close()
server.close()
```

**2. `chat_client.py`**
```python
import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('127.0.0.1', 9999))

while True:
    msg = input("Enter message (type EXIT to quit): ")
    client.send(msg.encode('utf-8'))
    
    if msg == 'EXIT':
        break
        
    # Wait for Server reply
    reply = client.recv(1024).decode('utf-8')
    print(f"Server says: {reply}")

client.close()
```

---

### Level 3: Secure & Error-Managed Server
Goal: In reality, a Server must run 24/7, never crash on errors, and reject malicious connections. We will use `try...except` and the `logging` library.

**`secure_server.py`**
```python
import socket
import logging

# Use Logging instead of print for professional tracing
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

def run_secure_server():
    # Context manager 'with' automatically closes socket on failure
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server.bind(('127.0.0.1', 9999))
        server.listen(5)
        logging.info("🛡️ Secure Server listening on 127.0.0.1:9999")
        
        while True:
            try:
                client_conn, client_addr = server.accept()
                
                # SECURITY: Block connections not from Localhost
                if client_addr[0] != '127.0.0.1':
                    logging.warning(f"⚠️ Detected strange IP {client_addr[0]}! Blocking...")
                    client_conn.close()
                    continue
                
                with client_conn:
                    logging.info(f"✅ Connected to secure client: {client_addr}")
                    
                    # Communication process
                    while True:
                        data = client_conn.recv(1024)
                        if not data:
                            break
                        
                        msg = data.decode('utf-8')
                        logging.info(f"📥 Received: {msg}")
                        
                        # Reply
                        response = f"[Server Ack] Received {len(msg)} characters."
                        client_conn.sendall(response.encode('utf-8'))
            
            except KeyboardInterrupt:
                logging.info("🛑 Admin actively shut down the Server.")
                break
            except Exception as e:
                logging.error(f"❌ System error: {e}")

if __name__ == "__main__":
    run_secure_server()
```
*Note: You can use `chat_client.py` from Level 2 to test connecting to this Level 3 Secure Server.*

---

## Homework

### Assignment: Basic Message Encryption (Caesar Cipher)
Based on Level 2 (Continuous Chat) knowledge, upgrade your Chat application:
1. **Client**: Write a simple letter shift function (Caesar Cipher). When the user types "HELLO", encrypt it to "KHOOR" (shift 3 characters) before sending it over the network.
2. **Server**: Upon receiving "KHOOR", it must call a decryption function to reverse the 3-character shift and print the word "HELLO".

**Submission Requirements:** 
Compress the 2 files `crypto_client.py` and `crypto_server.py` along with terminal screenshots as proof.

---

## Assessment Rubric Table

| Criteria | Excellent (90-100%) | Good (70-89%) | Needs Improvement (<70%) |
| :--- | :--- | :--- | :--- |
| **1. Safety Compliance** | Hardcode `127.0.0.1`. Absolutely no IP exposure to LAN/Public. (30 points) | Used localhost but code is sloppy, easily confused. (20 points) | Used IP `0.0.0.0`. (0 points, FAIL). |
| **2. Encryption Logic** | Accurate 2-way encryption/decryption, handles spaces well. (40 points) | Encrypts but occasionally fails on special characters. (25 points) | Flawed encryption logic or won't run. (10 points) |
| **3. Loop Handling** | Client and Server chat continuously without blocking. Exits gracefully on EXIT. (30 points) | Has loop but logic errors cause app to freeze. (15 points) | Only sends 1 message then disconnects. (0 points) |
