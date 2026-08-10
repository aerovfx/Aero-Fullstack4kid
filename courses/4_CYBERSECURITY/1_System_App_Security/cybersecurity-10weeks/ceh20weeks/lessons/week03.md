# Tuần 3: Scanning Networks (CEH v13 Module 03)

> Tương ứng: `CEHv13PDF/CEHv13 - Module 03 - Scanning Networks.pdf`

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 03** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu rõ **mục đích của Scanning** trong giai đoạn 2 của 5 pha tấn công: phát hiện **host đang sống**, **port mở**, **service chạy** và **hệ điều hành của mục tiêu**.
2. Phân biệt được các kỹ thuật **host discovery** (ICMP ping sweep, ARP) và hiểu **TCP 3-way handshake** cũng như ý nghĩa từng flag (SYN, ACK, FIN, RST, PSH, URG).
3. Nắm vững các kỹ thuật **port scan**: TCP Connect (full connect), SYN (half-open), FIN / XMAS / Null (stealth), và UDP scan — ưu nhược điểm từng loại.
4. Sử dụng thành thạo **Nmap** trên chính máy mình với các option cơ bản: `-sS -sT -sV -O -p -Pn`; biết **service/version detection**, **OS fingerprinting** và **banner grabbing**.
5. Hiểu các kỹ thuật **evasion** (idle scan, decoy) theo góc nhìn *phòng thủ* và đề xuất **countermeasures** (firewall, IDS/IPS, đóng service không cần thiết, giới hạn port).

---

## Lý Thuyết / Theory

### 1. Scanning Là Gì & Mục Tiêu

**Scanning** là giai đoạn 2 của [Cyber Kill Chain](week01.md) — sau Reconnaissance (footprinting). Kẻ tấn công đã có danh sách mục tiêu tiềm năng, giờ dùng công cụ quét để "cảm nhận" hệ thống:

| Mục tiêu quét | Loại thông tin lấy được | Ý nghĩa cho kẻ tấn công |
|---------------|--------------------------|-------------------------|
| **Host discovery** | Host nào đang sống / online | Thu hẹp danh sách mục tiêu |
| **Port scanning** | Cổng nào đang MỞ (listening) | Tìm "cửa ra vào" tiềm năng |
| **Service & version** | Service nào đang chạy + phiên bản | Tìm exploit tương ứng version cũ |
| **OS detection** | Hệ điều hành / bản vá | Chọn payload phù hợp hệ điều hành |

**Ghi nhớ:** *Footprinting* (W2) cho biết **ai** là mục tiêu; *Scanning* (W3) cho biết **cửa nào đang mở và khoá nào đang yếu**.

### 2. Host Discovery (Phát Hiện Host Sống)

| Kỹ thuật | Cơ chế | Đặc điểm |
|----------|--------|----------|
| **ICMP ping sweep** | Gửi loạt ICMP Echo Request tới dải địa chỉ; host sống trả lời Echo Reply | Nhanh nhưng dễ bị chặn bởi firewall / `ping` bị tắt |
| **ARP scan** | Gửi ARP Request trong cùng mạng LAN | **Chính xác nhất** trong LAN; host trả lời ngay |
| **TCP ACK ping** | Gửi gói TCP với flag ACK tới port 80/443 | Vượt firewall chỉ lọc ICMP |
| **Nmap `-sn`** | Tổng hợp ping sweep mà không quét port | Mặc định vẫn gửi TCP SYN tới 443 cùng ICMP |

**Thực tế:** Kẻ tấn công thường tổ hợp nhiều loại — vì ICMP bị chặn thì TCP ACK ping vẫn lộ host sống.

### 3. TCP 3-Way Handshake & Ý Nghĩa Từng Flag

```
Client                              Server
   |  ── SYN (seq=x) ──────────────▶  |  1. Client xin kết nối
   |  ◀──── SYN+ACK (seq=y, ack=x+1) ─|  2. Server đồng ý
   |  ── ACK (seq=x+1, ack=y+1) ────▶ |  3. Client xác nhận = kết nối MỞ
```

| Flag | Tên đầy đủ | Vai trò |
|------|------------|---------|
| **SYN** | Synchronize | Xin thiết lập kết nối (mở hộp thoại) |
| **ACK** | Acknowledgment | Xác nhận đã nhận dữ liệu |
| **FIN** | Finish | Xin đóng kết nối một chiều |
| **RST** | Reset | Hủy kết nối ngay lập tức (từ chối) |
| **PSH** | Push | Đẩy dữ liệu ngay, không chờ buffer |
| **URG** | Urgent | Dữ liệu khẩn cấp (hiếm dùng) |

**Mẹo cho quét port:** Port **MỞ** trả lời SYN với `SYN+ACK`; port **ĐÓNG** trả về `RST`. Đây chính là nguyên lý của mọi kỹ thuật TCP scan.

### 4. Các Kỹ Thuật Port Scanning

| Kỹ thuật | Cơ chế | Ưu điểm | Nhược điểm / Phát hiện |
|----------|--------|---------|------------------------|
| **TCP Connect (`-sT`)** | Hoàn tất **3-way handshake đầy đủ** rồi mới đóng | Chính xác, không cần admin/root | Dễ bị log; để lại kết nối trong log server |
| **SYN / half-open (`-sS`)** | Mới gửi SYN, thấy `SYN+ACK` (mở) hoặc `RST` (đóng) rồi **cắt ngay** | Nhanh, "tàng hình" hơn, không hoàn tất handshake | Cần quyền root; nhiều IDS dò thấy |
| **FIN** | Gửi gói chỉ có FIN; RFC yêu cầu TCP trả RST cho port đóng | Khó phát hiện hơn | Firewall hiện đại trả RST cho cả mở+đóng → kết quả vô nghĩa |
| **XMAS** | Bật cùng lúc **FIN + PSH + URG** (cây thông Noel) | Như trên | Giống FIN, nhiều OS xử lý khác nhau |
| **Null** | Gửi gói **không bật flag nào** | Như trên | Như trên; Windows trả RST cho mọi gói lạ |
| **UDP** | Gửi gói UDP rỗng; port đóng trả **ICMP Port Unreachable** | Tìm service UDP (DNS 53, SNMP 161) | Chậm; UDP-stateless, kết quả không tin cậy |

> [!NOTE]
> System phản hồi theo **OS cụ thể**: kỹ thuật FIN/XMAS/Null chỉ "chuẩn" trên TCP/IP stack của Linux — Windows gửi RST cho mọi gói lạ nên mọi cổng đều thấy "mở". Vì vậy trong bài lab chúng ta chỉ dùng `-sT` (tin cậy) trên localhost.

### 5. Service & Version Detection, OS Fingerprinting

- **Service detection (`-sV`):** Sau khi tìm ra port mở, gửi tín hiệu đặc trưng để xác định *phần mềm + phiên bản* đang chạy (VD: `SSH-2.0-OpenSSH_9.6`). Kẻ tấn công dùng thông tin này để tra exploit cũ.
- **OS fingerprinting (`-O`):** Sử dụng **TCP/IP stack fingerprinting** — các hệ điều hành khác nhau trả lời TTL, window size, thứ tự TCP option trái lại khác nhau → đoán ra OS (active fingerprint — phát ra gói; passive — chỉ nghe trộm).
- **Banner grabbing:** Nối vào service và đọc **banner** nó tự in ra (cách thủ công). Bảo mật tốt nên **ẩn banner**, VD đổi `Server: nginx` thành `Server: custom`.

### 6. Evasion Techniques (Góc Nhìn Phòng Thủ — Lý Thuyết)

| Kỹ thuật | Cách hoạt động | Dấu hiệu để phòng thủ nhận ra |
|----------|----------------|-------------------------------|
| **Idle / Zombie scan `-sI`** | "Mượn" một host zombie (IP ID đang tăng) để quét hộ, gói SYN mang địa chỉ zombie | Trong IDS: IP ID của zombie tăng bất thường; không có handshake |
| **Decoy scan `-D`** | Gửi quét kèm **nhiều IP giả mạo** để làm nhiễu log | Một loạt kết nối "gần như đồng thời" từ nhiều IP lạ |
| **Fragment `-f`** | Cắt gói TCP thành mảnh nhỏ để lách bộ lọc | IDS phải reassemble mới đánh giá được → tải cao |
| **Source port `-g`** | Đặt cổng nguồn là 53/80 để qua filter dễ dãi | Log cổng nguồn 53/80 nghi ngờ |

> [!NOTE]
> CEH luôn giảng **ma quỷ thì cũng phải hiểu ma quỷ**. Nhưng khoá học này **CHỈ thực hành phòng thủ**: chúng ta *nhận diện* các kỹ thuật trên để cấu hình firewall/IDS cho đúng, **không** chạy chúng trên mạng ai.

### 7. Nmap Cơ Bản — Các Option Cần Cầm Tay

```bash
nmap -sS 127.0.0.1          # SYN scan (half-open) — cần root
nmap -sT 127.0.0.1          # TCP Connect scan (đầy đủ handshake)
nmap -sV 127.0.0.1          # Service & version detection
nmap -O 127.0.0.1           # OS fingerprinting
nmap -p 1-1000,3306,8080    # Quét đúng dải port ta chỉ định
nmap -Pn                    # Bỏ qua host discovery, quét thẳng (host thật không ping được vẫn quét)
nmap -sU 127.0.0.1          # UDP scan (chậm, xem phần 4)
nmap -A 127.0.0.1           # "Aggressive": -sV + -O + script + traceroute
```

**Đọc output Nmap:** 3 cột chính = `PORT` (port/protocol) · `STATE` (open = cổng mở, filtered = bị chặn, closed = đóng) · `SERVICE` (service mặc định). Khi kèm `-sV`, phiên bản xuất hiện thêm (VD: `ssh` → `OpenSSH 9.6`).

### 8. Countermeasures (Biện Pháp Phòng Thủ)

| Lớp phòng thủ | Hành động cụ thể |
|---------------|------------------|
| **Firewall** | Chặn ICMP từ ngoài; chỉ mở đúng port cần thiết; giới hạn nguồn truy cập (allowlist IP) |
| **IDS/IPS** | Cài Snort/Suricata; cảnh báo khi phát hiện hàng loạt SYN, decoy, scan pattern |
| **Tắt service không cần** | Nếu không dùng Telnet/SMB → tắt; ít port mở hơn = bề mặt tấn công nhỏ hơn |
| **Ẩn banner / bản vá** | Xoá banner phiên bản; cập nhật bản vá để scan version không có lợi |
| **Giới hạn port** | Thu hẹp `-p` có ích gì cho attacker thì firewall cũng thu hẹp cho mình: giảm port mở về tối thiểu |
| **Log & giám sát** | Theo dõi log firewall; phát hiện quét bằng cảnh báo tần suất kết nối |

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Tuần này học về **công cụ tấn công** (Nmap, port scanner). Bạn **CHỈ được quét `127.0.0.1` (localhost) hoặc máy ảo của chính mình**. Quét bất kỳ máy nào khác — kể cả máy bạn cùng lớp, mạng trường, mạng công ty — là **bất hợp pháp** (Luật An toàn thông tin mạng 2015, Việt Nam) và **FAIL toàn bộ khoá học**.
> 2. `nmap -sS`, DECOY, idle scan **yêu cầu quyền root** và là kỹ thuật tấn công. Trong khoá học này chúng ta chỉ **chạy `-sT`/`-sV` trên localhost** để phòng thủ, và đọc evasion ở mức **lý thuyết**.
> 3. Quét thật trên mạng công ty phải có **Authorization Letter** bằng văn bản — đừng thử ở công ty, kể cả "cho vui".

---

## Thực Hành Code / Hands-On (Defensive-first)

### Lab 1: Port Scanner Đa Luồng + Banner Grabbing (Python)

File: `CODE/week03_port_scanner_ceh.py` — quét **localhost**, quét đa luồng (threading), đọc banner khi port mở, xuất báo cáo **JSON**.

```bash
chmod +x CODE/week03_port_scanner_ceh.py
python3 CODE/week03_port_scanner_ceh.py            # quét dải default
python3 CODE/week03_port_scanner_ceh.py -p 22,80,8000,443 -t 8000
python3 CODE/week03_port_scanner_ceh.py -s 1 -e 2000
```

Kết quả xuất ra màn hình + file `port_scan_report.json`:

```json
{
  "host": "127.0.0.1",
  "banner_org": {
    "host": "127.0.0.1",
    "scanned_at": "...",
    "scan_type": "TCP Threaded + Banner Grab",
    "threads": 100,
    "ports_scanned": 1024,
    "open_ports": [22, 8000],
    "services": {
      "22": {"port": 22, "service": "ssh", "banner": "SSH-2.0-OpenSSH_9.6", "risk": "medium"},
      "8000": {"port": 8000, "service": "http-alt", "banner": null, "risk": "low"}
    }
  }
}
```

### Lab 2: Nmap Trên 127.0.0.1 (Cách Đọc Output Theo Từng Lệnh)

**Bước 0 — Khởi động service cục bộ để có "port mở" để quét:**

```bash
# Terminal 1: web server tĩnh trên cổng 8000
python3 -m http.server 8000 --bind 127.0.0.1

# Terminal 2: (tuỳ chọn) SSH daemon — macOS: System Settings > General > Sharing > Remote Login
# Linux: sudo systemctl enable --now ssh
```

**Bước 1 — TCP Connect scan:**
```bash
nmap -sT 127.0.0.1
```
- Hoàn tất **đủ 3 bước handshake** mới cắt kết nối → dễ bị log nhất.
- Output: mỗi dòng `22/tcp open ssh`, `8000/tcp open http-alt`. Không cần root.

**Bước 2 — Service/version detection:**
```bash
nmap -sV 127.0.0.1
```
- Nmap gửi tín hiệu đặc trưng tới từng port mở để đoán **phần mềm + phiên bản**.
- Output có thêm cột version: `SSH-2.0-OpenSSH_9.6 protocol 2.0`, `SimpleHTTP/0.6 Python/3.x`.
- **Rủi ro bảo mật:** version lộ ra = kẻ tấn công tra exploit. Đây là lý do nên ẩn banner.

**Bước 3 — SYN scan (chỉ để biết, cần root):**
```bash
sudo nmap -sS -sV 127.0.0.1
```
- Chỉ gửi SYN, thấy `SYN+ACK`/`RST` rồi chấm dứt ngay, **không hoàn tất handshake** → nhanh hơn.
- Kết hợp `-sS -sV` tốn công hơn một chút nhưng có được cả trạng thái + version.
- Kết quả nên **khớp** với `-sT` ở Bước 1 — nếu lệch, có firewall đang phản hồi nhiễu.

**Bước 4 — Quét theo ý muốn:**
```bash
nmap -Pn -p 8000,443,3306,1-1000 127.0.0.1
```
- `-Pn`: bỏ qua host discovery, quét thẳng (host không reply ping vẫn ra kết quả).
- `-p`: chỉ quét đúng dải cần — giúp nhanh hơn và tuân theo nguyên tắc "ít lộ diện hơn".

**Bước 5 — Đọc output như BLUE TEAM:**
- Dòng `open` + version ⇔ **cửa sổ bảo mật đang mở** → cần đóng/giới hạn.
- Dòng `filtered` ⇔ firewall chặn → quét không nhìn thấy hết bề mặt thật.
- Nếu `PORT STATE` toàn `open` mà bạn không hề chạy service nào → **nguy cơ cao, cần kiểm tra ngay** (có thể máy đã bị rootkit/bot).

### Lab 3: `defensive_port_audit.py` — Đánh Giá Rủi Ro & Khuyến Nghị Đóng Port

Phòng thủ: quét chính máy mình, **chấm mức rủi ro** từng port mở theo kinh nghiệm CEH, và **đề xuất hành động đóng**. File đầy đủ tại `CODE/week03_defensive_port_audit.py`:

```python
# def_port_audit.py — BLUE TEAM: quét localhost, chấm điểm rủi ro, khuyến nghị
import socket

TARGET = "127.0.0.1"

# Bảng rủi ro service chung (kinh nghiệm CEH Module 03 + OWASP)
PORT_RISK = {
    21:   ("ftp",        "HIGH",   "Telnet/FTP plaintext — dùng SFTP/FTPS"),
    22:   ("ssh",        "LOW",    "Cần thiết nếu dùng remote — khoá SSH key, chặn password login"),
    23:   ("telnet",     "CRITICAL","Plaintext — TẮT ngay, dùng SSH"),
    25:   ("smtp",       "MEDIUM",  "Nếu không trong vai mail server → tắt"),
    53:   ("domain",     "LOW",     "Chỉ cần khi bạn chạy DNS server"),
    80:   ("http",       "MEDIUM",  "Public web cần TLS — chuyển sang 443"),
    443:  ("https",     "LOW",     "Chuẩn, nếu là web server"),
    445:  ("microsoft-ds","HIGH",   "SMB — tắt nếu không chia sẻ file trong LAN"),
    135:  ("msrpc",      "MEDIUM",  "Windows RPC — tắt nếu không cần"),
    3389: ("ms-wbt-server","HIGH", "RDP — hạn chế IP truy cập + mật khẩu mạnh"),
    3306: ("mysql",      "MEDIUM",  "DB chỉ bind localhost, đừng bind 0.0.0.0"),
    5432: ("postgresql", "MEDIUM",  "DB chỉ bind localhost"),
    6379: ("redis",      "HIGH",    "Redis unauthenticated — tắt nếu ẩn nấp vô dụng"),
    8000: ("http-alt",   "LOW",     "Dev server — tắt khi không dev"),
}

def check_port(port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(0.3)
    try:
        return s.connect_ex((TARGET, port)) == 0
    finally:
        s.close()

open_ports = sorted(p for p in PORT_RISK if check_port(p))

print("[*] Host mục tiêu :", TARGET)
print("[*] Số port mở     :", len(open_ports))
print("-" * 64)
report_lines = []
for port in open_ports:
    name, risk, advice = PORT_RISK[port]
    report_lines.append({"port": port, "service": name, "risk": risk, "advice": advice})
    print(f"[{risk:>8}] :{port:>5}  {name:<15} -> {advice}")
print("-" * 64)

if report_lines:
    worst = max(report_lines, key=lambda r: {"LOW": 1, "MEDIUM": 2, "HIGH": 3, "CRITICAL": 4}[r["risk"]])
    print(f"[KẾT LUẬN] Rủi ro cao nhất: {worst['risk']} (port {worst['port']} - {worst['service']})")
    print('[KHUYẾN NGHỊ] Đóng ngay những port "HIGH/CRITICAL" bằng firewall:')
    for r in report_lines:
        if r["risk"] in ("HIGH", "CRITICAL"):
            print(f'    sudo ufw deny {r["port"]}/tcp   # {r["service"]}')
else:
    print("[KẾT LUẬN] Không có cổng nào khảo sát mở. Bề mặt tấn công đang gọn.")

# Ghi report CSV để kiểm chứng checklist
with open("port_audit_report.csv", "w", encoding="utf-8") as f:
    f.write("port,service,risk,advice\n")
    for r in report_lines:
        f.write(f'{r["port"]},{r["service"]},{r["risk"]},"{r["advice"]}"\n')
print("[+] Đã xuất: port_audit_report.csv")
```

**Chạy:**
```bash
python3 CODE/week03_defensive_port_audit.py
```

---

## Bài Tập Về Nhà / Homework

1. **Nmap localhost:** khởi động `python3 -m http.server 8000` rồi chạy dãy lệnh `nmap -sT 127.0.0.1`, `nmap -sV 127.0.0.1`, `nmap -sS -sV -Pn -p 1-1024 127.0.0.1`. Chụp ảnh màn hình **output của cả 3 lệnh** gộp vào 1 file PDF; chú thích ngắn ý nghĩa của `open`, `filtered`, `SERVICE`, và cột version.
2. **Code:** chạy `week03_port_scanner_ceh.py` trên localhost với dải `-p 20-500`, sao chép nội dung file `port_scan_report.json` vào bài nộp — gồm các port mở, banner đọc được (nếu có) và mức rủi ro bạn tự gán cho từng port.
3. **Tóm tắt countermeasures:** viết **10 dòng** lý do vì sao tắt Telnet + SMB + đổi banner server lại làm tăng chi phí cho kẻ tấn công (liên hệ các kỹ thuật `-sV`, banner grabbing đã học).

---

## Rubric Đánh Giá Tuần 3

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Nmap on localhost** | Chạy đúng 3 lệnh, đọc đúng ý nghĩa `open`/`filtered`/version (40đ) | Chạy 2 lệnh, giải thích còn lẫn (25đ) | Không chạy được / vô ý quét IP khác (10đ) |
| **Port scanner code** | Đa luồng, có banner grab, JSON đầy đủ, không lệch thực tế (30đ) | Chạy được nhưng thiếu banner hoặc report sơ sài (20đ) | Không chạy được / mở quét IP ngoài localhost (5đ) |
| **Tóm tắt phòng thủ** | Nêu đúng 3 countermeasures + giải thích được cơ chế `-sV`/banner (30đ) | Nêu đúng nhưng thiếu giải thích cơ chế (20đ) | Nêu lại mà không hiểu tại sao (5đ) |

---

## Checklist Đầu Ra Tuần 3

- [ ] Vẽ được **TCP 3-way handshake** và giải thích SYN, ACK, FIN, RST
- [ ] Phân biệt được `-sT` (full connect) và `-sS` (half-open)
- [ ] Chạy thành công `nmap -sT/-sV/-sS` chỉ trên `127.0.0.1`
- [ ] Chạy `week03_port_scanner_ceh.py` xuất được báo cáo JSON có banner
- [ ] Nêu được ít nhất **3 countermeasures** cho scanning (firewall, IDS, đóng service, ẩn banner)
- [ ] Nhận diện được decoy/idle scan khi đọc log hoặc output IDS