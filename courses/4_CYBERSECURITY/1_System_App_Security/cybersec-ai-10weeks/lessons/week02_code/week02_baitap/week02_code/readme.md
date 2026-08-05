Week02 - Service Enumeration

1. Banner Grabbing
   - Thu thập thông tin dịch vụ.

2. Vulnerability Lookup
   - Tra cứu CVE bằng NVD API.

3. SSH Security Check
   - Kiểm tra cấu hình SSH.

4. Web Header Inspection
   - Kiểm tra HTTP Security Header.

5. FTP Anonymous Check
   - Kiểm tra Anonymous Login.

6. Buffer Overflow Demo
   - Mô phỏng khái niệm tràn bộ đệm.

---

# BÀI TẬP TUẦN 2

Đề bài đầy đủ, tiêu chí chấm điểm và cách nộp: [`../week02_exercises.md`](../week02_exercises.md)

## Nhóm A — Bài tập một máy (chỉ quét `127.0.0.1`)

| File | Bài | Thời gian |
| :--- | :--- | :--- |
| `lab_target_server.py` | "Con mồi" — mở 3 cổng giả (9001–9003) trên localhost | — |
| `ex01_service_checklist.py` | A1 — Checklist dịch vụ | ~15 phút |
| `ex02_speed_battle.py` | A2 — Đấu tốc độ vòng lặp vs đa luồng | ~20 phút |
| `ex03_mini_audit_report.py` | A3 — Báo cáo kiểm toán mini (Banner Grabbing) | ~20 phút |

**Cách chạy** — Terminal 1 mở "con mồi", Terminal 2 làm bài:

```bash
# Terminal 1
python3 lab_target_server.py

# Terminal 2
python3 ex01_service_checklist.py
python3 ex02_speed_battle.py
python3 ex03_mini_audit_report.py
```

Học xong nhấn `Ctrl + C` ở Terminal 1 để đóng các cổng lab.

## Nhóm B — Bài tập hai máy trong cùng mạng LAN

| File | Bài | Chạy ở đâu | Thời gian |
| :--- | :--- | :--- | :--- |
| `lan_target_server.py` | Mở cổng lab ra LAN, in IP của mình | **Máy A** | — |
| `lan_ex01_first_contact.py` | B1 — Bắt liên lạc | Máy B | ~20 phút |
| `lan_ex02_host_discovery.py` | B2 — Điểm danh thiết bị trong nhà | Máy B | ~25 phút |
| `lan_ex03_firewall_duel.py` | B3 — Song đấu tường lửa | Máy B (+ Máy A vá lỗi) | ~30 phút |

```text
   [MÁY A - Mục tiêu / Blue Team]          [MÁY B - Scanner / Red Team]
   chạy lan_target_server.py       <---->  chạy lan_ex01 / 02 / 03
   mở cổng 9001, 9002, 9003                tìm và phân tích các cổng đó
                    \                     /
                     \___ Wi-Fi nhà bạn __/
```

**Hướng dẫn chi tiết cho 2 MacBook cùng Wi-Fi** (lấy IP, tường lửa macOS, khắc phục sự cố): [`../huong_dan_lab_2_macbook.md`](../huong_dan_lab_2_macbook.md)

**Cách chạy:**

```bash
# MÁY A
python3 lan_target_server.py        # gõ YES -> chương trình in IP Máy A

# MÁY B
python3 lan_ex01_first_contact.py
python3 lan_ex02_host_discovery.py
python3 lan_ex03_firewall_duel.py before
# ... Máy A bật firewall chặn 9001, 9002 ...
python3 lan_ex03_firewall_duel.py after
```

> [!WARNING]
> **Nhóm B chỉ chạy khi cả 3 điều sau đều đúng:**
> 1. Cả Máy A và Máy B đều là máy **của bạn** hoặc của lớp học do giáo viên cấp.
> 2. Mạng LAN là mạng riêng ở nhà / phòng lab — **không phải** Wi-Fi trường học, công ty, ký túc xá, quán cà phê hay mạng công cộng.
> 3. Bạn đã được chủ mạng đồng ý.
>
> Quét máy của người khác mà không được phép là hành vi vi phạm pháp luật. Các file `lan_*` đều có hàm chặn IP công cộng và bước hỏi xác nhận `YES` — **không được xoá**.

**Dọn dẹp bắt buộc sau buổi học:**

```bash
# Máy A: Ctrl + C để tắt lan_target_server.py, rồi xoá luật firewall của bài B3
sudo ufw delete deny 9001 && sudo ufw delete deny 9002        # Linux
```

```powershell
Remove-NetFirewallRule -DisplayName "Block Lab 9001"          # Windows
Remove-NetFirewallRule -DisplayName "Block Lab 9002"
```

```bash
# macOS — gỡ luật đã thêm ở bài B3 và bật lại tường lửa
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp $(which python3)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
```

## Khắc phục sự cố (nhóm B)

| Triệu chứng | Nguyên nhân thường gặp |
| :--- | :--- |
| Máy B không thấy cổng nào của Máy A | Firewall Máy A đang bật sẵn, hoặc hai máy khác Wi-Fi |
| Máy B không thấy cả Máy A lẫn router | Router bật "AP isolation / Client isolation" — tắt trong trang quản trị router |
| `is_alive()` báo máy tắt dù máy đang bật | Máy A chặn toàn bộ kết nối đến; thử tạm tắt firewall Máy A ở bài B1 |
| Sai IP | Chạy lại `ipconfig` (Windows) hoặc `ifconfig` / `ip addr` (macOS, Linux) trên Máy A |

## Đáp án

Thư mục `solutions/` chứa lời giải đầy đủ của cả 6 bài (dành cho giáo viên, hoặc để tự đối chiếu **sau khi** đã làm xong).
