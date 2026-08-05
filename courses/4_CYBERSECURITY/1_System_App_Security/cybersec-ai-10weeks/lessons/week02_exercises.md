# Tuần 2 — Bộ Bài Tập Ngắn (Port Scanning)

Bộ bài tập đi kèm bài giảng [`week02.md`](week02.md). Gồm **2 nhóm**:

| Nhóm | Số bài | Môi trường | Thư mục code |
| :--- | :--- | :--- | :--- |
| **A. Một máy (Localhost)** | 3 bài | Chỉ cần 1 máy tính, quét `127.0.0.1` | [`week02_code/exercises/`](week02_code/exercises/) |
| **B. Hai máy (LAN)** | 3 bài | 2 máy cùng Wi-Fi nhà / phòng lab | [`week02_code/lan_exercises/`](week02_code/lan_exercises/) |

Mỗi bài có file khởi tạo (`TODO` để học viên tự điền) và file đáp án trong thư mục `solutions/`.

---

## Quy Tắc An Toàn Chung (đọc trước khi làm bất cứ bài nào)

> [!WARNING]
> 1. **Nhóm A** chỉ được quét `127.0.0.1`. Đổi sang IP khác = 0 điểm toàn bài.
> 2. **Nhóm B** chỉ được quét máy **của chính bạn / của nhóm bạn**, trên **mạng riêng ở nhà hoặc phòng lab đã được giáo viên bố trí**.
>    Tuyệt đối KHÔNG chạy ở Wi-Fi trường học, công ty, ký túc xá, quán cà phê hay bất kỳ mạng công cộng nào — ở đó đây là hành vi trinh sát trái phép và vi phạm Luật An ninh mạng.
> 3. Nếu quét ra thiết bị lạ (TV, điện thoại người khác): **chỉ ghi nhận, không quét sâu, không thử kết nối vào**.
> 4. Code trong bộ bài tập có sẵn hàm chặn IP công cộng và bước hỏi xác nhận `YES`. **Không được xoá các cơ chế này** — đó là một phần của điểm số.

---

# NHÓM A — BÀI TẬP MỘT MÁY (LOCALHOST)

### Chuẩn bị: mở "con mồi"

Scanner cần có cổng mở để tìm thấy. Mở terminal thứ nhất và chạy:

```bash
cd week02_code/exercises
python3 lab_target_server.py
```

Server này mở 3 cổng giả trên `127.0.0.1` (9001, 9002, 9003), mỗi cổng trả về một Banner khác nhau. **Để nguyên terminal này**, mở terminal thứ hai để làm bài. Học xong nhớ `Ctrl + C` để tắt.

---

## Bài A1 — Checklist Dịch Vụ (~15 phút)

**File:** `exercises/ex01_service_checklist.py`
**Ôn lại:** Cấp độ 1 + Cấp độ 2 (`connect_ex`, vòng lặp `for`)

Thay vì quét mù cả 65535 cổng, hãy quét đúng danh sách 10 cổng "đáng ngờ" nhất và in ra tên dịch vụ đứng sau mỗi cổng.

**Yêu cầu:**
1. Dùng `connect_ex()`, không dùng `connect()` — chương trình không được crash khi gặp cổng đóng.
2. Duyệt dictionary `COMMON_PORTS` bằng vòng lặp `for`.
3. In `MỞ` / `ĐÓNG` kèm tên dịch vụ cho từng cổng.
4. In dòng tổng kết: `Tổng kết: 3/10 cổng đang mở.`

**Kết quả mong đợi:**

```text
[-] ĐÓNG - Cổng 22    | SSH - Quản trị từ xa
[+] MỞ   - Cổng 9001  | Cổng lab (FTP giả)
...
Tổng kết: 3/10 cổng đang mở.
```

**Chấm điểm:** đúng `connect_ex` (30đ) · vòng lặp + `close()` đầy đủ (30đ) · định dạng đầu ra rõ ràng (20đ) · dòng tổng kết đúng (20đ).

---

## Bài A2 — Đấu Tốc Độ: Vòng Lặp vs Đa Luồng (~20 phút)

**File:** `exercises/ex02_speed_battle.py`
**Ôn lại:** Cấp độ 3 (`threading`, `start()`, `join()`)

Quét **cùng một dải cổng (8900–9400)** bằng hai cách, bấm giờ cả hai, rồi tính xem đa luồng nhanh hơn bao nhiêu **lần**. Đây là cách bạn tự chứng minh cho mình vì sao threading là bắt buộc.

**Yêu cầu:**
1. Hoàn thành `scan_slow()` — vòng lặp `for` thông thường.
2. Hoàn thành `scan_fast()` — mỗi cổng một thread, có `t.start()` và **có `t.join()`**.
3. Cả hai hàm trả về list cổng mở để đối chiếu.
4. In bảng so sánh + hệ số tăng tốc (`speedup = thời gian chậm / thời gian nhanh`).

**Kết quả mong đợi (máy tham chiếu):**

```text
[CHẬM] Vòng lặp thường: 3 cổng mở trong 10.11 giây
[NHANH] Đa luồng      : 3 cổng mở trong 0.25 giây
=> Đa luồng nhanh hơn 40.9 lần
```

> **Vì sao code có biến `NETWORK_LATENCY = 0.02`?**
> Trên localhost, cổng đóng bị hệ điều hành từ chối *ngay lập tức* — không có thời gian chờ để các luồng chia nhau. Nếu bỏ dòng này, đa luồng sẽ **chậm hơn** vòng lặp thường vì tốn công tạo 500 thread. Ta cộng 0.02 giây mỗi cổng đóng để mô phỏng độ trễ của một máy thật ngoài mạng.
> **Thí nghiệm nâng cao:** đặt `NETWORK_LATENCY = 0` rồi chạy lại — bạn sẽ thấy threading không "thần kỳ", nó chỉ có lợi khi chương trình phải **ngồi chờ** (I/O-bound).

**Câu hỏi suy ngẫm** (viết vào comment cuối file):
1. Hai cách quét có ra cùng danh sách cổng mở không? Nếu lệch thì vì sao?
2. Nếu quét đủ 65535 cổng, cách chậm sẽ mất bao lâu?

**Chấm điểm:** `scan_slow()` đúng (20đ) · `scan_fast()` có `join()` (30đ) · bảng so sánh + speedup (25đ) · trả lời 2 câu suy ngẫm (25đ).

---

## Bài A3 — Báo Cáo Kiểm Toán Mini (~20 phút)

**File:** `exercises/ex03_mini_audit_report.py`
**Ôn lại:** Banner Grabbing (bài về nhà) + tư duy phòng thủ Blue Team

Bạn không còn là hacker — bạn là **chuyên gia kiểm toán an ninh**. Với mỗi cổng mở trên máy mình: lấy Banner → chấm mức rủi ro → đề xuất cách xử lý.

Quy trình chuẩn của Auditor:

```text
Quét → Hiển thị cổng mở → Giải thích chức năng → Đánh giá rủi ro → Hướng dẫn đóng cổng
```

**Yêu cầu:**
1. Viết `grab_banner(ip, port)` — trả về banner hoặc `"(không phản hồi)"`. **Bắt buộc `try/except`** vì nhiều dịch vụ mở nhưng im lặng sẽ gây timeout.
2. Chỉ xử lý những cổng đang MỞ.
3. In báo cáo dạng bảng: `Cổng | Dịch vụ | Mức rủi ro | Banner`.
4. In phần **KHUYẾN NGHỊ** — chỉ liệt kê khuyến nghị của cổng thực sự đang mở.
5. In mức rủi ro tổng thể.

**Mẹo:** dịch vụ như SSH/FTP tự gửi banner ngay khi kết nối, còn HTTP thì im cho đến khi mình chào trước. Đáp án xử lý cả hai trường hợp: thử `recv()` trước, nếu rỗng thì `sendall(b"HELLO\r\n")` rồi `recv()` lần nữa.

**Kết quả mong đợi:**

```text
CỔNG   DỊCH VỤ       RỦI RO       BANNER
9001   Lab-FTP       CAO          Aero-FTP Server v1.2 (anonymous login al
9002   Lab-SSH       TRUNG BÌNH   Aero-SSH_2.0 OpenLab-8.9

KHUYẾN NGHỊ XỬ LÝ (Remediation):
- Cổng 9001 (Lab-FTP) [CAO]: Cổng lab, tắt server lab sau khi học xong.
```

**Chấm điểm:** `grab_banner` bắt được banner (35đ) · xử lý ngoại lệ timeout không treo (25đ) · bảng báo cáo (20đ) · khuyến nghị đúng cổng đang mở (20đ).

---

# NHÓM B — BÀI TẬP HAI MÁY TRONG CÙNG MẠNG LAN

## Sơ đồ phòng lab

```text
   [MÁY A - Mục tiêu / Blue Team]          [MÁY B - Scanner / Red Team]
   chạy lan_target_server.py       <---->  chạy lan_ex01 / 02 / 03
   mở cổng 9001, 9002, 9003                tìm và phân tích các cổng đó
                    \                     /
                     \___ Wi-Fi nhà bạn __/
                          (mạng riêng)
```

## Chuẩn bị (làm 1 lần, trên MÁY A)

```bash
cd week02_code/lan_exercises
python3 lan_target_server.py
```

Chương trình sẽ:
1. Bắt bạn gõ `YES` để xác nhận đây là mạng lab hợp lệ.
2. **In ra IP của Máy A** — đọc số này cho bạn ngồi ở Máy B.
3. Mở 3 cổng lab ra LAN và in log mỗi khi có ai gõ cửa (rất vui, Máy B quét là Máy A thấy ngay).

Tự tìm IP thủ công nếu cần:

| Hệ điều hành | Lệnh |
| :--- | :--- |
| Windows | `ipconfig` → xem `IPv4 Address` |
| macOS / Linux | `ifconfig \| grep "inet "` hoặc `ip addr` |

IP hợp lệ có dạng `192.168.x.x`, `10.x.x.x` hoặc `172.16–31.x.x`.

> **Nếu Máy B không thấy gì:** kiểm tra (1) hai máy có cùng Wi-Fi không, (2) firewall Máy A đang chặn, (3) Wi-Fi có bật "AP isolation / Client isolation" — nhiều router chặn máy trong nhà nhìn thấy nhau, phải tắt tính năng này trong trang quản trị router.

---

## Bài B1 — Bắt Liên Lạc (~20 phút) — chạy trên MÁY B

**File:** `lan_exercises/lan_ex01_first_contact.py`

**Yêu cầu:**
1. Nhập IP Máy A (code sẽ tự chặn nếu bạn gõ IP công cộng).
2. Viết `is_alive(ip)` — "TCP ping": máy đang bật sẽ trả lời **ngay** (mở hoặc từ chối), máy tắt thì treo tới hết timeout.
3. Viết `scan_host(ip)` — quét checklist cổng, trả về list cổng mở.
4. Quét **Máy A** và **chính máy mình (`127.0.0.1`)**, in bảng so sánh 2 cột.

**Bài học cốt lõi:** cổng mở trên localhost **chưa chắc** mở ra LAN, và ngược lại. Đây chính là khác biệt giữa `bind("127.0.0.1")` và `bind("0.0.0.0")` — điều đã nhắc tới trong Case Study PostgreSQL của bài giảng.

**Kết quả mong đợi:**

```text
CỔNG    MÁY A (qua LAN)     MÁY B (localhost)
9001    MỞ                  ĐÓNG
5432    ĐÓNG                MỞ
```

**Chấm điểm:** giữ nguyên `check_lab_ip()` + gõ đúng xác nhận (20đ) · `is_alive` hoạt động (20đ) · `scan_host` đúng (25đ) · bảng so sánh 2 cột (20đ) · nhận xét giải thích được bind 0.0.0.0 vs 127.0.0.1 (15đ).

---

## Bài B2 — Điểm Danh Thiết Bị Trong Nhà (~25 phút) — chạy trên MÁY B

**File:** `lan_exercises/lan_ex02_host_discovery.py`

Lần này bạn **không hỏi IP Máy A**. Bạn phải tự tìm nó giữa 254 địa chỉ có thể có — đúng cách một quản trị mạng kiểm kê xem trong nhà đang có bao nhiêu thiết bị.

**Yêu cầu:**
1. Tự phát hiện dải mạng từ IP máy mình (`192.168.1.7` → prefix `192.168.1.`).
2. **Đa luồng** quét từ `.1` đến `.254`, mỗi host thử 7 cổng đầu mối.
3. In danh sách thiết bị tìm thấy kèm cổng mở.
4. Đánh dấu host nào là Máy A (host mở cổng 9001/9002/9003), host nào là router (`.1`), host nào là chính mình.

**Vì sao bắt buộc đa luồng:** 254 host × 7 cổng = 1778 lần gõ cửa. Quét tuần tự với timeout 0.3s mất hơn 8 phút; đa luồng đưa về vài giây.

**Kết quả mong đợi:**

```text
192.168.1.1       [80, 443]                     <-- nhiều khả năng là Router
192.168.1.7       [9001, 9002, 9003]            <-- ĐÂY LÀ MÁY A
Tổng cộng: 4 thiết bị đang bật trong mạng.
```

**Câu hỏi suy ngẫm:**
1. Ngoài Máy A còn thiết bị nào? Đoán xem chúng là gì (máy in mạng thường mở 9100, Chromecast 8008/8009, camera IP 554).
2. Vì sao router (`.1`) hầu như luôn mở cổng 80 hoặc 443? *(Gợi ý: liên hệ với việc đổi mật khẩu mặc định của router.)*

**Chấm điểm:** tính prefix đúng (15đ) · đa luồng có `join()` (30đ) · dùng `Lock` khi ghi kết quả chung (15đ) · nhận diện Máy A/router (20đ) · trả lời suy ngẫm + tôn trọng thiết bị lạ (20đ).

---

## Bài B3 — Song Đấu Tường Lửa (~30 phút) — hai bạn hai vai

**File:** `lan_exercises/lan_ex03_firewall_duel.py`

**MÁY A = Blue Team** (phòng thủ) · **MÁY B = Red Team** (trinh sát)

### Luật chơi — 3 hiệp

| Hiệp | Ai làm | Việc cần làm |
| :--- | :--- | :--- |
| **1. BEFORE** | Máy B | `python3 lan_ex03_firewall_duel.py before` → quét + lấy banner, lưu `snapshot_before.json` |
| **2. VÁ LỖI** | Máy A | Bật firewall chặn cổng **9001** và **9002** (lệnh bên dưới) |
| **3. AFTER** | Máy B | `python3 lan_ex03_firewall_duel.py after` → quét lại, so sánh, chấm điểm Blue Team |

### Lệnh cho Máy A ở hiệp 2

**Ubuntu / Linux:**
```bash
sudo ufw enable
sudo ufw deny 9001
sudo ufw deny 9002
sudo ufw status
```

**Windows (PowerShell, quyền Administrator):**
```powershell
New-NetFirewallRule -DisplayName "Block Lab 9001" -Direction Inbound `
    -Protocol TCP -LocalPort 9001 -Action Block
New-NetFirewallRule -DisplayName "Block Lab 9002" -Direction Inbound `
    -Protocol TCP -LocalPort 9002 -Action Block
```

**macOS:**
```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
```

> [!IMPORTANT]
> **Dọn dẹp bắt buộc sau khi học xong** (nếu không máy bạn sẽ giữ luật lạ mãi mãi):
> ```bash
> sudo ufw delete deny 9001 && sudo ufw delete deny 9002     # Linux
> ```
> ```powershell
> Remove-NetFirewallRule -DisplayName "Block Lab 9001"       # Windows
> Remove-NetFirewallRule -DisplayName "Block Lab 9002"
> ```
> Và nhớ `Ctrl + C` để tắt `lan_target_server.py` trên Máy A.

**Yêu cầu code (Máy B):**
1. `grab_banner(ip, port)` — trả banner, hoặc `None` nếu cổng đóng.
2. `save_snapshot()` — lưu hiện trạng ra JSON (`ensure_ascii=False`, `indent=2`).
3. `compare(before, after)` — phân loại 4 trạng thái: `ĐÃ VÁ` / `CÒN HỞ` / `MỞ THÊM (!)` / `ỔN ĐỊNH`, chấm điểm Blue Team và in khuyến nghị cho cổng còn hở.

**Kết quả mong đợi:**

```text
CỔNG    TRƯỚC       SAU         KẾT LUẬN
9001    MỞ          ĐÓNG        ĐÃ VÁ
9002    MỞ          ĐÓNG        ĐÃ VÁ
9003    MỞ          MỞ          CÒN HỞ
ĐIỂM BLUE TEAM: đóng được 2/3 cổng từng mở.
```

**Câu hỏi chốt bài (quan trọng nhất cả tuần):**
Sau hiệp 3, Máy A hãy tự chạy `python3 -c "import socket;print(socket.socket().connect_ex(('127.0.0.1',9001)))"`.
Kết quả trả về `0` — nghĩa là **dịch vụ vẫn đang chạy bình thường**, chỉ có firewall chặn người ngoài. Vậy:
- Firewall chặn gói tin ở tầng nào — trước hay sau khi tới ứng dụng?
- Chỉ bật firewall đã đủ an toàn chưa, hay còn phải tắt luôn dịch vụ không cần thiết?

*(Đáp án nằm ở khái niệm **phòng thủ nhiều lớp / defense in depth**: nên làm cả hai.)*

**Chấm điểm:** `grab_banner` + lưu JSON đúng (25đ) · `compare` phân loại đủ 4 trạng thái (30đ) · chấm điểm + khuyến nghị (20đ) · **dọn dẹp firewall và tắt server sau khi học** (10đ) · trả lời câu hỏi chốt bài (15đ).

---

## Cách Nộp Bài

| Nhóm | Nộp gì |
| :--- | :--- |
| A (localhost) | 3 file `.py` đã hoàn thiện + ảnh chụp Terminal của bài A2 (bảng tốc độ) và A3 (bảng banner) |
| B (LAN) | 3 file `.py` + ảnh chụp Terminal **cả hai máy** ở bài B3 (trước và sau khi vá) + file `snapshot_before.json` |

> Ảnh chụp phải thấy rõ IP mục tiêu. Nếu ảnh cho thấy quét IP công cộng (không thuộc `192.168.x.x` / `10.x.x.x` / `172.16–31.x.x` / `127.0.0.1`), bài bị **0 điểm** theo quy định an toàn của khoá học.

---

## Bảng Tổng Kết Kiến Thức

| Bài | Kỹ thuật cốt lõi | Liên hệ bài giảng |
| :--- | :--- | :--- |
| A1 | `connect_ex()`, dictionary cổng-dịch vụ | Cấp độ 1 + 2 |
| A2 | `threading`, `start()`, `join()`, I/O-bound | Cấp độ 3 |
| A3 | Banner Grabbing, đánh giá rủi ro, remediation | Bài về nhà + Defensive Auditing |
| B1 | `bind("0.0.0.0")` vs `bind("127.0.0.1")`, TCP ping | Case Study PostgreSQL |
| B2 | Host discovery, `Lock`, quy mô mạng | Cấp độ 3 mở rộng |
| B3 | Kiểm chứng bản vá, defense in depth | Hướng dẫn đóng cổng (Remediation) |
