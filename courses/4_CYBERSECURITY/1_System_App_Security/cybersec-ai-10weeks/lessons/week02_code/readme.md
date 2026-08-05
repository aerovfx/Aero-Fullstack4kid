# Tuần 2 — Trinh Sát Mạng & Quét Cổng · Mục Lục Code

Bài giảng: [`../week02.md`](../week02.md) · Đề bài tập: [`../week02_exercises.md`](../week02_exercises.md) · Lab 2 MacBook: [`../huong_dan_lab_2_macbook.md`](../huong_dan_lab_2_macbook.md)

File được đánh số theo **đúng thứ tự nên học**. Cứ chạy lần lượt từ `01` trở đi.

---

## Lộ trình một trang

```text
01 → 02 → 03 → 04 → 05      Lý thuyết: xây Scanner từ 1 cổng đến 65535 cổng
06 → 07 → 08 → 09 → 10 → 11 Bài về nhà: moi thông tin dịch vụ sau cổng mở
12                          Phòng thủ: tự kiểm kê an ninh máy mình
20 → 21 → 22 → 23           Bài tập nhóm A (một máy, localhost)
30 → 31 → 32 → 33           Bài tập nhóm B (hai máy, cùng Wi-Fi)
```

---

## 01–05 · Lý thuyết: xây Scanner từng bước

| File | Nội dung | Kỹ thuật mới |
| :--- | :--- | :--- |
| `01_basic_scanner.py` | **Cấp độ 1** — gõ cửa đúng 1 cổng | `connect_ex()` thay cho `connect()` |
| `02_loop_scanner.py` | **Cấp độ 2** — quét dải cổng 1–100 | vòng lặp `for`, `settimeout()` |
| `03_fast_scanner.py` | **Cấp độ 3** — quét 1000 cổng đa luồng | `threading`, `start()`, `join()` |
| `04_pro_fast_scanner.py` | Quét đủ 65535 cổng bằng Thread Pool | `concurrent.futures` |
| `05_pro_fast_scanner_lan.py` | Bản quét máy khác trong LAN | dùng cho lab 2 máy |

```bash
python3 01_basic_scanner.py
python3 02_loop_scanner.py
python3 03_fast_scanner.py
```

> `01`–`04` đều quét `127.0.0.1`. Riêng `05` là bản dành cho lab LAN — chỉ điền IP máy của **chính bạn** trong mạng riêng, xem [`../huong_dan_lab_2_macbook.md`](../huong_dan_lab_2_macbook.md).

## 06–11 · Bài về nhà: moi thông tin sau cổng mở (Service Enumeration)

| File | Nội dung |
| :--- | :--- |
| `06_banner_grabbing.py` | Thu thập banner — biết phần mềm nào đứng sau cổng |
| `07_vulnerability_lookup.py` | Tra cứu CVE qua NVD API (cần `requests`) |
| `08_check_ssh_security.py` | Kiểm tra cấu hình SSH |
| `09_check_web_headers.py` | Kiểm tra HTTP Security Header |
| `10_check_ftp_anonymous.py` | Kiểm tra FTP có cho đăng nhập ẩn danh không |
| `11_buffer_demo.py` | Mô phỏng khái niệm tràn bộ đệm |

## 12 · Phòng thủ: tự kiểm kê an ninh (Blue Team)

| File | Nội dung |
| :--- | :--- |
| `12_defensive_auditor.py` | Quét máy mình → liệt kê dịch vụ → đánh giá rủi ro → khuyến nghị đóng cổng |

---

# BÀI TẬP

## 20–23 · Nhóm A — một máy, chỉ quét `127.0.0.1`

| File | Bài | Thời gian |
| :--- | :--- | :--- |
| `20_lab_target_server.py` | "Con mồi" — mở 3 cổng giả 9001–9003 trên localhost | — |
| `21_ex_service_checklist.py` | A1 — Checklist dịch vụ | ~15 phút |
| `22_ex_speed_battle.py` | A2 — Đấu tốc độ vòng lặp vs đa luồng | ~20 phút |
| `23_ex_mini_audit_report.py` | A3 — Báo cáo kiểm toán mini (Banner Grabbing) | ~20 phút |

```bash
# Terminal 1 — mở "con mồi", để nguyên cửa sổ này
python3 20_lab_target_server.py

# Terminal 2 — làm bài
python3 21_ex_service_checklist.py
python3 22_ex_speed_battle.py
python3 23_ex_mini_audit_report.py
```

Học xong nhấn `Ctrl + C` ở Terminal 1 để đóng các cổng lab.

## 30–33 · Nhóm B — hai máy trong cùng mạng Wi-Fi

| File | Bài | Chạy ở đâu | Thời gian |
| :--- | :--- | :--- | :--- |
| `30_lan_target_server.py` | Mở cổng lab ra LAN, in IP của mình | **Máy A** | — |
| `31_lan_first_contact.py` | B1 — Bắt liên lạc | Máy B | ~20 phút |
| `32_lan_host_discovery.py` | B2 — Điểm danh thiết bị trong nhà | Máy B | ~25 phút |
| `33_lan_firewall_duel.py` | B3 — Song đấu tường lửa | Máy B (+ Máy A vá lỗi) | ~30 phút |

```text
   [MÁY A - Mục tiêu / Blue Team]          [MÁY B - Scanner / Red Team]
   chạy 30_lan_target_server.py    <---->  chạy 31 / 32 / 33_lan_*
   mở cổng 9001, 9002, 9003                tìm và phân tích các cổng đó
                    \                     /
                     \___ Wi-Fi nhà bạn __/
```

**Hướng dẫn chi tiết cho 2 MacBook** (lấy IP, tường lửa macOS, khắc phục sự cố): [`../huong_dan_lab_2_macbook.md`](../huong_dan_lab_2_macbook.md)

```bash
# MÁY A
python3 30_lan_target_server.py     # gõ YES -> chương trình in IP Máy A

# MÁY B
python3 31_lan_first_contact.py
python3 32_lan_host_discovery.py
python3 33_lan_firewall_duel.py before
# ... Máy A bật firewall chặn 9001, 9002 ...
python3 33_lan_firewall_duel.py after
```

> [!WARNING]
> **Nhóm B chỉ chạy khi cả 3 điều sau đều đúng:**
> 1. Cả Máy A và Máy B đều là máy **của bạn** hoặc của lớp học do giáo viên cấp.
> 2. Mạng LAN là mạng riêng ở nhà / phòng lab — **không phải** Wi-Fi trường học, công ty, ký túc xá, quán cà phê hay mạng công cộng.
> 3. Bạn đã được chủ mạng đồng ý.
>
> Quét máy của người khác mà không được phép là hành vi vi phạm pháp luật. Các file `3x_lan_*` đều có hàm chặn IP công cộng và bước hỏi xác nhận `YES` — **không được xoá**.

**Dọn dẹp bắt buộc sau buổi học:**

```bash
# Máy A: Ctrl + C để tắt 30_lan_target_server.py, rồi gỡ luật firewall của bài B3
sudo ufw delete deny 9001 && sudo ufw delete deny 9002        # Linux
```

```bash
# macOS
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp $(which python3)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
```

```powershell
Remove-NetFirewallRule -DisplayName "Block Lab 9001"          # Windows
Remove-NetFirewallRule -DisplayName "Block Lab 9002"
```

## Khắc phục sự cố (nhóm B)

| Triệu chứng | Nguyên nhân thường gặp |
| :--- | :--- |
| Máy B không thấy cổng nào của Máy A | Firewall Máy A đang bật sẵn, hoặc hai máy khác Wi-Fi |
| Máy B không thấy cả Máy A lẫn router | Router bật "AP isolation / Client isolation" — tắt trong trang quản trị router |
| `is_alive()` báo máy tắt dù máy đang bật | Máy A chặn toàn bộ kết nối đến; thử tạm tắt firewall Máy A ở bài B1 |
| Sai IP | `ipconfig getifaddr en0` (macOS) · `ipconfig` (Windows) · `ip addr` (Linux) |

## solutions/

Lời giải đầy đủ của cả 6 bài tập, đánh số khớp với đề bài (`21_…`, `22_…`, `31_…`). Dành cho giáo viên, hoặc để tự đối chiếu **sau khi** đã làm xong.

---

## Quy tắc an toàn chung

> [!WARNING]
> Mọi file `01`–`23` chỉ được quét `127.0.0.1`. Mọi file `30`–`33` chỉ được dùng giữa hai máy của chính bạn trên mạng riêng đã được cho phép.
> Tuyệt đối không quét IP của trường học, công ty, hay bất kỳ trang web công cộng nào — theo rubric của khoá học, vi phạm điều này là **0 điểm toàn bài**.
