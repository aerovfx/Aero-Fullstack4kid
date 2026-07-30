# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 2 -- Bài 11

# Crack Serial Key of an Application Software (First Analysis)

> Bài học giới thiệu quy trình phân tích cơ chế kiểm tra **Serial Key**
> của một ứng dụng trong bối cảnh nghiên cứu Reverse Engineering và kiểm
> thử bảo mật trên phần mềm được phép phân tích.

## 1. Mục tiêu

-   Hiểu khái niệm Serial Key và quy trình xác thực.
-   Biết cách lần theo luồng xử lý khi người dùng nhập Serial.
-   Xác định vị trí kiểm tra bằng x64dbg.
-   Quan sát các lời gọi hàm và giá trị trong thanh ghi.

## 2. Kiến thức chính

### 2.1 Serial Key

Serial Key là chuỗi dùng để xác thực bản quyền hoặc kích hoạt phần mềm.

### 2.2 Quy trình xác thực

1.  Người dùng nhập Serial.
2.  Chương trình đọc dữ liệu từ giao diện.
3.  Thực hiện kiểm tra hoặc tính toán.
4.  So sánh kết quả.
5.  Thông báo hợp lệ hoặc không hợp lệ.

### 2.3 Công cụ

-   Detect It Easy (DIE)
-   x64dbg
-   Trình xem PE

### 2.4 Phân tích động

-   Đặt Breakpoint tại các hàm xử lý.
-   Theo dõi Call Stack.
-   Quan sát Registers và Flags.
-   Xác định đường đi của dữ liệu đầu vào.

### 2.5 Quy trình làm việc

-   Phân tích PE.
-   Xác định Entry Point.
-   Theo dõi sự kiện giao diện.
-   Ghi nhận các hàm liên quan đến kiểm tra Serial.

## 3. Thuật ngữ

  Thuật ngữ     Ý nghĩa
  ------------- ---------------------------
  Serial Key    Chuỗi kích hoạt
  Validation    Xác thực
  Breakpoint    Điểm dừng
  Register      Thanh ghi CPU
  Call Stack    Ngăn xếp lời gọi
  Entry Point   Điểm bắt đầu chương trình

## 4. Ví dụ minh họa

-   Quan sát quá trình nhập Serial và theo dõi các hàm được gọi sau khi
    nhấn nút kích hoạt.
-   Ghi lại các API hoặc hàm xử lý xuất hiện trong Call Stack.

## 5. Bài thực hành

1.  Mở chương trình bằng x64dbg.
2.  Nhập nhiều giá trị Serial khác nhau.
3.  Đặt Breakpoint tại các hàm xử lý sự kiện.
4.  Ghi nhận sự thay đổi của Registers và luồng thực thi.

## 6. Câu hỏi ôn tập

1.  Serial Key là gì?
2.  Vì sao cần theo dõi Call Stack?
3.  Breakpoint hỗ trợ quá trình phân tích như thế nào?
4.  Entry Point có vai trò gì?
5.  Những thông tin nào cần ghi lại trong quá trình phân tích?

## 7. Tổng kết

-   Hiểu quy trình xác thực Serial Key.
-   Biết cách theo dõi luồng xử lý bằng x64dbg.
-   Chuẩn bị nền tảng cho các bài học chuyên sâu về phân tích cơ chế xác
    thực trong môi trường nghiên cứu hợp pháp.
