# Tuần 9 — Bài Tập: AI Code Audit & Log

Bài giảng: [`../../week09.md`](../../week09.md) · Khung CEH: [`../../CEH_alignment.md`](../../CEH_alignment.md)

**Ánh xạ CEH:** M05 Vulnerability Analysis (Blue Team)

Mỗi bài có file khung `TODO` để bạn tự điền, và lời giải đầy đủ trong `solutions/`.

| File | Nội dung |
| :--- | :--- |
| `ex01_weblog_attack_detector.py` | Phát hiện tấn công web từ log (SQLi/XSS/Path Traversal) |
| `ex02_code_auditor.py` | Kiểm toán mã nguồn tĩnh theo OWASP |

## Cách chạy

```bash
python3 ex01_weblog_attack_detector.py
python3 ex02_code_auditor.py
```

> Toàn bộ bài tập chỉ dùng **thư viện chuẩn của Python** và **dữ liệu giả lập nhúng sẵn** —
> chạy được ngay, không cần cài scapy/bcrypt/scikit-learn hay gọi API tính phí.
> Bài giảng dùng các thư viện/công cụ thật đó; bài tập tái hiện *nguyên lý* để ai cũng chạy được.

## An toàn

Mọi bài chỉ thao tác trên `127.0.0.1`, mạng nội bộ của chính bạn, hoặc dữ liệu giả lập.
Không nhắm tới hệ thống của người khác — xem quy tắc đạo đức trong [`../../CEH_alignment.md`](../../CEH_alignment.md).
