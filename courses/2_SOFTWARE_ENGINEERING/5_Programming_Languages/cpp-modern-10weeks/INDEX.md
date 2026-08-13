# Modern C++ — 10 tuần

Khóa C++20 tập trung vào value semantics, RAII, STL, generic programming và concurrency an toàn.

## Cấu trúc

- [Lịch học](schedule.md)
- `lessons/week01.md` … `week10.md`: bài học.
- `code/week01.cpp` … `week10.cpp`: ví dụ chạy độc lập.
- `exercises/week01` … `week10`: starter cho học viên.
- [Dự án cuối khóa](projects/final_project.md)

## Chạy

```bash
c++ -std=c++20 -Wall -Wextra -Wpedantic code/week01.cpp -o /tmp/cpp-week01
/tmp/cpp-week01
```

Ưu tiên STL và RAII; không dùng `new/delete` trực tiếp khi smart pointer hoặc value giải quyết được.
