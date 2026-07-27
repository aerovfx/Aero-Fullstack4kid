# Tuần 4: C++ Multi-threading & Defensive Programming Code

Thư mục này chứa code minh họa cho học phần Tuần 4:

1. `cpp_multithreading.cpp`: Tạo và quản lý luồng trong C++ bằng thư viện `<thread>` và khóa `std::mutex`.
2. `defensive_buffer.cpp`: Minh họa nguyên lý phòng chống lỗi Tràn Bộ Đệm (Buffer Overflow) bằng kỹ thuật sao chép an toàn (Bounds Checking).

## Hướng dẫn Biên dịch / Compile Instructions

```bash
# Biên dịch Multi-threading (cần flag -pthread trên Linux)
g++ -std=c++11 -pthread cpp_multithreading.cpp -o cpp_multithreading
./cpp_multithreading

# Biên dịch Defensive Buffer Demo
g++ -std=c++11 defensive_buffer.cpp -o defensive_buffer
./defensive_buffer
```
