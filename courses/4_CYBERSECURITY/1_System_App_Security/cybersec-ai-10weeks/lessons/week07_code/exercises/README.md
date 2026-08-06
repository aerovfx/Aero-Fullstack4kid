# Tuần 7 — Bài Tập: Hashing & Wi-Fi

Bài giảng: [`../../week07.md`](../../week07.md) · Khung CEH: [`../../CEH_alignment.md`](../../CEH_alignment.md)

**Ánh xạ CEH:** M06 System Hacking · M16 Hacking Wireless

Mỗi bài có file khung `TODO` để bạn tự điền, và lời giải đầy đủ trong `solutions/`.

| File | Nội dung |
| :--- | :--- |
| `ex01_salted_hashing.py` | Băm mật khẩu có salt (PBKDF2) |
| `ex02_dictionary_attack.py` | Tấn công từ điển - vì sao MD5 không salt rất yếu |

## Cách chạy

```bash
python3 ex01_salted_hashing.py
python3 ex02_dictionary_attack.py
```

> Toàn bộ bài tập chỉ dùng **thư viện chuẩn của Python** và **dữ liệu giả lập nhúng sẵn** —
> chạy được ngay, không cần cài scapy/bcrypt/scikit-learn hay gọi API tính phí.
> Bài giảng dùng các thư viện/công cụ thật đó; bài tập tái hiện *nguyên lý* để ai cũng chạy được.

## An toàn

Mọi bài chỉ thao tác trên `127.0.0.1`, mạng nội bộ của chính bạn, hoặc dữ liệu giả lập.
Không nhắm tới hệ thống của người khác — xem quy tắc đạo đức trong [`../../CEH_alignment.md`](../../CEH_alignment.md).
