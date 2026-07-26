# Tuần 2: Phân tích gói tin với Scapy (Phòng thủ) / Week 2: Packet Analysis with Scapy (Defensive Auditing)

## Mục Tiêu / Objectives

### Vietnamese (Tiếng Việt)
- Hiểu được cấu trúc cơ bản của các gói tin mạng (Network Packets) trong mô hình TCP/IP, từ lớp liên kết dữ liệu đến lớp ứng dụng.
- Nắm bắt chi tiết các trường (fields) quan trọng trong Header của giao thức IP, TCP, UDP và ICMP.
- Làm quen với thư viện Scapy trong Python để bắt (sniff), phân tích và giám sát lưu lượng mạng một cách tự động và linh hoạt.
- Phát triển kỹ năng tư duy của một chuyên gia phân tích bảo mật (Security Analyst), kỹ sư mạng (Network Engineer) hoặc quản trị trị hệ thống (System Administrator).
- Nắm vững các kỹ thuật phòng thủ tiên tiến, đặc biệt là cách phát hiện các hoạt động bất thường, dò quét mạng trái phép, hoặc lưu lượng dữ liệu không hợp lệ thông qua việc kiểm tra lưu lượng mạng cục bộ.
- Xây dựng các kịch bản kiểm toán an ninh mạng (Network Security Auditing Scripts) sử dụng Python.
- Hiểu và tuân thủ tuyệt đối các nguyên tắc đạo đức nghề nghiệp và an toàn thông tin: chỉ kiểm tra lưu lượng trên giao diện loopback (localhost) hoặc mạng nội bộ được cho phép, kiểm soát và giả lập để phục vụ mục đích nghiên cứu và bảo vệ hệ thống.

### English
- Understand the basic structure of network packets within the TCP/IP model, from the data link layer to the application layer.
- Grasp the details of critical fields in the Headers of IP, TCP, UDP, and ICMP protocols.
- Become familiar with the Scapy library in Python for automatically and flexibly sniffing, analyzing, and monitoring network traffic.
- Develop the analytical mindset of a Security Analyst, Network Engineer, or System Administrator.
- Master advanced defensive techniques, particularly how to detect anomalous activities, unauthorized network scanning, or invalid data traffic by inspecting local network traffic.
- Build custom Network Security Auditing Scripts using Python.
- Strictly understand and adhere to professional ethics and information security principles: only inspect traffic on loopback interfaces (localhost) or authorized, controlled, and simulated local networks for the purpose of research and system protection.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Vietnamese (Tiếng Việt)
- Máy tính cá nhân (Windows, macOS, hoặc Linux) có quyền quản trị (Administrator/Root) để có thể truy cập ở tầng mạng thấp (Raw Sockets) phục vụ cho việc bắt gói tin.
- Python 3.8+ (khuyến nghị phiên bản mới nhất) đã được cài đặt sẵn trên máy và cấu hình biến môi trường chính xác.
- Môi trường phát triển tích hợp (IDE) hoặc Text Editor hiện đại hỗ trợ làm nổi bật cú pháp Python (ví dụ: Visual Studio Code, PyCharm, Sublime Text, Neovim).
- Thư viện Scapy (cài đặt thông qua lệnh pip: `pip install scapy`).
- Công cụ Npcap (dành cho môi trường Windows) hoặc libpcap (dành cho Linux/macOS) để cung cấp API bắt gói tin ở mức hệ điều hành.
- (Tùy chọn nhưng khuyến nghị) Phần mềm Wireshark để đối chiếu, kiểm chứng trực quan hóa các gói tin đã bắt được bởi script Python của bạn.
- Command Line Interface (CLI) như Terminal, PowerShell hoặc Command Prompt để chạy các tập lệnh kiểm toán bảo mật.

### English
- A personal computer (Windows, macOS, or Linux) with administrative (Administrator/Root) privileges to access low-layer network interfaces (Raw Sockets) for packet capture.
- Python 3.8+ (latest version recommended) pre-installed on the system with correctly configured environment variables.
- A modern Integrated Development Environment (IDE) or Text Editor that supports Python syntax highlighting (e.g., Visual Studio Code, PyCharm, Sublime Text, Neovim).
- The Scapy library (installed via pip command: `pip install scapy`).
- Npcap tool (for Windows environments) or libpcap (for Linux/macOS) to provide OS-level packet capture APIs.
- (Optional but recommended) Wireshark software for cross-referencing, verifying, and visualizing the captured packets by your Python scripts.
- Command Line Interface (CLI) such as Terminal, PowerShell, or Command Prompt to execute security auditing scripts.

---

## Lý Thuyết / Theory

### 1. Cấu trúc chuyên sâu của Gói tin Mạng / In-depth Structure of Network Packets

#### Tiếng Việt
Gói tin mạng là các đơn vị dữ liệu nhỏ gọn được định tuyến giữa nguồn và đích trên mạng. Khi bạn gửi một tệp tin, trình duyệt web hoặc ứng dụng mạng sẽ chia tệp tin đó thành nhiều gói tin nhỏ để truyền đi hiệu quả hơn. Mỗi gói tin chứa hai thành phần chính:
- **Header (Tiêu đề)**: Chứa thông tin kiểm soát, địa chỉ IP nguồn, IP đích, cổng (port), giao thức (protocol), độ dài gói tin, checksum (kiểm tra lỗi) và các cờ (flags) định tuyến. Header giống như phong bì của một bức thư, hướng dẫn cho bưu điện biết cần gửi nó đi đâu và từ ai.
- **Payload (Dữ liệu tải)**: Dữ liệu thực tế đang được truyền tải (ví dụ: một phần nội dung trang HTML, hình ảnh, văn bản). Đây là nội dung bức thư bên trong phong bì.

Việc phân tích gói tin mạng là một kỹ năng cốt lõi trong an ninh mạng để chẩn đoán sự cố mạng, giám sát hiệu suất ứng dụng và đặc biệt là phát hiện sớm các cuộc tấn công (Intrusion Detection - Phát hiện xâm nhập). Bằng cách mổ xẻ Header và Payload, các hệ thống phòng thủ có thể chặn các mối đe dọa.

#### English
Network packets are small, formatted units of data routed between an origin and a destination on a network. When you send a file, a web browser, or network application divides that file into multiple smaller packets to transmit more efficiently. Each packet contains two main components:
- **Header**: Contains control information, source IP address, destination IP address, ports, protocols, packet length, checksum (error checking), and routing flags. The Header is like the envelope of a letter, instructing the post office on where to send it and from whom it came.
- **Payload**: The actual data being transported (e.g., a portion of HTML content, an image, text). This is the content of the letter inside the envelope.

Network packet analysis is a core cybersecurity skill used for troubleshooting network issues, monitoring application performance, and crucially, early detection of attacks (Intrusion Detection). By dissecting the Header and Payload, defensive systems can block threats.

### 2. Mô hình TCP/IP, Các Giao Thức và Cờ (Flags) / The TCP/IP Model, Protocols and Flags

#### Tiếng Việt
Mô hình TCP/IP là nền tảng của mạng Internet hiện đại. Trong bài học này, chúng ta sẽ tập trung vào các giao thức cốt lõi và chi tiết của chúng:
- **IP (Internet Protocol)**: Chịu trách nhiệm định tuyến các gói tin dựa trên địa chỉ IP (IPv4 hoặc IPv6). IP không đảm bảo gói tin sẽ đến nơi, nó chỉ tìm đường đi tốt nhất.
- **TCP (Transmission Control Protocol)**: Đảm bảo dữ liệu được truyền tải tin cậy thông qua cơ chế "bắt tay 3 bước" (3-way handshake). TCP Header chứa các cờ (Flags) vô cùng quan trọng cho việc phân tích bảo mật:
  - `SYN (Synchronize)`: Dùng để bắt đầu một kết nối. Kẻ tấn công gửi hàng loạt SYN để quét cổng (SYN Scan).
  - `ACK (Acknowledgment)`: Xác nhận đã nhận dữ liệu hoặc xác nhận kết nối.
  - `FIN (Finish)`: Yêu cầu đóng kết nối một cách duyên dáng.
  - `RST (Reset)`: Đóng kết nối ngay lập tức khi có lỗi hoặc cổng bị đóng.
  - `PSH (Push)`: Yêu cầu đẩy dữ liệu thẳng lên lớp ứng dụng.
  - `URG (Urgent)`: Đánh dấu dữ liệu khẩn cấp.
  Phân tích sự kết hợp bất thường của các cờ này (ví dụ: XMAS Scan gửi cờ FIN, URG, PSH cùng lúc) giúp phát hiện các kiểu quét mạng bí mật.
- **UDP (User Datagram Protocol)**: Nhanh hơn TCP nhưng không đảm bảo dữ liệu đến nơi (không tin cậy). Thường dùng cho DNS, Streaming video/audio, hoặc các ứng dụng thời gian thực nơi tốc độ quan trọng hơn độ chính xác tuyệt đối.
- **ICMP (Internet Control Message Protocol)**: Dùng để báo lỗi và kiểm tra tình trạng kết nối mạng. Ping và Traceroute sử dụng ICMP. Việc một máy nhận quá nhiều ICMP Echo Request trong thời gian ngắn là dấu hiệu của tấn công Ping Flood (DoS).

#### English
The TCP/IP model is the foundation of the modern Internet. In this lesson, we will focus on the core protocols and their details:
- **IP (Internet Protocol)**: Responsible for routing packets based on IP addresses (IPv4 or IPv6). IP does not guarantee delivery; it only finds the best path.
- **TCP (Transmission Control Protocol)**: Ensures reliable data transmission through a "3-way handshake" mechanism. The TCP Header contains Flags that are critically important for security analysis:
  - `SYN (Synchronize)`: Used to initiate a connection. Attackers send a barrage of SYNs to scan ports (SYN Scan).
  - `ACK (Acknowledgment)`: Confirms receipt of data or acknowledges a connection.
  - `FIN (Finish)`: Requests to close the connection gracefully.
  - `RST (Reset)`: Resets the connection immediately when an error occurs or a port is closed.
  - `PSH (Push)`: Requests to push data directly to the application layer.
  - `URG (Urgent)`: Marks data as urgent.
  Analyzing abnormal combinations of these flags (e.g., XMAS Scan sending FIN, URG, PSH simultaneously) helps detect stealthy network scanning patterns.
- **UDP (User Datagram Protocol)**: Faster than TCP but does not guarantee delivery (unreliable). Commonly used for DNS, Video/audio streaming, or real-time applications where speed matters more than absolute accuracy.
- **ICMP (Internet Control Message Protocol)**: Used for error reporting and testing network connectivity status. Ping and Traceroute use ICMP. A machine receiving too many ICMP Echo Requests in a short time is a sign of a Ping Flood (DoS) attack.

### 3. Sức mạnh của Scapy trong Phòng thủ / The Power of Scapy in Defense

#### Tiếng Việt
Scapy là một công cụ thao tác gói tin tương tác, cực kỳ linh hoạt và mạnh mẽ được viết hoàn toàn bằng Python. Trái ngược với các công cụ tĩnh như Wireshark chỉ dùng để xem, Scapy cho phép lập trình viên nhúng trực tiếp khả năng giám sát mạng vào ứng dụng Python. Scapy cho phép người dùng:
- Bắt (Sniff) hàng ngàn gói tin trên đường truyền mạng mỗi giây với các bộ lọc BPF (Berkeley Packet Filter) tùy chỉnh.
- Phân tích và giải mã chi tiết từng lớp của gói tin (Ethernet, IP, TCP, Raw HTTP...).
- Lưu trữ các gói tin dưới định dạng PCAP để phân tích sau.
- Đối sánh (Match) các luồng gói tin gửi đi và nhận về để phân tích phiên kết nối (Session Analysis).

Trong khóa học này, chúng ta CHỈ sử dụng Scapy với mục đích **bắt và phân tích** (sniffing and analysis) trên môi trường cục bộ (localhost) để phục vụ cho mục đích phòng thủ (defensive purposes). Nó sẽ đóng vai trò là "con mắt" của hệ thống IDS (Intrusion Detection System) do chính học sinh lập trình. Việc tạo và gửi gói tin sẽ được giới hạn ở các tương tác an toàn với các dịch vụ cục bộ.

#### English
Scapy is a highly flexible, powerful interactive packet manipulation program and library written entirely in Python. Unlike static tools like Wireshark used mainly for viewing, Scapy allows developers to embed network monitoring capabilities directly into Python applications. Scapy enables users to:
- Sniff thousands of network packets off the wire per second using custom BPF (Berkeley Packet Filter) filters.
- Dissect and decode every layer of the packet in detail (Ethernet, IP, TCP, Raw HTTP...).
- Store packets in PCAP format for post-analysis.
- Match outgoing requests and incoming replies for Session Analysis.

In this course, we will ONLY use Scapy for **sniffing and analysis** on the local environment (localhost) for defensive purposes. It will act as the "eyes" of an IDS (Intrusion Detection System) programmed by the students themselves. Forging and sending packets will be strictly limited to safe interactions with local services.

### 4. Ứng dụng Phân Tích Gói Tin trong Blue Team / Blue Team Packet Analysis Applications

#### Tiếng Việt
Phân tích gói tin là "vũ khí" quan trọng nhất giúp các kỹ sư Blue Team (Đội phòng thủ):
- **Phát hiện Quét Cổng (Port Scanning Detection)**: Nhận biết khi nào một máy lạ liên tục gửi các gói TCP SYN (Half-open scan) hoặc TCP Connect tới nhiều cổng (Port 21, 22, 80, 443...) khác nhau để tìm kiếm các dịch vụ đang mở và có thể tồn tại lỗ hổng.
- **Phát hiện Tấn công Từ chối Dịch vụ (DoS Detection)**: Phân tích sự gia tăng bất thường về tần suất và số lượng của các gói tin (như ICMP Echo Request flood, TCP SYN flood, hay UDP Amplification) từ một hoặc nhiều IP ngập lụt mạng lưới.
- **Kiểm tra Cấu Hình Sai (Misconfiguration Auditing)**: Đảm bảo các quy tắc tường lửa (firewall rules) đang hoạt động chính xác bằng cách quan sát xem các gói tin đáng lẽ phải bị drop (loại bỏ) có thực sự bị loại bỏ hay không.
- **Phân Tích Dữ Liệu Rò Rỉ (Data Exfiltration Detection)**: Bắt các gói tin liên lạc chứa dữ liệu nhạy cảm (mật khẩu, khóa API) được truyền dưới dạng bản rõ (plaintext) không mã hóa (HTTP, Telnet) để kịp thời cảnh báo lập trình viên sửa lỗi.

#### English
Packet analysis is the most critical "weapon" helping Blue Team engineers (Defensive team) to:
- **Port Scanning Detection**: Recognize when an unknown host continuously sends TCP SYN packets (Half-open scan) or TCP Connect packets to various ports (Port 21, 22, 80, 443...) to discover open services and potential vulnerabilities.
- **Denial of Service (DoS) Detection**: Analyze abnormal spikes in frequency and volume of packets (like ICMP Echo Request floods, TCP SYN floods, or UDP Amplification) from one or multiple IPs flooding the network.
- **Misconfiguration Auditing**: Ensure firewall rules are functioning correctly by observing whether packets that should be dropped are indeed being dropped.
- **Data Exfiltration Detection**: Capture communication packets containing sensitive data (passwords, API keys) transmitted in unencrypted plaintext (HTTP, Telnet) to promptly alert developers to fix the security flaw.

---

## Sơ Đồ Cấu Hình Mạng / Network Topology

### Vietnamese (Tiếng Việt)
Để đảm bảo an toàn tuyệt đối và tuân thủ pháp luật, bài thực hành này được thiết kế theo một cấu trúc mạng "Đóng hộp" (Sandboxed) nghiêm ngặt nhất:
- **Giao diện (Interface)**: Toàn bộ quá trình bắt gói tin (sniffing) bằng Scapy sẽ được cấu hình tường minh để chỉ lắng nghe trên giao diện mạng cục bộ **Loopback**. (Tên giao diện thường là `lo`, `lo0` trên Linux/macOS, hoặc `Software Loopback Interface 1` trên Windows, với địa chỉ IP duy nhất là `127.0.0.1`).
- **Nguồn (Source)**: Máy tính cục bộ của học viên đóng vai trò là Máy Client.
- **Đích (Destination)**: Cùng chính máy tính cục bộ của học viên đóng vai trò là Máy Server nội bộ.
- **Tuyệt đối Không**: Tuyệt đối không thực thi các kịch bản quét, dò tìm hoặc bắt gói tin trên các dải địa chỉ IP trên mạng WiFi gia đình (như `192.168.1.x`, `10.0.0.x`), mạng công ty, trường học, hoặc bất kỳ địa chỉ IP công cộng (Public IP) nào trên Internet.
- **Kiểm Soát Rủi Ro**: Bằng cách chỉ sử dụng Loopback, chúng ta đảm bảo rằng không có bất kỳ dữ liệu nào rời khỏi thiết bị vật lý của người học, loại trừ 100% khả năng vô tình tấn công thiết bị khác.

### English
To ensure absolute safety and legal compliance, this hands-on lab is designed around the strictest "Sandboxed" network topology:
- **Interface**: The entire packet sniffing process using Scapy will be explicitly configured to listen ONLY on the local **Loopback** network interface. (The interface name is typically `lo`, `lo0` on Linux/macOS, or `Software Loopback Interface 1` on Windows, with the unique IP address `127.0.0.1`).
- **Source**: The student's local machine acting as the Client Machine.
- **Destination**: The exact same local machine of the student acting as the internal Server Machine.
- **Strictly Prohibited**: Absolutely do not execute scanning, probing, or packet sniffing scripts on IP address ranges on home WiFi networks (such as `192.168.1.x`, `10.0.0.x`), corporate networks, school networks, or any Public IPs on the Internet.
- **Risk Control**: By solely using Loopback, we guarantee that no data ever leaves the student's physical device, eliminating 100% of the possibility of accidentally attacking another device.

---

## Thực Hành / Hands-On

### Phần 1: Cài đặt và Phân Tích Giao Diện Mạng / Part 1: Setup and Network Interface Analysis

#### Tiếng Việt
**Bước 1:** Mở Terminal (Mac/Linux) hoặc Command Prompt/PowerShell (Windows - Chạy dưới quyền Administrator/Run as Administrator là bắt buộc để bắt gói tin).
**Bước 2:** Cài đặt Scapy thông qua công cụ quản lý gói `pip`.
```bash
# Nâng cấp pip (Tùy chọn)
python -m pip install --upgrade pip
# Cài đặt scapy
pip install scapy
```
*(Lưu ý đối với hệ điều hành Windows, hãy đảm bảo bạn đã tải và cài đặt Npcap từ trang chủ: https://npcap.com/. Trong quá trình cài đặt, hãy tích chọn ô "Install Npcap in WinPcap API-compatible Mode" để Scapy có thể tương thích tốt nhất.)*

**Bước 3:** Lập trình kịch bản xác định giao diện mạng Loopback an toàn.
Việc xác định đúng tên giao diện Loopback là bước quan trọng nhất để tránh bắt nhầm gói tin trên card mạng WiFi.
- Mở một file mới đặt tên là `find_loopback.py`. Nhập đoạn code sau:

```python
from scapy.all import conf

print("Danh sách các giao diện mạng khả dụng trên hệ thống (Available Interfaces):")
print("-" * 50)
for iface_name in conf.ifaces:
    iface = conf.ifaces[iface_name]
    print(f"Name/Index: {iface_name}")
    print(f"IP: {iface.ip}")
    print(f"Description: {iface.description}")
    print("-" * 30)

print("\nHướng dẫn: Hãy tìm giao diện có IP là '127.0.0.1'.")
print("Trên macOS/Linux thường là 'lo' hoặc 'lo0'.")
print("Trên Windows thường là 'Software Loopback Interface 1'.")
```
- Chạy file: `python find_loopback.py`. Ghi nhớ TÊN giao diện Loopback của bạn.

#### English
**Step 1:** Open Terminal (Mac/Linux) or Command Prompt/PowerShell (Windows - Run as Administrator is strictly required for packet sniffing).
**Step 2:** Install Scapy via the `pip` package manager.
```bash
# Upgrade pip (Optional)
python -m pip install --upgrade pip
# Install scapy
pip install scapy
```
*(Note for Windows Operating Systems, ensure you have downloaded and installed Npcap from the official site: https://npcap.com/. During installation, check the box "Install Npcap in WinPcap API-compatible Mode" for best Scapy compatibility.)*

**Step 3:** Program a script to identify the safe Loopback network interface.
Identifying the correct Loopback interface name is the most crucial step to avoid mistakenly sniffing packets on the WiFi network card.
- Open a new file named `find_loopback.py`. Enter the following code:
*(Code provided in the Vietnamese section)*
- Run the file: `python find_loopback.py`. Remember the NAME of your Loopback interface.

### Phần 2: Xây dựng Hệ thống Bắt Gói Tin Cơ Bản (Basic Local Sniffer) / Part 2: Building a Basic Local Packet Sniffer

#### Tiếng Việt
Mục tiêu: Viết một đoạn mã Python sử dụng hàm `sniff` của Scapy để lắng nghe trên cổng 127.0.0.1. Chúng ta sẽ áp dụng bộ lọc (BPF filter) để chỉ bắt các gói tin ICMP nhằm giảm nhiễu.
**Quy tắc An Toàn**: Phải gán biến `LOOPBACK_INTERFACE` thành tên giao diện bạn vừa tìm được ở Phần 1.

1. Tạo một file tên là `basic_sniffer.py`.
2. Dán đoạn mã sau.
3. Chạy file bằng quyền admin (`sudo python basic_sniffer.py` trên Mac/Linux hoặc chạy trong CMD Admin trên Windows).

#### English
Objective: Write a Python script using Scapy's `sniff` function to listen on 127.0.0.1. We will apply a BPF filter to only capture ICMP packets to reduce noise.
**Safety Rule**: You must assign the `LOOPBACK_INTERFACE` variable to the interface name you found in Part 1.

1. Create a file named `basic_sniffer.py`.
2. Paste the following code.
3. Run the file as admin (`sudo python basic_sniffer.py` on Mac/Linux or in Admin CMD on Windows).

```python
# basic_sniffer.py
from scapy.all import sniff, ICMP, IP

def packet_callback(packet):
    # Check if the packet has an IP layer and is ICMP
    if packet.haslayer(IP) and packet.haslayer(ICMP):
        src_ip = packet[IP].src
        dst_ip = packet[IP].dst
        icmp_type = packet[ICMP].type
        
        type_str = "Echo Request (Ping)" if icmp_type == 8 else "Echo Reply (Pong)" if icmp_type == 0 else str(icmp_type)
        print(f"[ICMP] {src_ip} -> {dst_ip} | Type: {type_str}")

# WARNING: CHANGE THIS TO YOUR LOOPBACK INTERFACE NAME
# e.g., 'lo', 'lo0', or 'Software Loopback Interface 1'
LOOPBACK_INTERFACE = 'lo0' 

print(f"[*] Starting local sniffer on {LOOPBACK_INTERFACE} for ICMP packets...")
# BPF Filter 'icmp' ensures we only capture ping packets, saving resources.
sniff(iface=LOOPBACK_INTERFACE, filter="icmp", prn=packet_callback, count=0)
```

**Thử nghiệm (Testing):** 
1. Để cho kịch bản Python đang chạy lắng nghe ở terminal 1.
2. Mở một terminal thứ hai và thực hiện lệnh ping nội bộ: `ping 127.0.0.1 -c 4` (trên Mac/Linux) hoặc `ping 127.0.0.1 -n 4` (trên Windows).
3. Quan sát terminal 1: Bạn sẽ thấy trình sniffer bắt được chính xác các yêu cầu Ping và phản hồi nội bộ.

### Phần 3: Lập Trình Hệ Thống Phát Hiện Quét Cổng (Port Scan Detector) / Part 3: Programming a Port Scan Detector (Mini NIDS)

#### Tiếng Việt
Trong môi trường thực tế, tin tặc sẽ dùng các công cụ như Nmap để quét các cổng đang mở. Dấu hiệu phổ biến nhất là một máy chủ gửi rất nhiều gói TCP SYN tới nhiều cổng khác nhau trong thời gian ngắn mà không hoàn thành quá trình bắt tay 3 bước (Half-open scan). 
Chúng ta sẽ lập trình một Mini NIDS để phát hiện hành vi này trên Localhost.

#### English
In a real-world environment, hackers use tools like Nmap to scan for open ports. The most common signature is a host sending many TCP SYN packets to different ports in a short time frame without completing the 3-way handshake (Half-open scan).
We will program a Mini NIDS to detect this behavior on Localhost.

```python
# defensive_auditor.py
from scapy.all import sniff, IP, TCP
from collections import defaultdict
import time

# Dictionary to track SYN packets from IP addresses to different destination ports
# Structure: { source_ip: set(port1, port2, port3...) }
syn_scan_tracker = defaultdict(set)
# Alert threshold: If a single IP scans more than 10 unique ports, it's considered a scan
SCAN_THRESHOLD = 10 

def detect_port_scan(packet):
    # Only analyze IPv4 and TCP packets
    if packet.haslayer(IP) and packet.haslayer(TCP):
        src_ip = packet[IP].src
        dst_port = packet[TCP].dport
        tcp_flags = packet[TCP].flags
        
        # 'S' stands for SYN flag
        if tcp_flags == 'S':
            # Add the scanned port to the set for this source IP
            syn_scan_tracker[src_ip].add(dst_port)
            
            # Check if the number of unique ports scanned exceeds the threshold
            if len(syn_scan_tracker[src_ip]) > SCAN_THRESHOLD:
                print(f"[CRITICAL ALERT] Port Scan Activity Detected from IP: {src_ip}!")
                print(f"[*] Total unique ports scanned so far: {len(syn_scan_tracker[src_ip])}")
                
                # Reset tracking to prevent continuous spam, or you could implement an IP ban logic here
                syn_scan_tracker[src_ip] = set()

# MUST BE LOOPBACK
LOOPBACK_INTERFACE = 'lo0'
print(f"[*] NIDS Engine starting on {LOOPBACK_INTERFACE}...")
print(f"[*] Monitoring for TCP SYN port scans (Threshold: {SCAN_THRESHOLD} ports)...")

# Sniff TCP traffic on loopback
sniff(iface=LOOPBACK_INTERFACE, filter="tcp", prn=detect_port_scan, store=0)
```

**Mô phỏng kiểm toán an toàn (Safe Auditing Simulation):**
1. Chạy file `defensive_auditor.py` ở terminal 1 bằng quyền Admin.
2. Ở terminal 2, chúng ta sẽ mô phỏng một kẻ tấn công quét cổng nội bộ bằng một đoạn mã Python đơn giản khác (lưu thành file `simulate_scan.py`):
```python
import socket

# Try connecting to 15 different ports on localhost
for port in range(8000, 8015):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(0.1) # Fast timeout for quick scan
        s.connect(('127.0.0.1', port))
        s.close()
    except:
        pass
print("Local scan simulation finished.")
```
3. Chạy lệnh `python simulate_scan.py` ở terminal 2.
4. Xem terminal 1 hiển thị dòng chữ ĐỎ (hoặc CẢNH BÁO) khi kịch bản quét chạm tới giới hạn 10 cổng.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices

### Vietnamese (Tiếng Việt)
- **THIẾT KẾ AN TOÀN (FAIL-SAFE BY DESIGN)**: Trong mọi đoạn mã trên, biến `LOOPBACK_INTERFACE` đều được gán cố định cho giao diện mạng cục bộ ảo (`lo`, `lo0`, `127.0.0.1`). Học sinh TUYỆT ĐỐI KHÔNG sửa giao diện này thành card mạng vật lý kết nối ra ngoài (`eth0`, `wlan0`, `Wi-Fi`) khi chưa có sự đồng ý bằng văn bản của người quản trị mạng và hướng dẫn viên.
- **Tuân thủ Pháp luật**: Việc quét cổng, dò tìm lỗ hổng hoặc bắt gói tin (sniffing) trên các hệ thống mạng mà bạn không sở hữu hoặc không có sự cho phép rõ ràng là hành vi phạm pháp nghiêm trọng tại Việt Nam (theo Luật An mạng) và trên toàn cầu, có thể dẫn đến truy cứu trách nhiệm hình sự.
- **Trọng tâm của Khóa học**: Bài học này dạy bạn cách tư duy như một HỆ THỐNG PHÒNG THỦ (Defensive System). Mục tiêu cao nhất là viết ra các đoạn mã phần mềm giúp bảo vệ hệ thống mạng khỏi các hành vi dò quét độc hại, không phải để tạo ra phần mềm đi tấn công máy tính của người khác.

### English
- **FAIL-SAFE BY DESIGN**: In all code snippets above, the `LOOPBACK_INTERFACE` variable is hard-coded to the virtual local network interface (`lo`, `lo0`, `127.0.0.1`). Students MUST NOT change this interface to physical outward-facing network cards (`eth0`, `wlan0`, `Wi-Fi`) without explicit written consent from network administrators and instructors.
- **Legal Compliance**: Port scanning, vulnerability probing, or packet sniffing on networks you do not own or lack explicit permission for is a serious criminal offense globally, punishable by law.
- **Course Focus**: This lesson teaches you to think like a DEFENSIVE SYSTEM. The ultimate goal is to write software scripts that protect networks from malicious scanning behaviors, not to create attack software targeting other computers.

---

## Code Mẫu Bổ Sung: Phân Tích Gói Tin Web Cục Bộ (Kiểm toán Dữ liệu nhạy cảm) / Additional Code Samples: Auditing Local Web Traffic

#### Tiếng Việt
Đoạn mã sau giúp kiểm toán viên an ninh (Security Auditor) theo dõi các yêu cầu HTTP (không mã hóa) diễn ra trên máy tính cục bộ.
**Ứng dụng thực tế phòng thủ:** Các nhà phát triển đôi khi mắc sai lầm khi tạo các API nội bộ không sử dụng HTTPS. Đoạn mã IDS này sẽ giám sát cổng 8080 trên localhost, và cảnh báo ngay lập tức nếu phát hiện bất kỳ trường hợp truyền tải dữ liệu mật khẩu nào dưới dạng bản rõ (plaintext).

#### English
The following code helps a Security Auditor monitor unencrypted HTTP requests occurring on the local machine.
**Practical Defensive Application:** Developers sometimes make the mistake of creating internal APIs without HTTPS. This IDS script monitors port 8080 on localhost and triggers an immediate alert if it detects any plaintext password transmission.

```python
# http_plaintext_auditor.py
from scapy.all import sniff, IP, TCP, Raw

def audit_http_traffic(packet):
    # Check if the packet has an IP layer, TCP layer, and Raw data (Payload)
    if packet.haslayer(IP) and packet.haslayer(TCP) and packet.haslayer(Raw):
        # Focus on a local testing port, e.g., 8080
        if packet[TCP].dport == 8080 or packet[TCP].sport == 8080:
            try:
                # Decode the raw payload bytes into string
                payload = packet[Raw].load.decode('utf-8', errors='ignore')
                
                # Simple heuristic to look for sensitive keywords in plaintext
                keywords = ['password=', 'pwd=', '"password":', 'secret_token']
                
                for word in keywords:
                    if word in payload.lower():
                        print(f"\n[CRITICAL WARNING] Cleartext credentials transmission detected!")
                        print(f"[*] Source: {packet[IP].src} | Destination: {packet[IP].dst}")
                        print(f"[*] Captured Payload Snippet: \n{payload[:150]}...")
                        print(f"[*] ACTION REQUIRED: Upgrade internal API to use HTTPS/TLS immediately.\n")
                        break
            except Exception as e:
                pass

LOOPBACK_INTERFACE = 'lo0'
print(f"[*] HTTP Data-Leak Auditor running on {LOOPBACK_INTERFACE} (Port 8080)...")
print("[*] Waiting for unencrypted credential transmissions...")
sniff(iface=LOOPBACK_INTERFACE, filter="tcp port 8080", prn=audit_http_traffic, store=0)
```

---

## Câu Hỏi Thảo Luận / Discussion

### Vietnamese (Tiếng Việt)
1. Trong đoạn mã phát hiện quét cổng `defensive_auditor.py`, tại sao chúng ta lại chỉ đếm số lượng các cổng đích (destination port) khác nhau mà máy trạm cố gắng kết nối tới thay vì chỉ đếm tổng số gói tin TCP SYN?
2. BBPF (Berkeley Packet Filter) filter được sử dụng trong hàm `sniff()` mang lại lợi ích hiệu suất lớn như thế nào đối với một hệ thống IDS phải xử lý hàng Gigabit dữ liệu mỗi giây?
3. Việc phân tích nội dung gói tin (như ở đoạn code `http_plaintext_auditor.py`) có thể gây ra những rủi ro nào về quyền riêng tư đối với nhân viên trong một tổ chức mạng doanh nghiệp? Là một quản trị viên an ninh mạng, bạn sẽ cân bằng thế nào giữa nhu cầu bảo mật dữ liệu và quyền riêng tư của cá nhân?
4. Tại sao giao diện Loopback (`127.0.0.1`) lại là một môi trường hộp cát (sandbox) hoàn hảo nhất để thử nghiệm và thực hành việc bắt gói tin và phân tích mã độc trước khi triển khai thực tế?

### English
1. In the `defensive_auditor.py` port scan detection script, why do we count the number of UNIQUE destination ports a host attempts to connect to, rather than just counting the total number of TCP SYN packets?
2. How does using a BPF (Berkeley Packet Filter) filter in the `sniff()` function provide massive performance benefits for an IDS system tasked with processing Gigabits of data per second?
3. What privacy risks could Deep Packet Inspection (as seen in `http_plaintext_auditor.py`) pose to employees within a corporate network? As a cybersecurity admin, how would you balance the need for data security with individual privacy rights?
4. Why is the Loopback interface (`127.0.0.1`) the most perfect sandbox environment for experimenting and practicing packet sniffing and malware traffic analysis prior to real-world deployment?

---

## Bài Về Nhà / Homework

### Vietnamese (Tiếng Việt)
**Nhiệm vụ 1: Lập trình tính năng Ghi Nhật Ký (Logging) cho Hệ thống IDS**
Nâng cấp file `defensive_auditor.py` (Hệ thống phát hiện quét cổng). Thay vì chỉ in ra màn hình `[CRITICAL ALERT]`, hãy sử dụng thư viện `logging` có sẵn của Python để ghi lại các cảnh báo này vào một tệp nhật ký bảo mật tên là `nids_audit_log.txt`. Mỗi dòng log phải ghi rõ thời gian thực (Timestamp), địa chỉ IP nguồn thực hiện dò quét, và tổng số cổng đã bị quét.

**Nhiệm vụ 2: Phân biệt các Hệ thống An ninh mạng (NIDS, NIPS, Firewall)**
Viết một đoạn văn ngắn bằng văn xuôi (khoảng 250-300 từ) hoặc lập bảng so sánh để làm rõ sự khác biệt về vai trò, chức năng và vị trí triển khai giữa 3 hệ thống:
1. NIDS (Network Intrusion Detection System) - Hệ thống phát hiện xâm nhập mạng.
2. NIPS (Network Intrusion Prevention System) - Hệ thống ngăn chặn xâm nhập mạng.
3. Network Firewall - Tường lửa mạng truyền thống.
Bạn hãy lấy một ví dụ thực tế về cách 3 hệ thống này phản ứng khi phát hiện một luồng SYN Scan nguy hiểm.

### English
**Task 1: Programming a Logging Feature for the IDS System**
Upgrade the `defensive_auditor.py` (Port Scan Detector) file. Instead of solely printing `[CRITICAL ALERT]` to the console, utilize Python's built-in `logging` library to record these alerts into a security log file named `nids_audit_log.txt`. Each log entry must clearly record the exact timestamp, the source IP address performing the scan, and the total number of scanned ports.

**Task 2: Differentiating Cybersecurity Systems (NIDS, NIPS, Firewall)**
Write a short paragraph (approx. 250-300 words) or create a comparison table to clarify the differences in role, functionality, and deployment location among these 3 systems:
1. NIDS (Network Intrusion Detection System)
2. NIPS (Network Intrusion Prevention System)
3. Traditional Network Firewall
Provide a practical example of how each of these three systems would react when detecting a malicious SYN Scan traffic flow.

---

## Đánh Giá / Assessment Rubric

### Tiêu chí chấm điểm (Tiếng Việt)
| Tiêu chí / Khung điểm | Xuất sắc (9-10) | Khá (7-8) | Trung bình (5-6) | Cần cố gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Thực hành Lập trình Python (Task 1)** | Áp dụng thư viện `logging` chính xác, format log chuẩn mực bao gồm đầy đủ Timestamp, IP, Port Count. Mã chạy ổn định, cấu trúc rõ ràng. | Hoàn thành việc ghi log vào file `txt` nhưng sử dụng hàm `open/write` cơ bản thay vì thư viện `logging`, mã hoạt động tốt. | Code chạy được nhưng tính năng ghi log file bị thiếu thông tin quan trọng hoặc định dạng khó đọc. | Không nộp bài code, đoạn code copy bị lỗi cú pháp, hoặc chương trình văng lỗi ngoại lệ. |
| **Kiến thức An ninh mạng chuyên sâu (Task 2)** | Phân biệt rõ ràng, sắc bén giữa NIDS (giám sát/báo động thụ động), NIPS (can thiệp/chặn chủ động) và Firewall (luật tĩnh). Ví dụ cực kỳ thực tế. | Trả lời đúng trọng tâm chức năng của 3 thành phần nhưng chưa phân tích sâu vị trí triển khai hoặc ví dụ còn chưa rõ. | Trình bày được định nghĩa cơ bản nhưng còn nhầm lẫn ranh giới giữa chức năng của Firewall và NIPS. | Không hiểu rõ khái niệm, copy/paste định nghĩa từ mạng không qua chỉnh sửa, thiếu ví dụ thực tế. |
| **Tuân thủ Chuẩn mực Đạo đức & An toàn** | Tuân thủ tuyệt đối quy định chỉ dùng giao diện loopback `127.0.0.1` trong mã code. Thể hiện tư duy phòng thủ mạng (Blue Team) mẫu mực. | Tuân thủ tốt các quy định về an toàn mạng, chạy mã nội bộ an toàn. | Đôi khi có xu hướng muốn thử nghiệm quét các máy ngoài mạng LAN thật nhưng chưa thực thi. | Vi phạm nguyên tắc an toàn cốt lõi: cố ý chỉnh sửa mã gốc để quét các dải IP thực, đe dọa các máy tính khác. |

### Grading Criteria (English)
| Criteria / Score Range | Excellent (9-10) | Good (7-8) | Average (5-6) | Needs Improvement (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Python Programming Practice (Task 1)** | Correctly applies the `logging` library, standard log format including complete Timestamp, IP, Port Count. Stable code, clear structure. | Completes logging to a `txt` file but uses basic `open/write` functions instead of the `logging` library; code runs well. | Code runs but the file logging feature is missing critical information or has hard-to-read formatting. | No code submitted, copied code has syntax errors, or program crashes with exceptions. |
| **Deep Cybersecurity Knowledge (Task 2)** | Sharply distinguishes between NIDS (passive monitoring/alerting), NIPS (active intervention/blocking), and Firewall (static rules). Excellent real-world example. | Correctly addresses the core functions of the 3 components but lacks depth on deployment locations; examples are somewhat vague. | Presents basic definitions but confuses the boundary between Firewall and NIPS functionalities. | Misunderstands concepts, unedited copy/paste of definitions from the web, lacks practical examples. |
| **Ethical & Safety Compliance** | Strictly adheres to the loopback interface `127.0.0.1` rule in code. Demonstrates exemplary Blue Team defensive mindset. | Adheres well to network safety rules, runs code safely internally. | Shows occasional inclination to test scanning on real LAN machines but hasn't executed it. | Violates core safety principles: intentionally modifies source code to scan real IP ranges, threatening other computers. |

---
*End of Week 2 Lesson / Kết thúc Bài học Tuần 2*
