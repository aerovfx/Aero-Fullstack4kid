# Tuần 1: Giới thiệu Python cho Security & Lập trình Socket cơ bản / Week 1: Introduction to Python for Security & Basic Socket Programming

## Mục Tiêu / Objectives

Trong tuần học đầu tiên này, chúng ta sẽ đặt nền móng vững chắc cho toàn bộ khóa học bằng cách tìm hiểu vai trò của Python trong lĩnh vực An ninh mạng, đồng thời nắm bắt các nguyên lý cốt lõi của lập trình mạng thông qua Socket. Các bài thực hành code sẽ được thiết kế tăng dần từ cơ bản đến phức tạp. / In this first week, we will lay a solid foundation for the entire course by exploring the role of Python in Cybersecurity and grasping the core principles of network programming through Sockets. Hands-on coding will progress from basic to complex.

**Mục tiêu cụ thể / Specific Objectives:**
1. Hiểu rõ tại sao Python là "vũ khí" số 1 của các hacker và chuyên gia bảo mật.
2. Nắm vững khái niệm Địa chỉ IP, Port (Cổng), TCP/UDP và Localhost.
3. Thực hành lập trình Socket qua 3 cấp độ: Cơ bản (Echo) -> Trung bình (Chat vòng lặp) -> Phức tạp (Bảo mật & Quản lý lỗi).
4. Khắc sâu nguyên tắc Đạo đức Hacker (White Hat Ethics) và tuyệt đối chỉ thực hành trên Localhost (127.0.0.1).

---

## Lý Thuyết / Theory (with definitions and examples)

### 1. Tại sao Python lại thống trị lĩnh vực An ninh mạng?
- **Cú pháp rõ ràng:** Giúp chuyên gia đọc hiểu mã độc (malware) nhanh chóng.
- **Thư viện khổng lồ:** `socket` (mạng cơ bản), `Scapy` (phân tích gói tin), `Requests` (web hacking), `Cryptography` (mã hoá).
- **Đa nền tảng:** Chạy mượt mà trên Kali Linux, macOS, và Windows.

### 2. Khái niệm Mạng Cơ Bản
- **IP Address & Port:** Nếu IP (vd: `192.168.1.5`) là địa chỉ tòa nhà, thì Port (vd: `80`, `443`, `9999`) là số phòng.
- **Localhost (127.0.0.1):** Địa chỉ Loopback. Gửi dữ liệu tới địa chỉ này có nghĩa là "gửi cho chính mình". Đây là môi trường cách ly (Sandbox) an toàn nhất để học bảo mật.
- **TCP vs UDP:** TCP giống như gọi điện thoại (bắt tay 3 bước, đảm bảo an toàn, không rớt gói). UDP giống như gửi thư (gửi đi không cần biết bên kia nhận được chưa, tốc độ cao nhưng thiếu tin cậy).

### 3. Socket là gì?
- Socket là điểm cuối (endpoint) để hai phần mềm nói chuyện với nhau. 
- **Máy chủ (Server):** Tạo socket -> `bind` (gắn IP/Port) -> `listen` (nghe) -> `accept` (chấp nhận kết nối).
- **Máy khách (Client):** Tạo socket -> `connect` (gọi điện tới Server).

### 4. Nền Tảng Ethical Hacking / Introduction to Ethical Hacking (CEH Module 01)

Trước khi viết dòng code tấn công đầu tiên, bạn phải hiểu **mình đang đứng ở đâu trong một cuộc tấn công** và **luật chơi**. Đây là kiến thức nền của CEH Module 01.

**a) Tam giác CIA — thứ ta bảo vệ / kẻ địch muốn phá:**
- **Confidentiality (Bí mật):** chỉ người được phép mới đọc được dữ liệu.
- **Integrity (Toàn vẹn):** dữ liệu không bị sửa trái phép.
- **Availability (Sẵn sàng):** hệ thống luôn phục vụ được.

**b) Năm giai đoạn của một cuộc tấn công (5 Phases of Hacking):**

```text
1. Reconnaissance → 2. Scanning → 3. Gaining Access → 4. Maintaining Access → 5. Clearing Tracks
   (Trinh sát)        (Quét)        (Chiếm quyền)       (Duy trì)               (Xoá dấu vết)
```

Việc lập trình Socket tuần này là **viên gạch đầu tiên** cho giai đoạn **Scanning** — muốn "gõ cửa" một cổng để xem nó mở hay đóng (Tuần 2), trước hết phải biết một chương trình kết nối mạng hoạt động thế nào.

**c) Bạn là hacker loại nào?** Khoá học này đào tạo **White Hat (mũ trắng)** — chuyên gia bảo mật hành động *có phép*. Đối lập là Black Hat (tội phạm) và Grey Hat (lằn ranh, vẫn phạm luật). Ranh giới không nằm ở kỹ năng, mà nằm ở **sự cho phép (authorization)**.

> Toàn bộ khung tư duy CEH được trình bày ở [`CEH_alignment.md`](CEH_alignment.md). Hãy đọc lướt tài liệu đó một lần trước khi vào Tuần 2.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices

> [!WARNING]
> **CẢNH BÁO PHÁP LÝ & ĐẠO ĐỨC (LEGAL & ETHICAL WARNING):**
> 1. Việc cố ý quét hoặc kết nối đến hệ thống của người khác khi chưa được phép là **hành vi vi phạm pháp luật**.
> 2. Khóa học này chỉ cho phép thực hành trên **localhost (127.0.0.1)**. Bất kỳ bài nộp nào sử dụng IP công cộng hoặc IP LAN (ví dụ 192.168.x.x) để tấn công/kết nối trái phép đều bị điểm 0.

---

## Thực Hành Code / Hands-On (Từ Cơ Bản Đến Phức Tạp)

Chúng ta sẽ trải qua 3 cấp độ code. Ở mỗi cấp độ, bạn hãy tạo các file Python mới, mở 2 cửa sổ Terminal (1 cho Server, 1 cho Client) và chạy thử nghiệm.

### Cấp độ 1: Giao tiếp Cơ bản (Basic Echo Server)
Mục tiêu: Viết đoạn code ngắn nhất có thể để kết nối thành công. Server nhận 1 tin nhắn và in ra màn hình.

**1. `basic_server.py` (Mở port và nghe)**
```python
import socket

# Khởi tạo Socket (IPv4, TCP)
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Gắn vào cổng 9999 trên máy của mình (Localhost)
server.bind(('127.0.0.1', 9999))

# Bắt đầu lắng nghe (tối đa chờ 1 kết nối)
server.listen(1)
print("Server đang chờ kết nối trên port 9999...")

# Chấp nhận khi có client gọi tới (Chương trình sẽ dừng ở đây chờ)
client, address = server.accept()
print(f"Có người kết nối từ: {address}")

# Nhận tin nhắn (tối đa 1024 bytes)
msg = client.recv(1024).decode('utf-8')
print(f"Tin nhắn nhận được: {msg}")

# Đóng kết nối
client.close()
server.close()
```

**2. `basic_client.py` (Kết nối và gửi)**
```python
import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Gọi điện tới Server
client.connect(('127.0.0.1', 9999))

# Gửi tin nhắn (phải encode sang bytes)
client.send("Xin chao, toi la Client!".encode('utf-8'))

client.close()
```
*(Chạy server trước, sau đó chạy client. Cả hai sẽ kết thúc ngay sau khi gửi/nhận 1 tin nhắn).*

---

### Cấp độ 2: Chat Liên tục (Continuous Chat)
Mục tiêu: Đưa tính năng nhận/gửi vào vòng lặp `while True` để có thể chat qua lại nhiều lần. Thêm lệnh thoát (`EXIT`).

**1. `chat_server.py`**
```python
import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) # Giúp chạy lại code không bị lỗi "Port in use"
server.bind(('127.0.0.1', 9999))
server.listen(1)
print("Server Chat đang chạy...")

client, address = server.accept()
print(f"Đã kết nối với {address}")

while True:
    # Chờ nhận tin nhắn
    data = client.recv(1024).decode('utf-8')
    if not data or data == 'EXIT':
        print("Client đã ngắt kết nối.")
        break
        
    print(f"Client: {data}")
    
    # Server nhập câu trả lời
    reply = input("Server trả lời: ")
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
    msg = input("Nhập tin nhắn (gõ EXIT để thoát): ")
    client.send(msg.encode('utf-8'))
    
    if msg == 'EXIT':
        break
        
    # Chờ Server phản hồi
    reply = client.recv(1024).decode('utf-8')
    print(f"Server nói: {reply}")

client.close()
```

---

### Cấp độ 3: Máy chủ Bảo mật & Quản lý Lỗi (Secure Server)
Mục tiêu: Trong thực tế, Server phải chạy 24/7, không được phép "crash" khi có lỗi, và phải từ chối các kết nối độc hại. Chúng ta sẽ dùng `try...except` và thư viện `logging`.

**`secure_server.py`**
```python
import socket
import logging

# Dùng Logging thay cho print để lưu vết chuyên nghiệp
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

def run_secure_server():
    # Context manager 'with' tự động đóng socket khi xảy ra sự cố
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server.bind(('127.0.0.1', 9999))
        server.listen(5)
        logging.info("🛡️ Secure Server đang lắng nghe trên 127.0.0.1:9999")
        
        while True:
            try:
                client_conn, client_addr = server.accept()
                
                # BẢO MẬT: Chặn các kết nối không đến từ Localhost
                if client_addr[0] != '127.0.0.1':
                    logging.warning(f"⚠️ Phát hiện IP lạ {client_addr[0]}! Đang chặn...")
                    client_conn.close()
                    continue
                
                with client_conn:
                    logging.info(f"✅ Đã kết nối với máy khách an toàn: {client_addr}")
                    
                    # Quá trình giao tiếp
                    while True:
                        data = client_conn.recv(1024)
                        if not data:
                            break
                        
                        msg = data.decode('utf-8')
                        logging.info(f"📥 Nhận được: {msg}")
                        
                        # Phản hồi
                        response = f"[Server Ack] Đã nhận {len(msg)} ký tự."
                        client_conn.sendall(response.encode('utf-8'))
            
            except KeyboardInterrupt:
                logging.info("🛑 Admin đã chủ động tắt Server.")
                break
            except Exception as e:
                logging.error(f"❌ Lỗi hệ thống: {e}")

if __name__ == "__main__":
    run_secure_server()
```
*Ghi chú: Bạn có thể dùng `chat_client.py` ở Cấp độ 2 để kết nối thử vào Secure Server Cấp độ 3 này.*

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 1.1: Trình Chat Socket 2 Chiều Liên Tục (Continuous Socket Chat)
Xây dựng cặp script Python `chat_server.py` và `chat_client.py` chạy trên Localhost `127.0.0.1:8888`.
- Server lắng nghe và duy trì kết nối với Client.
- Client và Server thay nhau nhập tin nhắn từ bàn phím và gửi cho đối phương.
- Khi một trong hai bên gõ `EXIT` hoặc `QUIT`, kết nối phải ngắt an toàn mà không làm sụp đổ chương trình.

#### Bài 1.2: Server Ghi Log Kết Nối Chuyên Nghiệp (Secure Logging Server)
Cập nhật `chat_server.py` sử dụng module `logging` của Python:
- Ghi vết địa chỉ IP, Port và dấu mốc thời gian (Timestamp) của mọi kết nối đến.
- Tự động chặn và từ chối các kết nối có địa chỉ IP khác `127.0.0.1`.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 1.3: Ứng Dụng Chat Mã Hóa Mạng Sơ Cấp (Crypto Socket Chat)
Nâng cấp cặp script Chat Socket bằng cách bổ sung lớp mã hóa Caesar Cipher:
1. **Client:** Nhập tin nhắn Plaintext, tự động dịch chuyển 3 vị trí ký tự (Mã hóa Caesar) trước khi truyền gói tin qua Socket.
2. **Server:** Nhận gói tin mã hóa từ Socket, tự động giải mã ngược 3 vị trí để khôi phục nội dung gốc và ghi Log.
3. Xử lý các ký tự đặc biệt, dấu cách và kiểm tra trôi dữ liệu (Buffer Overflow prevention).

---

### 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)

#### Bài 1.4: Thử Nghiệm Kiểm Tra Cổng TCP & Payload Nhị Phân Trên Colab
Mở Google Colab notebook và thực thi bài lab:
1. Tạo một mô phỏng TCP Echo Server chạy ẩn trong Colab trên cổng `127.0.0.1:9999`.
2. Tạo Client gửi 5 gói tin thử nghiệm chứa cả văn bản và mảng byte nhị phân.
3. In kết quả phản hồi của Server và biểu đồ phân tích độ trễ kết nối TCP (Round-Trip Time).

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

Bạn có thể thực hiện toàn bộ bài lab này trong một notebook Google Colab. Vì Colab không cho phép mở cổng ra Internet, việc chạy TCP server trên `127.0.0.1:9999` là hoàn toàn phù hợp.

#### Cell 1 - TCP Echo Server (chạy nền)

```python
import socket
import threading

HOST = "127.0.0.1"
PORT = 9999

def handle_client(conn, addr):
    print(f"[SERVER] Connected: {addr}")

    while True:
        data = conn.recv(1024)

        if not data:
            break

        print(f"[SERVER] Received: {data}")
        conn.sendall(data)

    conn.close()
    print(f"[SERVER] Closed: {addr}")


def start_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    server.bind((HOST, PORT))
    server.listen()

    print(f"[SERVER] Listening on {HOST}:{PORT}")

    while True:
        conn, addr = server.accept()

        t = threading.Thread(
            target=handle_client,
            args=(conn, addr),
            daemon=True
        )
        t.start()


threading.Thread(
    target=start_server,
    daemon=True
).start()
```

---

#### Cell 2 - TCP Client gửi 5 gói tin

```python
import socket
import time

TEST_PAYLOADS = [
    b"HELLO",
    b"TCP LAB",
    bytes([0, 1, 2, 3, 255]),
    b"CyberSecurity Week02",
    bytes(range(32))
]

rtts = []

for i, payload in enumerate(TEST_PAYLOADS, start=1):

    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    start = time.perf_counter()

    client.connect(("127.0.0.1", 9999))

    client.sendall(payload)

    response = client.recv(1024)

    end = time.perf_counter()

    rtt_ms = (end - start) * 1000

    rtts.append(rtt_ms)

    print(f"\nPacket #{i}")
    print(f"Sent     : {payload}")
    print(f"Received : {response}")
    print(f"RTT      : {rtt_ms:.3f} ms")

    client.close()
```

**Ví dụ đầu ra:**

```text
Packet #1
Sent     : b'HELLO'
Received : b'HELLO'
RTT      : 0.82 ms

Packet #3
Sent     : b'\x00\x01\x02\x03\xff'
Received : b'\x00\x01\x02\x03\xff'
RTT      : 0.74 ms
```

---

#### Cell 3 - Phân tích độ trễ RTT

```python
print("\n===== RTT SUMMARY =====")

print(f"Min RTT : {min(rtts):.3f} ms")
print(f"Max RTT : {max(rtts):.3f} ms")
print(f"Avg RTT : {sum(rtts)/len(rtts):.3f} ms")
```

---

#### Cell 4 - Vẽ biểu đồ RTT

```python
import matplotlib.pyplot as plt

plt.figure(figsize=(8,4))

plt.plot(
    range(1, len(rtts)+1),
    rtts,
    marker="o"
)

plt.xlabel("Packet Number")
plt.ylabel("RTT (ms)")
plt.title("TCP Echo Server Round-Trip Time")
plt.xticks(range(1, 6))
plt.grid(True)

plt.show()
```

**Kết quả mong đợi:** Một đồ thị thể hiện thời gian phản hồi của 5 gói tin:

| Packet # | RTT (ms) |
| --- | --- |
| Packet 1 | 0.82 ms |
| Packet 2 | 0.71 ms |
| Packet 3 | 0.74 ms |
| Packet 4 | 0.79 ms |
| Packet 5 | 0.88 ms |

#### Mục tiêu học được từ bài lab

1. Tạo TCP Echo Server bằng Python.
2. Sử dụng `socket.bind()`, `listen()`, `accept()`.
3. Sử dụng TCP Client với `connect()`, `sendall()`, `recv()`.
4. Truyền dữ liệu dạng text và binary.
5. Đo Round-Trip Time (RTT) bằng `time.perf_counter()`.
6. Phân tích hiệu năng kết nối TCP bằng biểu đồ.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Tuân Thủ An Toàn** | Tuyệt đối ràng buộc socket vào `127.0.0.1`, xử lý ngoại lệ `try...except` và `logging` chuyên nghiệp. | Hardcode `127.0.0.1` nhưng thiếu logging vết sự cố. | Code chạy được trên Localhost nhưng gán IP `0.0.0.0`. | Không tuân thủ nguyên tắc an toàn Localhost. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Chat 2 chiều, Secure Logging Server, Crypto Socket Chat & Colab TCP test). | Hoàn thành Bài 1.1 và Bài 1.2 đúng yêu cầu. | Code có lỗi trôi vòng lặp hoặc chỉ gửi được 1 tin nhắn rồi ngắt. | Không nộp mã nguồn thực thi. |

---

## 🎓 Góc Nhìn CEH / CEH Alignment

> Mục này gắn kiến thức Tuần 1 vào khung chuẩn CEH. Xem bản đồ tổng ở [`CEH_alignment.md`](CEH_alignment.md).

### Ánh xạ CEH (CEH Mapping)

| Hạng mục | Nội dung |
| :--- | :--- |
| Module CEH | **M01** Introduction to Ethical Hacking · nền tảng cho **M03** Scanning Networks |
| Giai đoạn tấn công | Đặt nền cho **Scanning** (giai đoạn 2/5) |
| Vai trò | Cả Red (hiểu cách công cụ kết nối) lẫn Blue (viết server ghi log, chặn IP lạ) |

### Methodology — Vì sao Socket là gốc của mọi công cụ mạng

Mọi công cụ tấn công/phòng thủ mạng (Nmap, scanner, sniffer, C2, backdoor) đều dựng trên cùng bộ khối: `socket() → connect()/bind() → send()/recv()`. Hiểu chắc vòng đời này ở Tuần 1 thì các tuần sau chỉ là biến tấu:
- `connect_ex()` để dò cổng → **Port Scanner (Tuần 2)**
- `bind('0.0.0.0')` để mở dịch vụ ra LAN → **máy mục tiêu (Tuần 2 lab)**
- gửi/nhận gói thô → **Scapy, sniffing (Tuần 6)**

### Thuật ngữ CEH cần thuộc (Key Terminology)

| Tiếng Việt | English | Trong Tuần 1 |
| :--- | :--- | :--- |
| Điểm cuối | Endpoint | Chính là socket |
| Địa chỉ loopback | Loopback address | `127.0.0.1` — sandbox an toàn |
| Bắt tay 3 bước | Three-way handshake | SYN → SYN-ACK → ACK của TCP |
| Ủy quyền | Authorization | Ranh giới White/Black Hat |
| Bề mặt tấn công | Attack Surface | Mỗi cổng mở là một điểm trên bề mặt |

### Câu hỏi ôn thi kiểu CEH (Exam-Style Questions)

**1.** Yếu tố nào của tam giác CIA bị vi phạm khi kẻ tấn công nghe lén và đọc được mật khẩu truyền dạng thô?
- A. Integrity  B. Availability  C. **Confidentiality**  D. Non-repudiation

**2.** Địa chỉ `127.0.0.1` được gọi là gì và vì sao an toàn để học?
> *Đáp án:* Loopback address — dữ liệu không bao giờ rời khỏi máy bạn, nên không thể vô tình tấn công máy khác.

**3.** Sắp xếp đúng thứ tự 5 giai đoạn tấn công của CEH.
> *Đáp án:* Reconnaissance → Scanning → Gaining Access → Maintaining Access → Clearing Tracks.

**4.** Điều gì phân biệt một White Hat với một Black Hat — kỹ năng hay sự cho phép?
> *Đáp án:* Sự cho phép (authorization). Cùng một kỹ thuật, có phép là hợp pháp, không phép là phạm tội.
