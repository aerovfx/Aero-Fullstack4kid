# Tuần 3: C++ Code Minh Họa / Week 3 Code Samples

Thư mục này chứa các bài thực hành minh họa kiến thức lập trình hệ thống C++ và quản lý bộ nhớ:

1. `pointers_basics.cpp`: Thực hành con trỏ, địa chỉ bộ nhớ và thao tác giải tham chiếu (`*`).
2. `stack_vs_heap.cpp`: So sánh cấp phát biến tĩnh trên Stack và cấp phát động trên Heap (`new`/`delete`).
3. `dangling_pointer_uaf.cpp`: Mô phỏng rủi ro con trỏ lơ lửng (Dangling Pointer) và lỗ hổng Use-After-Free (UAF), kèm cách khắc phục an toàn.

## Hướng dẫn Biên dịch và Chạy / How to Compile and Run

### Trên macOS / Linux:
```bash
g++ -std=c++11 pointers_basics.cpp -o pointers_basics
./pointers_basics

g++ -std=c++11 stack_vs_heap.cpp -o stack_vs_heap
./stack_vs_heap

g++ -std=c++11 dangling_pointer_uaf.cpp -o dangling_pointer_uaf
./dangling_pointer_uaf
```

### Trên Windows (MinGW / GCC):
```cmd
g++ -std=c++11 pointers_basics.cpp -o pointers_basics.exe
pointers_basics.exe
```
