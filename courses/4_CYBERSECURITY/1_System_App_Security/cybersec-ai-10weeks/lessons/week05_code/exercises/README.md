# Tuần 5 — Bài Tập: Kali Linux & Nmap

Bài giảng: [`../../week05.md`](../../week05.md) · Khung CEH: [`../../CEH_alignment.md`](../../CEH_alignment.md)

**Ánh xạ CEH:** M03 Scanning · M05 Vulnerability Analysis

Mỗi bài có file khung `TODO` để bạn tự điền, và lời giải đầy đủ trong `solutions/`.

| File | Nội dung |
| :--- | :--- |
| `ex01_service_risk_report.py` | Báo cáo rủi ro dịch vụ từ output ss/netstat |
| `ex02_safe_nmap_wrapper.py` | Wrapper Nmap có chốt chặn mục tiêu an toàn |

## Cách chạy

```bash
python3 ex01_service_risk_report.py
python3 ex02_safe_nmap_wrapper.py
```

> Toàn bộ bài tập chỉ dùng **thư viện chuẩn của Python** và **dữ liệu giả lập nhúng sẵn** —
> chạy được ngay, không cần cài scapy/bcrypt/scikit-learn hay gọi API tính phí.
> Bài giảng dùng các thư viện/công cụ thật đó; bài tập tái hiện *nguyên lý* để ai cũng chạy được.

## An toàn

Mọi bài chỉ thao tác trên `127.0.0.1`, mạng nội bộ của chính bạn, hoặc dữ liệu giả lập.
Không nhắm tới hệ thống của người khác — xem quy tắc đạo đức trong [`../../CEH_alignment.md`](../../CEH_alignment.md).
