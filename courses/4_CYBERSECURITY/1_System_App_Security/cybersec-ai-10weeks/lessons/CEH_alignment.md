# Lộ Trình CEH — Khung Kiến Thức Xuyên Suốt Khoá Học / CEH Alignment Master Map

Tài liệu này là "bản đồ lớn" gắn toàn bộ 10 tuần của khoá học vào khung kiến thức chuẩn của **CEH — Certified Ethical Hacker (EC-Council)**. Mỗi tuần đều có một mục **"🎓 Góc Nhìn CEH"** ở cuối bài, và tài liệu này cho bạn thấy các mảnh ghép đó hợp thành bức tranh thế nào.

> [!NOTE]
> Khoá học này **không phải** một khoá luyện thi CEH. Nó dạy bạn tự tay lập trình công cụ (Python, C++) và tích hợp AI — sâu về kỹ thuật hơn CEH ở phần code. Chúng ta mượn **khung tư duy có hệ thống của CEH** để sắp xếp kiến thức, chuẩn hoá thuật ngữ, và giúp bạn dễ dàng học tiếp lấy chứng chỉ sau này.

---

## 1. Nền Tảng: Ba Khung Tư Duy CEH Bạn Phải Thuộc

Mọi thứ trong an ninh mạng tấn công đều xoay quanh ba khung này. Học thuộc chúng trước khi đi vào từng tuần.

### 1.1. Tam Giác Bảo Mật CIA (CIA Triad)

Mục tiêu của phòng thủ — và cũng là thứ kẻ tấn công muốn phá:

| Yếu tố | Tiếng Anh | Nghĩa | Bị phá khi... |
| :--- | :--- | :--- | :--- |
| Bí mật | **Confidentiality** | Chỉ người được phép mới đọc được | Lộ mật khẩu, nghe lén gói tin (Tuần 6) |
| Toàn vẹn | **Integrity** | Dữ liệu không bị sửa trái phép | Sửa gói tin, giả mạo (ARP spoofing) |
| Sẵn sàng | **Availability** | Hệ thống luôn phục vụ được | Tấn công từ chối dịch vụ (DoS) |

> Người ta hay thêm **AAA** (Authentication - xác thực, Authorization - phân quyền, Accounting - ghi vết) và **Non-repudiation** (chống chối bỏ).

### 1.2. Năm Giai Đoạn Tấn Công (5 Phases of Hacking)

Đây là "sợi chỉ đỏ" xuyên suốt khoá học. Mỗi tuần rơi vào một hoặc vài giai đoạn:

```text
  1. Reconnaissance      →  2. Scanning        →  3. Gaining Access
     (Trinh sát)             (Quét)                (Chiếm quyền)
     Thu thập thông tin      Tìm cổng, dịch vụ,     Khai thác lỗ hổng
     thụ động & chủ động     lỗ hổng               để vào hệ thống
                                                          │
  5. Clearing Tracks     ←  4. Maintaining Access  ◄──────┘
     (Xoá dấu vết)           (Duy trì truy cập)
     Xoá log, ẩn mình        Backdoor, rootkit
```

| Giai đoạn | Trong khoá học | Công cụ điển hình |
| :--- | :--- | :--- |
| 1. Reconnaissance | Tuần 8 (OSINT + AI) | WHOIS, Shodan, Google Dorking |
| 2. Scanning | **Tuần 1, 2, 5** | Port scanner tự viết, Nmap |
| 3. Gaining Access | Tuần 3, 4, 7 | Buffer overflow, Hashcat, Aircrack-ng |
| 4. Maintaining Access | (giới thiệu) | Backdoor, C2 (nhận diện ở Tuần 6) |
| 5. Clearing Tracks | Tuần 6, 9, 10 (góc Blue Team) | Phân tích log để CHỐNG xoá dấu vết |

### 1.3. Bốn Loại Đánh Giá & Các Loại Hacker

**Phân loại hacker theo mũ (hat):**

| Loại | Mô tả | Hợp pháp? |
| :--- | :--- | :--- |
| White Hat (mũ trắng) | Chuyên gia bảo mật, có phép | ✅ Đây là bạn |
| Black Hat (mũ đen) | Tội phạm mạng | ❌ |
| Grey Hat (mũ xám) | Lằn ranh, xâm nhập không phép nhưng không phá hoại | ⚠️ Vẫn phạm luật |
| Script Kiddie | Dùng công cụ có sẵn, không hiểu bản chất | — |
| Hacktivist / State-sponsored | Vì mục đích chính trị / do nhà nước | ❌ |

**Ba kiểu hộp trong kiểm thử xâm nhập (Pentest boxes):**

| Kiểu | Kẻ tấn công biết gì | Mô phỏng |
| :--- | :--- | :--- |
| Black Box | Không biết gì | Hacker ngoài Internet |
| Grey Box | Biết một phần (vd tài khoản thường) | Nhân viên nội bộ / khách hàng |
| White Box | Biết hết (source code, sơ đồ mạng) | Đội kiểm toán nội bộ |

---

## 2. Bản Đồ 10 Tuần ↔ 20 Module CEH

CEH có 20 module. Bảng dưới cho biết mỗi tuần dạy phần nào, và những module nào khoá học chưa chạm tới (để bạn tự học bổ sung).

| Tuần | Chủ đề khoá học | Module CEH chính | Giai đoạn |
| :--- | :--- | :--- | :--- |
| **1** | Python & Socket | M03 Scanning Networks (nền tảng) | Scanning |
| **2** | Port Scanning | M03 Scanning Networks, M04 Enumeration | Scanning |
| **3** | C++ con trỏ & bộ nhớ | M06 System Hacking (nền tảng khai thác) | Gaining Access |
| **4** | C++ đa luồng & Buffer Overflow | M06 System Hacking, M20 Cryptography (an toàn bộ nhớ) | Gaining Access |
| **5** | Kali Linux & Nmap | M03 Scanning, M04 Enumeration, M05 Vuln Analysis | Scanning |
| **6** | Wireshark | M08 Sniffing | Scanning / Sniffing |
| **7** | Hashing & Wi-Fi | M06 System Hacking, M16 Hacking Wireless Networks | Gaining Access |
| **8** | AI + OSINT | M02 Footprinting and Reconnaissance | Reconnaissance |
| **9** | AI Code Audit & Log | M05 Vulnerability Analysis (Blue Team) | Phòng thủ |
| **10** | AI SOC/SOAR | M12 Evading IDS/Firewalls (góc phòng thủ) | Phòng thủ |

### Các Module CEH chưa có trong khoá (gợi ý tự học)

| Module CEH | Vì sao đáng học thêm |
| :--- | :--- |
| M01 Introduction to Ethical Hacking | Nền tảng lý thuyết — **đã bổ sung** ở đầu Tuần 1 |
| M07 Malware Threats | Trojan, virus, ransomware, worm |
| M09 Social Engineering | Phishing — nguyên nhân #1 của các vụ xâm nhập thực tế |
| M10 Denial-of-Service | DoS/DDoS, botnet |
| M11 Session Hijacking | Chiếm phiên đăng nhập |
| M13/14/15 Web Server / Web App / SQL Injection | Cực kỳ quan trọng cho pentest web |
| M17 Mobile · M18 IoT/OT · M19 Cloud | Bề mặt tấn công hiện đại |

> **Đề xuất mở rộng khoá:** có thể thêm một "Học kỳ 2" gồm Web/SQLi (3 tuần), Social Engineering (1 tuần), Malware analysis (2 tuần) để phủ trọn CEH.

---

## 3. Bản Đồ Theo 5 Giai Đoạn (Cách Nhìn Của Kẻ Tấn Công)

Nếu sắp xếp lại 10 tuần theo dòng chảy một cuộc tấn công thực sự, bạn sẽ thấy khoá học phủ mạnh phần đầu (Recon → Scanning → Gaining Access) và phần phòng thủ:

```text
RECONNAISSANCE ──────► Tuần 8 (OSINT bằng AI: WHOIS, Shodan)
       │
SCANNING ────────────► Tuần 1, 2 (tự viết scanner)
       │                Tuần 5 (Nmap chuyên nghiệp)
       │                Tuần 6 (Sniffing/Wireshark)
       │
GAINING ACCESS ──────► Tuần 3, 4 (Buffer Overflow)
       │                Tuần 7 (crack hash, bẻ Wi-Fi)
       │
MAINTAINING ACCESS ──► (giới thiệu khái niệm, chưa thực hành sâu)
       │
CLEARING TRACKS ─────► học ở góc NGƯỢC LẠI:
                        Tuần 6, 9, 10 — Blue Team phát hiện & chống xoá dấu vết
```

Điểm mạnh sư phạm của khoá: bạn học **cả hai phía** — tấn công (Red Team) để hiểu kẻ địch, và phòng thủ (Blue Team) bằng AI để bảo vệ. CEH gọi tư duy này là **"Think like a hacker to defend like a pro"**.

---

## 4. Từ Điển Thuật Ngữ CEH Cốt Lõi (Master Glossary)

Học thuộc bảng này — thuật ngữ tiếng Anh xuất hiện nguyên văn trong đề thi CEH và tài liệu quốc tế.

| Tiếng Việt | English | Nghĩa ngắn |
| :--- | :--- | :--- |
| Bề mặt tấn công | Attack Surface | Tổng các điểm kẻ tấn công có thể nhắm vào |
| Vector tấn công | Attack Vector | Con đường cụ thể để xâm nhập |
| Lỗ hổng | Vulnerability | Điểm yếu có thể bị khai thác |
| Mã khai thác | Exploit | Code/kỹ thuật lợi dụng lỗ hổng |
| Tải trọng | Payload | Phần mã thực thi mục tiêu sau khi khai thác |
| Điểm phơi nhiễm | Exposure | Tình trạng lỗ hổng bị lộ ra ngoài |
| Mối đe doạ | Threat | Tác nhân/sự kiện có thể gây hại |
| Rủi ro | Risk | Threat × Vulnerability × Impact |
| Trinh sát thụ động | Passive Recon | Thu thập thông tin không chạm mục tiêu |
| Trinh sát chủ động | Active Recon | Có tương tác trực tiếp (quét, gọi) |
| Liệt kê | Enumeration | Moi thông tin chi tiết (user, share, service) |
| Leo thang đặc quyền | Privilege Escalation | Từ quyền thường lên quyền admin/root |
| Cửa hậu | Backdoor | Lối vào bí mật để quay lại |
| Xoay trục | Pivoting | Dùng máy đã chiếm để tấn công máy khác |
| Zero-day | Zero-day | Lỗ hổng chưa có bản vá |
| Bằng chứng khái niệm | PoC (Proof of Concept) | Mã chứng minh lỗ hổng có thật |
| Phòng thủ nhiều lớp | Defense in Depth | Nhiều lớp bảo vệ chồng lên nhau |
| Nguyên tắc đặc quyền tối thiểu | Least Privilege | Chỉ cấp quyền vừa đủ để làm việc |

---

## 5. Khung Pháp Lý & Đạo Đức (Bắt Buộc Đọc)

CEH nhấn mạnh: **kỹ năng không đi kèm giấy phép = phạm tội**. Toàn khoá học tuân thủ nguyên tắc:

1. **Chỉ thực hành trên tài sản của chính mình** — `127.0.0.1`, máy ảo, hoặc mạng LAN riêng đã được cho phép.
2. **Scope & Authorization** — trong nghề, mọi cuộc pentest phải có văn bản cho phép (Rules of Engagement) ghi rõ được đánh cái gì, tới đâu.
3. **Không gây hại (Do No Harm)** — không làm sập dịch vụ, không xoá/sửa dữ liệu thật.
4. **Bảo mật kết quả** — thông tin lỗ hổng tìm được là bí mật, chỉ báo cho chủ hệ thống.

> Ở Việt Nam: hành vi truy cập trái phép chịu điều chỉnh của **Luật An ninh mạng 2018** và **Bộ luật Hình sự** (Điều 289 về xâm nhập trái phép mạng máy tính). Đọc thêm ở [`references/safety.md`](references/safety.md).

---

## 6. Cách Dùng Tài Liệu Này

- **Trước mỗi tuần:** xem tuần đó nằm ở giai đoạn nào (mục 1.2, 2).
- **Trong mỗi tuần:** đọc mục "🎓 Góc Nhìn CEH" ở cuối bài giảng để nối kiến thức với khung lớn.
- **Ôn tập:** dùng từ điển (mục 4) và các câu hỏi ôn thi kiểu CEH trong từng tuần.
- **Học tiếp:** dùng mục 2 (module còn thiếu) làm lộ trình tự học lên chứng chỉ.
