# Tuần 8: Sniffing (CEH v13 Module 08)

> Module CEH v13 tương ứng: **08 — Sniffing**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 08** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Phân biệt **passive sniffing** (trên hub/không cần chèn) vs **active sniffing** (trên switch cần kỹ thuật chèn), và hiểu khái niệm **promiscuous mode**.
2. Hiểu các kỹ thuật tấn công sniffing trên LAN: **MAC flooding**, **DHCP starvation**, **ARP poisoning**, **DNS poisoning** — LÝ THUYẾT, để phòng thủ.
3. Nắm rõ giao thức dễ bị sniff: **HTTP, Telnet, FTP, POP3, IMAP** (plaintext) vs **HTTPS, SSH, SFTP** (mã hoá).
4. Biết các công cụ sniffing (Wireshark, tcpdump, Ettercap, Bettercap, Scapy, MACOF, Cain & Abel) — từ góc nhìn phòng thủ.
5. Xây dựng **countermeasures**: ARP spoofing detection, DHCP snooping, port security, mã hoá toàn trình, segment mạng, và phát hiện máy đang ở promiscuous mode.

---

## Lý Thuyết / Theory

### 1. Sniffing Là Gì?

| Khái niệm | Giải thích |
|-----------|------------|
| **Sniffing** | Bắt giữ & phân tích lưu lượng mạng đi qua card mạng của kẻ tấn công |
| **Passive sniffing** | Chỉ quan sát lưu lượng đến máy mình (hub, hoặc làm cổng để lưu lượng chảy qua) — khó phát hiện |
| **Active sniffing** | Chèn kỹ thuật để **chuyển hướng lưu lượng** đến máy mình (switch LAN) — dễ phát hiện hơn |
| **Promiscuous mode** | Card mạng nhận **MỌI** frame, không chỉ frame có MAC của mình — nền tảng của sniffing |

> **Liên hệ Tuần 8 trong 5 pha tấn công:** sniffing nằm trong pha *Scanning/Gaining Access* và phá hoại **Confidentiality** của CIA Triad (Tuần 1).

### 2. Các Kỹ Thuật Sniffing Trên Switch (LÝ THUYẾT để phòng thủ)

| Kỹ thuật | Cơ chế | Tác động | Phòng thủ |
|----------|--------|----------|-----------|
| **MAC flooding** | Tràn bảng CAM của switch bằng MAC giả → switch chuyển sang *fail-open* (hoạt động như hub) | Toàn bộ frame broadcast cho mọi cổng | **Port security** giới hạn số MAC/cổng |
| **DHCP starvation** | Gửi hàng loạt DHCP DISCOVER với MAC giả → cạn IP trong pool → máy nạn nhân không xin được IP | Không có IP → tấn công người dùng, hoặc ép cấu hình rogue DHCP | **DHCP snooping** trên switch |
| **ARP poisoning** | Gửi ARP Reply giả: "IP của nạn nhân = MAC của attacker" → cập nhật ARP cache | Kẻ tấn công **MITM**: xem/sửa lưu lượng giữa 2 máy | **Dynamic ARP Inspection (DAI)**, theo dõi ARP (Lab 1) |
| **DNS poisoning** | Làm sai lệch DNS cache / trả lời DNS giả | Chuyển nạn nhân tới server giả (phishing) | DNSSEC, kiểm tra DNS (so sánh 8.8.8.8) |

> [!WARNING]
> **ARP poisoning, MAC flooding, DHCP starvation là tấn công thật** — chỉ học **LÝ THUYẾT** để hiểu cơ chế phòng thủ. Lab tuần này là công cụ **phát hiện**, không phải thực hiện tấn công.

### 3. Giao Thức Dễ Bị Sniff vs An Toàn

| Giao thức | Trạng thái | Thông tin lộ ra |
|-----------|-----------|-----------------|
| HTTP, FTP, Telnet, POP3, IMAP, SMTP (plaintext) | **DỄ BỊ SNIFF** | mật khẩu, cookie, nội dung |
| HTTPS, SSH, SFTP, SMTPS, IMAPS | **Mã hoá** | nội dung khó đọc (nhưng vẫn lộ metadata) |

**Nguyên tắc phòng thủ:** mọi thứ nhạy cảm phải đi qua **mã hoá toàn trình** (end-to-end). Dù sniff thấy được, kẻ tấn công chỉ nhận được ciphertext.

### 4. Công Cụ Sniffing (Phòng thủ — dùng để giám sát & phân tích)

| Công cụ | Vai trò phòng thủ |
|---------|-------------------|
| **Wireshark / tcpdump** | Phân tích pcap, điều tra sự cố, kiểm tra lưu lượng bất thường |
| **Ettercap / Bettercap** | (Kali) — dùng trong lab để HIỂU; phòng thủ dùng để test phát hiện ARP |
| **Scapy** | Tạo/đọc gói tin phục vụ test (đọc tài liệu) |
| **MACOF / Yersinia** | Chỉ lab; mục tiêu hiểu MAC flooding / DHCP starvation |

### 5. Phát Hiện & Phòng Thủ Tổng Hợp

- **Phát hiện ARP poisoning:** so sánh ARP cache với bảng MAC/IP thật (Lab 1); theo dõi các entry **một IP nhiều MAC** hoặc **một MAC nhiều IP**.
- **Switch hardening:** Port security, DHCP snooping, Dynamic ARP Inspection, BPDU guard.
- **Phát hiện promiscuous mode:** dùng `ip link` / `ifconfig` kiểm tra flag `PROMISC`, hoặc tool phát hiện gói không gửi đến MAC mình.
- **Network design:** segmentation (VLAN), không để máy nạn nhân & máy nhạy cảm chung L2 domain với người ngoài.
- **Mã hoá toàn trình + HSTS** cho web (liên hệ Tuần 14).

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này **CHỈ là công cụ PHÁT HIỆN** chạy trên chính máy bạn (đọc `arp -a` / `netstat`) — **KHÔNG** thực hiện ARP poisoning, MAC flooding, DHCP starvation.
> 2. Bắt giữ lưu lượng mạng của người khác trên mạng không thuộc quyền kiểm soát của bạn là **bất hợp pháp** (Luật An ninh mạng 2018 VN).
> 3. Nếu muốn thử công cụ tấn công (Ettercap...), hãy dùng **GNS3/EVE-NG** hoặc 3 VM ảo riêng trong lab của bạn — tuyệt đối không chạy trên Wi-Fi công cộng.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week08_arp_monitor.py`. Tool đọc bảng ARP của chính máy bạn — không cần quyền root, không gửi gói tin.

### Lab 1: ARP Monitor — Phát hiện ARP poisoning (Python)

Công cụ phòng thủ: đọc bảng ARP (`arp -a` trên macOS/Linux), phân tích các entry **một IP ↔ nhiều MAC** hoặc **một MAC ↔ nhiều IP** — dấu hiệu điển hình của **ARP poisoning**. Chạy định kỳ so sánh với baseline.

```bash
python3 CODE/week08_arp_monitor.py --check
python3 CODE/week08_arp_monitor.py --scan 3   # quét 3 lần, mỗi lần cách 2s
```

Kết quả mẫu:

```
[BASELINE] Ghi lại 5 entry ARP hiện tại (lần đầu).
[SCAN #2]  Phát hiện thay đổi: 192.168.1.10 đang trỏ tới 2 MAC khác nhau!
[!] NGHI NGỜ ARP POISONING — xác minh bằng 'ip neigh' trên router thật.
```

> **Cách đọc kết quả:** mạng gia đình bình thường mỗi IP = 1 MAC. Nếu 1 IP có 2 MAC (kẻ tấn công + nạn nhân) hoặc 1 MAC xuất hiện ở nhiều IP (quét/giả mạo) → nghi vấn.

### Lab 2: Kiểm tra trạng thái PROMISC của card mạng (phòng thủ)

```bash
# macOS
ifconfig en0 | grep -i promisc   # nếu có dòng "promisc" -> card đang bắt tất cả
# Linux
ip link show | grep -i promisc
# Xem đang LISTEN trên cổng nào (dịch vụ có thể bị sniff)
lsof -i -P | grep LISTEN
```

### Lab 3: Phân tích pcap bằng tcpdump/Wireshark (giám sát)

```bash
# Ghi lại 30 giây lưu lượng trên chính máy (không ai khác)
sudo tcpdump -i en0 -w /tmp/capture.pcap -c 100

# Đọc & lọc — tìm nghi vấn, KHÔNG đọc nội dung người khác
tcpdump -r /tmp/capture.pcap -nn | grep -iE "ARP|HTTP|Telnet"
```

---

## Bài Tập Về Nhà / Homework

1. **Chạy ARP Monitor:** chạy `week08_arp_monitor.py` 3 lần trên máy bạn, ghi nhận baseline, chụp màn hình. Giải thích: vì sao thấy "1 IP nhiều MAC" là dấu hiệu nguy hiểm?
2. **Phân loại giao thức:** liệt kê 5 giao thức plaintext dễ bị sniff và 5 giao thức mã hoá an toàn; nêu đúng port mặc định của mỗi loại.
3. **Thiết kế phòng thủ:** vẽ (bằng text/ảnh) một sơ đồ mạng nhỏ có switch, nêu **3 biện pháp hardening** trên switch (port security, DHCP snooping, DAI) và giải thích tác dụng từng cái với MAC flooding / DHCP starvation / ARP poisoning.

---

## Rubric Đánh Giá Tuần 8

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Lab ARP Monitor** | Chạy đúng, hiểu dấu hiệu poisoning, chụp ảnh rõ (40đ) | Chạy được nhưng thiếu giải thích (25đ) | Không chạy được (10đ) |
| **Phân loại giao thức** | Đủ 10 giao thức + port đúng (30đ) | Đủ nhưng sai 1-2 port (20đ) | Thiếu nhiều / sai port (5đ) |
| **Sơ đồ hardening** | Đủ 3 biện pháp, giải thích đúng cơ chế (30đ) | Đủ 3 nhưng giải thích mơ hồ (20đ) | Thiếu biện pháp (5đ) |

---

## Checklist Đầu Ra Tuần 8

- [ ] Phân biệt passive vs active sniffing; hiểu promiscuous mode
- [ ] Giải thích được MAC flooding, DHCP starvation, ARP poisoning, DNS poisoning — LÝ THUYẾT
- [ ] Liệt kê giao thức plaintext vs mã hoá kèm port
- [ ] Biết công cụ sniffing phục vụ phòng thủ (Wireshark, tcpdump)
- [ ] Chạy thành công `week08_arp_monitor.py` trên máy của mình
- [ ] Nêu được 3 hardening switch (port security, DHCP snooping, DAI)
