# Nhóm B — Bài tập hai máy trong cùng mạng LAN

Đề bài đầy đủ: [`../../week02_exercises.md`](../../week02_exercises.md)

> [!WARNING]
> **Chỉ chạy khi cả 3 điều sau đều đúng:**
> 1. Cả Máy A và Máy B đều là máy **của bạn** hoặc của lớp học do giáo viên cấp.
> 2. Mạng LAN là mạng riêng ở nhà / phòng lab — **không phải** Wi-Fi trường học, công ty, ký túc xá, quán cà phê hay mạng công cộng.
> 3. Bạn đã được chủ mạng đồng ý.
>
> Quét máy của người khác mà không được phép là hành vi vi phạm pháp luật.
> Các file trong thư mục này đều có hàm chặn IP công cộng và bước hỏi xác nhận `YES` — **không được xoá**.

## Sơ đồ

```text
   [MÁY A - Mục tiêu / Blue Team]          [MÁY B - Scanner / Red Team]
   chạy lan_target_server.py       <---->  chạy lan_ex01 / 02 / 03
   mở cổng 9001, 9002, 9003                tìm và phân tích các cổng đó
                    \                     /
                     \___ Wi-Fi nhà bạn __/
```

## Cách chạy

**Trên MÁY A:**

```bash
python3 lan_target_server.py
# gõ YES để xác nhận -> chương trình in ra IP Máy A -> đọc cho bạn ở Máy B
```

**Trên MÁY B:**

```bash
python3 lan_ex01_first_contact.py             # B1 — Bắt liên lạc        (~20 phút)
python3 lan_ex02_host_discovery.py            # B2 — Điểm danh thiết bị  (~25 phút)
python3 lan_ex03_firewall_duel.py before      # B3 — hiệp 1
# ... Máy A bật firewall chặn 9001, 9002 ...
python3 lan_ex03_firewall_duel.py after       # B3 — hiệp 3
```

## File trong thư mục

| File | Nội dung |
| :--- | :--- |
| `lan_target_server.py` | Chạy trên **Máy A** — mở cổng lab ra LAN, in IP của mình |
| `lan_ex01_first_contact.py` | Bài B1 — khung code có `TODO` |
| `lan_ex02_host_discovery.py` | Bài B2 — khung code có `TODO` |
| `lan_ex03_firewall_duel.py` | Bài B3 — khung code có `TODO` |
| `solutions/` | Đáp án đầy đủ |

## Dọn dẹp sau buổi học (bắt buộc)

```bash
# Máy A: tắt server lab
Ctrl + C

# Máy A: xoá luật firewall đã thêm ở bài B3
sudo ufw delete deny 9001 && sudo ufw delete deny 9002        # Linux
```

```powershell
Remove-NetFirewallRule -DisplayName "Block Lab 9001"          # Windows
Remove-NetFirewallRule -DisplayName "Block Lab 9002"
```

## Khắc phục sự cố

| Triệu chứng | Nguyên nhân thường gặp |
| :--- | :--- |
| Máy B không thấy cổng nào của Máy A | Firewall Máy A đang bật sẵn, hoặc hai máy khác Wi-Fi |
| Máy B không thấy cả Máy A lẫn router | Router bật "AP isolation / Client isolation" — tắt trong trang quản trị router |
| `is_alive()` báo máy tắt dù máy đang bật | Máy A chặn toàn bộ kết nối đến; thử tạm tắt firewall Máy A ở bài B1 |
| Sai IP | Chạy lại `ipconfig` (Windows) hoặc `ifconfig` / `ip addr` (macOS, Linux) trên Máy A |
