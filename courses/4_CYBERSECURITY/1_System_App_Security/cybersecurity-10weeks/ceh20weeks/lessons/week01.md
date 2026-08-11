# Tuần 1: Introduction to Ethical Hacking (CEH v13 Module 01)

> Module CEH v13 tương ứng: **01 — Introduction to Ethical Hacking**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 01** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu rõ **khái niệm Information Security** (CIA Triad) và các thế hệ bảo mật.
2. Phân biệt được các **loại hacker** (White / Grey / Black Hat, Script Kiddie, Hacktivist, State-Sponsored).
3. Nắm vững **5 pha tấn công (5 Hacking Phases)**: Reconnaissance → Scanning → Gaining Access → Maintaining Access → Clearing Tracks.
4. Hiểu **Cyber Kill Chain** của Lockheed Martin và **MITRE ATT&CK** framework.
5. Nắm rõ **CEH Code of Ethics**, Luật An ninh mạng Việt Nam, và quy trình **thủ tục pháp lý khi pentest** (Scope of Work / Authorization).

---

## Lý Thuyết / Theory

### 1. Information Security (CIA Triad)

| Thành phần | Ý nghĩa | Ví dụ minh hoạ |
|-----------|---------|----------------|
| **Confidentiality** (Tính bảo mật) | Chỉ người được phép mới đọc được dữ liệu | Mật khẩu, mã hoá AES |
| **Integrity** (Tính toàn vẹn) | Dữ liệu không bị sửa đổi trái phép | Hash SHA-256, chữ ký số |
| **Availability** (Tính khả dụng) | Hệ thống luôn sẵn sàng khi cần | DDoS mitigation, backup |

**Thực tế:** Tấn công **DDoS** (Tuần 10) phá hoại *Availability*; **Session Hijacking** (Tuần 11) phá hoại *Integrity*; **Sniffing** (Tuần 8) phá hoại *Confidentiality*.

### 2. Các Loại Hacker

| Loại Hacker | Đặc điểm | Màu mũ |
|-------------|----------|--------|
| White Hat | Hợp pháp, có giấy phép (pentester) | Trắng |
| Grey Hat | Ranh giới mờ, không xin phép trước | Xám |
| Black Hat | Phá hoại, trục lợi trái phép | Đen |
| Script Kiddie | Dùng công cụ có sẵn, không hiểu sâu | - |
| Hacktivist | Hacker vì mục đích chính trị/xã hội | - |
| State-Sponsored | Được chính phủ tài trợ, APT | - |
| Insider | Nhân viên nội bộ, chiếc đồng hồ nhiễm độc | - |

### 3. 5 Pha Tấn Công (Hacking Phases)

```
Reconnaissance (Trinh sát - W2) 
    → Scanning (Quét - W3, W4) 
    → Gaining Access (Chiếm quyền - W6) 
    → Maintaining Access (Duy trì - W7 Malware) 
    → Clearing Tracks (Xoá dấu vết - W8)
```

### 4. Cyber Kill Chain (Lockheed Martin)

| Giai đoạn | Mô tả |
|-----------|-------|
| Reconnaissance | Thu thập thông tin mục tiêu |
| Weaponization | Đóng gói payload độc hại |
| Delivery | Gửi payload (email, USB, web) |
| Exploitation | Khai thác lỗ hổng |
| Installation | Cài backdoor / RAT |
| Command & Control | Kết nối C2 |
| Actions on Objectives | Thực hiện mục tiêu cuối cùng |

### 5. CEH Code of Ethics & Pháp Lý

- **Ethics 1-6:** Chỉ test trên hệ thống được ủy quyền; không lạm dụng thông tin; bảo vệ dữ liệu khách hàng; chịu trách nhiệm xã hội.
- **Luật VN:** Nghị định 06/2022/NĐ-CP; Luật An toàn thông tin mạng 2015.
- **Hợp đồng pentest:** Scoping, MSA, Rules of Engagement (RoE), Non-Disclosure Agreement (NDA).

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Toàn bộ khoá học 20 tuần **CHỈ thực hành trên**: `127.0.0.1`, Kali VM, Metasploitable 2/3, DVWA, hoặc phòng lab ảo của chính bạn.
> 2. Quét / tấn công hệ thống **không thuộc về bạn** là **vi phạm pháp luật**, không được chấp nhận và sẽ **FAIL toàn bộ khoá học**.
> 3. Nếu bạn đang làm việc tại công ty, yêu cầu **Authorization Letter** bằng văn bản trước khi test.

---

## Thực Hành Code / Hands-On (Defensive-first)

### Lab 1: Máy quét "rủi ro" — Kiểm kê bảo mật máy tính cá nhân (Python)

Công cụ phòng thủ: liệt kê cổng đang lắng nghe trên chính máy bạn, dùng `psutil` — chủ động tìm cửa sổ bảo mật của chính mình.

```python
# week01_code/security_audit.py
# Security Audit Tool — Đánh giá bảo mật cơ bản máy tính cá nhân (BLUE TEAM)
import socket
import json
import datetime

print("=" * 60)
print("SECURITY AUDIT - Kiểm kê cửa sổ bảo mật máy cá nhân")
print(f"Thời gian: {datetime.datetime.now():%Y-%m-%d %H:%M}")
print("=" * 60)

# Zone an toàn: chỉ quét localhost
TARGET = "127.0.0.1"

# Các cổng thường bị khai thác nhất (theo CEH Module 01 & OWASP)
RISKY_PORTS = {
    21: "FTP - truyền file không mã hoá",
    22: "SSH - remote shell",
    23: "Telnet - KHÔNG an toàn",
    445: "SMB - chia sẻ file Windows",
    3389: "RDP - remote desktop",
    5432: "PostgreSQL DB",
    3306: "MySQL DB",
    6379: "Redis DB",
    27017: "MongoDB DB",
    8080: "HTTP alt",
}

def check_port(port):
    """Kiểm tra 1 cổng trên localhost. Trả True nếu đang MỞ."""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(0.3)
    try:
        result = s.connect_ex((TARGET, port))
        return result == 0
    finally:
        s.close()

open_risky = []
report = {"host": TARGET, "scanned_at": str(datetime.datetime.now())}

for port, desc in RISKY_PORTS.items():
    if check_port(port):
        print(f"[!] CỔNG MỞ: {port:>5} → {desc}")
        open_risky.append(port)

print("-" * 60)
if open_risky:
    print(f"[KẾT QUẢ] Phát hiện {len(open_risky)} cổng rủi ro đang mở.")
    print("[KHUYẾN NGHỊ] Hãy kiểm tra / đóng bằng firewall (xem Lab 2).")
    report["open_ports"] = open_risky
    report["risk_level"] = "HIGH"
else:
    print("[KẾT QUẢ] Không phát hiện cổng rủi ro nào đang mở.")
    report["open_ports"] = []
    report["risk_level"] = "LOW"

# Xuất báo cáo JSON (chuẩn Pentest Report sơ khởi)
with open("security_report.json", "w", encoding="utf-8") as f:
    json.dump(report, f, ensure_ascii=False, indent=2)
print("[+] Đã xuất báo cáo: security_report.json")
```

**Chạy:**
```bash
python3 week01_code/security_audit.py
```

### Lab 2: Bật/tắt cửa sổ bằng Firewall (Defensive)

Ví dụ **macOS** — tắt dịch vụ đang lộ cổng:

```bash
# Liệt kê tiến trình đang LISTEN
lsof -i -P | grep LISTEN

# Bật macOS Application Firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
```

Ví dụ **Linux (ufw)**:

```bash
sudo ufw deny 23        # chặn Telnet
sudo ufw deny 445       # chặn SMB
sudo ufw status verbose
```

---

## Bài Tập Về Nhà / Homework

1. **Viết báo cáo** phân tích **một vụ tấn công mạng thực tế trong nước/international** (VD: SolarWinds, VNDIRECT, ransomware nhà bán lẻ), xác định **5 pha tấn công** đã diễn ra và đề xuất **5 biện pháp phòng thủ** tương ứng theo CIA Triad.
2. **Code:** chạy `security_audit.py` trên máy bạn, ghi lại kết quả ít nhất 5 cổng, kèm ảnh chụp màn hình.
3. **Đọc:** `CEHv13 - Module 01` phần "Threat Modeling" và "Vulnerability Research" — tóm tắt 10 dòng.

---

## Rubric Đánh Giá Tuần 1

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Báo cáo case study** | Phân tích đúng 5 pha + biện pháp phòng thủ có liên hệ CIA (40đ) | Phân tích đúng các pha nhưng thiếu liên hệ bảo mật (25đ) | Không xác định được pha tấn công (10đ) |
| **Code audit tool** | Chạy được, xuất JSON, nhận xét đúng rủi ro (30đ) | Chạy được nhưng thiếu nhận xét (20đ) | Không chạy được (5đ) |
| **Tóm tắt module** | Nêu đúng khái niệm Threat Modeling & Vulnerability Research (30đ) | Thiếu 1 trong 2 khái niệm (20đ) | Chép lại không hiểu (5đ) |

---

## Checklist Đầu Ra Tuần 1

- [ ] Phân biệt được White/Grey/Black Hat
- [ ] Đọc và hiểu Cyber Kill Chain (7 bước)
- [ ] Chạy thành công `security_audit.py` trên chính máy
- [ ] Hiểu 3 thuộc tính CIA + 1 ví dụ cụ thể mỗi loại
- [ ] Nắm cách xin phép pentest hợp lệ (RoE / NDA)