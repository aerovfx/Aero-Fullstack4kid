# Giáo trình Cyber Security – Reverse Engineering

> Khi mô tả FLAGS và control flow, áp dụng quy ước tại
> [hướng dẫn viết báo cáo](../references/reporting-and-writing.md).

## Tuần 3 – Bài 3

# Kiến Trúc Máy Tính, Thanh Ghi CPU, Bộ Nhớ & Assembly Cơ Bản

---

# 1. Mục tiêu bài học

Sau khi hoàn thành bài này, học viên có thể:

* Hiểu kiến trúc vi xử lý x86 và x64 (IA-32 và x86-64).
* Nắm vững danh sách và vai trò của các thanh ghi CPU phổ biến (`RAX`, `RBX`, `RCX`, `RDX`, `RSP`, `RBP`, `RIP`, `EFLAGS`).
* Phân biệt cấu trúc phân vùng bộ nhớ Process (Code/Text, Data, Heap, Stack).
* Đọc hiểu các câu lệnh Assembly x86/x64 căn bản (`MOV`, `PUSH`, `POP`, `ADD`, `SUB`, `CMP`, `TEST`, `JMP`, `JE`, `JNE`, `CALL`, `RET`).
* Áp dụng kiến thức Assembly để theo dõi luồng tính toán dữ liệu trong x64dbg.

---

# 2. Kiến thức chính

## 2.1 Kiến trúc x86 vs x64 và Các Thanh Ghi CPU

CPU thực thi lệnh trực tiếp trên các thanh ghi (Registers) — các ô nhớ siêu tốc tích hợp ngay trong lõi vi xử lý.

```text
Thanh ghi 64-bit (x64)    Thanh ghi 32-bit (x86)    16-bit    8-bit High / Low
─────────────────────────────────────────────────────────────────────────────
RAX                      EAX                       AX        AH / AL
RBX                      EBX                       BX        BH / BL
RCX                      ECX                       CX        CH / CL
RDX                      EDX                       DX        DH / DL
RSI                      ESI                       SI        SIL
RDI                      EDI                       DI        DIL
RSP                      ESP                       SP        SPL
RBP                      EBP                       BP        BPL
R8  - R15                (Không có trên x86)        -         -
```

### Vai trò các thanh ghi chính:
* **RAX / EAX (Accumulator)**: Lưu kết quả tính toán toán học và giá trị trả về của hàm (`return value`).
* **RCX / ECX (Counter)**: Đếm vòng lặp (`loop counter`) và truyền tham số thứ nhất trong x64 calling convention.
* **RDX / EDX (Data)**: Hỗ trợ phép nhân/chia và truyền tham số thứ hai trong x64 calling convention.
* **RSP / ESP (Stack Pointer)**: Con trỏ chỉ tới đỉnh hiện tại của Ngăn xếp (Stack).
* **RBP / EBP (Base Pointer)**: Con trỏ chỉ tới đáy của Frame hàm hiện tại.
* **RIP / EIP (Instruction Pointer)**: Con trỏ lưu địa chỉ lệnh Assembly **tiếp theo** sắp được CPU thực thi.
* **RFLAGS / EFLAGS**: Lưu các cờ trạng thái sau phép tính (Zero Flag `ZF`, Carry Flag `CF`, Sign Flag `SF`).

---

## 2.2 Phân Vùng Bộ Nhớ Của Ứng Dụng (Process Memory Layout)

Khi một file EXE được nạp vào bộ nhớ RAM, hệ điều hành Windows phân chia không gian địa chỉ ảo (Virtual Address Space) thành các phân vùng chính:

```text
0x7FFFFFFFFFFF ┌────────────────────────────────────────┐
               │ Stack (Phát triển từ địa chỉ cao xuống) │
               ├────────────────────────────────────────┤
               │ Heap  (Phát triển từ địa chỉ thấp lên) │
               ├────────────────────────────────────────┤
               │ Data Section (.data, .rdata - Hằng số) │
               ├────────────────────────────────────────┤
               │ Code Section (.text - Mã Assembly)     │
0x000000000000 └────────────────────────────────────────┘
```

* **Section `.text`**: Chứa toàn bộ các lệnh thực thi Assembly (Read-Only / Execute).
* **Section `.rdata`**: Chứa hằng số, chuỗi văn bản tĩnh (`"Password incorrect"`).
* **Section `.data`**: Chứa biến toàn cục có thể thay đổi.
* **Heap**: Bộ nhớ cấp phát động runtime (`malloc`, `new`).
* **Stack**: Ngăn xếp lưu trữ biến cục bộ, tham số truyền vào hàm và địa chỉ trả về (`Return Address`).

---

## 2.3 Các Lệnh Assembly Cơ Bản (Instruction Set)

Assembly sử dụng cú pháp Intel: `Opcode Destination, Source` (Ví dụ: `MOV EAX, EBX` copy giá trị từ EBX vào EAX).

### 1. Lệnh di chuyển dữ liệu & Stack:
* `MOV dest, src`: Copy giá trị từ `src` vào `dest`.
* `PUSH src`: Đẩy `src` vào đỉnh Stack (`RSP` giảm đi 8/4 bytes).
* `POP dest`: Lấy giá trị từ đỉnh Stack gán vào `dest` (`RSP` tăng 8/4 bytes).

### 2. Lệnh tính toán & Logic:
* `ADD dest, src`: `dest = dest + src`.
* `SUB dest, src`: `dest = dest - src`.
* `CMP op1, op2`: So sánh `op1` và `op2` bằng cách thực hiện phép trừ ẩn (`op1 - op2`) và cập nhật cờ `EFLAGS` (nếu bằng nhau thì Zero Flag `ZF = 1`).
* `TEST op1, op2`: Thực hiện phép `AND` bitwise ẩn và cập nhật `ZF` (thường dùng `TEST EAX, EAX` để kiểm tra EAX có bằng 0 hay không).

### 3. Lệnh nhảy điều kiện & Hàm:
* `JMP target`: Nhảy không điều kiện tới địa chỉ `target`.
* `JE / JZ target`: Nhảy tới `target` nếu bằng nhau (`ZF = 1`).
* `JNE / JNZ target`: Nhảy tới `target` nếu không bằng nhau (`ZF = 0`).
* `CALL function`: Gọi hàm (đẩy địa chỉ lệnh tiếp theo vào Stack rồi nhảy tới `function`).
* `RET`: Trở về từ hàm (rút địa chỉ trả về từ Stack gán vào `RIP`).

---

# 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **CPU Register** | Thanh ghi vi xử lý lưu dữ liệu siêu tốc |
| **RIP / EIP** | Thanh ghi con trỏ lệnh tiếp theo sẽ thực thi |
| **Stack (Ngăn xếp)** | Phân vùng bộ nhớ LIFO (Last In First Out) |
| **Zero Flag (ZF)** | Cờ trạng thái bật lên 1 khi kết quả phép tính bằng 0 |
| **Opcode** | Mã thao tác Assembly (MOV, CMP, JMP, CALL) |
| **Operand** | Toán cục của lệnh Assembly (Thanh ghi, bộ nhớ, giá trị trực tiếp) |
| **Calling Convention** | Quy ước truyền tham số và dọn dẹp Stack giữa các hàm |
| **Stack Frame** | Khung bộ nhớ Stack riêng của từng lệnh gọi hàm |

---

# 4. Ví dụ minh họa

## Ví dụ 1: Đoạn mã C và Assembly tương đương kiểm tra Password

Mã nguồn C:
```c
if (check_password(input) == 1) {
    printf("Access Granted!\n");
} else {
    printf("Access Denied!\n");
}
```

Mã Assembly trong x64dbg:
```assembly
00007FF610001050 | E8 A0000000            | call check_password                   | Gọi hàm kiểm tra
00007FF610001055 | 83F8 01                | cmp eax, 1                            | So sánh kết quả trong EAX với 1
00007FF610001058 | 75 0F                  | jne 00007FF610001069                  | Nếu không bằng 1 (ZF=0), nhảy tới Denied
00007FF61000105A | 48:8D0D 20200000        | lea rcx, qword ptr ["Access Granted!"]| Nạp chuỗi thành công
00007FF610001061 | E8 B0010000            | call printf                           | In thông báo
00007FF610001066 | EB 0D                  | jmp 00007FF610001075                  | Nhảy qua nhánh Denied
00007FF610001069 | 48:8D0D 30200000        | lea rcx, qword ptr ["Access Denied!"] | Nạp chuỗi thất bại
00007FF610001070 | E8 A1010000            | call printf                           | In thông báo
```

---

# 5. Ghi nhớ

```text
            [ Lệnh so sánh: CMP EAX, 1 / TEST EAX, EAX ]
                                 │
                     Cập nhật cờ Zero Flag (ZF)
                                 │
              ┌──────────────────┴──────────────────┐
              ▼                                     ▼
        ZF = 1 (Bằng nhau)                   ZF = 0 (Khác nhau)
              │                                     │
      Lệnh JE/JZ thực thi                   Lệnh JNE/JNZ thực thi
```

> **Ghi nhớ**: "Mọi quyết định phân nhánh trong phần mềm biên dịch đều phụ thuộc vào kết quả của các lệnh so sánh (`CMP`, `TEST`) và cờ trạng thái CPU (đặc biệt là `Zero Flag`)!"

---

# 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Thanh ghi CPU nào lưu trữ địa chỉ lệnh Assembly tiếp theo sẽ được thực thi trên kiến trúc x64?
A. RAX  
B. RSP  
C. RIP  
D. RBP  

**Đáp án:** C

---

### Câu 2 (Thông hiểu)
Lệnh Assembly `CMP EAX, EBX` thực hiện thao tác toán học nào dưới nền tảng?
A. Cộng EAX với EBX và gán vào EAX  
B. Trừ EAX cho EBX (ngầm) và cập nhật các cờ trạng thái RFLAGS mà không đổi giá trị EAX  
C. Nhân EAX với EBX  
D. Copy EBX vào EAX  

**Đáp án:** B

---

### Câu 3 (Thông hiểu)
Giá trị trả về (`return value`) của một hàm C/C++ chuẩn trên x86/x64 thường được lưu trữ trong thanh ghi nào khi hàm kết thúc?
*Gợi ý trả lời:* Lưu trữ trong thanh ghi `EAX` (trên x86) hoặc `RAX` (trên x64).

---

### Câu 4 (Vận dụng)
Một đoạn mã Assembly trong x64dbg có dạng:
```assembly
TEST EAX, EAX
JZ 0x00401050
```
Giải thích ý nghĩa và điều kiện để lệnh `JZ` thực hiện cú nhảy.
*Gợi ý trả lời:* `TEST EAX, EAX` thực hiện phép AND bitwise để kiểm tra EAX. Nếu `EAX == 0`, kết quả phép TEST bằng 0 làm cờ Zero Flag `ZF` bật lên 1. Khi đó, lệnh `JZ` (Jump if Zero) sẽ thực hiện cú nhảy tới địa chỉ `0x00401050`.

---

### Câu 5 (Vận dụng)
Phân biệt sự khác nhau về hướng phát triển bộ nhớ giữa phân vùng Stack và Heap trong quá trình thực thi chương trình.
*Gợi ý trả lời:* Phân vùng Stack phát triển từ vùng địa chỉ cao xuống vùng địa chỉ thấp (khi PUSH thì RSP giảm). Phân vùng Heap phát triển từ vùng địa chỉ thấp lên vùng địa chỉ cao (khi cấp phát `malloc` thì con trỏ heap tăng lên).

---

## Tổng kết bài học

* Làm chủ các thanh ghi CPU x86/x64 và phân vùng bộ nhớ Process.
* Đọc hiểu luồng thực thi Assembly của các câu lệnh tính toán, so sánh và rẽ nhánh.
* Nắm vững cơ chế kiểm tra điều kiện thông qua thanh ghi cờ `EFLAGS` (`Zero Flag`).

---

# Bổ sung Bài 6: Phân Tích Lệnh Jump & Luồng Điều Kiện Trong Assembly

## 1. Mục tiêu bổ sung

Sau khi hoàn thành phần này, học viên có thể:

* Phân biệt và sử dụng đúng các lệnh Jump điều kiện và không điều kiện.
* Hiểu mối quan hệ nhân quả giữa lệnh `CMP`, thanh ghi cờ `EFLAGS` và lệnh Jump.
* Đọc sơ đồ luồng thực thi (Control Flow) từ Assembly trong x64dbg.
* Theo dõi nhánh thực thi nào được chọn dựa trên giá trị FLAGS.

---

## 2. Kiến thức chính

### 2.1 Hai nhóm lệnh Jump

**Nhóm 1 — Jump không điều kiện (`JMP`):**
Luôn nhảy tới địa chỉ đích, bất kể mọi điều kiện.

```assembly
JMP 0x00401200      ; Luôn nhảy đến 0x00401200
```

**Nhóm 2 — Jump có điều kiện:**
Chỉ nhảy khi thanh ghi cờ `EFLAGS` thỏa mãn điều kiện cụ thể.

| Lệnh | Tên đầy đủ | Điều kiện kích hoạt | Cờ kiểm tra |
|---|---|---|---|
| `JE` / `JZ` | Jump if Equal / Zero | Hai toán hạng bằng nhau | `ZF = 1` |
| `JNE` / `JNZ` | Jump if Not Equal / Not Zero | Hai toán hạng khác nhau | `ZF = 0` |
| `JG` / `JNLE` | Jump if Greater | Lớn hơn (signed) | `ZF=0 AND SF=OF` |
| `JL` / `JNGE` | Jump if Less | Nhỏ hơn (signed) | `SF ≠ OF` |
| `JGE` / `JNL` | Jump if Greater or Equal | Lớn hơn hoặc bằng | `SF = OF` |
| `JLE` / `JNG` | Jump if Less or Equal | Nhỏ hơn hoặc bằng | `ZF=1 OR SF≠OF` |
| `JA` / `JNBE` | Jump if Above | Lớn hơn (unsigned) | `CF=0 AND ZF=0` |
| `JB` / `JNAE` | Jump if Below | Nhỏ hơn (unsigned) | `CF = 1` |

---

### 2.2 Thanh ghi cờ EFLAGS — Trung tâm điều phối nhánh

Sau khi lệnh `CMP` (hoặc `TEST`) thực thi, CPU tự động cập nhật các cờ trong thanh ghi `EFLAGS/RFLAGS`:

```text
EFLAGS Register (32-bit):
┌────┬────┬────┬────┬──────────────────────────┐
│ OF │ SF │ ZF │ CF │   ...  (các cờ khác)      │
└────┴────┴────┴────┴──────────────────────────┘
```

* **ZF (Zero Flag)**: Bật lên `1` khi kết quả phép tính bằng `0` (hai toán hạng bằng nhau).
* **CF (Carry Flag)**: Bật lên `1` khi có số nhớ (carry/borrow) — dùng cho phép so sánh unsigned.
* **SF (Sign Flag)**: Bật lên `1` khi kết quả âm (bit cao nhất = 1).
* **OF (Overflow Flag)**: Bật lên `1` khi kết quả tràn số nguyên có dấu (signed overflow).

---

### 2.3 Quan sát Jump trong x64dbg

```text
Quy trình quan sát luồng thực thi:

Bước 1: Đặt Breakpoint (F2) trước lệnh CMP/TEST
        ↓
Bước 2: Nhấn F9 chạy đến Breakpoint
        ↓
Bước 3: Nhấn F8 (Step Over) thực thi lệnh CMP
        ↓
Bước 4: Quan sát cửa sổ Registers: ZF thay đổi 0→1 hay không?
        ↓
Bước 5: Nhấn F8 lần nữa — x64dbg hiển thị nhánh Jump nào được chọn
         (Mũi tên màu xanh = Jump thực hiện / Màu xám = Không nhảy)
```

---

## 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **JMP** | Lệnh nhảy không điều kiện |
| **JE / JZ** | Jump if Equal / Zero — nhảy khi ZF=1 |
| **JNE / JNZ** | Jump if Not Equal / Not Zero — nhảy khi ZF=0 |
| **JG / JL** | Jump if Greater / Less (so sánh có dấu signed) |
| **JA / JB** | Jump if Above / Below (so sánh không dấu unsigned) |
| **CMP** | Lệnh so sánh (thực hiện phép trừ ẩn, cập nhật FLAGS) |
| **EFLAGS** | Thanh ghi chứa các cờ trạng thái CPU |
| **ZF** | Zero Flag — bật khi kết quả = 0 |
| **CF** | Carry Flag — bật khi có số nhớ |
| **SF** | Sign Flag — bật khi kết quả âm |
| **OF** | Overflow Flag — bật khi tràn số |
| **Control Flow** | Luồng điều khiển thực thi chương trình |

---

## 4. Ví dụ minh họa

### Ví dụ 1: Kiểm tra Password đúng/sai

```assembly
; Giả sử EAX chứa kết quả kiểm tra password (1 = đúng, 0 = sai)
00401050 | CMP EAX, 1          ; So sánh EAX với 1
00401053 | JE  0x00401070      ; Nếu bằng 1 (ZF=1) → nhảy tới "Access Granted"
00401055 | PUSH "Access Denied!"
00401060 | CALL MessageBoxA
00401065 | JMP 0x00401080      ; Nhảy qua nhánh Granted
00401070 | PUSH "Access Granted!"
00401078 | CALL MessageBoxA
```

**Phân tích:**
- Nếu `EAX = 1`: `CMP EAX,1` → kết quả trừ = 0 → **ZF = 1** → `JE` nhảy đến `0x401070` → Thông báo "Access Granted!"
- Nếu `EAX = 0`: `CMP EAX,1` → kết quả trừ = -1 → **ZF = 0** → `JE` KHÔNG nhảy → Thông báo "Access Denied!"

---

### Ví dụ 2: Kiểm tra Serial Key không bằng nhau

```assembly
CMP EAX, 5
JNE Wrong       ; Nếu EAX ≠ 5 (ZF=0) → nhảy tới Wrong
; ... nhánh đúng
Wrong:
; ... nhánh sai
```

---

### Ví dụ 3: Vẽ sơ đồ Control Flow

```text
            [CMP EAX, serial]
                   │
        ┌──────────┴──────────┐
        │                     │
    ZF = 1 (Bằng)         ZF = 0 (Khác)
        │                     │
    [JE nhảy]           [Không nhảy]
        │                     │
  "Correct Key"          "Wrong Key"
```

---

## 5. Bài thực hành (Lab)

### Lab 1: Theo dõi ZF trong x64dbg
- Mở `toy_control_flow.exe` bằng x64dbg.
- Tìm lệnh `CMP` hoặc `TEST` trong disassembly.
- Đặt Breakpoint (F2) trước lệnh CMP.
- Nhấn F8 để thực thi CMP và quan sát sự thay đổi của ZF trong cửa sổ Registers.
- Ghi lại: ZF = 0 hay 1? Lệnh Jump nào theo sau? Nhánh nào được chọn?

### Lab 2: Vẽ sơ đồ luồng Control Flow
- Tìm một đoạn code có `CMP` + `JE/JNE` trong toy program.
- Vẽ sơ đồ text mô tả hai nhánh có thể xảy ra.
- Đặt Breakpoint và chạy thử cả hai trường hợp để xác nhận.

### Lab 3: Theo dõi thay đổi của nhiều cờ FLAGS
- Thực hiện `CMP EAX, EBX` với nhiều giá trị khác nhau trong x64dbg.
- Ghi lại giá trị của ZF, CF, SF, OF sau mỗi lần CMP.
- Điền vào bảng kết quả:

| EAX | EBX | ZF | CF | SF | OF | Kết quả CMP |
|---|---|---|---|---|---|---|
| 5 | 5 | 1 | 0 | 0 | 0 | Bằng nhau |
| 5 | 3 | 0 | 0 | 0 | 0 | EAX lớn hơn |
| 3 | 5 | 0 | 1 | 1 | 0 | EAX nhỏ hơn |

---

## 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Lệnh `JNE` (Jump if Not Equal) sẽ thực hiện cú nhảy khi điều kiện nào của cờ EFLAGS?  
A. ZF = 1  
B. ZF = 0  
C. CF = 1  
D. SF = 1  

**Đáp án:** B

---

### Câu 2 (Thông hiểu)
Phân biệt sự khác nhau giữa lệnh `JE` và `JG` trong assembly x86/x64.  
*Gợi ý trả lời:* `JE` (Jump if Equal) nhảy khi ZF=1 (hai toán hạng bằng nhau). `JG` (Jump if Greater — Signed) nhảy khi ZF=0 AND SF=OF, tức là khi toán hạng đầu tiên lớn hơn toán hạng thứ hai theo kiểu so sánh có dấu (signed comparison).

---

### Câu 3 (Thông hiểu)
Lệnh `CMP EAX, EBX` thực sự thực hiện thao tác nào dưới nền?  
*Gợi ý trả lời:* Lệnh CMP thực hiện phép trừ ẩn (`EAX - EBX`) nhưng không lưu kết quả vào bất kỳ thanh ghi nào. Chỉ có thanh ghi cờ EFLAGS được cập nhật dựa trên kết quả phép trừ đó.

---

### Câu 4 (Vận dụng)
Quan sát đoạn Assembly sau và dự đoán luồng thực thi khi `EAX = 10`:
```assembly
MOV EAX, 10
CMP EAX, 10
JNE Wrong_Branch
PUSH "Correct"
CALL MessageBoxA
Wrong_Branch:
PUSH "Wrong"
CALL MessageBoxA
```
*Gợi ý trả lời:* `CMP EAX, 10` → EAX bằng 10 → kết quả trừ = 0 → ZF=1. Lệnh `JNE Wrong_Branch` kiểm tra ZF=0 để nhảy, nhưng ZF=1 nên `JNE` KHÔNG nhảy. Chương trình tiếp tục thực thi nhánh "Correct" ngay bên dưới.

---

### Câu 5 (Vận dụng)
Kỹ thuật "Reversing Jump" (đảo ngược lệnh nhảy) là gì và trong hoàn cảnh nào nó được áp dụng trong phân tích RE Lab?  
*Gợi ý trả lời:* Reversing Jump là thay đổi opcode của lệnh nhảy điều kiện sang lệnh nhảy đối lập (ví dụ: đổi `JE` thành `JNE`, hoặc `JNE` thành `JE`). Trong lab RE với toy binary được ủy quyền, kỹ thuật này được dùng để kiểm tra hành vi của chương trình nếu điều kiện kiểm tra bị đảo ngược, nhằm xác nhận giả thuyết về logic kiểm tra.

---

## Tổng kết Bài 6

* Nắm vững toàn bộ bảng lệnh **Jump điều kiện** và cờ **EFLAGS** tương ứng.
* Hiểu cơ chế hoạt động của chuỗi `CMP → EFLAGS Update → Conditional Jump`.
* Thực hành quan sát nhánh thực thi trong **x64dbg** thông qua màu sắc mũi tên Jump.
* Có thể **vẽ Control Flow Graph** từ đoạn Assembly có nhánh điều kiện.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 03](../code/week03/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 03](../code/week03/README.md), học lần lượt từ `01_...` đến `20_...`.
