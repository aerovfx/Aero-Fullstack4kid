# Giáo trình Cyber Security – Reverse Engineering

## Tuần 4 – Bài 4

# Cơ Chế Debugging: Stepping, Call Stack & Breakpoints Trong x64dbg

---

# 1. Mục tiêu bài học

Sau khi hoàn thành bài này, học viên có thể:

* Làm chủ các phím tắt và thao tác gỡ lỗi trong x64dbg: **Step Over (F8)**, **Step Into (F7)**, **Run (F9)**, **Execute Till Return (Ctrl+F9)**.
* Đọc hiểu cửa sổ **Call Stack** và quản lý các khung gọi hàm (Call Frames).
* Phân biệt và ứng dụng 3 loại điểm ngắt chính: **Software Breakpoint (INT 3)**, **Hardware Breakpoint (DR0-DR7)** và **Memory Breakpoint**.
* Sử dụng Breakpoint hiệu quả để tìm điểm kiểm tra logic đăng ký mà không mất thời gian đọc toàn bộ mã máy.

---

# 2. Kiến thức chính

## 2.1 Các Thao Tác Stepping Trong Debugger

Khi đính kèm ứng dụng vào x64dbg, chương trình tạm dừng ở điểm ngắt hệ thống. Người phân tích sử dụng các thao tác Stepping để duyệt qua từng dòng lệnh Assembly:

```text
[Phím tắt]    [Tên thao tác]          [Hành vi gỡ lỗi]
─────────────────────────────────────────────────────────────────────────────
F7            Step Into               Đi vào bên trong hàm của lệnh CALL
F8            Step Over               Chạy qua lệnh CALL mà không nhảy vào trong
F9            Run / Continue          Cho phép chương trình chạy tự do tới Breakpoint tiếp theo
Ctrl + F9     Execute till Return     Chạy liên tục cho đến khi gặp lệnh RET của hàm hiện tại
Alt + F9      Run to User Code        Chạy thoát khỏi DLL hệ thống về mã nguồn ứng dụng
```

---

## 2.2 Call Stack và Quản Lý Khung Gọi Hàm (Call Frames)

Call Stack là cửa sổ trong x64dbg ghi lại chuỗi các lệnh `CALL` đã dẫn chương trình đến vị trí hiện tại.

```text
Cửa sổ Call Stack trong x64dbg:
Address          Return Address    Function / Module
──────────────────────────────────────────────────────────────────────────────
00007FF610001050 00007FF610001200  toy_validator.check_serial (Mã ứng dụng)
00007FF610001200 00007FF82A104030  toy_validator.main
00007FF82A104030 0000000000000000  KERNEL32.BaseThreadInitThunk (Windows OS)
```

### Ý nghĩa của Call Stack:
* Giúp người phân tích xác định **nguồn gốc hàm nào đã gọi hàm hiện tại**.
* Cho phép click đúp vào dòng địa chỉ trong Call Stack để quay lại vị trí gọi hàm trước đó.

---

## 2.3 Các Loại Breakpoints (Điểm Ngắt) Chi Tiết

Breakpoints là công cụ giúp "đóng băng" thời gian thực thi của chương trình tại một thời điểm hoặc vị trí cụ thể.

```text
    ┌──────────────────────────────────────────────────────────────┐
    │                     Hệ Thống Breakpoint                      │
    └──────────────────────────────┬───────────────────────────────┘
                                   │
      ┌────────────────────────────┼────────────────────────────┐
      ▼                            ▼                            ▼
[Software Breakpoint]     [Hardware Breakpoint]       [Memory Breakpoint]
- Mã op: 0xCC (INT 3)     - Thanh ghi DR0-DR7         - Đổi PAGE protection
- Dễ bị Anti-Debug phát   - Khó bị phát hiện          - Bẫy đọc/ghi vùng nhớ
  hiện (Check 0xCC)       - Tối đa 4 điểm ngắt        - Tốc độ chậm hơn
```

### 1. Software Breakpoint (Phím tắt F2):
Debugger ghi đè opcode byte đầu tiên tại địa chỉ đích bằng `0xCC` (ngắt phần mềm `INT 3`). Khi CPU chạy tới địa chỉ đó, ngắt `INT 3` được kích hoạt và trả quyền kiểm soát lại cho Debugger.

### 2. Hardware Breakpoint:
Sử dụng các thanh ghi gỡ lỗi chuyên dụng trên vi xử lý x86/x64 (`DR0`, `DR1`, `DR2`, `DR3` để lưu địa chỉ; `DR7` để lưu cấu hình ngắt khi Đọc/Ghi/Thực thi).  
✔ **Ưu điểm**: Không sửa đổi mã trong bộ nhớ RAM, vượt qua kỹ thuật quét `0xCC` anti-debugging.

### 3. Memory Breakpoint:
Debugger thay đổi quyền bảo vệ của trang bộ nhớ (Memory Page Protection) thành `PAGE_NOACCESS` hoặc `PAGE_GUARD`. Khi chương trình truy cập trang nhớ này, một ngoại lệ được kích hoạt để tạm dừng.

---

# 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **Step Into (F7)** | Lệnh gỡ lỗi đi sâu vào trong hàm |
| **Step Over (F8)** | Lệnh gỡ lỗi nhảy qua hàm |
| **Software BP (INT 3)** | Điểm ngắt phần mềm bằng byte 0xCC |
| **Hardware BP (DR0-DR7)** | Điểm ngắt phần cứng bằng thanh ghi CPU Debug Registers |
| **Memory BP** | Điểm ngắt bộ nhớ khi có thao tác Đọc/Ghi |
| **Call Stack** | Ngăn xếp lưu lịch sử chuỗi lời gọi hàm |
| **Return Address** | Địa chỉ trả về trên Stack khi kết thúc hàm |
| **Entry Point (EP)** | Địa chỉ lệnh đầu tiên được thực thi của file PE |

---

# 4. Ví dụ minh họa

## Ví dụ 1: Đặt Software Breakpoint tại điểm kiểm tra Serial

Trong x64dbg, chuyển tới địa chỉ `0x00401580` chứa lệnh so sánh:
```assembly
00401580 | 83F8 00 | cmp eax, 0 | Đặt Breakpoint nhấn F2 tại đây (Biến 83 thành CC ngầm)
```
Nhấn **F9** để chạy ứng dụng. Nhập chuỗi serial bất kỳ vào phần mềm và nhấn Submit. Chương trình sẽ dừng ngay lập tức tại dòng `00401580`.

---

## Ví dụ 2: Dùng Hardware Breakpoint bẫy chuỗi Password nhập vào

1. Nhập chuỗi `"MySecretPass"` trên giao diện ứng dụng.
2. Tìm địa chỉ chuỗi `"MySecretPass"` trong Cửa sổ Memory Map (Địa chỉ `0x0250AB80`).
3. Click chuột phải vào địa chỉ `0x0250AB80` → **Breakpoint** → **Hardware, Access** → **Byte**.
4. Nhấn **F9** để tiếp tục. Ngay khi chương trình đọc từng ký tự để kiểm tra, Hardware Breakpoint sẽ kích hoạt dừng CPU đúng dòng lệnh đọc password!

---

# 5. Ghi nhớ

```text
[Nhập liệu trên GUI] ──► [Kích hoạt Hardware BP trên Memory / Software BP tại API]
                                                 │
                                                 ▼
[Chương trình tạm dừng] ◄── [Debugger bắt ngắt INT 3 / DR0-DR7 Exception]
         │
         ▼
[Dùng F8 (Step Over) / F7 (Step Into) để trace logic kiểm tra]
```

> **Ghi nhớ**: "Hardware Breakpoint ngắt trên vùng nhớ (Access/Write) là vũ khí tối thượng để tìm kiếm đoạn mã xử lý dữ liệu nhập vào mà không cần đọc mã nguồn!"

---

# 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Phím tắt nào trong x64dbg dùng để thực hiện thao tác Step Over (chạy qua lệnh `CALL` mà không nhảy vào trong hàm)?
A. F7  
B. F8  
C. F9  
D. F2  

**Đáp án:** B

---

### Câu 2 (Thông hiểu)
Software Breakpoint mặc định trong x64dbg hoạt động bằng cơ chế nào bên dưới bộ nhớ?
A. Thay đổi giá trị thanh ghi RAX thành 0  
B. Ghi đè byte lệnh đầu tiên bằng opcode 0xCC (lệnh ngắt INT 3)  
C. Xóa file EXE khỏi ổ cứng  
D. Đóng chương trình đang chạy  

**Đáp án:** B

---

### Câu 3 (Thông hiểu)
Tại sao Hardware Breakpoint lại có khả năng chống lại các kỹ thuật phát hiện debugger (Anti-debugging) tốt hơn Software Breakpoint?
*Gợi ý trả lời:* Vì Hardware Breakpoint dùng các thanh ghi phần cứng của CPU (`DR0-DR7`) để bẫy điểm dừng chứ không sửa đổi mã byte trong bộ nhớ RAM (không chèn byte `0xCC`), do đó các kỹ thuật quét toàn vẹn bộ nhớ (Checksum/CRC) không phát hiện được.

---

### Câu 4 (Vận dụng)
Khi đang gỡ lỗi một hàm trong x64dbg, chương trình vô tình nhảy vào một DLL hệ thống của Windows (`NTDLL.DLL`). Bạn sử dụng phím tắt hoặc thao tác nào để thoát nhanh về lại mã nguồn của ứng dụng chính?
*Gợi ý trả lời:* Nhấn **Alt + F9** (Run to User Code) hoặc nhấn **Ctrl + F9** (Execute till Return) rồi nhấn **F7/F8** để thoát khỏi DLL hệ thống về mã ứng dụng.

---

### Câu 5 (Vận dụng)
Trình bày các bước dùng Call Stack để xác định hàm chính kiểm tra bản quyền khi chương trình hiển thị hộp thoại thông báo lỗi `"Invalid Serial Key"`.
*Gợi ý trả lời:* 
1. Đặt Software Breakpoint tại hàm Windows API hiển thị thông báo (`MessageBoxA/W`).
2. Nhập key sai để chương trình kích hoạt breakpoint dừng tại `MessageBoxA`.
3. Mở cửa sổ **Call Stack** trong x64dbg.
4. Click đúp vào dòng Call Frame ngay bên dưới `MessageBoxA` (thuộc module ứng dụng chính) để quay lại vị trí ngay sau câu lệnh `CALL MessageBox`.
5. Cuộn ngược lên vài dòng Assembly để tìm câu lệnh `CMP/TEST` và `JNE/JE` đã dẫn đến thông báo lỗi.

---

## Tổng kết bài học

* Làm chủ các thao tác Stepping (F7, F8, F9, Ctrl+F9, Alt+F9).
* Phân tích và truy vết nguồn gốc câu lệnh bằng cửa sổ **Call Stack**.
* Phân biệt sâu sắc cơ chế của Software, Hardware và Memory Breakpoint.

---

# Bổ sung: Giao Diện x64dbg, Cơ Chế CALL/RET & Conditional Breakpoint

## Phần A — Giao Diện x64dbg Chi Tiết (Bài 3)

### A.1 Các cửa sổ chính trong x64dbg

```text
┌─────────────────────────────────────────────────────────────────────┐
│                        x64dbg Main Window                           │
├──────────────────────┬──────────────────────────────────────────────┤
│  CPU / Disassembly   │  Registers (RAX, RBX, RCX, RDX, RSP, RBP,   │
│  (Mã Assembly)       │            RIP, RFLAGS...)                   │
├──────────────────────┼──────────────────────────────────────────────┤
│  Stack               │  Dump / Hexview                              │
│  (Ngăn xếp)          │  (Bộ nhớ dạng Hex)                          │
├──────────────────────┴──────────────────────────────────────────────┤
│  Tabs: Breakpoints | Memory Map | Call Stack | Handles | Threads    │
└─────────────────────────────────────────────────────────────────────┘
```

| Cửa sổ | Vai trò |
|---|---|
| **CPU / Disassembly** | Hiển thị mã Assembly tại vị trí RIP hiện tại |
| **Registers** | Hiển thị giá trị tức thời của tất cả thanh ghi CPU |
| **Stack** | Hiển thị dữ liệu trên Ngăn xếp (vùng RSP đang trỏ) |
| **Memory Map** | Liệt kê tất cả vùng nhớ được cấp phát cho tiến trình |
| **Dump / Hexview** | Xem bộ nhớ dạng thô (Hex + ASCII) |
| **Breakpoints** | Danh sách và quản lý tất cả điểm ngắt đã đặt |
| **Call Stack** | Chuỗi lời gọi hàm dẫn đến vị trí hiện tại |

### A.2 Mở chương trình trong x64dbg

```text
Cách 1: Menu File → Open → Chọn file EXE
Cách 2: Kéo thả file EXE vào cửa sổ x64dbg
Cách 3: Command Line: x64dbg.exe "C:\path\to\target.exe"

→ Chương trình tự động dừng tại System Breakpoint (trước Entry Point)
→ Nhấn F9 để chạy tiếp đến Entry Point của ứng dụng
```

### A.3 Phím tắt điều khiển thực thi tổng hợp

| Phím tắt | Tên | Hành vi |
|---|---|---|
| **F2** | Toggle Breakpoint | Bật/tắt Software Breakpoint tại dòng hiện tại |
| **F7** | Step Into | Đi vào bên trong hàm của lệnh CALL |
| **F8** | Step Over | Chạy qua lệnh CALL mà không đi vào |
| **F9** | Run / Continue | Chạy tiếp đến Breakpoint tiếp theo |
| **Ctrl + F9** | Execute till Return | Chạy đến lệnh RET của hàm hiện tại |
| **Alt + F9** | Run to User Code | Thoát khỏi DLL hệ thống về mã ứng dụng |
| **Ctrl + G** | Go to Address | Chuyển Disassembly tới địa chỉ cụ thể |
| **F4** | Run to Cursor | Chạy đến dòng lệnh đang được chọn |

---

## Phần B — Cơ Chế CALL & RET Chi Tiết (Bài 4)

### B.1 Lệnh CALL — Gọi hàm

Khi CPU thực thi lệnh `CALL target_function`:
1. **Push Return Address**: CPU đẩy địa chỉ lệnh tiếp theo (sau CALL) lên Stack.
2. **Jump**: CPU cập nhật `RIP/EIP` về địa chỉ đầu tiên của hàm đích.
3. **Execute**: CPU thực thi các lệnh trong hàm đích.

```assembly
; Ví dụ: CALL tại địa chỉ 0x00401050
00401050 | E8 AB000000 | CALL verify_serial   ; Push 0x00401055, JMP verify_serial
00401055 | 83F8 01     | CMP EAX, 1           ; Lệnh tiếp theo sau CALL (Return Address)
```

```text
Stack trước CALL:             Stack sau CALL:
┌──────────────┐              ┌──────────────┐
│              │              │  0x00401055  │ ← RSP (Return Address được đẩy vào)
│              │              │              │
└──────────────┘              └──────────────┘
```

### B.2 Lệnh RET — Trả về từ hàm

Khi CPU thực thi lệnh `RET`:
1. **Pop Return Address**: CPU lấy địa chỉ từ đỉnh Stack (`RSP`).
2. **Jump Back**: CPU cập nhật `RIP/EIP` về địa chỉ vừa lấy.
3. `RSP` tăng lên 8 bytes (x64) hoặc 4 bytes (x86).

### B.3 Chuỗi Call Stack thực tế

```text
Cửa sổ Call Stack trong x64dbg (đọc từ dưới lên trên):
───────────────────────────────────────────────────────────────────
Address          Return Address    Function/Module
00401010         00401080          toy_validator.main
00401080         004010C0          toy_validator.check_login
004010C0         004010F0          toy_validator.verify_serial
004010F0         004010FF          toy_validator.compare_strings   ← Đang ở đây
───────────────────────────────────────────────────────────────────
```

**Cách sử dụng**: Click đúp vào bất kỳ dòng nào trong Call Stack để x64dbg chuyển Disassembly tới vị trí lời gọi hàm tương ứng.

---

## Phần C — Conditional Breakpoint & Memory Breakpoint Chi Tiết (Bài 5)

### C.1 Conditional Breakpoint (Điểm ngắt có điều kiện)

Conditional Breakpoint chỉ dừng chương trình khi một điều kiện cụ thể được thỏa mãn, giúp tránh phải dừng hàng trăm lần ở vòng lặp không cần thiết.

```text
Cách tạo Conditional Breakpoint trong x64dbg:
1. Click chuột phải vào dòng lệnh cần Breakpoint
2. Chọn "Set Conditional Breakpoint"
3. Nhập điều kiện, ví dụ:
   - "EAX == 0"                    → Dừng khi EAX = 0
   - "DWORD:[ESP] == 0x1234ABCD"   → Dừng khi giá trị Stack top = 0x1234ABCD
   - "RCX == 5 && RDX == 10"       → Dừng khi cả hai điều kiện thỏa mãn
4. Nhấn OK → Breakpoint màu vàng xuất hiện
```

### C.2 Memory Breakpoint — Bẫy truy cập vùng nhớ

Memory Breakpoint dừng chương trình khi có bất kỳ thao tác Đọc/Ghi nào trên một vùng bộ nhớ cụ thể.

```text
Cách đặt Memory Breakpoint:
1. Mở Memory Map (tab)
2. Click chuột phải vào vùng nhớ muốn theo dõi
3. Chọn:
   - "Set Memory Breakpoint on Access"  → Bẫy cả đọc lẫn ghi
   - "Set Memory Breakpoint on Write"   → Chỉ bẫy khi ghi
4. Khi chương trình truy cập vùng nhớ đó, x64dbg sẽ dừng
```

### C.3 Best Practices khi đặt Breakpoints

```text
✔ Đặt BP tại Entry Point để nắm bức tranh tổng thể trước.
✔ Dùng Intermodular Calls để tìm nhanh vị trí CALL API cần BP.
✔ Ghi chú địa chỉ và mục đích của từng BP vào tài liệu phân tích.
✔ Dùng Conditional BP thay vì thông thường khi phân tích vòng lặp.
✔ Dùng Hardware BP khi cần tránh bị Anti-Debug phát hiện.
✘ KHÔNG đặt quá nhiều BP không cần thiết — làm chậm quá trình trace.
```

---

## Bài thực hành Lab tổng hợp

### Lab 1: Khám phá giao diện x64dbg
- Mở `toy_control_flow.exe` trong x64dbg.
- Nhận diện và đặt tên cho từng cửa sổ: CPU, Registers, Stack, Memory Map.
- Nhấn F9 để chạy đến Entry Point. Ghi lại giá trị RIP, RSP, RAX.

### Lab 2: Phân tích chuỗi CALL/RET
- Tìm một lệnh `CALL` trong Disassembly.
- Ghi lại: địa chỉ của CALL, địa chỉ hàm được gọi, Return Address sẽ là gì.
- Nhấn F7 để đi vào hàm. Quan sát Stack — Return Address có xuất hiện đỉnh Stack không?
- Nhấn Ctrl+F9 để thoát hàm. Quan sát RIP quay về Return Address đúng không?

### Lab 3: Conditional Breakpoint thực hành
- Đặt Conditional Breakpoint tại một lệnh hay được gọi trong vòng lặp.
- Điều kiện: `EAX == 10` (chỉ dừng lần thứ 10 giá trị EAX=10).
- Chạy chương trình và xác nhận BP chỉ kích hoạt khi điều kiện thỏa.

### Lab 4: Memory Breakpoint thực hành
- Nhập chuỗi bất kỳ vào toy program (nếu có giao diện).
- Dùng Memory Map tìm vùng nhớ chứa chuỗi nhập vào.
- Đặt Memory Breakpoint on Access.
- Tiếp tục chạy — quan sát x64dbg dừng tại lệnh nào đọc chuỗi đó.

---

## Câu hỏi ôn tập bổ sung

### Câu 1 (Nhận biết)
Cửa sổ nào trong x64dbg hiển thị chuỗi lời gọi hàm dẫn đến vị trí hiện tại?  
A. Memory Map  
B. Registers  
C. Call Stack  
D. Dump  

**Đáp án:** C

---

### Câu 2 (Thông hiểu)
Khi lệnh `CALL verify_password` được thực thi, điều gì xảy ra với thanh ghi `RSP`?  
A. RSP tăng lên 8 bytes  
B. RSP giảm đi 8 bytes (địa chỉ trả về được đẩy vào Stack)  
C. RSP không thay đổi  
D. RSP về giá trị 0  

**Đáp án:** B

---

### Câu 3 (Thông hiểu)
Conditional Breakpoint khác gì so với Software Breakpoint thông thường?  
*Gợi ý trả lời:* Software Breakpoint dừng chương trình mỗi lần CPU đi qua địa chỉ đó. Conditional Breakpoint chỉ dừng khi một điều kiện cụ thể được thỏa mãn (ví dụ EAX==0), rất hữu ích trong vòng lặp hoặc khi muốn bắt một trường hợp đặc biệt.

---

### Câu 4 (Vận dụng)
Bạn đang trace một vòng lặp chạy 1000 lần và chỉ muốn dừng lại ở lần thứ 100 (khi biến đếm ECX = 900). Nên dùng loại Breakpoint nào và điều kiện là gì?  
*Gợi ý trả lời:* Dùng Conditional Breakpoint với điều kiện `ECX == 900`. Phím F9 chạy qua 999 lần không thỏa, chỉ dừng đúng lần thứ 100.

---

## Tổng kết phần bổ sung

* Nắm vững **giao diện x64dbg** và chức năng của từng cửa sổ.
* Hiểu cơ chế **CALL/RET** và quản lý Return Address trên Stack.
* Làm chủ **Conditional Breakpoint** và **Memory Breakpoint** nâng cao.
* Đọc thành thạo **Call Stack** để truy vết nguồn gốc lời gọi hàm.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.
