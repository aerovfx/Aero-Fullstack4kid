# Tuần 5: Sniffing & Traffic Analysis với Wireshark (CEH v12 Module 08 Aligned)

## Mục Tiêu / Objectives (CEH v12 Aligned)

### Vietnamese
Trong tuần này, học sinh sẽ học cách:
1. Hiểu các khái niệm cơ bản về mạng máy tính (địa chỉ IP, cổng, giao thức).
2. Làm quen với môi trường Kali Linux, một hệ điều hành dành riêng cho kiểm tra bảo mật.
3. Sử dụng công cụ Nmap để quét và kiểm toán hệ thống mạng nội bộ một cách an toàn.
4. Nhận biết các dịch vụ đang chạy trên một máy tính và đánh giá các rủi ro bảo mật tiềm ẩn.
5. Học cách đọc và phân tích kết quả từ Nmap để đưa ra các biện pháp phòng thủ (phòng thủ mạng).
6. Tuân thủ nghiêm ngặt các nguyên tắc đạo đức và pháp luật trong an ninh mạng (chỉ quét các hệ thống được phép, cụ thể là localhost).

### English
In this week, students will learn how to:
1. Understand the basic concepts of computer networks (IP addresses, ports, protocols).
2. Get familiar with the Kali Linux environment, an operating system dedicated to security auditing.
3. Use the Nmap tool to safely scan and audit a local network.
4. Identify services running on a computer and assess potential security risks.
5. Learn how to read and analyze results from Nmap to implement defensive measures (network defense).
6. Strictly adhere to ethical and legal principles in cybersecurity (only scanning authorized systems, specifically localhost).

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Vietnamese
Để tham gia bài học này, học sinh cần chuẩn bị:
1. **Máy tính / Laptop**: Cấu hình tối thiểu 4GB RAM, ổ cứng trống ít nhất 20GB.
2. **Máy ảo (Virtual Machine)**: Phần mềm VMware Workstation Player hoặc Oracle VirtualBox.
3. **Hệ điều hành Kali Linux**: File ảnh (ISO hoặc file máy ảo đã cấu hình sẵn) của Kali Linux.
4. **Kết nối Internet**: Để tải các bản cập nhật và công cụ cần thiết (nếu cần).
5. **Nmap**: Đã được cài đặt sẵn trong Kali Linux.

### English
To participate in this lesson, students need to prepare:
1. **Computer / Laptop**: Minimum configuration of 4GB RAM, at least 20GB of free hard drive space.
2. **Virtual Machine**: VMware Workstation Player or Oracle VirtualBox software.
3. **Kali Linux Operating System**: Image file (ISO or pre-configured virtual machine file) of Kali Linux.
4. **Internet Connection**: To download updates and necessary tools (if needed).
5. **Nmap**: Pre-installed in Kali Linux.

---

## Lý Thuyết / Theory

### 1. Tổng quan về Mạng Máy Tính (Computer Network Overview)
**Vietnamese**:
Mạng máy tính là một tập hợp các máy tính và các thiết bị khác được kết nối với nhau để chia sẻ tài nguyên và thông tin. Trong an ninh mạng, việc hiểu rõ cách các thiết bị giao tiếp là bước đầu tiên để bảo vệ chúng.
- **Địa chỉ IP (IP Address)**: Là một nhãn số được gán cho mỗi thiết bị tham gia mạng. Giống như địa chỉ nhà của bạn. Ví dụ: `192.168.1.5` hoặc `127.0.0.1` (localhost).
- **Cổng (Ports)**: Là các điểm cuối ảo trong một kết nối mạng. Một máy tính có thể có nhiều dịch vụ chạy trên các cổng khác nhau (từ 0 đến 65535). Ví dụ: Web (HTTP) thường chạy ở cổng 80, SSH chạy ở cổng 22.
- **Giao thức (Protocols)**: Là các quy tắc giao tiếp giữa các thiết bị. TCP (Transmission Control Protocol) đảm bảo dữ liệu được gửi đến đích một cách an toàn, trong khi UDP (User Datagram Protocol) nhanh hơn nhưng không đảm bảo độ tin cậy.

**English**:
A computer network is a collection of computers and other devices connected to share resources and information. In cybersecurity, understanding how devices communicate is the first step to protecting them.
- **IP Address**: A numerical label assigned to each device participating in a network. It's like your home address. Example: `192.168.1.5` or `127.0.0.1` (localhost).
- **Ports**: Virtual endpoints in a network connection. A computer can have multiple services running on different ports (from 0 to 65535). Example: Web (HTTP) usually runs on port 80, SSH runs on port 22.
- **Protocols**: Rules for communication between devices. TCP (Transmission Control Protocol) ensures data is safely delivered to the destination, while UDP (User Datagram Protocol) is faster but does not guarantee reliability.

### 2. Giới thiệu về Kali Linux (Introduction to Kali Linux)
**Vietnamese**:
Kali Linux là một bản phân phối Linux dựa trên Debian, được thiết kế đặc biệt cho việc kiểm tra thâm nhập (Penetration Testing) và kiểm toán an ninh mạng (Security Auditing). Nó chứa hàng trăm công cụ bảo mật được cài đặt sẵn.
- **Lý do sử dụng**: Kali cung cấp một môi trường chuẩn hóa, giúp các chuyên gia an ninh mạng tiết kiệm thời gian cài đặt công cụ.
- **Giao diện dòng lệnh (CLI)**: Mặc dù Kali có giao diện đồ họa (GUI), nhưng hầu hết các công cụ mạnh mẽ đều được sử dụng qua giao diện dòng lệnh (Terminal).

**English**:
Kali Linux is a Debian-based Linux distribution designed specifically for Penetration Testing and Security Auditing. It contains hundreds of pre-installed security tools.
- **Reason for use**: Kali provides a standardized environment, helping cybersecurity professionals save time on tool installation.
- **Command Line Interface (CLI)**: Although Kali has a graphical user interface (GUI), most powerful tools are used via the command line interface (Terminal).

### 3. Công cụ Nmap (Network Mapper)
**Vietnamese**:
Nmap là một công cụ mã nguồn mở được sử dụng để khám phá mạng và kiểm toán bảo mật.
- **Khám phá Host (Host Discovery)**: Nmap có thể tìm ra các thiết bị đang hoạt động trên mạng.
- **Quét Cổng (Port Scanning)**: Đây là tính năng quan trọng nhất, giúp xác định các cổng đang mở, đóng, hoặc bị lọc (filtered) bởi tường lửa.
- **Phát hiện Dịch vụ và Phiên bản (Service and Version Detection)**: Xác định phần mềm nào đang chạy trên các cổng mở và phiên bản của chúng.
- **Phát hiện Hệ điều hành (OS Detection)**: Dự đoán hệ điều hành của máy đích dựa trên các đặc điểm gói tin.

**English**:
Nmap is an open-source tool used for network discovery and security auditing.
- **Host Discovery**: Nmap can find active devices on a network.
- **Port Scanning**: This is the most important feature, helping identify open, closed, or filtered ports by firewalls.
- **Service and Version Detection**: Identifying which software is running on open ports and their versions.
- **OS Detection**: Predicting the operating system of the target machine based on packet characteristics.

### 4. Vòng đời của một cuộc kiểm toán mạng nội bộ (Local Network Audit Lifecycle)
**Vietnamese**:
1. **Lập kế hoạch và Lấy quyền**: Xác định mục tiêu và đảm bảo bạn có quyền quét các hệ thống đó (luôn sử dụng `127.0.0.1` trong thực hành này).
2. **Khám phá (Discovery)**: Tìm hiểu những gì đang có trên mạng.
3. **Thu thập thông tin chi tiết (Enumeration)**: Quét các cổng và dịch vụ.
4. **Phân tích Rủi ro**: Đánh giá các dịch vụ lỗi thời hoặc cấu hình sai.
5. **Báo cáo và Khắc phục**: Ghi lại kết quả và đề xuất cách bảo mật hệ thống.

**English**:
1. **Planning and Authorization**: Define goals and ensure you have permission to scan those systems (always use `127.0.0.1` in this lab).
2. **Discovery**: Find out what is on the network.
3. **Enumeration**: Scan ports and services.
4. **Risk Analysis**: Evaluate outdated services or misconfigurations.
5. **Reporting and Remediation**: Document findings and propose ways to secure the system.

---

## Sơ Đồ Cấu Hình Mạng / Network Topology

### Vietnamese
Trong bài thực hành này, chúng ta sẽ chỉ sử dụng mạng cục bộ bên trong máy ảo Kali Linux của bạn. Điều này đảm bảo an toàn tuyệt đối và ngăn chặn mọi tác động đến các thiết bị khác trên mạng thực của bạn.
- **Máy Tấn công / Giám sát**: Kali Linux (Máy ảo).
- **Máy Mục tiêu**: Cũng chính là Kali Linux (`127.0.0.1` - Localhost).
- **Môi trường**: Bị cô lập, không có lưu lượng quét nào đi ra khỏi máy ảo.

### English
In this hands-on lab, we will only use the internal local network within your Kali Linux virtual machine. This ensures absolute safety and prevents any impact on other devices on your actual network.
- **Attacking / Auditing Machine**: Kali Linux (Virtual Machine).
- **Target Machine**: The same Kali Linux machine (`127.0.0.1` - Localhost).
- **Environment**: Isolated, no scanning traffic leaves the virtual machine.

```text
+---------------------------------------------------+
|               Kali Linux Virtual Machine          |
|                                                   |
|   +-----------------+         +---------------+   |
|   |   Nmap Scanner  |  -----> |   Localhost   |   |
|   |  (Auditor tool) |         | (127.0.0.1)   |   |
|   +-----------------+         +---------------+   |
|                               (Target Services)   |
+---------------------------------------------------+
```

---

## Thực Hành / Hands-On (Strict localhost auditing focus)

### Bước 1: Khởi động Kali Linux và Mở Terminal / Step 1: Boot Kali Linux and Open Terminal
**Vietnamese**:
1. Khởi động máy ảo Kali Linux của bạn.
2. Đăng nhập với tên người dùng (thường là `kali` hoặc `root`).
3. Mở ứng dụng Terminal. Đây là nơi chúng ta sẽ nhập các lệnh Nmap.
4. Kiểm tra cấu hình mạng của bạn bằng lệnh `ip a` hoặc `ifconfig`. Bạn sẽ thấy một giao diện có tên `lo` (loopback) với địa chỉ `127.0.0.1`.

**English**:
1. Boot your Kali Linux virtual machine.
2. Log in with your username (usually `kali` or `root`).
3. Open the Terminal application. This is where we will enter Nmap commands.
4. Check your network configuration with the `ip a` or `ifconfig` command. You will see an interface named `lo` (loopback) with the address `127.0.0.1`.

### Bước 2: Thiết lập một số dịch vụ nội bộ (Tùy chọn nhưng khuyến nghị) / Step 2: Set up some local services (Optional but recommended)
**Vietnamese**:
Để Nmap tìm thấy một số cổng đang mở trên `localhost`, chúng ta có thể khởi động một vài dịch vụ có sẵn trên Kali.
Chạy các lệnh sau trong Terminal (có thể cần quyền `sudo`):
```bash
sudo systemctl start apache2   # Khởi động máy chủ web trên cổng 80
sudo systemctl start ssh       # Khởi động dịch vụ SSH trên cổng 22
```

**English**:
For Nmap to find some open ports on `localhost`, we can start a few built-in services on Kali.
Run the following commands in the Terminal (may require `sudo` privileges):
```bash
sudo systemctl start apache2   # Start a web server on port 80
sudo systemctl start ssh       # Start the SSH service on port 22
```

### Bước 3: Quét cơ bản (Basic Scan)
**Vietnamese**:
Hãy thử quét cơ bản nhất trên `localhost`. Lệnh này sẽ quét 1000 cổng phổ biến nhất.
**Lệnh**:
```bash
nmap 127.0.0.1
```
**Phân tích kết quả**: Bạn sẽ thấy danh sách các cổng đang mở, ví dụ: 22/tcp (ssh), 80/tcp (http). Nếu cột "STATE" hiển thị "open", có nghĩa là dịch vụ đang chạy và sẵn sàng nhận kết nối.

**English**:
Let's try the most basic scan on `localhost`. This command will scan the 1000 most common ports.
**Command**:
```bash
nmap 127.0.0.1
```
**Analyzing results**: You will see a list of open ports, for example: 22/tcp (ssh), 80/tcp (http). If the "STATE" column shows "open", it means the service is running and ready to accept connections.

### Bước 4: Quét với chi tiết dịch vụ và phiên bản (Service/Version Detection)
**Vietnamese**:
Để biết chính xác phiên bản phần mềm đang chạy trên cổng (điều này rất quan trọng để tìm kiếm các lỗ hổng bảo mật đã biết), chúng ta sử dụng cờ `-sV`.
**Lệnh**:
```bash
nmap -sV 127.0.0.1
```
**Phân tích kết quả**: Nmap sẽ cố gắng giao tiếp với dịch vụ để xác định phiên bản. Ví dụ, cổng 80 có thể hiển thị "Apache httpd 2.4.52 (Debian)". Đây là thông tin cực kỳ hữu ích cho một kiểm toán viên (auditor).

**English**:
To know exactly what software version is running on a port (which is crucial for finding known security vulnerabilities), we use the `-sV` flag.
**Command**:
```bash
nmap -sV 127.0.0.1
```
**Analyzing results**: Nmap will try to communicate with the service to determine the version. For example, port 80 might show "Apache httpd 2.4.52 (Debian)". This is extremely useful information for an auditor.

### Bước 5: Quét nhanh (Fast Scan)
**Vietnamese**:
Nếu bạn đang vội, bạn có thể chỉ quét 100 cổng phổ biến nhất thay vì 1000. Sử dụng cờ `-F`.
**Lệnh**:
```bash
nmap -F 127.0.0.1
```
**English**:
If you are in a hurry, you can scan only the top 100 common ports instead of 1000. Use the `-F` flag.
**Command**:
```bash
nmap -F 127.0.0.1
```

### Bước 6: Quét tất cả các cổng (Scan All Ports)
**Vietnamese**:
Một máy tính có 65535 cổng TCP. Lệnh quét cơ bản có thể bỏ qua một số dịch vụ chạy ở các cổng lạ (ví dụ: cổng 8080 hoặc 4444). Để quét toàn bộ, sử dụng cờ `-p-`. (Việc này có thể mất thời gian).
**Lệnh**:
```bash
nmap -p- 127.0.0.1
```
**English**:
A computer has 65535 TCP ports. A basic scan might miss services running on unusual ports (e.g., port 8080 or 4444). To scan them all, use the `-p-` flag. (This may take some time).
**Command**:
```bash
nmap -p- 127.0.0.1
```

### Bước 7: Quét hệ điều hành (OS Detection)
**Vietnamese**:
Nmap có thể đoán hệ điều hành dựa trên cách mà mạng của mục tiêu phản hồi. Điều này thường yêu cầu quyền quản trị (`sudo`) vì nó gửi các gói tin tùy chỉnh. Sử dụng cờ `-O`.
**Lệnh**:
```bash
sudo nmap -O 127.0.0.1
```
**English**:
Nmap can guess the operating system based on how the target's networking stack responds. This often requires administrative privileges (`sudo`) because it sends custom packets. Use the `-O` flag.
**Command**:
```bash
sudo nmap -O 127.0.0.1
```

### Bước 8: Quét tổng hợp / Quét mạnh mẽ (Aggressive Scan)
**Vietnamese**:
Để tiết kiệm thời gian, Nmap cung cấp cờ `-A`, kết hợp quét hệ điều hành, quét phiên bản, quét script (sử dụng các kịch bản mặc định của Nmap) và traceroute.
**Lệnh**:
```bash
sudo nmap -A 127.0.0.1
```
**English**:
To save time, Nmap provides the `-A` flag, which combines OS detection, version detection, script scanning (using default Nmap scripts), and traceroute.
**Command**:
```bash
sudo nmap -A 127.0.0.1
```

### Bước 9: Lưu kết quả ra file (Saving Output)
**Vietnamese**:
Một kiểm toán viên giỏi luôn lưu lại bằng chứng. Bạn có thể lưu đầu ra của Nmap vào một file văn bản với cờ `-oN` (Normal output) hoặc `-oX` (XML output).
**Lệnh**:
```bash
nmap -sV 127.0.0.1 -oN localhost_scan_results.txt
cat localhost_scan_results.txt
```
**English**:
A good auditor always keeps evidence. You can save Nmap's output to a text file with the `-oN` (Normal output) or `-oX` (XML output) flag.
**Command**:
```bash
nmap -sV 127.0.0.1 -oN localhost_scan_results.txt
cat localhost_scan_results.txt
```

---

## Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices

### Vietnamese
🚨 **CẢNH BÁO TUYỆT ĐỐI**:
- **KHÔNG BAO GIỜ** sử dụng Nmap hoặc bất kỳ công cụ quét mạng nào đối với các hệ thống hoặc địa chỉ IP mà bạn KHÔNG sở hữu hoặc KHÔNG có sự cho phép bằng văn bản rõ ràng.
- Quét mạng của người khác mà không có sự cho phép được coi là một hành động thù địch, vi phạm pháp luật ở nhiều quốc gia và có thể dẫn đến việc bạn bị kiện hoặc phạt tù.
- Trong khóa học này, mục tiêu duy nhất của chúng ta là học cách phòng thủ. Việc quét `127.0.0.1` (localhost) là hoàn toàn an toàn và hợp pháp vì bạn đang tự quét máy của chính mình.
- Hãy luôn là một chuyên gia an ninh mạng có đạo đức (White Hat Hacker).

### English
🚨 **ABSOLUTE WARNING**:
- **NEVER** use Nmap or any network scanning tools against systems or IP addresses that you DO NOT own or DO NOT have explicit written permission to scan.
- Scanning someone else's network without permission is considered a hostile act, is illegal in many countries, and can lead to lawsuits or imprisonment.
- In this course, our sole objective is to learn defensive techniques. Scanning `127.0.0.1` (localhost) is completely safe and legal because you are scanning your own machine.
- Always be an ethical cybersecurity professional (White Hat Hacker).

---

## Code Mẫu / Code Samples

### Nmap Cheat Sheet cho Localhost Auditing
```bash
# Quét cơ bản (1000 cổng)
nmap 127.0.0.1

# Quét phát hiện phiên bản dịch vụ
nmap -sV 127.0.0.1

# Quét tất cả 65535 cổng
nmap -p- 127.0.0.1

# Quét UDP (chậm hơn TCP nhiều)
sudo nmap -sU 127.0.0.1

# Quét tổng hợp (-sV, -O, -sC, --traceroute)
sudo nmap -A 127.0.0.1

# Lưu kết quả
nmap 127.0.0.1 -oN output.txt

# Dừng các dịch vụ sau khi thực hành xong
sudo systemctl stop apache2
sudo systemctl stop ssh
```

---

## Câu Hỏi Thảo Luận / Discussion

### Vietnamese
1. Tại sao việc một cổng (port) mở trên hệ thống lại có thể gây rủi ro bảo mật?
2. Nếu bạn phát hiện một cổng mở chạy phiên bản phần mềm cũ (ví dụ: Apache 2.2), bạn sẽ khuyên quản trị viên hệ thống làm gì?
3. Sự khác biệt giữa TCP và UDP là gì và tại sao việc quét UDP thường khó khăn và chậm chạp hơn?
4. Tại sao địa chỉ `127.0.0.1` lại an toàn để thực hành Nmap?

### English
1. Why can an open port on a system pose a security risk?
2. If you detect an open port running an old software version (e.g., Apache 2.2), what would you advise the system administrator to do?
3. What is the difference between TCP and UDP, and why is UDP scanning often harder and slower?
4. Why is the address `127.0.0.1` safe for practicing Nmap?

---

## Bài Về Nhà / Homework

### Vietnamese
**Nhiệm vụ 1: Thực hiện một cuộc kiểm toán localhost toàn diện**
1. Khởi động ít nhất 2 dịch vụ trên Kali Linux (ví dụ: apache2 và ssh).
2. Sử dụng Nmap để thực hiện một cuộc quét toàn diện (`-A`) trên `127.0.0.1`.
3. Lưu kết quả ra file có tên `my_local_audit.txt`.

**Nhiệm vụ 2: Viết báo cáo đánh giá (Report)**
Đọc file kết quả và trả lời các câu hỏi sau:
- Có bao nhiêu cổng TCP đang mở?
- Dịch vụ nào đang chạy trên cổng 80? Phiên bản cụ thể của nó là gì?
- Theo Nmap, hệ điều hành của bạn đang chạy là gì? Nmap có đoán đúng không?
- Bạn có nhận thấy cấu hình nào có vẻ không an toàn không? (Ví dụ: để hở cổng SSH mà không có mật khẩu mạnh có nguy hiểm không?)

**Nhiệm vụ 3: Đóng các cổng**
Sử dụng lệnh `systemctl stop <tên_dịch_vụ>` để đóng các dịch vụ bạn đã mở. Chạy lại nmap cơ bản và đảm bảo các cổng đó không còn hiển thị là "open" nữa.

### English
**Task 1: Perform a comprehensive localhost audit**
1. Start at least 2 services on Kali Linux (e.g., apache2 and ssh).
2. Use Nmap to perform a comprehensive scan (`-A`) on `127.0.0.1`.
3. Save the results to a file named `my_local_audit.txt`.

**Task 2: Write an assessment report**
Read the result file and answer the following questions:
- How many TCP ports are open?
- What service is running on port 80? What is its specific version?
- According to Nmap, what operating system are you running? Did Nmap guess correctly?
- Do you notice any configuration that seems insecure? (For example: is leaving the SSH port open without a strong password dangerous?)

**Task 3: Close the ports**
Use the `systemctl stop <service_name>` command to close the services you opened. Re-run a basic nmap scan and ensure those ports no longer show up as "open".

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí / Criteria | Xuất Sắc / Excellent (9-10) | Khá / Good (7-8) | Cơ Bản / Needs Improvement (5-6) |
| --- | --- | --- | --- |
| **Hiểu lý thuyết mạng** | Nắm vững các khái niệm IP, Port, TCP/UDP. Giải thích rõ ràng sự khác biệt. | Hiểu cơ bản về IP và Port. | Còn nhầm lẫn giữa các khái niệm cơ bản. |
| **Sử dụng Nmap cơ bản** | Thành thạo các cờ `-sV`, `-O`, `-p-`. Biết cách xuất kết quả. | Biết cách chạy Nmap cơ bản và hiểu kết quả (Open/Closed). | Chỉ biết copy lệnh mà không hiểu ý nghĩa. |
| **Đánh giá rủi ro (Auditing)** | Đọc kết quả quét, xác định chính xác các dịch vụ và phân tích rủi ro nếu để lộ ra ngoài internet. | Có thể chỉ ra cổng nào đang mở và dịch vụ tương ứng. | Không thể hiểu kết quả đầu ra của Nmap. |
| **Thực hành An toàn** | Chỉ chạy trên `127.0.0.1`. Nhấn mạnh tầm quan trọng của việc có sự cho phép. | Chạy trên `127.0.0.1`. | Quên dừng dịch vụ sau khi thực hành hoặc có ý định quét mạng bên ngoài. |
| **Báo cáo bài tập** | Báo cáo chi tiết, rõ ràng, phân tích sâu các dịch vụ và lý do cần bảo vệ chúng. | Trả lời đủ các câu hỏi nhưng thiếu phần phân tích. | Báo cáo sơ sài, thiếu log từ Nmap. |

---
*Ghi chú cho Giảng Viên: Hãy đảm bảo học sinh không kết nối mạng Kali Linux của họ theo chế độ "Bridged" đối với mạng trường học để tránh việc vô tình quét các thiết bị khác trong lớp. Chế độ "NAT" hoặc "Host-only" là lý tưởng.*

*Instructor Note: Ensure students do not connect their Kali Linux network in "Bridged" mode to the school network to prevent accidental scanning of other classroom devices. "NAT" or "Host-only" mode is ideal.*

---

## Phụ Lục Chuyên Sâu (Deep-Dive Appendix): Nmap Cheat Sheet & Defensive Commands

### 1. Bảng Tra Cứu Cờ Lệnh Nmap Phổ Biến (Nmap Options Cheat Sheet)

| Cờ Lệnh (Option) | Chức năng (Description) | Ví dụ sử dụng (Example) |
| :--- | :--- | :--- |
| `-sS` | TCP SYN Scan (Bán mở, nhanh và hiệu quả) | `nmap -sS 127.0.0.1` |
| `-sT` | TCP Connect Scan (Đầy đủ 3-way handshake) | `nmap -sT 127.0.0.1` |
| `-sV` | Phát hiện phiên bản dịch vụ (Service Version) | `nmap -sV 127.0.0.1` |
| `-O` | Đoán hệ điều hành (OS Detection) | `nmap -O 127.0.0.1` |
| `-A` | Quét toàn diện (Bao gồm -sV, -O, -sC và traceroute) | `nmap -A 127.0.0.1` |
| `-p <range>` | Chỉ định dải cổng cần quét | `nmap -p 80,443,22 127.0.0.1` |
| `-oN <file>` | Lưu kết quả dưới dạng văn bản thường | `nmap -sV -oN audit.txt 127.0.0.1` |

### 2. Các Lệnh Quản Lý Service Cần Thiết Trên Kali Linux (Systemd)

```bash
# Khởi động dịch vụ web Apache
sudo systemctl start apache2

# Kiểm tra trạng thái dịch vụ SSH
sudo systemctl status ssh

# Dừng dịch vụ để đóng cổng an toàn
sudo systemctl stop apache2
```
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
