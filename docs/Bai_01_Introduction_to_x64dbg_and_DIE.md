# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 1

# Introduction to x64dbg and Detect It Easy (DIE)

## 1. Mục tiêu bài học

-   Hiểu quy trình Reverse Engineering.
-   Hiểu vai trò của x64dbg và Detect It Easy (DIE).
-   Phân biệt Static Analysis và Dynamic Analysis.

## 2. Kiến thức chính

### Reverse Engineering

Là quá trình phân tích chương trình đã biên dịch để hiểu cách hoạt động
mà không cần mã nguồn.

### Static Analysis

-   Không chạy chương trình.
-   Dùng Detect It Easy để xác định Compiler, Architecture, Packer và
    Protector.

### Dynamic Analysis

-   Chạy chương trình bằng x64dbg.
-   Quan sát Registers, Memory, Stack và Breakpoints.

### Quy trình

1.  Mở file bằng DIE.
2.  Xác định Compiler và Packer.
3.  Mở bằng x64dbg.
4.  Đặt Breakpoint.
5.  Phân tích luồng thực thi.

## 3. Thuật ngữ

  Thuật ngữ             Ý nghĩa
  --------------------- ----------------------
  Reverse Engineering   Phân tích ngược
  Static Analysis       Phân tích tĩnh
  Dynamic Analysis      Phân tích động
  x64dbg                Debugger Windows
  Detect It Easy        Công cụ nhận diện PE
  Breakpoint            Điểm dừng
  Register              Thanh ghi
  Assembly              Hợp ngữ

## 4. Ví dụ

-   `hello.exe`: PE64, Visual Studio, không dùng packer.
-   `CrackMe.exe`: UPX Packed, nên unpack trước khi phân tích.

## 5. Câu hỏi ôn tập

1.  Reverse Engineering là gì?
2.  DIE dùng để làm gì?
3.  Phân biệt Static Analysis và Dynamic Analysis.
4.  Khi gặp UPX Packed cần xử lý như thế nào?
5.  Vì sao nên dùng DIE trước x64dbg?

## 6. Tổng kết

-   Hiểu quy trình Reverse Engineering.
-   Biết sử dụng Detect It Easy.
-   Làm quen với x64dbg.
