# Tuần 8 — Bài Tập: AI + OSINT

Bài giảng: [`../../week08.md`](../../week08.md) · Khung CEH: [`../../CEH_alignment.md`](../../CEH_alignment.md)

**Ánh xạ CEH:** M02 Footprinting and Reconnaissance

Mỗi bài có file khung `TODO` để bạn tự điền, và lời giải đầy đủ trong `solutions/`.

| File | Nội dung |
| :--- | :--- |
| `ex01_osint_aggregator.py` | Tổng hợp OSINT & tóm tắt bề mặt tấn công |
| `ex02_prompt_builder.py` | Dựng prompt phân tích rủi ro cho AI |

## Cách chạy

```bash
python3 ex01_osint_aggregator.py
python3 ex02_prompt_builder.py
```

> Toàn bộ bài tập chỉ dùng **thư viện chuẩn của Python** và **dữ liệu giả lập nhúng sẵn** —
> chạy được ngay, không cần cài scapy/bcrypt/scikit-learn hay gọi API tính phí.
> Bài giảng dùng các thư viện/công cụ thật đó; bài tập tái hiện *nguyên lý* để ai cũng chạy được.

## An toàn

Mọi bài chỉ thao tác trên `127.0.0.1`, mạng nội bộ của chính bạn, hoặc dữ liệu giả lập.
Không nhắm tới hệ thống của người khác — xem quy tắc đạo đức trong [`../../CEH_alignment.md`](../../CEH_alignment.md).
