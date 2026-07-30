# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 6

# Reversing Jumps in Software Cracking

> Giáo trình được biên soạn theo chủ đề của bài học và kiến thức chuẩn
> về Jump Instructions trong Assembly và Reverse Engineering.

## 1. Mục tiêu

-   Hiểu cơ chế hoạt động của các lệnh Jump.
-   Phân biệt JMP, JE/JZ, JNE/JNZ, JG, JL, JGE, JLE.
-   Hiểu mối quan hệ giữa CMP và các lệnh nhảy có điều kiện.
-   Theo dõi luồng thực thi bằng x64dbg.

## 2. Kiến thức chính

### Jump Instruction

Có hai nhóm:

-   Jump không điều kiện (`JMP`)
-   Jump có điều kiện (`JE`, `JNE`, `JG`, `JL`, `JGE`, `JLE`)

### CMP và FLAGS

Sau lệnh `CMP`, CPU cập nhật:

-   ZF (Zero Flag)
-   CF (Carry Flag)
-   SF (Sign Flag)
-   OF (Overflow Flag)

Các lệnh Jump sử dụng các cờ này để quyết định hướng thực thi.

### Các lệnh Jump phổ biến

-   `JMP`: luôn nhảy.
-   `JE/JZ`: nhảy nếu bằng nhau.
-   `JNE/JNZ`: nhảy nếu khác nhau.
-   `JG`: nhảy nếu lớn hơn.
-   `JL`: nhảy nếu nhỏ hơn.
-   `JGE`: nhảy nếu lớn hơn hoặc bằng.
-   `JLE`: nhảy nếu nhỏ hơn hoặc bằng.

### Quan sát bằng x64dbg

1.  Đặt Breakpoint.
2.  Thực hiện `CMP`.
3.  Quan sát FLAGS.
4.  Theo dõi Jump và nhánh được chọn.

### Ứng dụng

-   Kiểm tra mật khẩu.
-   Kiểm tra Serial Key.
-   Điều khiển luồng chương trình.
-   Phân tích logic phần mềm.

## 3. Thuật ngữ

  Thuật ngữ   Ý nghĩa
  ----------- ------------------------------
  JMP         Nhảy không điều kiện
  JE/JZ       Jump if Equal / Zero
  JNE/JNZ     Jump if Not Equal / Not Zero
  JG          Jump if Greater
  JL          Jump if Less
  CMP         So sánh
  FLAGS       Thanh ghi cờ
  ZF          Zero Flag
  CF          Carry Flag
  SF          Sign Flag
  OF          Overflow Flag

## 4. Ví dụ minh họa

### Ví dụ 1

``` asm
CMP EAX,5
JE Correct
```

Nếu `EAX = 5` thì chương trình nhảy tới `Correct`.

### Ví dụ 2

``` asm
CMP EAX,5
JNE Wrong
```

Nếu `EAX ≠ 5` thì chương trình chuyển sang nhánh `Wrong`.

## 5. Bài thực hành (Lab)

### Lab 1

Quan sát các lệnh `CMP`, `JE`, `JNE` trong x64dbg và theo dõi ZF.

### Lab 2

Vẽ sơ đồ luồng thực thi của một chương trình có nhiều nhánh.

### Lab 3

Theo dõi sự thay đổi của ZF, CF, SF và OF sau các lệnh `CMP` và `TEST`.

## 6. Câu hỏi ôn tập

1.  Phân biệt JMP và JE.
2.  Vai trò của lệnh CMP là gì?
3.  ZF ảnh hưởng như thế nào đến JE và JNE?
4.  Vì sao cần quan sát FLAGS?
5.  Jump Instructions có vai trò gì trong Reverse Engineering?

## 7. Tổng kết

-   Hiểu cơ chế hoạt động của các lệnh Jump.
-   Biết đọc các nhánh điều kiện trong Assembly.
-   Quan sát FLAGS và luồng thực thi bằng x64dbg.
-   Vận dụng kiến thức để phân tích logic chương trình.
