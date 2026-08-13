# Tuần 2: Scanning Networks & Kỹ thuật Quét Cổng (CEH v12 Module 03 Aligned)

## Mục Tiêu / Objectives (CEH v12 Aligned)

Trong tuần 2, chúng ta sẽ đi sâu vào kỹ thuật **Scanning Networks** (CEH v12 Module 03). Học viên sẽ học nguyên lý quét cổng TCP Connect Scan, SYN Scan và tự tay lập trình công cụ Port Scanner bằng Python qua 3 cấp độ từ cơ bản đến đa luồng tốc độ cao.

**Mục tiêu cụ thể / Specific Objectives:**
1. Hiểu rõ quy trình rà quét mạng (Scanning Networks) theo chuẩn CEH v12 và CompTIA Security+.
2. Nắm vững cơ chế hoạt động của TCP Connect Scan, SYN Scan, FIN Scan và danh sách các cổng thông dụng (80, 443, 21, 22, 3306).
3. Lập trình công cụ Port Scanner bằng Python qua 3 cấp độ: Single Port -> Port Range -> Multi-threaded Fast Scanner.
4. Tuân thủ CEH Code of Ethics: Tuyệt đối chỉ rà quét thiết bị cá nhân hoặc Localhost (`127.0.0.1`).

---

## Lý Thuyết / Theory (with definitions and examples)

### 1. Trinh sát mạng (Reconnaissance) là gì?
- Giống như việc một thám tử khảo sát ngôi nhà trước khi quyết định cách đột nhập. Hacker (hoặc chuyên gia bảo mật) sẽ dò tìm xem mục tiêu đang chạy hệ điều hành gì, mở những cổng (Port) nào, và phần mềm nào đang lắng nghe sau các cổng đó.
- Mục đích: Tìm kiếm lỗ hổng (Ví dụ: Tìm thấy cổng 21 - FTP mở mà không yêu cầu mật khẩu).

### 2. Kỹ thuật Port Scanning
- Một máy tính có **65535** cổng.
- Công cụ Scanner sẽ lần lượt gõ cửa từng cổng.
- **TCP Connect Scan**: Phương pháp cơ bản nhất (mà chúng ta sẽ code hôm nay). Máy của bạn cố gắng hoàn thành "Bắt tay 3 bước" (3-way handshake) với máy đích.
    - Nếu cổng MỞ: Máy đích phản hồi `SYN-ACK`. Kết nối thành công.
    - Nếu cổng ĐÓNG: Máy đích phản hồi `RST` (Reset). Kết nối thất bại.
- *Lưu ý:* Kỹ thuật này rất ồn ào và dễ bị Tường lửa (Firewall) hoặc hệ thống phát hiện xâm nhập (IDS) ghi lại log.

### 3. Đa luồng (Multi-threading) là gì?
- Nếu dùng một vòng lặp bình thường để quét 65535 cổng, và mỗi cổng mất 1 giây để chờ phản hồi (timeout), bạn sẽ mất hơn 18 tiếng!
- **Đa luồng (Threading)** cho phép Python mở hàng chục, hàng trăm "công nhân" (threads) đi gõ cửa các cổng cùng một lúc, rút ngắn thời gian quét xuống chỉ còn vài phút hoặc vài giây.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices

> [!WARNING]
> **CẢNH BÁO PHÁP LÝ & ĐẠO ĐỨC (LEGAL & ETHICAL WARNING):**
> 1. Hành động quét cổng (Port Scanning) vào một mục tiêu lạ **có thể bị coi là hành vi tấn công trinh sát**, vi phạm nghiêm trọng chính sách bảo mật của các tổ chức và luật An ninh mạng.
> 2. Công cụ Nmap hay script bạn viết ra **CHỈ ĐƯỢC PHÉP** chạy với đích đến là `127.0.0.1` (Localhost) hoặc các máy ảo do chính bạn lập ra để phục vụ việc học.
> 3. Tuyệt đối không thử quét IP của trường học, công ty, hay bất kỳ trang web công cộng nào.

---

## Thực Hành Code / Hands-On (Từ Cơ Bản Đến Phức Tạp)

Chúng ta sẽ trải qua 3 cấp độ để xây dựng một cỗ máy quét (Scanner) hoàn chỉnh. Ở bài thực hành này, trước khi quét, bạn nên mở sẵn vài Server (như file `basic_server.py` ở tuần 1) để có cổng mở cho Scanner tìm thấy nhé!

### Cấp độ 1: Scanner Cơ bản (Quét 1 Cổng)
Mục tiêu: Dùng hàm `connect_ex()` thay vì `connect()`. Hàm này không làm văng lỗi (crash) khi cổng đóng, mà chỉ trả về mã lỗi.

**`basic_scanner.py`**
```python
import socket

# Khai báo mục tiêu an toàn (Luôn là localhost)
target_ip = "127.0.0.1"
port_to_scan = 9999

# Tạo socket TCP
scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
scanner.settimeout(1) # Chỉ chờ tối đa 1 giây để phản hồi

print(f"Đang gõ cửa cổng {port_to_scan} trên {target_ip}...")

# connect_ex trả về số 0 nếu kết nối thành công (Cổng MỞ)
# Trả về các số khác (ví dụ: 61, 111) nếu Cổng ĐÓNG
result = scanner.connect_ex((target_ip, port_to_scan))

if result == 0:
    print(f"[+] CỔNG {port_to_scan}: MỞ (OPEN)")
else:
    print(f"[-] CỔNG {port_to_scan}: ĐÓNG (CLOSED)")

scanner.close()
```

---

### Cấp độ 2: Vòng lặp Scanner (Quét Dải Cổng)
Mục tiêu: Quét tự động từ cổng 1 đến 100 bằng vòng lặp `for`.

**`loop_scanner.py`**
```python
import socket
import time

target_ip = "127.0.0.1"

print(f"=== BẮT ĐẦU QUÉT HỆ THỐNG: {target_ip} ===")
start_time = time.time()

# Quét các cổng phổ biến từ 1 đến 100
for port in range(1, 101):
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.1) # Chờ 0.1s mỗi cổng để quét nhanh hơn
    
    result = scanner.connect_ex((target_ip, port))
    if result == 0:
        print(f"[+] PHÁT HIỆN CỔNG MỞ: {port}")
        
    scanner.close()

end_time = time.time()
print(f"Hoàn tất quét trong {round(end_time - start_time, 2)} giây.")
```

---

### Cấp độ 3: Scanner Tốc độ cao (Multi-threading)
Mục tiêu: Sử dụng thư viện `threading` để quét hàng ngàn cổng cực nhanh.

**`fast_scanner.py`**
```python
import socket
import threading
import time

target_ip = "127.0.0.1"
open_ports = [] # Danh sách lưu các cổng đang mở

def scan_port(port):
    """Hàm quét 1 cổng duy nhất, sẽ được các công nhân (luồng) gọi."""
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.5)
    
    try:
        result = scanner.connect_ex((target_ip, port))
        if result == 0:
            print(f"[+] MỞ: Cổng {port}")
            open_ports.append(port)
    except Exception:
        pass # Bỏ qua lỗi
    finally:
        scanner.close()

print(f"=== MULTI-THREAD SCANNER ĐANG CHẠY TRÊN {target_ip} ===")
start_time = time.time()
threads = [] # Danh sách quản lý các công nhân

# Quét 1000 cổng đầu tiên (1 - 1000)
for port in range(1, 1001):
    # Tạo một luồng (thread) mới và giao nhiệm vụ chạy hàm scan_port
    t = threading.Thread(target=scan_port, args=(port,))
    threads.append(t)
    t.start() # Ra lệnh cho công nhân bắt đầu làm việc

# Chờ tất cả công nhân làm việc xong thì mới kết thúc chương trình
for t in threads:
    t.join()

end_time = time.time()
print("\\n" + "="*40)
print(f"BÁO CÁO KẾT QUẢ:")
print(f"- Tổng số cổng mở: {len(open_ports)} {open_ports}")
print(f"- Thời gian hoàn thành: {round(end_time - start_time, 2)} giây")
print("="*40)
```

---

## Bài Về Nhà / Homework

### Đề bài: Thám tử Banner (Banner Grabbing)
Banner Grabbing là kỹ thuật thu thập thông tin phần mềm đang chạy đằng sau một cổng mở. Ví dụ: Cổng 80 mở, nhưng đằng sau nó là Nginx hay Apache?
Dựa trên Cấp độ 3, hãy viết thêm một tính năng: Khi phát hiện cổng MỞ, thay vì chỉ in ra "[+] MỞ", hãy thử gửi một chuỗi văn bản bất kỳ vào cổng đó (ví dụ: `"HELLO\\r\\n"`), sau đó dùng `recv(1024)` để xem phần mềm đằng sau phản hồi lại nội dung gì. In phản hồi đó ra màn hình (Lưu ý dùng `try...except` vì có dịch vụ mở nhưng không phản hồi).

**Yêu cầu kỹ thuật / Technical Requirements:**
1. Code đa luồng chạy mượt mà.
2. Có hàm thu thập Banner `grab_banner(ip, port)`.
3. Chỉ thực hành quét `127.0.0.1`.

**Cách nộp bài / How to Submit:**
Nộp file `banner_scanner.py` lên hệ thống LMS kèm theo hình ảnh chụp Terminal hiển thị rõ một dịch vụ đã trả về Banner (Gợi ý: Mở sẵn `secure_server.py` của Tuần 1 làm "mồi" để quét, vì nó có cài đặt logic phản hồi lại Client).

---

## Đánh Giá / Assessment Rubric Table

| Tiêu chí / Criteria | Xuất sắc / Excellent (90-100%) | Tốt / Good (70-89%) | Cần cố gắng / Needs Improvement (<70%) |
| :--- | :--- | :--- | :--- |
| **1. Tuân thủ An toàn** | Chỉ quét `127.0.0.1`. (30 điểm) | Dùng localhost nhưng thiếu cẩn thận. (20 điểm) | Quét IP mạng ngoài/LAN. (0 điểm, FAIL). |
| **2. Tốc độ & Đa luồng** | Quét hàng ngàn cổng nhanh chóng, không bị treo nhờ `threading`. Đóng luồng gọn gàng bằng `join()`. (30 điểm) | Dùng vòng lặp thường hoặc Thread bị treo do cấu trúc sai. (15 điểm) | Không thể quét nhiều cổng. (0 điểm) |
| **3. Thu thập Banner** | Gửi thông điệp, bắt được phản hồi của phần mềm đích, xử lý ngoại lệ `recv()` mượt mà. (40 điểm) | Có hứng dữ liệu nhưng không xử lý ngoại lệ Timeout khiến luồng bị kẹt. (25 điểm) | Cổng mở nhưng không bắt được Banner. (10 điểm) |

---

## Mở Rộng: Xây Dựng Công Cụ Quản Trị Mạng & Phòng Thủ (Defensive Auditing)

Thay vì dùng Scanner để tấn công, chúng ta có thể sử dụng chính công cụ này với **tư duy phòng thủ (Blue Team)** để kiểm kê an ninh thiết bị. Mục tiêu là phát hiện các cổng đang mở ngoài ý muốn và đưa ra khuyến nghị đóng các dịch vụ không cần thiết để giảm thiểu rủi ro.

Một quy trình quản trị an toàn bao gồm:
1. Quét thiết bị (Localhost).
2. Kiểm tra các cổng phổ biến (Common Ports).
3. Hiển thị ý nghĩa của từng cổng.
4. Đánh giá mức độ rủi ro.
5. In ra hướng dẫn (Windows Firewall, ufw, router, v.v.) để đóng cổng.

### Mã Nguồn Công Cụ: `defensive_auditor.py`
Công cụ này được thiết kế để chỉ quét an toàn trên `127.0.0.1` (theo quy định của khóa học), liệt kê các dịch vụ đang chạy và tự động đưa ra các lời khuyên bảo mật. Bạn có thể xem mã nguồn tại thư mục `week02_code`.

### Hướng Dẫn Đóng Cổng (Remediation)

Sau khi công cụ chỉ ra các cổng đang mở, người dùng cần tự đóng cổng trên thiết bị của họ:

| Cổng   | Khuyến nghị phòng thủ                  |
| ------ | -------------------------------------- |
| 21     | Tắt dịch vụ FTP nếu không sử dụng      |
| 22     | Chỉ cho phép SSH bằng khóa công khai   |
| 23     | Nên tắt hoàn toàn (Dịch vụ lỗi thời)   |
| 80/443 | Kiểm tra web server có cần thiết không |
| 445    | Tắt chia sẻ file nếu không dùng        |
| 3389   | Giới hạn truy cập bằng firewall/VPN    |

**Ví dụ đóng cổng trên Windows (Powershell):**
```powershell
New-NetFirewallRule `
    -DisplayName "Block RDP" `
    -Direction Inbound `
    -Protocol TCP `
    -LocalPort 3389 `
    -Action Block
```

**Ví dụ đóng cổng trên Ubuntu (Linux):**
```bash
sudo ufw deny 3389
sudo ufw deny 23
sudo ufw status
```

**Quy Trình Chuẩn Của Chuyên Gia Phân Tích (Auditor):**
```text
Quét thiết bị
      ↓
Hiển thị cổng đang mở
      ↓
Giải thích chức năng
      ↓
Đánh giá mức độ rủi ro
      ↓
Đưa hướng dẫn đóng cổng (Remediation)
```
Cách tiếp cận này giúp học viên tự kiểm tra và tăng cường an toàn cho chính thiết bị của mình một cách chủ động và có trách nhiệm!

---

## Case Study Thực Tế: Đánh Giá An Ninh Máy Tính Cá Nhân (PostgreSQL & macOS Firewall)

Dưới đây là một bài học thực tế về cách đánh giá bảo mật trên một máy tính Mac đang chạy cơ sở dữ liệu PostgreSQL.

### Tổng hợp hiện trạng

| Hạng mục       | Trạng thái            |
| -------------- | --------------------- |
| PostgreSQL     | Chỉ mở trên localhost |
| Cổng 5432      | Không lộ ra Wi-Fi     |
| Cổng 5432      | Không lộ ra Internet  |
| Unix Socket    | Hoạt động bình thường |
| macOS Firewall | **Đang tắt**          |

Log quan trọng:
```text
Firewall is disabled. (State = 0)
```
Điều này có nghĩa là hiện tại macOS không bật tường lửa ứng dụng. Tuy nhiên, do PostgreSQL chỉ lắng nghe trên `127.0.0.1:5432` và `::1:5432` nên riêng PostgreSQL vẫn an toàn.

### Đánh giá rủi ro

**Kịch bản cần lưu ý:**
Nếu sau này bạn cài thêm các dịch vụ mở cổng công khai (Bind ra `0.0.0.0`) như Node.js server (`0.0.0.0:3000`), Docker containers, Redis (`6379`), MongoDB (`27017`), SSH (`22`)... thì khi Firewall tắt, các dịch vụ đó có thể bị truy cập trái phép từ mạng nội bộ Wi-Fi (ví dụ `192.168.1.15:3000`).

### Khuyến nghị & Cách kiểm tra bằng lệnh (Command-line Auditing)

Đối với máy lập trình viên (developer machine), cách tốt nhất là duy trì thói quen kiểm tra định kỳ:

1. **Bật macOS Firewall:**
```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
```

2. **Xác nhận trạng thái Firewall:**
```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
# Kết quả mong muốn: Firewall is enabled. (State = 1)
```

3. **Liệt kê tất cả dịch vụ đang lắng nghe trên máy (Lệnh Cực Kỳ Quan Trọng):**
```bash
lsof -i -P | grep LISTEN
```
*Lệnh này mạnh tương đương với việc chạy công cụ Port Scanner trên chính máy bạn.*

4. **Tìm các dịch vụ đang lộ ra toàn mạng Wi-Fi/Internet:**
```bash
lsof -i -P | grep LISTEN | grep -v "127.0.0.1"
```
*Nếu chỉ thấy `localhost`, `127.0.0.1` hoặc `::1` thì bạn đang ở trạng thái an toàn tuyệt đối.*

### Đánh giá điểm bảo mật (Security Score)

Nếu hệ thống của bạn vượt qua bài kiểm tra cuối cùng:
| Tiêu chí                     | Kết quả |
| ---------------------------- | ------- |
| Chỉ có 1 cổng mở             | Có      |
| Cổng mở là localhost         | Có      |
| Firewall bật                 | Có      |
| Không có Telnet/FTP/RDP      | Có      |
| Không lộ dịch vụ ra Wi-Fi    | Có      |
| Không lộ dịch vụ ra Internet | Có      |

**Overall Security Score: 10/10 | Risk Level: VERY LOW**

Đối với một máy phát triển cá nhân, đây là một cấu hình nguyên tắc "default deny" (mặc định từ chối) hoàn chỉnh. Hãy duy trì thói quen dùng `lsof` sau khi cài đặt phần mềm mới để luôn làm chủ sự an toàn của thiết bị!

---

### Phụ Lục: Phân Tích Chuyên Sâu Các Tiến Trình Hệ Thống (macOS Services)

Khi bạn chạy lệnh `lsof -i -P | grep LISTEN`, ngoài PostgreSQL ra, bạn có thể sẽ bắt gặp một số cổng khác đang mở. Dưới đây là phân tích chi tiết về các dịch vụ thường gặp trên macOS để giúp bạn nhận diện đâu là rủi ro, đâu là bình thường:

#### Phân loại kết quả mẫu

| Port        | Process         | Phạm vi   | Đánh giá      |
| ----------- | --------------- | --------- | ------------- |
| 5000        | ControlCenter   | `*`       | macOS AirPlay |
| 7000        | ControlCenter   | `*`       | macOS AirPlay |
| 49152       | rapportd        | `*`       | Dịch vụ Apple |
| 54999       | rapportd        | `*`       | Dịch vụ Apple |
| 55000       | rapportd        | `*`       | Dịch vụ Apple |
| 5432        | postgres        | localhost | An toàn       |
| 8080        | node            | localhost | An toàn       |
| 49196-49992 | language_server | localhost | An toàn       |
| 61034       | VS Code         | localhost | An toàn       |

---

#### 1. `ControlCenter` (Port 5000, 7000)
Đây là tiến trình của macOS liên quan đến AirPlay, Screen Mirroring.
Nếu bạn thấy `TCP *:5000 (LISTEN)`, dấu `*` nghĩa là nó đang mở ra toàn mạng Wi-Fi.
- **Xử lý:** Nếu bạn không dùng AirPlay, hãy vào `System Settings > General > AirDrop & Handoff` và tắt `AirPlay Receiver`.

#### 2. `rapportd` (Các Port ngẫu nhiên > 49000)
Đây là dịch vụ chính thức của Apple dùng cho Handoff, Universal Clipboard (Copy máy này Paste máy kia). Nó kết nối liên tục giữa MacBook, iPhone và iPad.
- **Xử lý:** Đây không phải mã độc. Nếu bạn dùng hệ sinh thái Apple, hãy giữ nguyên.

#### 3. Các tiến trình lập trình nội bộ (`node`, `language_server`, `Code H`)
Khi dùng VS Code (hoặc Cursor), nó sẽ tự động bật các Language Server (như Python, TypeScript) để phân tích code, mở các cổng ngẫu nhiên (VD: 61034) trên `localhost`.
- **Xử lý:** Hoàn toàn bình thường và an toàn vì chúng bị trói chặt vào `localhost`.

### Sơ Đồ An Ninh Lý Tưởng

```text
                 Internet
                     X (Bị chặn bởi Tường lửa mạng)
                     |
              macOS Firewall
                     |
          -----------------------
          |                     |
      localhost              Wi-Fi
          |                     |
5432,8080,VSCode       AirPlay,Apple
```

**Kết luận:** Không có dấu hiệu của mã độc hoặc dịch vụ bất thường. Những cổng mở ra mạng nội bộ đều thuộc dịch vụ hệ thống của Apple, còn toàn bộ dịch vụ lập trình (Database, Web server, Editor) đều được giới hạn ở `localhost`. Đây là một bức tranh bảo mật chuẩn mực!
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.
