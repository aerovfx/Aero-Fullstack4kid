# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 2 -- Bài 10

# Analysing the PE for a Graphical User Interface (GUI)-Based Program

> Giáo trình giới thiệu cách phân tích tệp PE (Portable Executable) của
> một ứng dụng giao diện đồ họa (GUI) để phục vụ Reverse Engineering
> trong môi trường học tập và nghiên cứu bảo mật.

## 1. Mục tiêu

-   Hiểu cấu trúc tệp PE của ứng dụng GUI.
-   Xác định các thông tin quan trọng trước khi debug.
-   Nhận biết Compiler, Architecture và Entry Point.
-   Kết hợp Detect It Easy (DIE) và x64dbg trong quy trình phân tích.

## 2. Kiến thức chính

### 2.1 PE (Portable Executable)

Tệp PE thường gồm:

-   DOS Header
-   PE Header
-   Optional Header
-   Section Table
-   Sections (.text, .rdata, .data, .rsrc, .idata)

### 2.2 Kiểm tra bằng Detect It Easy

Xác định:

-   PE32 hoặc PE64
-   Compiler
-   Linker
-   Packer/Protector
-   Entry Point

### 2.3 Các Section quan trọng

  Section   Chức năng
  --------- ------------------
  .text     Mã thực thi
  .rdata    Dữ liệu chỉ đọc
  .data     Dữ liệu khởi tạo
  .idata    Import Table
  .rsrc     Tài nguyên GUI

### 2.4 Import Table

Các API GUI thường gặp:

-   CreateWindowEx
-   DialogBoxParam
-   GetDlgItemText
-   SendMessage
-   MessageBox

### 2.5 Workflow

1.  Phân tích PE bằng DIE.
2.  Kiểm tra Sections.
3.  Xác định Entry Point.
4.  Mở bằng x64dbg.
5.  Theo dõi lời gọi API và luồng xử lý GUI.

## 3. Thuật ngữ

  Thuật ngữ      Ý nghĩa
  -------------- ----------------------
  PE             Portable Executable
  Entry Point    Điểm bắt đầu
  Section        Phân vùng của tệp PE
  Import Table   Bảng hàm nhập
  Resource       Tài nguyên giao diện
  Compiler       Trình biên dịch
  Linker         Trình liên kết

## 4. Ví dụ minh họa

### Ví dụ 1

Phân tích một chương trình GUI bằng DIE:

-   PE64
-   Visual Studio
-   Không dùng Packer

### Ví dụ 2

Mở bằng x64dbg và xác định Entry Point trước khi theo dõi các API giao
diện.

## 5. Bài thực hành (Lab)

-   Phân tích một file EXE GUI bằng DIE.
-   Liệt kê các Section.
-   Xác định Import Table.
-   Mở chương trình bằng x64dbg và ghi lại Entry Point.

## 6. Câu hỏi ôn tập

1.  PE là gì?
2.  Vai trò của Section `.text`?
3.  Import Table dùng để làm gì?
4.  Vì sao cần phân tích PE trước khi debug?
5.  Những thông tin nào DIE có thể cung cấp?

## 7. Tổng kết

-   Hiểu cấu trúc PE của ứng dụng GUI.
-   Biết sử dụng DIE để thu thập thông tin ban đầu.
-   Xác định Entry Point và Import Table.
-   Chuẩn bị cho quá trình phân tích động bằng x64dbg.
