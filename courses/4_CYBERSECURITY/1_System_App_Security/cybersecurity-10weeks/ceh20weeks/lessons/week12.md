# Tuần 12: Evading IDS, Firewalls, and Honeypots (CEH v13 Module 12)

> Module CEH v13 tương ứng: **12 — Evading IDS, Firewalls, and Honeypots**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 12** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Phân biệt **IDS** (phát hiện) vs **IPS** (chặn) và các loại: **NIDS/HIDS**, **signature-based** vs **anomaly-based**.
2. Hiểu các loại **firewall**: packet filtering, stateful, proxy, next-generation (NGFW), và vị trí triển khai.
3. Nắm các kỹ thuật **evasion** IDS/firewall (fragmentation, Unicode encoding, obfuscation, timing, spoofing, encryption) — **LÝ THUYẾT để phòng thủ**.
4. Hiểu **honeypot / honeynet** và cách dùng chúng để phát hiện & nghiên cứu kẻ tấn công.
5. Biết các công cụ (Snort, Suricata, Wireshark, Honeyd, KFSensor) và xây dựng **signature/log parser** đơn giản (Lab 1) cùng bộ quy tắc chặn.

---

## Lý Thuyết / Theory

### 1. IDS vs IPS

| Loại | Chức năng | Ưu điểm | Hạn chế |
|------|-----------|---------|---------|
| **IDS (Intrusion Detection System)** | **Phát hiện** & cảnh báo, không chặn | Không ảnh hưởng traffic hợp lệ | Phản ứng sau khi phát hiện |
| **IPS (Intrusion Prevention System)** | **Chặn** tấn công tự động (inline) | Chặn được ngay | Có thể chặn nhầm (false positive) |
| **NIDS** | Giám sát lưu lượng mạng (span port) | Bao phủ nhiều máy | Không thấy bên trong host |
| **HIDS** | Giám sát trên host (file, log, process) | Thấy hoạt động nội bộ | Triển khai nhiều host |

### 2. Signature-based vs Anomaly-based

| Cách tiếp cận | Cơ chế | Ưu | Nhược |
|---------------|--------|-----|-------|
| **Signature-based** | So khớp dấu hiệu đã biết (pattern/rule) | Chính xác, ít false positive | **Bỏ sót zero-day / biến thể** |
| **Anomaly-based** | Học **baseline hành vi**, phát hiện lệch chuẩn | Phát hiện mới lạ | Nhiều false positive |

> **Thực tế CEH:** hệ thống tốt **kết hợp cả hai**. Signature bắt nhanh, anomaly bắt lạ. Lab 1 mô phỏng signature matching trên log.

### 3. Các Loại Firewall

| Loại | Kiểm tra | Ví dụ |
|------|----------|-------|
| **Packet filtering** | Header gói tin (IP/port/protocol) | iptables, ACL |
| **Stateful inspection** | Theo dõi **trạng thái kết nối** (state table) | pfSense, ASA |
| **Proxy (application)** | Kiểm tra nội dung ứng dụng | squid, WAF |
| **NGFW** | Tích hợp IDS/IPS + ứng dụng-aware | Palo Alto, Fortinet |

### 4. Kỹ Thuật Evasion (LÝ THUYẾT để phòng thủ)

| Kỹ thuật | Cơ chế | Phòng thủ |
|----------|--------|-----------|
| **Fragmentation** | Chia gói tin nhỏ để né signature dựa trên pattern | **Reassembly & inspection** (fragment normalization) |
| **Unicode / encoding** | Mã hoá URL (URL encoding, double-encoding) | Normalize input trước khi match |
| **Obfuscation** | Làm rối payload (hex, base64) | Deep packet inspection |
| **Timing attack** | Kéo dài thời gian gửi để tránh rate detection | Anomaly detection theo thời gian |
| **Source spoofing** | Giả nguồn gói tin | **BCP38 egress filtering** (liên hệ Tuần 10) |
| **Encryption** | Mã hoá tunnel (VPN) | DPI, ghi log phiên |

> [!WARNING]
> Hiểu evasion để **biết điểm mù của phòng thủ**: nếu IDS chỉ match pattern trên gói chưa reassemble, fragmentation sẽ lọt. Vì vậy cần **normalization + reassembly + anomaly detection**.

### 5. Honeypot & Honeynet

| Loại | Mô tả |
|------|-------|
| **Honeypot** | Máy/servive giả cài đặt **có chủ đích để bị tấn công** — hấp dẫn kẻ xấu, ghi log hành vi |
| **Honeynet** | Mạng gồm nhiều honeypot |
| **High-interaction** | Hệ thống thật đầy đủ (tốn tài nguyên, nhiều dữ liệu) |
| **Low-interaction** | Giả lập service tối thiểu (ít rủi ro) |
| **Honeywords/Honeytoken** | Dữ liệu giả (credential, file) để phát hiện truy cập trái phép |

**Vai trò:** phát hiện sớm (kẻ tấn công đụng honeypot = có kẻ trong mạng), nghiên cứu TTP, phân tán lực lượng kẻ xấu khỏi hệ thống thật.

### 6. Công Cụ & Quy Trình Phòng Thủ

- **Snort / Suricata:** IDS/IPS signature-based (rules: alert, drop, reject).
- **pfSense / iptables:** stateful firewall.
- **Honeyd / KFSensor / T-Pot:** honeypot.
- **Wireshark / Zeek:** phân tích lưu lượng.
- **Quy trình:** triển khai NIDS + HIDS + firewall NGFW, log tập trung (SIEM), điều chỉnh signature định kỳ, giám sát honeypot.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này là **PHÒNG THỦ**: tool parse log/rule để **phát hiện** bất thường — không thực hiện kỹ thuật evasion, không quét mạng người khác.
> 2. Học evasion **chỉ để biết điểm mù của hệ thống phòng thủ của bạn**, không để né IDS của tổ chức khác (bất hợp pháp).
> 3. Triển khai honeypot trên mạng thật cần có **cảnh báo pháp lý** (log có thể chứa dữ liệu nhạy cảm) — chỉ lab.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week12_ids_rule_engine.py`. Tool phân tích **log text bạn tự cung cấp** (hoặc log mẫu) — không bắt gói tin, không quét mạng.

### Lab 1: Mini IDS Rule Engine — Phát hiện bất thường trong log (Python)

Công cụ phòng thủ: mô phỏng cách **signature-based IDS** hoạt động — đọc từng dòng log, so khớp với **rule** (pattern) và in cảnh báo. Kèm **log mẫu** (access log giả, port scan log) để bạn hiểu cơ chế.

```bash
python3 CODE/week12_ids_rule_engine.py --demo
python3 CODE/week12_ids_rule_engine.py --log /path/to/your/log.txt
```

Kết quả mẫu (demo):

```
[RULE] SQLi:   'union select' hoặc "' OR 1=1"  -> 2 dòng khớp
[RULE] XSS:    '<script>'                      -> 1 dòng khớp
[RULE] PortScan: nhiều cổng từ 1 IP            -> phát hiện 1 IP quét 20 cổng
[RULE] PathTraversal: '..%2f' hoặc '..\\'      -> 1 dòng khớp
[TỔNG] 5 cảnh báo từ 20 dòng log
```

> **Giải thích CEH:** đây chính là nguyên lý của Snort — một tập rule đơn giản có thể phát hiện SQLi/XSS/path traversal ngay ở tầng log. Hệ thống thật sẽ kết hợp thêm anomaly detection (học baseline) để bắt zero-day.

### Lab 2: Snort rule tham khảo (phòng thủ)

```text
# /etc/snort/rules/local.rules — rule mẫu phát hiện SQL injection
alert tcp $HOME_NET any -> $EXTERNAL_NET $HTTP_PORTS (msg:"SQLi: union select"; \
    content:"union select"; nocase; sid:1000001; rev:1;)

# Phát hiện XSS cơ bản
alert tcp $HOME_NET any -> $EXTERNAL_NET $HTTP_PORTS (msg:"XSS: script tag"; \
    content:"<script>"; sid:1000002; rev:1;)
```

### Lab 3: Chặn bằng iptables (stateful firewall)

```bash
# Chỉ cho phép SSH từ IP nội bộ, chặn phần còn lại (ví dụ phòng thủ)
sudo iptables -A INPUT -p tcp --dport 22 -s 192.168.1.0/24 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j DROP
# Giới hạn số kết nối mới / phút (chống quét)
sudo iptables -A INPUT -p tcp --dport 80 -m recent --update --seconds 60 \
     --hitcount 20 -j DROP
```

---

## Bài Tập Về Nhà / Homework

1. **Chạy rule engine:** chạy `week12_ids_rule_engine.py --demo`, chụp màn hình, giải thích 3 rule phát hiện gì và hạn chế của signature-based (zero-day).
2. **Viết rule của bạn:** thêm 1 rule phát hiện lỗ hổng phổ biến (VD: `/etc/passwd`, `cmd=`, `wget`) vào file và chạy với log mẫu của bạn.
3. **So sánh IDS/IPS:** bảng so sánh NIDS vs HIDS, signature vs anomaly (ưu/nhược, khi nào dùng), triển khai 1 sơ đồ mạng nhỏ có firewall + NIDS + honeypot.
4. **Nghiên cứu honeypot:** tóm tắt 1 honeypot nổi tiếng (VD: T-Pot, Cowrie SSH) — cách hoạt động, thu thập được gì, rủi ro.

---

## Rubric Đánh Giá Tuần 12

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Rule engine** | Chạy được, giải thích đúng 3 rule + hạn chế (40đ) | Chạy được nhưng thiếu phân tích (25đ) | Không chạy được (10đ) |
| **Rule tự viết** | Rule đúng cú pháp, chạy phát hiện đúng (30đ) | Rule sai cú pháp nhưng hiểu ý (20đ) | Không viết được (5đ) |
| **So sánh + honeypot** | Đủ 4 phần, chính xác (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 12

- [ ] Phân biệt IDS vs IPS, NIDS vs HIDS, signature vs anomaly
- [ ] Phân biệt 4 loại firewall (packet/stateful/proxy/NGFW)
- [ ] Nêu 4 kỹ thuật evasion (fragmentation, encoding, timing, spoofing) và cách chống
- [ ] Hiểu honeypot/honeynet và vai trò phát hiện sớm
- [ ] Chạy thành công `week12_ids_rule_engine.py --demo`
- [ ] Viết được 1 Snort rule đơn giản
