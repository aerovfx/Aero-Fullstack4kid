# Hướng Dẫn Chạy Client/Server Trên 2 MacBook Cùng Mạng Wi-Fi

Tài liệu dùng chung cho **Tuần 1** (Chat Client/Server) và **Tuần 2** (Port Scanner).
Áp dụng cho macOS. Nếu bạn dùng Windows hoặc Linux, xem phần lệnh tương đương ở cuối bài.

---

## Quy Tắc An Toàn (đọc trước)

> [!WARNING]
> 1. Cả **hai MacBook đều phải là máy của bạn / của lớp học**, và mạng Wi-Fi phải là **mạng riêng ở nhà hoặc phòng lab** đã được chủ mạng đồng ý.
> 2. Tuyệt đối KHÔNG làm bài này trên Wi-Fi trường học, công ty, ký túc xá, quán cà phê hay bất kỳ mạng công cộng nào.
> 3. Khi mở server ra LAN (`bind("0.0.0.0")`), **bất kỳ ai trong mạng Wi-Fi cũng gõ cửa được máy bạn**. Học xong phải tắt server và dọn firewall.
> 4. Nếu quét trúng thiết bị lạ (TV, điện thoại người khác): chỉ ghi nhận, không quét sâu, không thử kết nối vào.

---

## Đặt Tên Hai Máy

Từ đây gọi thống nhất:

| Tên | Vai trò | Chạy gì |
| :--- | :--- | :--- |
| **MÁY A** | Server / Mục tiêu (Blue Team) | `lan_chat_server.py` hoặc `lan_target_server.py` |
| **MÁY B** | Client / Scanner (Red Team) | `lan_chat_client.py` hoặc `lan_ex01…03` |

Hai bạn nên **dán giấy note "A" và "B"** lên máy để khỏi nhầm khi làm bài.

---

# PHẦN 1 — CHUẨN BỊ (làm trên CẢ HAI MÁY)

## Bước 1.1 — Xác nhận cùng một mạng Wi-Fi

Click biểu tượng Wi-Fi trên thanh menu, xem tên mạng ở hai máy có **giống hệt nhau** không.

> Cẩn thận: nhiều router phát 2 sóng `TenWifi` (2.4GHz) và `TenWifi_5G` (5GHz). Đa số router vẫn cho 2 sóng này nhìn thấy nhau, nhưng để chắc chắn, **hãy nối cả hai máy vào cùng một tên mạng**.

## Bước 1.2 — Kiểm tra Python

```bash
python3 --version
```

Nếu báo lỗi "command not found", cài Xcode Command Line Tools:

```bash
xcode-select --install
```

## Bước 1.3 — Lấy địa chỉ IP của máy

**Cách nhanh nhất (Terminal):**

```bash
ipconfig getifaddr en0
```

`en0` là card Wi-Fi trên hầu hết MacBook. Nếu lệnh không in ra gì, thử `en1`:

```bash
ipconfig getifaddr en1
```

Không chắc card nào là Wi-Fi thì liệt kê ra xem:

```bash
networksetup -listallhardwareports
```

Tìm dòng `Hardware Port: Wi-Fi`, ngay dưới nó là `Device: en0` (hoặc `en1`).

**Cách dùng giao diện:** `System Settings` → `Network` → `Wi-Fi` → `Details…` → tab `TCP/IP` → xem `IP Address`.

**IP hợp lệ** cho bài lab có dạng:

| Dạng IP | Ý nghĩa |
| :--- | :--- |
| `192.168.x.x` | Phổ biến nhất ở mạng gia đình |
| `10.x.x.x` | Một số router/nhà mạng dùng dải này |
| `172.16.x.x` – `172.31.x.x` | Ít gặp hơn nhưng vẫn là mạng nội bộ |

> [!IMPORTANT]
> Nếu IP máy bạn bắt đầu bằng `169.254.` → máy **chưa nhận được IP từ router**. Tắt/bật lại Wi-Fi rồi thử lại.
> Nếu IP không thuộc 3 dải trên → bạn **không** ở mạng nội bộ, dừng bài lab lại.

## Bước 1.4 — Ghi lại thông tin

Viết ra giấy, cả hai bạn cùng nhìn:

```text
MÁY A (Server)  : 192.168.1.____
MÁY B (Client)  : 192.168.1.____
Tên Wi-Fi       : ________________
```

## Bước 1.5 — Kiểm tra hai máy "nhìn thấy" nhau

Trên **MÁY B**, ping thử MÁY A (thay bằng IP thật):

```bash
ping -c 4 192.168.1.25
```

Kết quả mong đợi:

```text
64 bytes from 192.168.1.25: icmp_seq=0 ttl=64 time=3.412 ms
--- 192.168.1.25 ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
```

| Kết quả | Nghĩa là | Làm gì |
| :--- | :--- | :--- |
| `0.0% packet loss` | Hai máy thông nhau | Sang Bước 1.6 |
| `100.0% packet loss` | Không tới được | Xem mục **Khắc phục sự cố** ở cuối bài |
| `Request timeout` | Firewall chặn ping hoặc sai IP | Kiểm tra lại IP, xem Bước 1.6 |

> Ping thất bại **chưa chắc** là hỏng: macOS ở chế độ Stealth Mode sẽ im lặng không trả lời ping dù vẫn nhận kết nối TCP. Cứ chạy tiếp và kiểm tra bằng `nc` ở Bước 3.

## Bước 1.6 — Xử lý Tường lửa macOS

macOS chặn kết nối đến theo **ứng dụng**, không theo cổng. Có 2 lựa chọn:

### Lựa chọn 1 — Cho phép Python nhận kết nối (khuyến nghị)

Khi bạn chạy server lần đầu, macOS sẽ hiện hộp thoại:

> *"Do you want the application 'Python' to accept incoming network connections?"*

Bấm **Allow**. Nếu lỡ bấm Deny, sửa lại bằng:

`System Settings` → `Network` → `Firewall` → `Options…` → tìm `Python` trong danh sách → đổi thành `Allow incoming connections`.

Hoặc dùng Terminal:

```bash
# Thêm python3 vào danh sách được phép
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add $(which python3)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp $(which python3)
```

### Lựa chọn 2 — Tạm tắt firewall trong lúc học

```bash
# Xem trạng thái hiện tại
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

# Tạm tắt
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
```

> [!CAUTION]
> **Bật lại ngay sau khi học xong:**
> ```bash
> sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
> ```
> Đây chính là bài học của Case Study trong `week02.md`: máy dev tắt firewall thì mọi dịch vụ bind `0.0.0.0` đều lộ ra Wi-Fi.

Kiểm tra Stealth Mode (chế độ tàng hình, không trả lời ping):

```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode
```

---

# PHẦN 2 — TUẦN 1: CHAT CLIENT/SERVER TRÊN 2 MÁY

Code ở thư mục `lessons/week01_code/`.

## 2.1 — Chạy Server (trên MÁY A)

```bash
cd ~/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersec-ai-10weeks/lessons/week01_code
python3 lan_chat_server.py
```

Màn hình MÁY A sẽ hiện:

```text
==================================================
🌍 LAN CHAT SERVER ĐANG CHẠY!
👉 Hãy nói với máy tính thứ 2 nhập IP này vào Client: 192.168.1.25
👉 Cổng (Port): 9999
==================================================
```

**Để nguyên cửa sổ Terminal này**, đọc IP cho bạn ở MÁY B.

> `lan_chat_server.py` đã `bind('0.0.0.0', 9999)` nên máy khác trong Wi-Fi kết nối được.
> Riêng `basic_server.py` và `secure_server.py` của Tuần 1 đang `bind('192.168.1.100', ...)` — địa chỉ cứng này gần như chắc chắn **không phải** IP máy bạn, chạy sẽ báo lỗi `Can't assign requested address`. Muốn dùng chúng cho lab 2 máy thì sửa thành `'0.0.0.0'`.

## 2.2 — Chạy Client (trên MÁY B)

```bash
cd ~/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersec-ai-10weeks/lessons/week01_code
python3 lan_chat_client.py
```

Chương trình hỏi IP → gõ **IP của MÁY A** (không phải IP máy mình):

```text
Nhập IP của máy chủ bạn muốn kết nối (vd: 192.168.1.5): 192.168.1.25
Đang gọi tới 192.168.1.25:9999...
[+] KẾT NỐI THÀNH CÔNG! Bạn có thể bắt đầu chat.
```

Gõ tin nhắn ở MÁY B → MÁY A nhận và trả lời. Gõ `EXIT` để thoát.

## 2.3 — Sơ đồ luồng

```text
   MÁY A (192.168.1.25)                MÁY B (192.168.1.31)
   ┌──────────────────┐                ┌──────────────────┐
   │ lan_chat_server  │                │ lan_chat_client  │
   │ bind 0.0.0.0:9999│ ◄───────────── │ connect A:9999   │
   │ listen()         │   qua Wi-Fi    │ send("Chào!")    │
   │ accept()         │ ─────────────► │ recv(reply)      │
   └──────────────────┘                └──────────────────┘
```

---

# PHẦN 3 — TUẦN 2: PORT SCANNER TRÊN 2 MÁY

Code ở thư mục `lessons/week02_code/`. Đề bài đầy đủ: [`week02_exercises.md`](week02_exercises.md).

## 3.1 — Mở mục tiêu (trên MÁY A)

```bash
cd ~/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersec-ai-10weeks/lessons/week02_code
python3 lan_target_server.py
```

1. Chương trình bắt gõ `YES` để xác nhận đây là mạng lab hợp lệ.
2. Nó **tự in ra IP của MÁY A** — đọc số này cho bạn ở MÁY B.
3. Mở 3 cổng lab: **9001, 9002, 9003**, mỗi cổng một banner khác nhau.
4. Mỗi khi MÁY B quét tới, MÁY A in log `Có người gõ cửa cổng 9001 từ 192.168.1.31` — rất tiện để hai bạn biết kết nối đã thông.

## 3.2 — Kiểm tra nhanh trước khi làm bài (trên MÁY B)

Dùng `nc` (netcat, có sẵn trên macOS) để chắc chắn cổng đã thông:

```bash
nc -zv 192.168.1.25 9001
```

Kết quả mong đợi: `Connection to 192.168.1.25 port 9001 [tcp/*] succeeded!`

Xem thử banner mà MÁY A gửi về:

```bash
nc 192.168.1.25 9001
# Sẽ in: Aero-FTP Server v1.2 (anonymous login allowed)
# Nhấn Ctrl + C để thoát
```

Nếu `nc` chạy được nghĩa là bài tập chắc chắn chạy được.

## 3.3 — Làm 3 bài tập (trên MÁY B)

```bash
cd ~/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersec-ai-10weeks/lessons/week02_code

python3 lan_ex01_first_contact.py      # B1 — nhập IP Máy A, so sánh LAN vs localhost
python3 lan_ex02_host_discovery.py     # B2 — tự tìm Máy A giữa 254 địa chỉ
python3 lan_ex03_firewall_duel.py before   # B3 hiệp 1
# ... MÁY A vá lỗi (xem 3.4) ...
python3 lan_ex03_firewall_duel.py after    # B3 hiệp 3
```

## 3.4 — Bài B3: MÁY A vá lỗi bằng firewall macOS

macOS **không** có lệnh chặn theo cổng đơn giản như `ufw` của Linux. Trên Mac có 2 cách:

**Cách 1 (dễ, khuyến nghị cho học sinh):** chặn ở tầng ứng dụng.

```bash
# Bật firewall và chặn Python nhận kết nối đến
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --blockapp $(which python3)
```

Cách này chặn **cả 3 cổng** cùng lúc (vì cả 3 đều do Python mở). Kết quả bài B3 sẽ là "đóng được 3/3" thay vì 2/3 — vẫn đúng bài, chỉ khác con số. Ghi chú điều này vào báo cáo.

**Cách 2 (nâng cao, chặn đúng từng cổng bằng `pf`):**

```bash
# Tạo luật chặn riêng cổng 9001 và 9002
echo "block in proto tcp from any to any port {9001, 9002}" | sudo tee /etc/pf.anchors/lab.week02
sudo pfctl -f /etc/pf.anchors/lab.week02 -e
```

Gỡ luật sau khi học xong:

```bash
sudo pfctl -d
sudo rm /etc/pf.anchors/lab.week02
```

**Khôi phục sau Cách 1:**

```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp $(which python3)
```

## 3.5 — Câu hỏi chốt bài (làm trên MÁY A sau khi vá)

```bash
python3 -c "import socket; print(socket.socket().connect_ex(('127.0.0.1', 9001)))"
```

Kết quả in ra `0` → **dịch vụ vẫn đang chạy bình thường**, chỉ có firewall chặn người ngoài. Đây chính là bài học *defense in depth*: firewall chặn gói tin trước khi tới ứng dụng, nhưng muốn an toàn thật sự thì phải **tắt luôn dịch vụ không cần thiết**.

---

# PHẦN 4 — DỌN DẸP SAU BUỔI HỌC (bắt buộc)

Chạy trên **cả hai máy**:

```bash
# 1. Tắt mọi server đang chạy: quay lại Terminal đó và nhấn Ctrl + C

# 2. Kiểm tra chắc chắn không còn cổng nào mở ra ngoài
lsof -i -P | grep LISTEN | grep -v "127.0.0.1" | grep -v "\[::1\]"
#    Không in ra gì (hoặc chỉ còn dịch vụ hệ thống Apple) là sạch.

# 3. Bật lại firewall nếu đã tắt ở Bước 1.6
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
#    Mong đợi: Firewall is enabled. (State = 1)

# 4. Gỡ luật đã thêm ở bài B3
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp $(which python3)
sudo pfctl -d 2>/dev/null            # nếu đã dùng Cách 2
```

---

# PHẦN 5 — KHẮC PHỤC SỰ CỐ

## 5.1 — Bảng tra nhanh

| Triệu chứng | Nguyên nhân | Cách sửa |
| :--- | :--- | :--- |
| `Connection refused` | Server chưa chạy, hoặc sai cổng | Kiểm tra Terminal MÁY A còn đang chạy server không |
| `Operation timed out` | Firewall chặn, hoặc sai IP | Xem Bước 1.6, kiểm tra lại IP bằng `ipconfig getifaddr en0` |
| `No route to host` | Hai máy khác mạng | Kiểm tra tên Wi-Fi ở hai máy |
| `Address already in use` | Cổng đang bị chương trình khác chiếm | `lsof -i :9001` rồi `kill <PID>`, hoặc đổi số cổng |
| `Can't assign requested address` | Code `bind()` vào IP không phải của máy này | Sửa thành `bind('0.0.0.0', ...)` |
| MÁY B không thấy **bất kỳ** thiết bị nào (kể cả router) | Router bật **AP/Client Isolation** | Xem mục 5.2 |
| Ping thất bại nhưng `nc` lại thành công | macOS Stealth Mode | Bình thường, cứ làm bài tiếp |
| IP máy A đổi sau khi ngủ/thức | Router cấp lại IP qua DHCP | Chạy lại `ipconfig getifaddr en0`, cập nhật IP mới |
| macOS hỏi "accept incoming connections?" | Firewall ứng dụng | Bấm **Allow** |

## 5.2 — Router bật AP Isolation (lỗi hay gặp nhất)

Nhiều router Wi-Fi (đặc biệt router nhà mạng cho thuê) bật sẵn tính năng **AP Isolation / Client Isolation / Guest Mode** — chặn các máy trong cùng Wi-Fi nhìn thấy nhau. Dấu hiệu: MÁY B ping MÁY A thất bại, và bài B2 quét cả dải mạng cũng **không thấy gì ngoài chính mình**.

Cách xử lý, thử theo thứ tự:

1. **Đảm bảo không dùng mạng Guest** — mạng khách gần như luôn bật isolation. Chuyển sang Wi-Fi chính.
2. **Tắt AP Isolation trong router**: mở trình duyệt vào `192.168.1.1` (hoặc `192.168.0.1`), đăng nhập, tìm mục `Wireless` → `Advanced` → bỏ tick `AP Isolation` / `Client Isolation`. *Chỉ làm nếu bạn là chủ mạng hoặc được bố mẹ đồng ý.*
3. **Dùng phương án dự phòng**: tạo mạng riêng bằng cách bật điểm phát sóng (Personal Hotspot) từ một chiếc iPhone, cho cả hai MacBook nối vào. Hotspot iPhone không bật isolation. Đây cũng là mạng riêng tuyệt đối an toàn cho bài lab.

## 5.3 — Kiểm tra từng lớp một cách có hệ thống

Khi bí, đi lần lượt từ thấp lên cao — đây chính là tư duy của kỹ sư mạng:

```text
Lớp 1: Hai máy cùng Wi-Fi?          → so tên mạng ở 2 máy
Lớp 2: Có IP hợp lệ?                → ipconfig getifaddr en0  (không phải 169.254.x.x)
Lớp 3: Hai máy tới được nhau?       → ping -c 4 <IP Máy A>
Lớp 4: Server có đang chạy?         → trên Máy A: lsof -i :9001
Lớp 5: Cổng có thông qua LAN?       → trên Máy B: nc -zv <IP Máy A> 9001
Lớp 6: Bài tập chạy được?           → python3 lan_ex01_first_contact.py
```

Lớp nào hỏng thì sửa đúng lớp đó, đừng nhảy cóc.

---

# PHẦN 6 — LỆNH TƯƠNG ĐƯƠNG TRÊN HỆ ĐIỀU HÀNH KHÁC

| Việc cần làm | macOS | Ubuntu/Linux | Windows (PowerShell) |
| :--- | :--- | :--- | :--- |
| Xem IP Wi-Fi | `ipconfig getifaddr en0` | `hostname -I` | `ipconfig` |
| Ping | `ping -c 4 <IP>` | `ping -c 4 <IP>` | `ping <IP>` |
| Thử cổng | `nc -zv <IP> 9001` | `nc -zv <IP> 9001` | `Test-NetConnection <IP> -Port 9001` |
| Xem cổng đang mở | `lsof -i -P \| grep LISTEN` | `ss -tlnp` | `netstat -ano \| findstr LISTENING` |
| Bật firewall | `socketfilterfw --setglobalstate on` | `sudo ufw enable` | `Set-NetFirewallProfile -Enabled True` |
| Chặn 1 cổng | `pfctl` (xem mục 3.4) | `sudo ufw deny 9001` | `New-NetFirewallRule -LocalPort 9001 -Action Block …` |

---

## Tóm Tắt Một Trang

```text
┌─ CHUẨN BỊ (cả 2 máy) ────────────────────────────────────┐
│ 1. Cùng Wi-Fi        2. python3 --version                │
│ 3. ipconfig getifaddr en0   → ghi IP ra giấy             │
│ 4. ping từ B sang A  5. Cho phép Python qua firewall     │
└──────────────────────────────────────────────────────────┘
              ↓
┌─ MÁY A (Server) ──────────┐   ┌─ MÁY B (Client/Scanner) ─┐
│ Tuần 1:                   │   │ Tuần 1:                  │
│   lan_chat_server.py      │◄──│   lan_chat_client.py     │
│ Tuần 2:                   │   │ Tuần 2:                  │
│   lan_target_server.py    │◄──│   lan_ex01/02/03         │
└───────────────────────────┘   └──────────────────────────┘
              ↓
┌─ DỌN DẸP (bắt buộc) ─────────────────────────────────────┐
│ Ctrl+C tắt server · bật lại firewall · gỡ luật đã thêm   │
│ Kiểm tra: lsof -i -P | grep LISTEN | grep -v 127.0.0.1   │
└──────────────────────────────────────────────────────────┘
```
