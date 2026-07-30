# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 3

# Basic Steps of x64dbg Debugger

> **Lưu ý:** Giáo trình này được biên soạn theo chủ đề của bài học và
> các bước cơ bản khi sử dụng x64dbg trong môi trường học tập về Reverse
> Engineering.

## 1. Mục tiêu

Sau bài học, học viên có thể:

-   Khởi động x64dbg và mở chương trình thực thi.
-   Hiểu giao diện chính của x64dbg.
-   Thực hiện các thao tác Step Into, Step Over và Run.
-   Đặt và quản lý Breakpoint.
-   Quan sát Registers, Stack và Memory.
-   Theo dõi luồng thực thi của chương trình.

## 2. Kiến thức chính

### 2.1 Giao diện x64dbg

Các cửa sổ chính:

-   CPU/Disassembly
-   Registers
-   Stack
-   Memory Map
-   Dump
-   Breakpoints

### 2.2 Mở chương trình

1.  File → Open.
2.  Chọn file EXE.
3.  Chương trình dừng tại Entry Point.

### 2.3 Điều khiển thực thi

-   Run (F9)
-   Pause
-   Restart
-   Stop

### 2.4 Step Debugging

-   Step Into (F7): đi vào lời gọi hàm.
-   Step Over (F8): thực thi lời gọi hàm mà không đi vào.
-   Run Until Return (Ctrl+F9): chạy đến khi hàm hiện tại kết thúc.

### 2.5 Breakpoint

-   Software Breakpoint
-   Hardware Breakpoint
-   Conditional Breakpoint

Breakpoint giúp dừng chương trình tại vị trí mong muốn để quan sát trạng
thái.

### 2.6 Quan sát trạng thái chương trình

-   Registers: RAX, RBX, RCX, RDX...
-   Stack
-   Memory Dump
-   Call Stack

## 3. Thuật ngữ

  Thuật ngữ     Ý nghĩa
  ------------- ---------------------------
  Entry Point   Điểm bắt đầu chương trình
  Breakpoint    Điểm dừng
  Step Into     Đi vào hàm
  Step Over     Bỏ qua việc đi vào hàm
  Run           Tiếp tục chạy
  Registers     Thanh ghi CPU
  Stack         Ngăn xếp
  Memory Dump   Dữ liệu bộ nhớ
  Call Stack    Ngăn xếp lời gọi

## 4. Ví dụ minh họa

### Ví dụ 1

Mở `Hello.exe` bằng x64dbg:

-   Chương trình dừng tại Entry Point.
-   Quan sát Registers.
-   Nhấn F9 để chạy.

### Ví dụ 2

Đặt Breakpoint tại hàm kiểm tra mật khẩu:

1.  Chọn lệnh.
2.  Nhấn F2.
3.  Nhấn F9.
4.  Chương trình dừng tại Breakpoint.
5.  Dùng F7 hoặc F8 để phân tích.

## 5. Bài thực hành (Lab)

### Lab 1

-   Mở một file EXE bằng x64dbg.
-   Xác định Entry Point.

### Lab 2

-   Đặt Breakpoint tại một địa chỉ bất kỳ.
-   Quan sát sự thay đổi của Registers sau mỗi lần Step Into.

### Lab 3

-   So sánh kết quả giữa Step Into và Step Over đối với một lời gọi hàm.

## 6. Câu hỏi ôn tập

1.  Entry Point là gì?
2.  Khác nhau giữa Step Into và Step Over?
3.  Breakpoint dùng để làm gì?
4.  Những cửa sổ nào quan trọng trong x64dbg?
5.  Khi nào nên dùng Hardware Breakpoint?

## 7. Tổng kết

-   Làm quen với giao diện x64dbg.
-   Biết mở và debug chương trình.
-   Sử dụng các chế độ chạy và từng bước.
-   Hiểu vai trò của Breakpoint.
-   Quan sát Registers, Stack và Memory trong quá trình phân tích.
