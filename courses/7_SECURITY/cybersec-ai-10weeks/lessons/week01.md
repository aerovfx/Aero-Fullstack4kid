# Tuần 1: Giới thiệu Python cho Security & Lập trình Socket cơ bản / Week 1: Introduction to Python for Security & Basic Socket Programming

## Mục Tiêu / Objectives

Trong tuần học đầu tiên này, chúng ta sẽ đặt nền móng vững chắc cho toàn bộ khóa học bằng cách tìm hiểu vai trò của Python trong lĩnh vực An ninh mạng, đồng thời nắm bắt các nguyên lý cốt lõi của lập trình mạng thông qua Socket. / In this first week, we will lay a solid foundation for the entire course by exploring the role of Python in Cybersecurity and grasping the core principles of network programming through Sockets.

**Mục tiêu cụ thể / Specific Objectives:**
1. **Hiểu rõ vai trò của Python trong An toàn thông tin (InfoSec):** / **Understand Python's role in Information Security:**
   - Tại sao Python lại là ngôn ngữ phổ biến nhất trong an ninh mạng? / Why is Python the most popular language in cybersecurity?
   - Các ứng dụng của Python trong phòng thủ (Defensive Security) và phân tích (Analysis). / Applications of Python in Defensive Security and Analysis.
2. **Nắm vững kiến thức nền tảng về mạng máy tính:** / **Master foundational computer networking concepts:**
   - Mô hình TCP/IP và vai trò của nó trong truyền thông dữ liệu. / The TCP/IP model and its role in data communication.
   - Khái niệm về địa chỉ IP (đặc biệt là Localhost - 127.0.0.1) và Cổng (Port). / Concepts of IP addresses (especially Localhost - 127.0.0.1) and Ports.
3. **Thành thạo lập trình Socket cơ bản:** / **Proficiency in basic Socket programming:**
   - Khởi tạo, cấu hình và quản lý các kết nối mạng bằng thư viện `socket` của Python. / Initializing, configuring, and managing network connections using Python's `socket` library.
   - Xây dựng thành công một mô hình Client-Server giao tiếp hoàn toàn trên môi trường máy chủ cục bộ (Localhost). / Successfully building a Client-Server model communicating entirely on the local environment (Localhost).
4. **Nhận thức về đạo đức và an toàn (Ethics & Safety):** / **Awareness of ethics and safety:**
   - Hiểu rõ ranh giới giữa kiểm thử bảo mật hợp pháp và hành vi tấn công mạng trái phép. / Understanding the boundary between legal security testing and illegal cyber attacks.
   - Tuân thủ nghiêm ngặt nguyên tắc chỉ thực hành trên hệ thống được ủy quyền (ở đây là máy tính cá nhân - localhost). / Strictly adhering to the principle of only practicing on authorized systems (here, the personal computer - localhost).

---

## Linh Kiện & Dụng Cụ / Components & Tools (Localhost VM configs)

Để đảm bảo quá trình học tập diễn ra suôn sẻ, an toàn và hiệu quả, học viên cần chuẩn bị đầy đủ các công cụ sau đây. Tất cả các thực hành sẽ được giới hạn nghiêm ngặt trong phạm vi máy tính cá nhân của bạn. / To ensure a smooth, safe, and effective learning process, students must prepare the following tools. All hands-on practices will be strictly limited to your personal computer.

**Phần cứng & Hệ điều hành / Hardware & OS:**
- **Máy tính cá nhân (PC/Laptop):** / **Personal Computer (PC/Laptop):**
  - CPU: Dual-core 2.0 GHz trở lên / or higher.
  - RAM: Tối thiểu 4GB (Khuyến nghị 8GB) / Minimum 4GB (Recommended 8GB).
  - Ổ cứng: Trống ít nhất 10GB / At least 10GB free space.
- **Hệ điều hành:** / **Operating System:**
  - Windows 10/11, macOS, hoặc Linux (Ubuntu, Mint, v.v.). / Windows 10/11, macOS, or Linux (Ubuntu, Mint, etc.).

**Phần mềm cần thiết / Required Software:**
- **Python 3.10+:** Môi trường thực thi mã Python. Khuyến nghị tải từ trang chủ chính thức (python.org). / Python execution environment. Recommended to download from the official website.
- **Trình soạn thảo mã (IDE/Code Editor):** / **Code Editor:**
  - Visual Studio Code (Khuyến nghị do có nhiều extension hỗ trợ tốt). / Recommended due to excellent extension support.
  - Hoặc PyCharm Community Edition. / Or PyCharm Community Edition.
- **Công cụ kiểm thử mạng (Tùy chọn nhưng khuyến nghị):** / **Network Testing Tools (Optional but recommended):**
  - Ncat hoặc Netcat (để kiểm tra kết nối localhost). / (to test localhost connections).
  - Wireshark (để bắt gói tin trên loopback interface). / (to capture packets on the loopback interface).

**Cấu hình Môi trường Kiểm thử An toàn (Safe Testing Environment Config):**
- **Strict Localhost Rule:** Xuyên suốt bài học, chúng ta **CHỈ** sử dụng địa chỉ IP `127.0.0.1` (hoặc tên miền `localhost`). Đây là địa chỉ loopback, nghĩa là dữ liệu gửi đi sẽ quay trở lại chính máy tính của bạn mà không truyền ra mạng internet hay mạng LAN. / Throughout the lesson, we will **ONLY** use the IP address `127.0.0.1` (or domain `localhost`). This is a loopback address, meaning sent data will return to your own computer without traversing the internet or LAN.
- **VM Configuration (Nếu dùng máy ảo):** / **(If using virtual machines):**
  - Nếu học viên sử dụng VMware hoặc VirtualBox, yêu cầu cấu hình Network Adapter sang chế độ **Host-Only** hoặc **NAT** và ngắt kết nối với mạng ngoài khi thực hiện các bài lab có tính chất rà quét cổng. / If using VMware or VirtualBox, it is required to configure the Network Adapter to **Host-Only** or **NAT** mode and disconnect from the external network when performing labs involving port scanning.

---

## Lý Thuyết / Theory (with definitions and examples)

### 1. Tại sao Python lại thống trị lĩnh vực An ninh mạng? / Why does Python dominate Cybersecurity?

Python không chỉ là một ngôn ngữ lập trình phổ biến dành cho người mới bắt đầu mà còn là một "vũ khí" tối thượng của các chuyên gia bảo mật. / Python is not just a popular programming language for beginners but also an ultimate "weapon" for security professionals.

**Đặc điểm nổi bật / Outstanding Characteristics:**
- **Cú pháp rõ ràng, dễ đọc (Clear, readable syntax):** Python được thiết kế để giống với ngôn ngữ tự nhiên. Điều này giúp các nhà phân tích bảo mật (Security Analysts) nhanh chóng đọc hiểu các đoạn mã lạ, phân tích mã độc (malware analysis) hoặc viết script tự động hóa mà không mất nhiều thời gian rà soát lỗi cú pháp. / Python is designed to resemble natural language. This helps Security Analysts quickly read unfamiliar code, analyze malware, or write automation scripts without spending much time debugging syntax errors.
- **Thư viện khổng lồ (Massive standard and third-party libraries):** Python sở hữu hệ sinh thái thư viện phong phú phục vụ trực tiếp cho Security, ví dụ: / Python boasts a rich ecosystem of libraries directly serving Security, for example:
  - `socket`: Giao tiếp mạng mức thấp. / Low-level network communication.
  - `Scapy`: Thao tác, tạo và phân tích gói tin mạng (Packet manipulation). / Packet manipulation, creation, and analysis.
  - `Requests`: Tương tác với HTTP/HTTPS, kiểm thử bảo mật ứng dụng web. / Interacting with HTTP/HTTPS, web application security testing.
  - `Cryptography`: Mã hóa và giải mã dữ liệu an toàn. / Secure data encryption and decryption.
- **Đa nền tảng (Cross-platform):** Một script Python viết trên máy Mac có thể chạy trơn tru trên Windows hoặc hệ thống Linux của máy chủ. Điều này vô cùng quan trọng khi triển khai các công cụ phòng thủ trên nhiều môi trường khác nhau. / A Python script written on a Mac can run smoothly on Windows or a server's Linux system. This is crucial when deploying defensive tools across diverse environments.

**Ứng dụng trong Phòng thủ (Defensive Applications):**
Thay vì tập trung vào tấn công, chúng ta học Python để xây dựng hệ thống phòng thủ vững chắc: / Instead of focusing on attacking, we learn Python to build solid defense systems:
- Xây dựng Hệ thống phát hiện xâm nhập (IDS/IPS) cơ bản. / Building basic Intrusion Detection Systems (IDS/IPS).
- Tự động hóa quá trình phân tích Log hệ thống để tìm kiếm dấu hiệu bất thường (Anomaly detection). / Automating system Log analysis to find anomalies.
- Viết các công cụ rà soát cấu hình bảo mật tự động trên hệ thống cục bộ. / Writing tools to automatically audit security configurations on local systems.

### 2. Các Khái niệm Cơ bản về Mạng (Fundamental Networking Concepts)

Để viết được các chương trình tương tác mạng, trước hết ta phải hiểu cách dữ liệu di chuyển từ điểm A đến điểm B. / To write programs that interact with networks, we first must understand how data moves from point A to point B.

**Địa chỉ IP (IP Address) & Localhost:**
- IP (Internet Protocol) là một chuỗi số định danh duy nhất cho một thiết bị trên mạng (ví dụ: `192.168.1.5`). Nó hoạt động giống như địa chỉ nhà của bạn. / IP is a unique numeric identifier for a device on a network (e.g., `192.168.1.5`). It acts like your home address.
- **Loopback Interface (Localhost - 127.0.0.1):** Đây là một địa chỉ IP đặc biệt. Bất kỳ dữ liệu nào gửi đến `127.0.0.1` sẽ được hệ điều hành định tuyến ngược trở lại máy tính đó. Trong Security, loopback cực kỳ quan trọng vì nó cung cấp môi trường Sandbox an toàn để kiểm thử các mã khai thác hoặc phần mềm mạng mà không sợ rò rỉ ra bên ngoài. / This is a special IP address. Any data sent to `127.0.0.1` is routed back to the computer itself by the OS. In Security, loopback is crucial because it provides a safe Sandbox environment to test exploits or network software without fear of external leakage.

**Cổng (Ports):**
- Nếu IP là địa chỉ của tòa nhà (Máy tính), thì Port chính là số cửa phòng (Ứng dụng). / If the IP is the building's address (Computer), the Port is the room number (Application).
- Một máy tính có 65535 cổng (từ 0 đến 65535). / A computer has 65535 ports.
- Các cổng thông dụng (Well-known ports): Port 80 (HTTP), Port 443 (HTTPS), Port 22 (SSH). / Common ports.
- Khi viết ứng dụng localhost, chúng ta thường sử dụng các cổng chưa cấp phát (như 8080, 9999, 50000) để tránh xung đột với các dịch vụ hệ thống. / When writing localhost apps, we often use unassigned ports to avoid conflicts with system services.

**Giao thức TCP và UDP:**
- **TCP (Transmission Control Protocol):** Giao thức định hướng kết nối. Đảm bảo dữ liệu đến nơi an toàn, đúng thứ tự và không bị lỗi. TCP yêu cầu quá trình "Bắt tay 3 bước" (3-way handshake) trước khi truyền dữ liệu. (Sử dụng cho Web, Email, Truyền file). / Connection-oriented protocol. Ensures data arrives safely, in order, and without errors. Requires a 3-way handshake.
- **UDP (User Datagram Protocol):** Giao thức phi kết nối. Gửi dữ liệu đi một cách nhanh chóng mà không cần kiểm tra xem đối phương có nhận được hay không. Nhanh nhưng thiếu tin cậy. (Sử dụng cho Streaming Video, Game online, DNS). / Connectionless protocol. Sends data quickly without checking receipt. Fast but unreliable.

### 3. Khái quát về Socket (Overview of Sockets)

**Socket là gì? / What is a Socket?**
- Trong lập trình, Socket là một điểm cuối (endpoint) của một liên kết truyền thông hai chiều giữa hai chương trình chạy trên mạng. / In programming, a Socket is one endpoint of a two-way communication link between two programs running on the network.
- Bạn có thể hình dung Socket như một chiếc điện thoại. Để hai người nói chuyện được với nhau, cả hai đều phải có điện thoại (Socket), một người phải biết số của người kia (IP + Port), một người gọi (Client) và một người nghe máy (Server). / Think of a Socket as a telephone.

**Kiến trúc Client-Server / Client-Server Architecture:**
- **Server (Máy chủ):** Chương trình luôn chạy, lắng nghe trên một IP và Port cụ thể, chờ đợi Client kết nối tới. / The program running constantly, listening on a specific IP and Port, waiting for connections.
- **Client (Máy khách):** Chương trình khởi tạo kết nối đến Server dựa trên IP và Port mà Server đang lắng nghe. / The program initiating the connection to the Server based on the IP and Port.

**Các bước lập trình TCP Server bằng Python:**
1. `socket()`: Tạo một đối tượng socket. / Create a socket object.
2. `bind()`: Gắn kết socket với một địa chỉ IP (`127.0.0.1`) và Port cụ thể. / Bind the socket to an IP and Port.
3. `listen()`: Chuyển socket sang trạng thái lắng nghe kết nối. / Put the socket in a listening state.
4. `accept()`: Chấp nhận kết nối từ một Client (hàm này sẽ chặn - block - cho đến khi có client kết nối). / Accept a client connection.
5. `recv()` và `send()`: Nhận và gửi dữ liệu. / Receive and send data.
6. `close()`: Đóng kết nối. / Close the connection.

**Các bước lập trình TCP Client bằng Python:**
1. `socket()`: Tạo đối tượng socket. / Create a socket object.
2. `connect()`: Khởi tạo kết nối đến IP và Port của Server. / Initiate connection to Server's IP and Port.
3. `send()` và `recv()`: Gửi và nhận dữ liệu. / Send and receive data.
4. `close()`: Đóng kết nối. / Close connection.

---

## Sơ Đồ Cấu Hình Mạng / Network Topology (Localhost only)

Trong suốt khóa học, đặc biệt là tuần 1, mọi kết nối mạng đều phải được đóng gói gọn trong sơ đồ sau. Không có bất kỳ lưu lượng nào được phép đi qua Router vật lý hay Internet. / Throughout the course, especially week 1, all network connections must be encapsulated in the following diagram. No traffic is allowed to traverse the physical Router or the Internet.

```mermaid
graph TD
    subgraph Máy Tính Cá Nhân (Personal Computer)
        direction TB
        Client[("Python Client Script\nIP: 127.0.0.1\nPort Nguồn: Ngẫu nhiên (Random)")]
        Server[("Python Server Script\nIP: 127.0.0.1\nPort Đích: 9999 (Listening)")]
        
        Client -- "Kết nối TCP / TCP Connect" --> Loopback(("Loopback Interface\n(lo / 127.0.0.1)"))
        Loopback -- "Chuyển tiếp / Forward" --> Server
        Server -- "Phản hồi / Response" --> Loopback
        Loopback -- "Gửi lại / Reply" --> Client
    end
    
    Internet(("INTERNET / LAN"))
    
    Máy_Tính_Cá_Nhân -. "Bị ngắt kết nối vật lý hoặc logic trong bài lab\n(Isolated)" .-x Internet
```

**Giải thích / Explanation:**
- Toàn bộ quá trình giao tiếp diễn ra bên trong môi trường máy tính của học viên. Hệ điều hành đóng vai trò là môi trường truyền dẫn (thông qua interface `lo` hoặc `loopback`). / The entire communication process occurs within the student's computer environment.
- Cấu trúc này đảm bảo an toàn tuyệt đối, ngăn chặn việc vô tình tấn công các hệ thống khác trên mạng LAN (như điện thoại, TV thông minh, hoặc máy tính của người khác). / This structure ensures absolute safety, preventing accidental attacks on other systems on the LAN.

---

## Thực Hành / Hands-On (Step-by-step, strict localhost focus)

Trong phần này, chúng ta sẽ tự tay viết một Server lắng nghe kết nối và một Client để gửi thông điệp, hoàn toàn trên localhost. / In this section, we will manually write a Server listening for connections and a Client to send messages, entirely on localhost.

### Bước 1: Khởi tạo môi trường / Step 1: Environment Setup
1. Mở thư mục dự án của bạn (ví dụ: `Week01_Workspace`) bằng Visual Studio Code. / Open your project folder using VS Code.
2. Tạo hai file Python riêng biệt: `secure_server.py` và `secure_client.py`. / Create two separate Python files.
3. Đảm bảo bạn đã kích hoạt môi trường ảo (Virtual Environment) nếu cần thiết, dù thư viện `socket` đã có sẵn trong lõi của Python (Built-in). / Ensure you have activated a virtual environment if necessary.

### Bước 2: Viết mã cho máy chủ (Server) / Step 2: Writing the Server Code
Mở file `secure_server.py` và chúng ta sẽ triển khai theo các bước lý thuyết đã học. Máy chủ này sẽ hoạt động như một "Bộ dội âm" (Echo Server), nghĩa là nó nhận được thông điệp gì thì sẽ phản hồi lại y hệt cho Client, kèm theo thông báo đã nhận. / Open `secure_server.py` and implement the theory. This server will act as an Echo Server.

*Lưu ý: Bạn có thể xem toàn bộ mã nguồn ở phần "Code Mẫu" bên dưới. Hãy gõ tay từng dòng code để hiểu rõ cơ chế hoạt động, tuyệt đối không copy-paste.* / *Note: See the full source code below. Type it manually to understand the mechanism.*

### Bước 3: Viết mã cho máy khách (Client) / Step 3: Writing the Client Code
Mở file `secure_client.py`. Nhiệm vụ của Client là kết nối tới đúng địa chỉ `127.0.0.1` và Port `9999` mà Server đang mở, sau đó gửi một chuỗi văn bản. / Open `secure_client.py`. The Client's task is to connect to `127.0.0.1` port `9999`.

### Bước 4: Kiểm thử trên Localhost / Step 4: Testing on Localhost
Đây là bước quan trọng. Bạn phải chạy Server trước để mở cổng lắng nghe. / This is the crucial step. You must run the Server first.
1. Mở một cửa sổ Terminal (hoặc Command Prompt). / Open a terminal window.
2. Chạy server: `python secure_server.py` / Run the server.
   *(Terminal sẽ hiển thị: Đang lắng nghe kết nối trên 127.0.0.1:9999... / Listening for connections on...)*
3. Mở một cửa sổ Terminal thứ hai (Giữ cửa sổ đầu tiên vẫn đang chạy). / Open a second terminal window.
4. Chạy client: `python secure_client.py` / Run the client.
5. Quan sát cả hai Terminal. Bạn sẽ thấy quá trình bắt tay, gửi dữ liệu, nhận phản hồi và đóng kết nối diễn ra một cách hoàn hảo. / Observe both terminals.

### Bước 5: Phân tích lưu lượng mạng (Nâng cao & Tùy chọn) / Step 5: Network Traffic Analysis (Advanced & Optional)
Nếu bạn có cài đặt Wireshark, hãy mở nó lên và chọn interface là **Adapter for loopback traffic capture** (trên Windows) hoặc `lo` (trên Linux/macOS). / If you have Wireshark, select the loopback interface.
Lọc bằng cú pháp (Filter): `tcp.port == 9999`
Bạn sẽ thấy rõ quá trình bắt tay 3 bước (SYN, SYN-ACK, ACK), sau đó là các gói tin PSH (Push) chứa dữ liệu văn bản bạn vừa gửi, và quá trình kết thúc kết nối (FIN-ACK). Điều này chứng minh dữ liệu thực sự đi qua ngăn xếp mạng của hệ điều hành, dù không ra khỏi máy. / You will clearly see the 3-way handshake, PSH packets, and connection termination.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices

Trong An ninh mạng, ranh giới giữa một chuyên gia bảo mật xuất sắc (White Hat Hacker) và một tội phạm mạng (Black Hat Hacker) đôi khi chỉ nằm ở **sự cho phép (Authorization)**. / In Cybersecurity, the boundary between a White Hat and a Black Hat hacker sometimes lies merely in **Authorization**.

> [!WARNING]
> **CẢNH BÁO PHÁP LÝ & ĐẠO ĐỨC (LEGAL & ETHICAL WARNING):**
> 1. **KHÔNG BAO GIỜ (NEVER)** sử dụng các công cụ, kỹ năng mạng học được (như scan port, kết nối socket, gửi dữ liệu lượng lớn) đối với bất kỳ máy chủ, địa chỉ IP, tên miền, hoặc hệ thống mạng nào mà bạn KHÔNG sở hữu hoặc KHÔNG được sự cho phép bằng văn bản từ chủ sở hữu.
> 2. Việc cố ý quét hoặc kết nối đến hệ thống của người khác khi chưa được phép là **hành vi vi phạm pháp luật** tại hầu hết các quốc gia (bao gồm Luật An mạng). Nó có thể dẫn đến việc bạn bị truy tố hình sự.
> 3. Trong khuôn khổ khóa học này, môi trường thực hành duy nhất được chấp nhận là **localhost (127.0.0.1)** hoặc một mạng nội bộ (LAN) hoàn toàn tách biệt, bao gồm các máy ảo do chính bạn thiết lập.
> 4. Hãy sử dụng kiến thức này để xây dựng các công cụ giám sát, phòng thủ mạng máy tính cá nhân của mình, không dùng nó để quấy rối người khác.

> [!IMPORTANT]
> **LỜI HỨA CỦA HỌC VIÊN (STUDENT'S PLEDGE):** 
> "Tôi cam kết chỉ áp dụng kiến thức lập trình mạng và bảo mật trên môi trường localhost hoặc hệ thống được tôi sở hữu hợp pháp. Tôi hiểu rõ các hậu quả nghiêm trọng của việc lạm dụng kỹ thuật mạng."

---

## Code Mẫu / Code Samples (Python with bilingual comments)

Dưới đây là mã nguồn chuẩn, đã được tối ưu hóa cho mục đích học tập với các khối `try...except` để bắt lỗi (Error Handling), điều bắt buộc phải có khi lập trình các công cụ an toàn thông tin (Security Tools).

### 1. Máy Chủ Cục Bộ An Toàn (Secure Localhost Server - `secure_server.py`)

```python
import socket
import logging

# Thiết lập hệ thống ghi nhật ký (Logging) thay vì dùng print thông thường
# Điều này rất quan trọng trong phân tích an ninh mạng (Security Auditing)
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def run_secure_server():
    # Khai báo địa chỉ IP loopback và Cổng. Tuyệt đối không dùng '0.0.0.0' trong bài lab này.
    # Defining loopback IP and Port. Absolutely do not use '0.0.0.0' in this lab.
    HOST = '127.0.0.1' 
    PORT = 9999

    # Tạo socket object với họ địa chỉ IPv4 (AF_INET) và giao thức TCP (SOCK_STREAM)
    # Create socket object with IPv4 family (AF_INET) and TCP protocol (SOCK_STREAM)
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        # Cấu hình cho phép tái sử dụng cổng ngay lập tức sau khi tắt server (tránh lỗi Address already in use)
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        
        try:
            # Liên kết socket với địa chỉ và cổng
            server_socket.bind((HOST, PORT))
            # Bắt đầu lắng nghe, tham số 5 là số lượng kết nối đang chờ xử lý tối đa (backlog)
            server_socket.listen(5)
            logging.info(f"🛡️ Máy chủ đang khởi chạy an toàn tại / Server is running securely at {HOST}:{PORT}")
            
            while True:
                # accept() sẽ chặn chương trình cho đến khi có client kết nối
                # accept() blocks the program until a client connects
                client_conn, client_addr = server_socket.accept()
                
                # Kiểm tra bảo mật: Chỉ chấp nhận kết nối từ chính localhost.
                # Security Check: Only accept connections from localhost itself.
                if client_addr[0] != '127.0.0.1':
                    logging.warning(f"⚠️ Phát hiện kết nối bất hợp pháp từ / Unauthorized connection from: {client_addr[0]}. Đang ngắt kết nối / Dropping connection.")
                    client_conn.close()
                    continue

                with client_conn:
                    logging.info(f"✅ Đã chấp nhận kết nối hợp lệ từ / Accepted valid connection from: {client_addr}")
                    
                    # Nhận dữ liệu từ Client (tối đa 1024 bytes một lần)
                    # Receive data from Client (max 1024 bytes at once)
                    data = client_conn.recv(1024)
                    
                    if data:
                        decoded_data = data.decode('utf-8')
                        logging.info(f"📥 Nhận được dữ liệu / Data received: {decoded_data}")
                        
                        # Phản hồi lại Client (Echo phản hồi an toàn)
                        # Respond to Client (Secure Echo response)
                        response_msg = f"[Server Ack] Đã nhận thành công thông điệp dài {len(decoded_data)} ký tự / Successfully received message of length {len(decoded_data)}."
                        client_conn.sendall(response_msg.encode('utf-8'))
                        logging.info("📤 Đã gửi phản hồi về cho Client. / Response sent back to Client.")
        
        except KeyboardInterrupt:
            logging.info("🛑 Quản trị viên đã tắt Server (Ctrl+C). / Administrator shut down the Server (Ctrl+C).")
        except Exception as e:
            logging.error(f"❌ Đã xảy ra lỗi hệ thống / System error occurred: {e}")

if __name__ == "__main__":
    run_secure_server()
```

### 2. Máy Khách Cục Bộ (Localhost Client - `secure_client.py`)

```python
import socket
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def run_client():
    # Địa chỉ đích phải trỏ về chính máy tính này (localhost)
    # The destination address must point to this very computer (localhost)
    TARGET_HOST = '127.0.0.1'
    TARGET_PORT = 9999

    try:
        # Khởi tạo TCP Socket
        # Initialize TCP Socket
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
            # Thiết lập thời gian chờ timeout là 5 giây (Thực hành lập trình phòng thủ)
            # Set timeout to 5 seconds (Defensive programming practice)
            client_socket.settimeout(5.0)
            
            logging.info(f"⏳ Đang kết nối tới / Connecting to {TARGET_HOST}:{TARGET_PORT}...")
            client_socket.connect((TARGET_HOST, TARGET_PORT))
            logging.info("✅ Kết nối thành công! / Connection successful!")
            
            # Chuẩn bị dữ liệu để gửi
            message = "Xin chào Server, đây là thông điệp kiểm tra an toàn hệ thống."
            # Chuyển đổi string thành dạng bytes (mã hóa utf-8) để gửi qua mạng
            client_socket.sendall(message.encode('utf-8'))
            logging.info(f"📤 Đã gửi thông điệp / Message sent: {message}")
            
            # Chờ nhận phản hồi từ Server
            data = client_socket.recv(1024)
            logging.info(f"📥 Phản hồi từ Server / Response from Server: {data.decode('utf-8')}")

    except ConnectionRefusedError:
        logging.error("❌ Kết nối bị từ chối. Server có đang chạy không? / Connection refused. Is the server running?")
    except socket.timeout:
        logging.error("⏰ Hết thời gian chờ kết nối. / Connection timed out.")
    except Exception as e:
        logging.error(f"❌ Lỗi không xác định / Unknown error: {e}")

if __name__ == "__main__":
    run_client()
```

---

## Câu Hỏi Thảo Luận / Discussion (5 questions)

Sau khi hoàn thành phần thực hành, học viên hãy thảo luận và trả lời các câu hỏi sau để củng cố kiến thức: / After completing the practical section, students should discuss and answer the following questions to consolidate their knowledge:

1. **Về Giao Thức (Protocol):** Trong bài lab, chúng ta sử dụng `socket.SOCK_STREAM` (tương ứng với TCP). Nếu chúng ta thay đổi thành `socket.SOCK_DGRAM` (UDP), thì các hàm `listen()` và `accept()` bên Server có còn hợp lệ không? Tại sao? / In the lab, we use `socket.SOCK_STREAM` (TCP). If we change it to `socket.SOCK_DGRAM` (UDP), are the `listen()` and `accept()` functions on the Server still valid? Why?
2. **Về Bảo Mật (Security):** Trong file Server, đoạn mã `if client_addr[0] != '127.0.0.1':` có tác dụng gì? Nếu chúng ta cấu hình `HOST = '0.0.0.0'` mà không có đoạn kiểm tra đó, điều gì tồi tệ có thể xảy ra trên mạng LAN? / In the Server file, what is the purpose of `if client_addr[0] != '127.0.0.1':`? If we configure `HOST = '0.0.0.0'` without that check, what bad things could happen on the LAN?
3. **Về Vòng Đời (Lifecycle):** Hàm `recv(1024)` có ý nghĩa gì? Số 1024 đại diện cho điều gì? Điều gì sẽ xảy ra nếu Client gửi một chuỗi văn bản lớn hơn kích thước này? / What does the function `recv(1024)` mean? What does the number 1024 represent? What happens if the Client sends a text string larger than this size?
4. **Về Lập Trình (Programming):** Tại sao chúng ta lại sử dụng cấu trúc `with socket.socket(...) as s:` thay vì khởi tạo bằng biến thông thường như `s = socket.socket(...)`? Lợi ích bảo mật hoặc quản lý tài nguyên của từ khóa `with` (Context Manager) là gì? / Why do we use the `with socket.socket(...) as s:` structure instead of initializing with a normal variable like `s = socket.socket(...)`? What is the security or resource management benefit of the `with` keyword (Context Manager)?
5. **Về Đạo Đức (Ethics):** Một người bạn nhờ bạn viết một script kết nối Socket đến máy chủ web của trường đại học trên Port 80 để xem "nó có phản hồi nhanh không". Theo tiêu chuẩn đạo đức An toàn thông tin, bạn có nên thực hiện điều này không? Hãy giải thích rõ lý do. / A friend asks you to write a Socket script connecting to the university's web server on Port 80 to see "if it responds quickly". According to InfoSec ethical standards, should you do this? Explain your reasoning clearly.

---

## Bài Về Nhà / Homework + Mini-Project

### Đề bài: Xây dựng hệ thống Chat an toàn trên Localhost (Secure Localhost Chat App)

Dựa trên mã nguồn cơ bản ở trên, hãy nâng cấp Client và Server để tạo thành một ứng dụng Chat hai chiều theo thời gian thực (Terminal-based), hoạt động hoàn toàn trên `127.0.0.1`.

**Yêu cầu kỹ thuật / Technical Requirements:**
1. **Liên tục tương tác (Continuous Interaction):** Sử dụng vòng lặp `while True` bên trong Client để cho phép người dùng nhập văn bản từ bàn phím (`input()`) nhiều lần và gửi đến Server, thay vì chỉ gửi một lần rồi thoát. / Use a `while True` loop inside the Client to allow the user to input text from the keyboard multiple times and send it to the Server.
2. **Lệnh thoát (Exit Command):** Nếu người dùng ở Client gõ chữ `EXIT`, Client phải gửi thông điệp này đến Server, sau đó tự động đóng kết nối một cách duyên dáng (Graceful shutdown). / If the user types `EXIT`, send this to the server, then gracefully shut down the connection.
3. **Phản hồi từ Server (Server Response):** Server phải có khả năng nhận nhiều thông điệp từ Client. Nếu nhận được chữ `EXIT`, Server in ra dòng log ghi nhận Client đã ngắt kết nối và quay trở lại trạng thái `accept()` để chờ một Client mới, thay vì bị crash. / Server must receive multiple messages. If `EXIT` is received, log the disconnection and return to `accept()` state to wait for a new Client, without crashing.
4. **Quy tắc an toàn (Safety Rule):** Địa chỉ IP ràng buộc phải luôn là `127.0.0.1`. (Bắt buộc). / Bound IP must always be `127.0.0.1`. (Mandatory).
5. **Nâng cao (Tùy chọn - Dành cho điểm thưởng):** Áp dụng mã hóa Caesar Cipher đơn giản (dịch vòng ký tự) ở Client trước khi gửi và giải mã ở Server trước khi in log. Đây là bước đệm tuyệt vời để hiểu về mã hóa đường truyền (Encryption in Transit). / Apply simple Caesar Cipher encryption on Client before sending, and decrypt on Server before logging.

**Cách nộp bài / How to Submit:**
Học viên nén thư mục chứa 2 file `chat_server.py` và `chat_client.py` thành tệp `.zip` và tải lên hệ thống quản lý học tập. Kèm theo một ảnh chụp màn hình terminal cho thấy hai bên đang "chat" với nhau. / Zip the 2 files and upload them to the LMS, along with a screenshot of the terminal showing the chat in action.

---

## Đánh Giá / Assessment Rubric Table

Quá trình đánh giá Bài Về Nhà (Mini-Project) sẽ dựa trên các tiêu chí nghiêm ngặt sau, với tổng điểm tối đa là 100 điểm. / The evaluation of the Mini-Project will be based on the following strict criteria, with a maximum score of 100 points.

| Tiêu chí / Criteria | Xuất sắc / Excellent (90-100%) | Tốt / Good (70-89%) | Cần cố gắng / Needs Improvement (<70%) |
| :--- | :--- | :--- | :--- |
| **1. Tuân thủ An toàn (Safety Compliance) - *Cực kỳ quan trọng*** | IP được hardcode là `127.0.0.1`. Có cơ chế kiểm tra IP nguồn của Client. KHÔNG mở port ra mạng ngoài. (30 điểm) / IP hardcoded to 127.0.0.1. Client IP checking mechanism exists. NO port exposed to external network. | IP được cấu hình là localhost, nhưng thiếu cơ chế kiểm tra xác thực chặn IP lạ ở mức ứng dụng. (20 điểm) / IP is localhost, but lacks application-level source IP validation. | IP được thiết lập thành `0.0.0.0` hoặc IP mạng LAN, vi phạm nghiêm trọng quy định an toàn. (0 điểm, Fail toàn phần) / IP set to 0.0.0.0 or LAN IP, serious safety violation. |
| **2. Chức năng cốt lõi (Core Functionality)** | Client và Server nhắn tin liên tục, đa chiều ổn định. Xử lý tốt vòng lặp `while`. (30 điểm) / Client and Server chat continuously and stably. Handles `while` loops perfectly. | Nhắn tin được nhiều lần nhưng đôi khi bị treo (block) do xử lý IO không đồng bộ. (20 điểm) / Can chat multiple times but sometimes freezes due to synchronous IO handling. | Chỉ gửi được một tin nhắn rồi ngắt kết nối, giống Echo server ban đầu. (10 điểm) / Can only send one message then disconnects, like the initial Echo server. |
| **3. Xử lý lỗi (Error Handling)** | Bắt đầy đủ các ngoại lệ (Exception, ConnectionRefused, KeyboardInterrupt), log rõ ràng, không bao giờ bị crash đột ngột. (20 điểm) / Catches all exceptions, logs clearly, never crashes abruptly. | Bắt được một số lỗi cơ bản nhưng chương trình vẫn văng (traceback) nếu ngắt đột ngột bằng `Ctrl+C`. (15 điểm) / Catches some basic errors but still shows traceback on Ctrl+C. | Không có `try...except`, ứng dụng dễ dàng văng lỗi đỏ màn hình. (5 điểm) / No `try...except`, application easily crashes with red error screens. |
| **4. Phong cách Code & Bình luận (Code Style & Comments)** | Code tuân thủ PEP8, đặt tên biến rõ nghĩa. 100% các khối logic có comment giải thích bằng tiếng Anh hoặc tiếng Việt. (10 điểm) / Code follows PEP8, meaningful variable names. 100% of logic blocks have comments. | Code khá gọn gàng nhưng thiếu bình luận, khó đọc cho người khác. (7 điểm) / Code is relatively neat but lacks comments, hard to read. | Đặt tên biến lộn xộn (như `x`, `y`, `z`), không thụt lề đúng chuẩn, không comment. (3 điểm) / Messy variable naming, improper indentation, no comments. |
| **5. Tính năng nâng cao (Bonus - Advanced Feature)** | Cài đặt thành công một thuật toán mã hóa (như Caesar, XOR) để xáo trộn dữ liệu trước khi gửi qua Socket, giải mã thành công bên nhận. (10 điểm thưởng) / Successfully implements an encryption algorithm to scramble data before sending, and decrypts on the receiving end. | Có nỗ lực mã hóa nhưng logic mã hóa/giải mã bị sai lệch, dữ liệu không đọc được. (5 điểm thưởng) / Attempted encryption but logic is flawed, data unreadable. | Không làm tính năng này. (0 điểm) / Did not attempt this feature. |

*Lưu ý từ Giảng viên (Instructor's Note):* Môn học này đặt yếu tố đạo đức và an toàn lên hàng đầu. Một mã nguồn xuất sắc nhưng vi phạm quy tắc số 1 (mở cấu hình mạng ra public thay vì localhost) sẽ nhận điểm 0 cho toàn bộ bài thực hành. / This course places ethics and safety first. Excellent code that violates rule #1 (exposing to public instead of localhost) will receive a 0 for the entire assignment.
