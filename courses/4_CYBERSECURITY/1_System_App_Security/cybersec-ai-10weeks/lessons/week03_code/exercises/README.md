# Tuần 3 — Bài Tập: C++ Con Trỏ & Bộ Nhớ

Bài giảng: [`../../week03.md`](../../week03.md) · Khung CEH: [`../../CEH_alignment.md`](../../CEH_alignment.md)

**Ánh xạ CEH:** M06 System Hacking (nền tảng khai thác bộ nhớ)

Mỗi bài có file khung `TODO` để bạn tự điền, và lời giải đầy đủ trong `solutions/`.

| File | Nội dung |
| :--- | :--- |
| `ex01_pointer_swap.cpp` | Hoán đổi giá trị bằng con trỏ |
| `ex02_heap_array.cpp` | Mảng động trên Heap, không rò rỉ bộ nhớ |

## Cách chạy

```bash
g++ -std=c++17 ex01_pointer_swap.cpp -o bai1 && ./bai1
```

> Cần trình biên dịch `g++` (Linux/macOS có sẵn hoặc cài qua Xcode Command Line Tools).

## An toàn

Mọi bài chỉ thao tác trên `127.0.0.1`, mạng nội bộ của chính bạn, hoặc dữ liệu giả lập.
Không nhắm tới hệ thống của người khác — xem quy tắc đạo đức trong [`../../CEH_alignment.md`](../../CEH_alignment.md).
