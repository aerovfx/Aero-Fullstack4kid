# Tuần 4 — Bài Tập: C++ Đa Luồng & Buffer Overflow

Bài giảng: [`../../week04.md`](../../week04.md) · Khung CEH: [`../../CEH_alignment.md`](../../CEH_alignment.md)

**Ánh xạ CEH:** M06 System Hacking

Mỗi bài có file khung `TODO` để bạn tự điền, và lời giải đầy đủ trong `solutions/`.

| File | Nội dung |
| :--- | :--- |
| `ex01_race_condition.cpp` | Sửa race condition bằng mutex |
| `ex02_safe_input.cpp` | Nhập liệu an toàn, chống tràn bộ đệm |

## Cách chạy

```bash
g++ -std=c++17 ex01_race_condition.cpp -o bai1 -pthread && ./bai1
```

> Cần trình biên dịch `g++` (Linux/macOS có sẵn hoặc cài qua Xcode Command Line Tools).

## An toàn

Mọi bài chỉ thao tác trên `127.0.0.1`, mạng nội bộ của chính bạn, hoặc dữ liệu giả lập.
Không nhắm tới hệ thống của người khác — xem quy tắc đạo đức trong [`../../CEH_alignment.md`](../../CEH_alignment.md).
