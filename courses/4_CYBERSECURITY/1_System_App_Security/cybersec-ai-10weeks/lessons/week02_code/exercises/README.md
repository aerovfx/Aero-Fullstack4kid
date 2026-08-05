# Nhóm A — Bài tập một máy (Localhost)

Đề bài đầy đủ: [`../../week02_exercises.md`](../../week02_exercises.md)

## Cách chạy

**Terminal 1** — mở "con mồi" (3 cổng giả trên `127.0.0.1`):

```bash
python3 lab_target_server.py
```

**Terminal 2** — làm bài:

```bash
python3 ex01_service_checklist.py      # Checklist dịch vụ     (~15 phút)
python3 ex02_speed_battle.py           # Vòng lặp vs đa luồng  (~20 phút)
python3 ex03_mini_audit_report.py      # Báo cáo kiểm toán     (~20 phút)
```

Học xong nhấn `Ctrl + C` ở Terminal 1 để đóng các cổng lab.

## File trong thư mục

| File | Nội dung |
| :--- | :--- |
| `lab_target_server.py` | Server giả lập, mở cổng 9001/9002/9003 trên localhost |
| `ex01_service_checklist.py` | Bài A1 — khung code có `TODO` |
| `ex02_speed_battle.py` | Bài A2 — khung code có `TODO` |
| `ex03_mini_audit_report.py` | Bài A3 — khung code có `TODO` |
| `solutions/` | Đáp án đầy đủ (dành cho giáo viên hoặc tự đối chiếu sau khi làm) |

## An toàn

Toàn bộ nhóm A chỉ quét `127.0.0.1`. Đổi `target_ip` sang địa chỉ khác = 0 điểm.
