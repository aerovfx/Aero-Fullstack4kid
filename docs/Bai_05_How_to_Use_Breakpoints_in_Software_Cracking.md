# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 5

# How to Use Breakpoints in Software Cracking

> Giáo trình được biên soạn theo chủ đề của bài học và các nguyên tắc sử
> dụng Breakpoint trong môi trường học tập về Reverse Engineering.

## 1. Mục tiêu

-   Hiểu khái niệm Breakpoint.
-   Biết các loại Breakpoint trong x64dbg.
-   Đặt, xóa và quản lý Breakpoint.
-   Theo dõi luồng thực thi để phân tích chương trình.
-   Sử dụng Breakpoint hiệu quả trong quá trình debug.

## 2. Kiến thức chính

### Breakpoint là gì?

Breakpoint là điểm dừng được đặt trong chương trình để debugger tạm dừng
thực thi và cho phép quan sát trạng thái hiện tại.

### Các loại Breakpoint

-   Software Breakpoint
-   Hardware Breakpoint
-   Conditional Breakpoint
-   Memory Breakpoint

### Đặt Breakpoint

1.  Mở chương trình bằng x64dbg.
2.  Chọn lệnh cần dừng.
3.  Nhấn **F2** hoặc chọn Toggle Breakpoint.
4.  Nhấn **F9** để chạy đến Breakpoint.

### Quan sát khi dừng

-   Registers
-   Stack
-   Memory Dump
-   Call Stack
-   Disassembly

### Xóa Breakpoint

-   Nhấn **F2** lần nữa hoặc dùng cửa sổ Breakpoints để quản lý.

### Thực hành tốt

-   Đặt Breakpoint tại Entry Point hoặc trước các đoạn mã cần nghiên
    cứu.
-   Ghi chú địa chỉ và mục đích của từng Breakpoint.
-   Hạn chế đặt quá nhiều Breakpoint không cần thiết.

## 3. Thuật ngữ

  Thuật ngữ                Ý nghĩa
  ------------------------ ---------------------------
  Breakpoint               Điểm dừng
  Software Breakpoint      Điểm dừng bằng phần mềm
  Hardware Breakpoint      Điểm dừng bằng phần cứng
  Conditional Breakpoint   Điểm dừng có điều kiện
  Entry Point              Điểm bắt đầu chương trình
  Disassembly              Mã hợp ngữ sau dịch ngược
  Call Stack               Chuỗi lời gọi hàm

## 4. Ví dụ minh họa

### Ví dụ 1

Đặt Breakpoint tại Entry Point, nhấn **F9** và quan sát Registers khi
chương trình dừng.

### Ví dụ 2

Đặt Breakpoint trước lệnh `CALL` để theo dõi việc truyền tham số và kết
quả trả về của hàm.

## 5. Bài thực hành (Lab)

### Lab 1

-   Mở một file EXE bằng x64dbg.
-   Đặt Software Breakpoint tại Entry Point.

### Lab 2

-   Đặt Breakpoint trước một lệnh `CALL`.
-   Quan sát Registers và Stack trước và sau khi thực thi.

### Lab 3

-   Thử tạo Conditional Breakpoint (nếu hỗ trợ) và ghi lại kết quả quan
    sát.

## 6. Câu hỏi ôn tập

1.  Breakpoint là gì?
2.  Phân biệt Software Breakpoint và Hardware Breakpoint.
3.  Phím tắt để bật/tắt Breakpoint trong x64dbg là gì?
4.  Vì sao nên quan sát Registers khi chương trình dừng?
5.  Khi nào nên sử dụng Conditional Breakpoint?

## 7. Tổng kết

-   Hiểu vai trò của Breakpoint trong Debugging.
-   Biết cách đặt và quản lý Breakpoint.
-   Quan sát trạng thái chương trình để phục vụ Reverse Engineering.
-   Áp dụng Breakpoint trong quá trình phân tích phần mềm.
