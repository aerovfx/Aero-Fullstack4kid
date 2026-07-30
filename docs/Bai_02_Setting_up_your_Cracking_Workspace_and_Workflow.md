# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 2

# Setting up your Cracking Workspace and Workflow

## 1. Mục tiêu bài học

-   Xây dựng môi trường làm việc phục vụ Reverse Engineering.
-   Cài đặt và tổ chức các công cụ cần thiết.
-   Hiểu quy trình phân tích một chương trình thực thi.
-   Quản lý các bài CrackMe và dự án phân tích.
-   Thực hiện workflow chuẩn trước khi debug.

## 2. Kiến thức chính

### Workspace là gì?

Workspace là môi trường làm việc dùng để: - Lưu mẫu chương trình. - Chứa
công cụ phân tích. - Lưu ghi chú và báo cáo. - Quản lý dự án Reverse
Engineering.

Ví dụ cấu trúc:

``` text
ReverseEngineering/
├── CrackMe/
├── Malware/
├── Tools/
├── Notes/
├── Dumps/
├── Screenshots/
└── Reports/
```

### Bộ công cụ cần chuẩn bị

-   x64dbg
-   Detect It Easy (DIE)
-   HxD
-   VS Code hoặc Notepad++
-   ShareX/Snipping Tool
-   VMware hoặc VirtualBox (khuyến nghị)

### Workflow chuẩn

1.  Quan sát file thực thi.
2.  Phân tích bằng Detect It Easy.
3.  Kiểm tra Compiler, Architecture, Packer.
4.  Mở bằng x64dbg.
5.  Đặt Breakpoint.
6.  Theo dõi Registers, Memory và Call Stack.
7.  Ghi chú kết quả và báo cáo.

## 3. Thuật ngữ

  Thuật ngữ     Ý nghĩa
  ------------- -----------------------
  Workspace     Không gian làm việc
  Sample        Chương trình mẫu
  CrackMe       Phần mềm luyện tập RE
  Dump          Dữ liệu trích xuất
  Patch         Chỉnh sửa mã máy
  Offset        Địa chỉ tương đối
  Entry Point   Điểm bắt đầu
  Report        Báo cáo

## 4. Ví dụ

### Cấu trúc dự án

``` text
Week01/
├── Calculator.exe
├── Calculator.md
├── Images/
├── Dump/
└── Patch/
```

### Quy trình

``` text
Calculator.exe
↓
Detect It Easy
↓
PE64
↓
Visual Studio
↓
No Packer
↓
x64dbg
↓
Breakpoint
↓
Analysis
```

## 5. Bài thực hành

1.  Tạo cấu trúc thư mục cho các bài Lab.
2.  Cài đặt x64dbg, Detect It Easy và HxD.
3.  Phân tích một file EXE để xác định:
    -   x86/x64
    -   Compiler
    -   Packer

## 6. Câu hỏi ôn tập

1.  Workspace dùng để làm gì?
2.  Những công cụ nào cần có cho Reverse Engineering?
3.  Workflow chuẩn khi phân tích một chương trình là gì?
4.  Vì sao cần ghi chú trong quá trình debug?
5.  Khi phát hiện file bị packer, cần làm gì?

## 7. Tổng kết

-   Thiết lập môi trường làm việc chuyên nghiệp.
-   Tổ chức tài liệu khoa học.
-   Chuẩn bị đầy đủ công cụ.
-   Áp dụng workflow chuẩn trước khi debug.
