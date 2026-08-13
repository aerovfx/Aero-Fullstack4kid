# Giáo trình Cyber Security – Reverse Engineering

## Tuần 2 – Bài 2

# Nhập Môn x64dbg, Detect It Easy (DIE) & Static PE Triage

---

# 1. Mục tiêu bài học

Sau khi hoàn thành bài này, học viên có thể:

* Hiểu rõ quy trình Reverse Engineering ứng dụng phần mềm Windows.
* Nắm vững vai trò của trình gỡ lỗi (Debugger) và công cụ phân tích tĩnh (Static Triage).
* Làm chủ các tính năng của **Detect It Easy (DIE)** để nhận diện PE Header, Compiler, Packer và Entropy.
* Biết cách cài đặt, cấu hình và mở chương trình thực thi bằng **x64dbg** (x32dbg / x64dbg).
* Phân biệt thành thạo giữa **Static Analysis (Phân tích tĩnh)** và **Dynamic Analysis (Phân tích động)**.

---

# 2. Kiến thức chính

## 2.1 Reverse Engineering là gì?

Reverse Engineering (RE) là quá trình phân tích một chương trình đã biên dịch (file binary `.exe`, `.dll`) để hiểu cách thức nó vận hành mà không cần mã nguồn (Source Code).

```text
hello.exe (Binary)
       ↓
Reverse Engineering
       ↓
Assembly Code → Logic điều khiển → Windows API → Thuật toán
```

### Ứng dụng thực tế:
* **Malware Analysis**: Phân tích hành vi mã độc.
* **Software Security Review**: Kiểm thử an ninh và tìm kiếm lỗ hổng.
* **Vulnerability Research**: Nghiên cứu lỗ hổng bảo mật zero-day.
* **Patch phần mềm**: Sửa lỗi binary khi không còn source code.
* **Digital Forensics**: Điều tra sự cố an toàn thông tin.

---

## 2.2 Static Analysis (Phân tích tĩnh)

Phân tích tĩnh là quá trình kiểm tra, soi chiếu tệp thực thi **mà không thực thi (không chạy) chương trình**.

```text
Target EXE
    ↓
Detect It Easy (DIE)
    ↓
Thông tin thu thập:
- Architecture (x86 / x64)
- PE Format (PE32 / PE32+)
- Compiler (Visual Studio, Delphi, GCC)
- Protector / Packer (UPX, Themida, VMProtect)
- Entropy & Section Headers
```

### Ưu điểm của Static Analysis:
✔ **An toàn tuyệt đối**: Không lo ngại mã độc thực thi mã hại lên hệ thống.  
✔ **Tốc độ nhanh**: Thu thập thông tin cấu trúc file chỉ trong vài giây.  
✔ **Định hướng chiến lược**: Giúp lựa chọn công cụ debugger và quy trình tiếp theo phù hợp.

---

## 2.3 Dynamic Analysis (Phân tích động)

Phân tích động là quá trình theo dõi, giám sát hành vi của chương trình **ngay trong lúc chương trình đang chạy** thông qua trình gỡ lỗi (Debugger).

```text
Target Program
      ↓
   x64dbg
      ↓
CPU Execution
      ↓
[Instructions]  [Registers]  [Memory Window]  [Stack]
```

### Thao tác gỡ lỗi cơ bản trong Dynamic Analysis:
* **Step Into (F7)**: Đi vào bên trong hàm được gọi (`CALL`).
* **Step Over (F8)**: Chạy qua hàm được gọi mà không nhảy vào chi tiết bên trong.
* **Breakpoint (F2)**: Đặt điểm ngắt để dừng chương trình tại địa chỉ lệnh mong muốn.
* **Theo dõi Register**: Quan sát giá trị thay đổi trong thanh ghi CPU (`RAX`, `RBX`, `EIP/RIP`).
* **Quan sát Memory**: Xem dữ liệu thô trong RAM (Hexdump, String references).

---

## 2.4 Detect It Easy (DIE)

DIE là công cụ phân tích tĩnh tiêu chuẩn giúp nhận diện:
* **Trình biên dịch (Compiler)**: Microsoft Visual C/C++, Delphi, Borland, MinGW.
* **Trình liên kết (Linker)**: MS Linker, Turbo Linker.
* **Kiến trúc (Architecture)**: 32-bit (x86) hay 64-bit (x64).
* **Packers & Protections**: UPX, ASPack, Themida, VMProtect, ConfuserEx.

```text
Ví dụ phân tích notepad.exe bằng DIE:
- Format: PE64
- Compiler: Visual Studio 2022
- Architecture: x64
- Packer: None (Mã nguồn nguyên bản)

Ví dụ phân tích Sample_Packed.exe:
- Format: PE32
- Packer: UPX v4.00
→ Kết luận: Cần Unpack trước khi thực hiện Dynamic Analysis!
```

---

## 2.5 Trình gỡ lỗi x64dbg

x64dbg là trình gỡ lỗi mã nguồn mở (Open-source Debugger) phổ biến nhất hiện nay cho Windows (gồm `x32dbg` cho ứng dụng 32-bit và `x64dbg` cho ứng dụng 64-bit).

### Tính năng chính:
* Debug tệp `.exe` và tệp thư viện `.dll`.
* Đặt điểm ngắt (Software Breakpoint `INT 3`, Hardware Breakpoint, Memory Breakpoint).
* Patch trực tiếp mã Assembly và xuất file thực thi đã sửa đổi.
* Memory Dump, Disassembler view, Call Stack window.
* Tìm kiếm chuỗi ký tự (String References) và lời gọi hàm (Intermodular Calls).

---

## 2.6 Quy trình Reverse Engineering chuẩn

```text
  [Tệp thực thi EXE]
          ↓
[Bước 1: Detect It Easy (DIE)]
          ↓
[Bước 2: Kiểm tra Compiler & Architecture (x86/x64)]
          ↓
[Bước 3: Kiểm tra Packer / Protector (UPX/Themida?)]
          ↓
[Bước 4: Chọn x32dbg hoặc x64dbg tương ứng]
          ↓
[Bước 5: Đặt Breakpoint tại Entry Point hoặc Windows API]
          ↓
[Bước 6: Trace luồng điều khiển & Phân tích thuật toán]
```

---

# 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **Reverse Engineering** | Phân tích ngược mã máy thành cấu trúc logic |
| **Static Analysis** | Phân tích tĩnh (không chạy chương trình) |
| **Dynamic Analysis** | Phân tích động (chạy chương trình trong Debugger) |
| **Debugger** | Trình gỡ lỗi (x64dbg, OllyDbg, WinDbg) |
| **x64dbg** | Trình gỡ lỗi GUI mã nguồn mở cho Windows |
| **Detect It Easy (DIE)** | Công cụ nhận diện PE Header, Compiler & Packer |
| **Compiler** | Trình biên dịch mã nguồn thành mã máy |
| **Linker** | Trình liên kết các object file thành file EXE/DLL |
| **Packer** | Công cụ nén/mã hóa file thực thi để giảm dung lượng hoặc chống soi mã |
| **Protector** | Công cụ bảo vệ chống phân tích ngược (Anti-RE/Anti-Debug) |
| **PE File** | Portable Executable (định dạng file thực thi tiêu chuẩn trên Windows) |
| **Register** | Thanh ghi CPU (nơi lưu trữ dữ liệu siêu tốc của vi xử lý) |
| **Memory** | Bộ nhớ RAM làm việc của chương trình |
| **Breakpoint** | Điểm dừng tạm thời khi gỡ lỗi chương trình |
| **Assembly** | Ngôn ngữ hợp ngữ (dạng gợi nhớ của mã máy) |

---

# 4. Ví dụ minh họa

## Ví dụ 1: Triage file `hello.exe` bằng DIE
Mở file `hello.exe` trong Detect It Easy.  
**Kết quả hiển thị**:
```text
PE64
Compiler: Microsoft Visual C/C++ (2019-2022)
Packer: None
```
→ **Chiến lược**: File 64-bit không bị nén/bảo vệ. Dùng `x64dbg` để đính kèm và phân tích trực tiếp.

---

## Ví dụ 2: Triage file `CrackMe_Sample.exe` bị packed
Mở file trong DIE.  
**Kết quả hiển thị**:
```text
PE32
Packer: UPX (3.96) [NRV]
```
→ **Chiến lược**: File 32-bit đã bị nén bằng UPX. Cần dùng lệnh `upx -d CrackMe_Sample.exe` hoặc dump bộ nhớ trong `x32dbg` để unpack trước khi phân tích logic chính.

---

## Ví dụ 3: Quan sát luồng thực thi trong x64dbg
Mở file trong x64dbg:
```assembly
00007FF610311000 | 48:83EC 28              | sub rsp, 28                            | Entry Point
00007FF610311004 | E8 47000000            | call hello.7FF610311050                |
00007FF610311009 | 48:83C4 28              | add rsp, 28                            |
00007FF61031100D | C3                     | ret                                    |
```
→ Thao tác: Nhấn **F2** tại địa chỉ `00007FF610311004` để đặt Breakpoint, sau đó nhấn **F9** (Run) để chương trình dừng đúng tại điểm cần phân tích.

---

# 5. Ghi nhớ

```text
          Bước 1                  Bước 2                    Bước 3
[ Mở DIE kiểm tra PE ] ──► [ Nhận diện Compiler/Packer ] ──► [ Khởi động x64dbg ]
                                                                    │
                                    Bước 5                          ▼
                        [ Phân tích mã Assembly ] ◄── [ Đặt Breakpoint (F2) ]
                                                              Bước 4
```

> **Ghi nhớ cốt lõi**: "Luôn thực hiện Static Analysis với DIE trước để biết đúng kiến trúc (x86/x64) và trạng thái Packer trước khi khởi động trình gỡ lỗi x64dbg!"

---

# 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Công cụ Detect It Easy (DIE) được dùng chủ yếu để làm gì?
A. Mã hóa dữ liệu người dùng  
B. Nhận diện định dạng tệp PE, trình biên dịch (Compiler) và công cụ nén (Packer)  
C. Thay đổi hình nền máy tính  
D. Quét virus toàn bộ ổ cứng  

**Đáp án:** B

---

### Câu 2 (Thông hiểu)
Sự khác biệt cơ bản giữa Static Analysis và Dynamic Analysis là gì?
A. Static Analysis chạy chương trình trên Linux; Dynamic Analysis chạy trên Windows  
B. Static Analysis phân tích khi chương trình không chạy; Dynamic Analysis phân tích khi chương trình đang thực thi trong debugger  
C. Static Analysis dùng cho file video; Dynamic Analysis dùng cho file ảnh  
D. Cả hai là một khái niệm hoàn toàn giống nhau  

**Đáp án:** B

---

### Câu 3 (Thông hiểu)
Khi mở file thực thi bằng DIE, nếu phát hiện trường thông tin `Packer: UPX`, điều này ảnh hưởng thế nào đến quá trình phân tích trong x64dbg?
*Gợi ý trả lời:* Phần mã nguồn thực tế đã bị nén/mã hóa. Nếu mở trực tiếp trong x64dbg mà chưa unpack, ta chỉ thấy mã của trình xả nén (Unpacker stub) chứ chưa thấy mã logic chính của ứng dụng. Cần thực hiện unpack (tĩnh hoặc động) trước.

---

### Câu 4 (Vận dụng)
Bạn nhận được một file `Invoice.exe` nghi ngờ là malware 32-bit được biên dịch bằng C++. Hãy trình bày các bước sơ cứu và phân tích ban đầu bằng DIE và x32dbg.
*Gợi ý trả lời:* 
1. Đưa file vào môi trường Windows VM cô lập, tính hash SHA-256.
2. Mở file bằng DIE để xác nhận kiến trúc (PE32) và kiểm tra packer.
3. Nếu file không bị packed, khởi động `x32dbg`, đính kèm file.
4. Đặt breakpoint tại Entry Point hoặc các hàm Windows API nguy hiểm (`URLDownloadToFile`, `CreateProcess`).
5. Step over (F8) / Step into (F7) để quan sát luồng điều khiển và hành vi.

---

### Câu 5 (Vận dụng)
Vì sao lại có hai phiên bản executable là `x32dbg.exe` và `x64dbg.exe` trong cùng bộ cài x64dbg?
*Gợi ý trả lời:* Vì kiến trúc CPU và cấu trúc thanh ghi/địa chỉ bộ nhớ của ứng dụng 32-bit (x86) và 64-bit (x64) hoàn toàn khác nhau. `x32dbg` dùng để gỡ lỗi ứng dụng 32-bit, còn `x64dbg` dùng cho ứng dụng 64-bit.

---

## Tổng kết bài học

* Làm chủ khái niệm và tầm quan trọng của quy trình Reverse Engineering chuẩn.
* Phân biệt rõ ràng mục đích và thời điểm áp dụng **Static Analysis** và **Dynamic Analysis**.
* Sử dụng thành thạo **Detect It Easy (DIE)** để kiểm tra PE header, compiler và packer.
* Hiểu cách thức hoạt động cơ bản của **x64dbg** và bộ thao tác phím tắt gỡ lỗi (F2, F7, F8, F9).
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.
