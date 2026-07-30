# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 4

# Stepping Into Call Function of x64dbg

> Giáo trình được biên soạn theo chủ đề của bài học và kiến thức chuẩn
> về sử dụng x64dbg trong Reverse Engineering.

## 1. Mục tiêu

-   Hiểu lệnh CALL trong Assembly.
-   Phân biệt Step Into và Step Over.
-   Theo dõi quá trình gọi hàm bằng x64dbg.
-   Quan sát Registers và Stack khi CALL được thực thi.
-   Xác định luồng thực thi giữa hàm gọi và hàm được gọi.

## 2. Kiến thức chính

### Lệnh CALL

Lệnh `CALL` chuyển điều khiển đến một hàm khác.

Quy trình: 1. Lưu Return Address lên Stack. 2. Chuyển RIP/EIP đến hàm
được gọi. 3. Thực thi hàm. 4. Gặp `RET` sẽ quay lại địa chỉ đã lưu.

### Step Into (F7)

-   Đi vào bên trong hàm.
-   Dùng để phân tích thuật toán và luồng thực thi.

### Step Over (F8)

-   Thực thi toàn bộ hàm.
-   Không đi vào chi tiết bên trong.

### Stack và Registers

Quan sát: - RIP/EIP - RSP/ESP - RBP/EBP - RAX - RCX - RDX

### Call Stack

Hiển thị chuỗi lời gọi hàm:

``` text
main()
↓
login()
↓
verify()
↓
compare()
```

## 3. Thuật ngữ

  Thuật ngữ        Ý nghĩa
  ---------------- -------------------
  CALL             Lệnh gọi hàm
  RET              Lệnh trả về
  Step Into        Đi vào hàm
  Step Over        Chạy qua hàm
  Call Stack       Chuỗi lời gọi hàm
  Return Address   Địa chỉ quay về
  RIP/EIP          Thanh ghi lệnh
  Stack Pointer    Con trỏ Stack

## 4. Ví dụ minh họa

### Ví dụ 1

``` asm
CALL Login
```

Nhấn **F7** để đi vào hàm `Login`.

### Ví dụ 2

``` asm
CALL MessageBoxA
```

Nhấn **F8** để bỏ qua việc phân tích API Windows và tiếp tục dòng kế
tiếp.

## 5. Bài thực hành (Lab)

### Lab 1

-   Mở một chương trình bằng x64dbg.
-   Tìm một lệnh CALL.
-   So sánh F7 và F8.

### Lab 2

Quan sát sự thay đổi của RIP, RSP và Stack trước và sau CALL.

### Lab 3

Vẽ sơ đồ Call Stack của một chuỗi hàm trong chương trình.

## 6. Câu hỏi ôn tập

1.  CALL dùng để làm gì?
2.  Khác nhau giữa F7 và F8?
3.  Return Address được lưu ở đâu?
4.  Call Stack có vai trò gì?
5.  Khi nào nên dùng Step Into?

## 7. Tổng kết

-   Hiểu cơ chế CALL và RET.
-   Thành thạo Step Into và Step Over.
-   Quan sát Registers, Stack và Call Stack.
-   Áp dụng trong Reverse Engineering và Debugging.
