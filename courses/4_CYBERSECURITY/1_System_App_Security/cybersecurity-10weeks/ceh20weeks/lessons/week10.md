# Tuần 10: Denial-of-Service (CEH v13 Module 10)

> Module CEH v13 tương ứng: **10 — Denial-of-Service**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 10** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Phân biệt **DoS** vs **DDoS** và các dạng tấn công khác nhau theo tầng (network/transport/application).
2. Hiểu cơ chế **SYN flood**, **UDP flood**, **ICMP flood**, **Slowloris** (application), **amplification/reflection** (DNS, NTP, amplification factor), và vai trò của **botnet**.
3. Nắm các tham số đánh giá DDoS: **BPS** (bit/s), **RPS** (request/s), **PPS** (packet/s).
4. Biết các công cụ DDoS (Hping3, LOIC/HOIC, Slowloris, GoldenEye, Metasploit aux) — LÝ THUYẾT phòng thủ.
5. Xây dựng **countermeasures**: rate limiting, connection limits, load balancer/CDN, egress filtering (BCP38), SYN cookies, giám sát lưu lượng (Lab 1).

---

## Lý Thuyết / Theory

### 1. DoS vs DDoS

| Tiêu chí | DoS | DDoS |
|----------|-----|------|
| Nguồn tấn công | 1 máy | Nhiều máy (botnet, thường hàng nghìn → hàng triệu) |
| Mục tiêu | Làm cạn tài nguyên 1 máy chủ | Vượt khả năng hấp thụ của cả hạ tầng |
| Phát hiện / chặn | Dễ (1 IP) | Khó (nhiều IP phân tán, khó phân biệt người dùng thật) |
| Ví dụ | Ping of Death, SYN flood 1 nguồn | Mirai botnet tấn công Dyn DNS 2016 |

### 2. Phân Loại Tấn Công DoS/DDoS

| Loại | Cơ chế | Cách chống |
|------|--------|-----------|
| **SYN flood** | Gửi hàng loạt SYN, không trả lời SYN-ACK → cạn **backlog queue** | **SYN cookies**, giới hạn tỷ lệ SYN |
| **UDP flood** | Gửi nhiều gói UDP tới cổng ngẫu nhiên → server trả ICMP Port Unreachable, tốn CPU | Rate limit UDP, firewall |
| **ICMP flood** | Ping (ICMP Echo) số lượng lớn | Giới hạn ICMP rate, tắt reply ngoài |
| **Slowloris** | Mở nhiều kết nối HTTP, gửi từng phần header chậm → giữ chân worker | Reverse proxy, timeout ngắn, giới hạn connection/IP |
| **Amplification** | Gửi request nhỏ với **địa chỉ nguồn giả** (spoof) tới server phản hồi lớn (DNS, NTP) → địa chỉ nạn nhân nhận lũ | **BCP38 egress filtering** chặn IP giả, đóng DNS recursion mở |
| **Botnet DDoS** | Điều khiển hàng nghìn máy nhiễm để tấn công đồng loạt | CDN/Anycast, giám sát an ninh loại bỏ bot |

**Amplification factor (hệ số khuếch đại):** NTP monlist ≈ x500, DNS ANY ≈ x70, memcached ≈ x10.000. Kẻ tấn công gửi **vài byte** nhưng nạn nhân nhận **hàng MB**.

### 3. Các Tham Số Đánh Giá

| Tham số | Ý nghĩa |
|---------|---------|
| **BPS** (Bit Per Second) | Băng thông tấn công |
| **PPS** (Packet Per Second) | Tốc độ gói tin (quan trọng khi chặn per-packet) |
| **RPS** (Request Per Second) | Tốc độ request tầng application (Slowloris, HTTP flood) |

> **Lưu ý CEH:** đừng chỉ nhìn BPS. Tấn công **low-rate** (vài PPS nhưng request chậm) vẫn làm sập ứng dụng — đây là lý do cần giám sát đa chiều.

### 4. Công Cụ DDoS (LÝ THUYẾT để hiểu phòng thủ)

| Công cụ | Đặc điểm |
|---------|----------|
| **Hping3** | CLI linh hoạt, SYN flood, spoofing |
| **LOIC / HOIC** | Dễ dùng, tấn công băng thông (Windows) |
| **Slowloris / GoldenEye** | Tấn công tầng ứng dụng, giữ kết nối |
| **Metasploit (aux)** | `auxiliary/dos/tcp/synflood` — chỉ lab |
| **Raven-Storm, Xerxes** | Các công cụ Kali khác |

> [!WARNING]
> Những công cụ này **chỉ dùng trong lab** để hiểu. Dùng để tấn công hệ thống người khác là **bất hợp pháp**.

### 5. Phòng Thủ Tổng Hợp

- **Mạng:** CDN/Anycast (hấp thụ lưu lượng), load balancer, rate limiting theo IP, giới hạn connection.
- **Kernel/OS:** SYN cookies (Linux mặc định), tăng backlog, tune TCP timers.
- **Nguồn:** **egress filtering (BCP38)** — chặn gói có source IP giả từ mạng nội bộ (giết chết amplification/spoofing).
- **Ứng dụng:** bật reverse proxy (nginx) chống Slowloris, giới hạn body/header size, WAF.
- **Giám sát:** theo dõi BPS/PPS/RPS bất thường (Lab 1), alerting, runbook giảm tải.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. **TUYỆT ĐỐI không** thực hiện DoS/DDoS — kể cả "thử nhẹ", "test", hay nhắm vào hệ thống của chính mình trên Internet. Tấn công DDoS vi phạm Luật An ninh mạng 2018 VN và gây thiệt hại cho người khác.
> 2. Lab tuần này là **phòng thủ**: tool giám sát tốc độ kết nối trên chính máy bạn, **không gửi gói tin** tới ai.
> 3. Không dùng công cụ DDoS (Hping3, LOIC, Slowloris) dù chỉ để "thử" ngoài phòng lab cô lập cục bộ (GNS3/EVE-NG).
> 4. Vi phạm = **FAIL toàn bộ khoá học** và có thể bị truy cứu hình sự.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week10_dos_defense_monitor.py`. Tool đọc bảng kết nối (`netstat`/`lsof`) của chính máy, đếm số kết nối theo IP — **không gửi gói tin**.

### Lab 1: Connection Rate Monitor — Phát hiện dấu hiệu DoS (Python)

Công cụ phòng thủ: đọc `netstat -an` (hoặc `lsof -i`) trên máy bạn, đếm số **kết nối TCP theo địa chỉ nguồn** và số kết nối **ở trạng thái SYN_RECV** (backlog) — nếu một IP giữ quá nhiều kết nối hoặc SYN_RECV tăng vọt, đó là dấu hiệu **SYN flood / connection exhaustion**.

```bash
python3 CODE/week10_dos_defense_monitor.py --check
python3 CODE/week10_dos_defense_monitor.py --watch 5   # theo dõi 5 vòng, cách 2s
```

Kết quả mẫu:

```
[NETSTAT] Doc 142 kết nối TCP trên máy bạn
[SYN_RECV] 3 kết nối (bình thường < 50)
[TOP IP NGUỒN] 127.0.0.1: 12 kết nối | 192.168.1.5: 8 | ...
[KẾT LUẬN] Chưa có dấu hiệu DoS rõ ràng. Giám sát tiếp.
```

> **Cách đọc:** số SYN_RECV cao kéo dài = backlog đầy (SYN flood). Một IP mở hàng trăm kết nối đồng thời = nghi vấn. Trên server thật hãy dùng `ss -s` và rate-limit theo IP.

### Lab 2: Hướng dẫn bật SYN cookies (phòng thủ hệ điều hành)

```bash
# Linux — SYN cookies thường bật mặc định; kiểm tra & bật:
sysctl net.ipv4.tcp_syncookies
sudo sysctl -w net.ipv4.tcp_syncookies=1

# Kiểm tra backlog hiện tại
sysctl net.ipv4.tcp_max_syn_backlog
sudo sysctl -w net.ipv4.tcp_max_syn_backlog=1024
```

### Lab 3: Rate limiting bằng nginx (chống Slowloris & HTTP flood)

```nginx
http {
    limit_conn_zone $binary_remote_addr zone=perip:10m;
    server {
        limit_conn perip 20;            # tối đa 20 kết nối / IP
        limit_req zone=req zone=perip:10m rate=10r/s;  # 10 request/giây
        client_body_timeout 5s;
        client_header_timeout 5s;       # chống Slowloris giữ header
        keepalive_timeout 15s;
    }
}
```

---

## Bài Tập Về Nhà / Homework

1. **Chạy monitor:** chạy `week10_dos_defense_monitor.py --watch 5` trên máy bạn, ghi nhận SYN_RECV và top IP, chụp màn hình, kết luận.
2. **Tính amplification:** giải thích bằng số: NTP monlist amplification factor ≈ x500 — nếu attacker gửi 1 KB request với source spoof, nạn nhân nhận bao nhiêu? Vì sao BCP38 chặn được?
3. **Viết runbook:** soạn runbook 1 trang "Khi bị DDoS" cho admin: các bước (xác nhận, chặn IP, kích hoạt CDN scrub, thông báo, điều tra), mỗi bước 1-2 dòng.
4. **Phân tích vụ Mirai:** tóm tắt botnet Mirai (2016) — lây qua thiết bị IoT như thế nào, tấn công Dyn ra sao, bài học phòng thủ.

---

## Rubric Đánh Giá Tuần 10

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Lab monitor** | Chạy đúng, phân tích SYN_RECV + top IP, chụp ảnh (40đ) | Chạy được nhưng thiếu phân tích (25đ) | Không chạy được (10đ) |
| **Tính amplification** | Tính đúng + giải thích đúng BCP38 (30đ) | Tính đúng nhưng sai BCP38 (20đ) | Sai cả hai (5đ) |
| **Runbook + Mirai** | Đủ các bước, đúng kỹ thuật (30đ) | Thiếu bước / sơ sài (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 10

- [ ] Phân biệt DoS vs DDoS; hiểu BPS/PPS/RPS
- [ ] Giải thích được SYN flood, UDP flood, ICMP flood, Slowloris, amplification
- [ ] Nêu amplification factor của NTP/DNS và cách BCP38 chặn spoofing
- [ ] Biết công cụ DDoS chỉ dùng trong lab (Hping3, LOIC, Slowloris)
- [ ] Chạy thành công `week10_dos_defense_monitor.py` trên máy của mình
- [ ] Nêu ít nhất 4 countermeasures (rate limit, CDN, SYN cookies, egress filtering, WAF)
