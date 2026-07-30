# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 2 -- Bài 9

# Introduction to Cracking Graphical User Interface Based Programs

> Giáo trình giới thiệu phương pháp phân tích các ứng dụng có giao diện
> đồ họa (GUI) bằng kỹ thuật Reverse Engineering trong môi trường học
> tập và nghiên cứu bảo mật.

## 1. Mục tiêu

-   Hiểu cấu trúc của ứng dụng GUI trên Windows.
-   Nhận biết các thành phần như Button, Edit Box, Dialog và Message
    Loop.
-   Hiểu cách chương trình xử lý sự kiện từ người dùng.
-   Chuẩn bị phân tích luồng xử lý của ứng dụng GUI bằng x64dbg.

## 2. Kiến thức chính

### 2.1 Ứng dụng GUI

Một chương trình GUI thường gồm:

-   Cửa sổ (Window)
-   Điều khiển (Controls)
-   Hộp thoại (Dialog)
-   Thanh menu
-   Message Loop

### 2.2 Luồng xử lý

``` text
Người dùng
    ↓
Button / Edit Box
    ↓
Message (WM_COMMAND)
    ↓
Event Handler
    ↓
Kiểm tra dữ liệu
    ↓
Hiển thị kết quả
```

### 2.3 Các API Windows thường gặp

-   CreateWindowEx
-   DialogBox
-   SendMessage
-   GetDlgItemText
-   MessageBox

### 2.4 Phân tích bằng x64dbg

-   Xác định Entry Point.
-   Theo dõi Message Loop.
-   Đặt Breakpoint tại các hàm xử lý sự kiện.
-   Quan sát Registers và Call Stack.

### 2.5 Quy trình phân tích

1.  Mở chương trình.
2.  Xác định giao diện.
3.  Tìm các sự kiện chính.
4.  Theo dõi hàm xử lý.
5.  Phân tích logic.

## 3. Thuật ngữ

  Thuật ngữ       Ý nghĩa
  --------------- ------------------------------
  GUI             Graphical User Interface
  Dialog          Hộp thoại
  Control         Điều khiển giao diện
  Message Loop    Vòng lặp xử lý thông điệp
  Event Handler   Hàm xử lý sự kiện
  WM_COMMAND      Thông điệp từ điều khiển
  API             Giao diện lập trình ứng dụng

## 4. Ví dụ minh họa

### Ví dụ 1

Một hộp đăng nhập gồm:

-   Username
-   Password
-   Login Button

Khi nhấn **Login**, chương trình gửi `WM_COMMAND` đến hàm xử lý để kiểm
tra dữ liệu.

### Ví dụ 2

Đặt Breakpoint tại hàm xử lý nút bấm để quan sát luồng xử lý trong
x64dbg.

## 5. Bài thực hành (Lab)

-   Mở một ứng dụng GUI bằng x64dbg.
-   Xác định các điều khiển chính.
-   Theo dõi thông điệp khi nhấn một nút.
-   Ghi lại Call Stack và các API được gọi.

## 6. Câu hỏi ôn tập

1.  GUI là gì?
2.  Message Loop có vai trò gì?
3.  WM_COMMAND được dùng khi nào?
4.  Vì sao nên đặt Breakpoint tại Event Handler?
5.  Những API nào thường xuất hiện trong ứng dụng GUI?

## 7. Tổng kết

-   Hiểu cấu trúc ứng dụng GUI.
-   Nắm quy trình xử lý sự kiện.
-   Biết cách bắt đầu phân tích ứng dụng GUI bằng x64dbg.
-   Chuẩn bị cho các bài phân tích giao diện và luồng xử lý nâng cao.
