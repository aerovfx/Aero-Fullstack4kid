# Tuần 6: Secure patching, regression và rollback

> Secure patch phải tuân theo các nguyên tắc Clean Code và test được
> nêu trong [hướng dẫn viết báo cáo](../references/reporting-and-writing.md).

## Nguồn bài học

- **How to patch a Software Application** được tái cấu trúc thành quy trình vá phần mềm có kiểm soát. Ưu tiên source patch; binary patch chỉ dùng trên toy artifact thuộc khóa.

## Chuyên đề: Vá Mã An Toàn (Secure Patching), Kiểm Thử Hồi Quy & Chiến Lược Rollback

### 1. Lời mở đầu: Bản chất của một bản vá bảo mật chuẩn mực

Một bản vá bảo mật (Security Patch) tốt không phải là bản vá sửa lỗi nhanh nhất, mà là bản vá **triệt tiêu triệt để nguyên nhân gốc rễ (Root Cause)** mà không gây ra tác dụng phụ (Side-effects) làm sập hệ thống hay mở ra lỗ hổng mới. Trong kỹ thuật đảo ngược, thay vì chỉ tập trung vào việc "sửa byte trong RAM" (Binary Hotfix), quy trình chuyên nghiệp luôn ưu tiên **Source-level Patching** — sửa đổi mã nguồn gốc, biên dịch lại với cờ bảo mật và phát hành dưới dạng artifact có chữ ký số.

### 2. Thứ tự ưu tiên trong quy trình Remediation

```text
[1. Source-Level Fix] (Ưu tiên số 1: Sửa mã nguồn -> Code Review -> CI/CD Build -> Chữ ký số)
        │
        ▼ (Nếu không thể sửa source ngay lập tức)
[2. Configuration Mitigation] (Áp dụng cờ/quy tắc WAF/Registry tạm thời có thời hạn)
        │
        ▼ (Nếu là phần mềm bên thứ ba)
[3. Vendor-Supported Hotfix] (Chờ nhà phát hành công bố bản vá chính thức)
        │
        ▼ (Chỉ trong lab/nghiên cứu khẩn cấp có ủy quyền)
[4. Authorized Binary Patch] (Sửa trực tiếp byte nhị phân trên working copy + Hash manifest)
```

### 3. Quy trình 6 Bước Vá Mã & Kiểm Thử Hồi Quy (Regression Testing)

```text
[1. Reproduce] ──► [2. Hash & Preserve] ──► [3. Source Fix] ──► [4. Build & Test Matrix] ──► [5. Manifest & Sign] ──► [6. Rollback Drill]
  Tái lập lỗi        Lưu file gốc SHA-256   Sửa tận gốc C/C++    Test Happy & Negative       Tạo SHA-256 Manifest      Diễn tập khôi phục
```

#### Bước 1 — Tái lập lỗi tối thiểu (Minimal Reproduction):
Xây dựng kịch bản kiểm thử (PoC/Unit Test) tái lập chính xác lỗ hổng trước khi sửa code.

#### Bước 2 — Bảo tồn Bằng chứng (Chain of Custody):
Tính SHA-256 của file gốc và chuyển sang chế độ `Read-Only`. Mọi thao tác biên dịch/vá mã đều thực hiện trên thư mục làm việc riêng (`samples/working/`).

#### Bước 3 — Vá lỗi trên Mã nguồn (Source Fix):
Ví dụ sửa lỗi tràn bộ nhớ hoặc kiểm tra ranh giới:
```c
// ❌ Mã chứa lỗ hổng (Vulnerable Code)
void process_input(char *user_str) {
    char buffer[64];
    strcpy(buffer, user_str); // Lỗi tràn bộ nhớ Stack Buffer Overflow
}

// ✅ Mã đã vá an toàn (Patched Code)
void process_input(char *user_str) {
    if (user_str == NULL) return;
    char buffer[64];
    strncpy(buffer, user_str, sizeof(buffer) - 1);
    buffer[sizeof(buffer) - 1] = '\0'; // Đảm bảo null-terminated
}
```

#### Bước 4 — Kiểm thử Hồi quy (Regression Test Matrix):
Đảm bảo bản vá sửa đúng lỗi mà **không làm hỏng các tính năng hoạt động bình thường khác**.

| Kịch bản Test | Đầu vào | Kết quả File Gốc | Kết quả File Vá | Mong đợi |
|---|---|---|---|---|
| **Happy Path** | Input hợp lệ (`"user_01"`) | Pass | Pass | Pass |
| **Boundary Test** | Input dài 63 ký tự | Pass | Pass | Pass |
| **Overflow Test** | Input dài 256+ ký tự | Crash / Overflow | Reject an toàn | Reject an toàn |
| **Null Test** | `NULL` pointer | Crash | Reject an toàn | Reject an toàn |

#### Bước 5 — Tạo Manifest & Ký số Artifact:
Sử dụng script Python để tạo manifest SHA-256 cho file sau khi vá:
```bash
python code/hash_manifest.py create patched/manifest.json patched/toy_app.exe
python code/hash_manifest.py verify patched/manifest.json
```

#### Bước 6 — Kế hoạch Khôi phục Khẩn cấp (Rollback Plan):
Luôn sẵn sàng quy trình rollback về bản build ổn định đã biết hash (`Known-Good Version`) nếu phát hiện bản vá gây ra lỗi gián đoạn dịch vụ.

## Kết quả cần đạt

- Viết minimal reproduction và root-cause fix.
- Phân biệt source patch, configuration mitigation và binary hotfix.
- Tạo before/after manifest, test report, release note và rollback.
- Xác minh bản vá không mở rộng quyền hoặc phá chức năng liên quan.

## 1. Thứ tự ưu tiên

1. Sửa source, review, rebuild và ký artifact.
2. Configuration mitigation có thời hạn, owner và kế hoạch bỏ.
3. Vendor-supported hotfix.
4. Binary patch có ủy quyền khi mất source/khẩn cấp — rủi ro cao và không mặc định dùng production.

## 2. Patch plan

| Trường | Nội dung |
|---|---|
| Finding/issue | ID và root cause |
| Target | Version + SHA-256 |
| Expected behavior | Trước và sau patch |
| Code/config change | Diff nhỏ nhất hợp lý |
| Security tests | Abuse/tamper/negative cases |
| Regression | Chức năng lân cận |
| Rollback trigger | Metric/error cụ thể |
| Rollback artifact | Version/hash đã biết tốt |

## 3. Workflow

```text
Reproduce → Preserve/hash → Fix source → Review → Build
→ Unit + integration + negative tests → Diff behavior
→ Manifest/sign → Pilot → Monitor → Release or rollback
```

```bash
python code/hash_manifest.py create patched/manifest.json patched/toy.exe
python code/hash_manifest.py verify patched/manifest.json
```

Manifest hash xác minh byte integrity, không thay chữ ký số hay provenance system.

## 4. Binary patch lab giới hạn

Giảng viên cung cấp toy binary và source tương ứng. Học viên có thể quan sát byte diff do compiler tạo sau source fix, nhưng không patch license check. Nếu thử chỉnh binary lab:

- Ghi offset, bytes trước/sau và lý do.
- Làm trên working copy; không thay bản gốc.
- Chạy cùng test suite với source-rebuilt artifact.
- Đánh dấu `LAB ONLY - UNSUPPORTED`.
- Chứng minh rollback bằng manifest.

## 5. Regression matrix

| Test | Original | Patched | Mong đợi |
|---|---|---|---|
| Valid input | pass | pass | pass |
| Boundary input | incorrect | correct | correct |
| Invalid input | reject | reject | reject |
| Empty/null | safe reject | safe reject | safe reject |
| Tampered config | reject | reject | reject |

## Lỗi thường gặp

- Patch symptom nhưng không sửa root cause.
- Chỉ test happy path.
- Không lưu artifact/hash rollback.
- Phân phối file patch không ký và không release note.
- Patch third-party binary trái quyền.
- Dùng NOP/jump edit như “fix” authorization.

## Bài tập và rubric

Nộp source diff, build log, test matrix, manifest, release note và rollback drill. Chấm: fix 30, tests 25, artifact integrity 15, rollback 15, documentation/risk 15.

---

# Bổ sung Bài 7: Quy Trình Patch Phần Mềm Trong x64dbg

## 1. Mục tiêu bổ sung

Sau khi hoàn thành phần này, học viên có thể:

* Hiểu rõ khái niệm Patch trong bối cảnh Reverse Engineering và kiểm thử bảo mật Lab.
* Thực hiện đầy đủ quy trình 6 bước Patch trong x64dbg trên toy binary được ủy quyền.
* Phân biệt Patch tạm thời trong bộ nhớ RAM và Patch lưu vĩnh viễn vào tệp thực thi.
* Kiểm tra kết quả sau khi Patch và phục hồi mã gốc khi cần.

---

## 2. Kiến thức chính

### 2.1 Patch là gì?

**Patch** là hành động thay đổi một hoặc nhiều byte mã máy (Machine Instruction/Opcode) trong chương trình để thay đổi hành vi thực thi của nó.

```text
Trước khi Patch:              Sau khi Patch:
74 10  → JE 0x401080          75 10  → JNE 0x401080
(Nhảy nếu bằng)               (Nhảy nếu khác — đảo ngược logic!)
```

### 2.2 Quy trình Patch 6 bước trong x64dbg

```text
Bước 1: Mở chương trình bằng x64dbg → Debug/Analyze
         ↓
Bước 2: Phân tích vị trí cần Patch (dùng BP, Intermodular Calls)
         ↓
Bước 3: Quan sát Assembly và Registers tại vị trí đó
         ↓
Bước 4: Thay đổi lệnh Assembly (Assemble / NOP / Edit bytes)
         ↓
Bước 5: Kiểm tra hành vi chương trình sau khi Patch
         ↓
Bước 6: Lưu Patch vào tệp nếu cần (Copy to Executable → Save)
```

### 2.3 Các thao tác Patch quan trọng trong x64dbg

| Thao tác | Cách thực hiện | Kết quả |
|---|---|---|
| **Assemble** | Click phải dòng lệnh → Assemble | Nhập lệnh Assembly mới để thay thế |
| **NOP Instruction** | Click phải → Fill with NOPs | Thay dòng lệnh bằng byte `0x90` (không thao tác) |
| **Edit Bytes** | Click phải → Edit bytes | Sửa trực tiếp giá trị byte Hex |
| **Restore Original** | Click phải → Restore Original Bytes | Khôi phục byte gốc trước khi Patch |
| **Copy to Executable** | Click phải → Patches → Copy to Executable | Áp dụng Patch vào file EXE mới |
| **Save Patched File** | Sau Copy to Executable → Save | Lưu file EXE đã Patch ra đĩa |

### 2.4 Phân biệt Patch trong RAM và Patch File

| Loại Patch | Ảnh hưởng | Mất sau khi | Khi nào dùng |
|---|---|---|---|
| **Memory Patch** (RAM) | Chỉ trong phiên debug hiện tại | Tắt chương trình | Kiểm tra nhanh giả thuyết |
| **File Patch** (EXE) | Lưu vĩnh viễn vào file trên đĩa | Không mất | Lab có ủy quyền, cần artifact |

---

## 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **Patch** | Thay đổi mã máy của chương trình |
| **Assemble** | Biên dịch ngược lệnh Assembly sang mã máy |
| **Opcode** | Mã lệnh máy (byte đại diện cho lệnh Assembly) |
| **NOP** | No Operation — byte `0x90`, không thực hiện thao tác gì |
| **Restore** | Khôi phục lại mã byte gốc trước khi Patch |
| **Copy to Executable** | Sao chép các Patch từ RAM sang file EXE trên đĩa |
| **Byte Diff** | Sự khác biệt giữa byte gốc và byte sau Patch |

---

## 4. Ví dụ minh họa

### Ví dụ 1: Đảo ngược lệnh Jump bằng Assemble

Trong x64dbg, phát hiện logic kiểm tra:
```assembly
00401080 | 74 0A | JE 0x40108C   ; Nếu đúng key → nhảy tới Granted
00401082 | ...   | (nhánh Wrong)
```

Để kiểm tra nhánh Granted trong Lab toy binary:
1. Click phải dòng `00401080` → **Assemble**
2. Nhập lệnh mới: `JNE 0x40108C` (hoặc `JMP 0x40108C`)
3. Nhấn **OK** → byte `74 0A` biến thành `75 0A` (hoặc `EB 0A`)
4. Kiểm tra hành vi ứng dụng

### Ví dụ 2: NOP một kiểm tra không cần thiết

Lệnh kiểm tra gây crash trong toy binary:
```assembly
00401050 | E8 A0000000 | CALL check_anti_debug  ; Gây crash nếu detect debugger
```

Patch bằng NOP:
1. Click phải → **Fill with NOPs**
2. Kết quả: `00401050 | 90 90 90 90 90 | NOP NOP NOP NOP NOP`
3. Lệnh `CALL check_anti_debug` bị vô hiệu hóa.

### Ví dụ 3: Lưu Patch vào file để tạo artifact Lab

1. Sau khi Patch trong RAM thành công, vào menu **Debug → Patches**
2. Click **Copy to Executable**
3. Trong cửa sổ Hex Editor hiện ra, chọn **File → Save As**
4. Lưu với tên `toy_validator_patched.exe`
5. Tính hash SHA-256: `Get-FileHash .\toy_validator_patched.exe -Algorithm SHA256`
6. Ghi vào manifest: `LAB ONLY - NOT FOR DISTRIBUTION`

---

## 5. Bài thực hành (Lab)

### Lab 1: Patch thử lệnh Assembly
- Mở `toy_control_flow.exe` bằng x64dbg.
- Tìm một lệnh `CMP` + `JE/JNE`.
- Dùng **Assemble** để đảo ngược lệnh Jump (JE → JNE hoặc ngược lại).
- Chạy và quan sát hành vi thay đổi.

### Lab 2: NOP một lệnh kiểm tra
- Tìm một `CALL` tới hàm kiểm tra điều kiện.
- Dùng **Fill with NOPs** để vô hiệu hóa lời gọi hàm.
- Chạy chương trình và xác nhận điều kiện không còn được kiểm tra.

### Lab 3: Patch file và kiểm tra
- Sau khi Patch thành công trong Lab 1 hoặc 2:
  - Dùng **Copy to Executable** → **Save As** → `toy_patched.exe`.
  - Tính SHA-256 của file gốc và file patch.
  - Chạy `toy_patched.exe` mà không cần debugger để xác nhận Patch ổn định.
  - Khôi phục file gốc bằng **Restore Original Bytes** và xác nhận lại hash.

---

## 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Patch trong Reverse Engineering có nghĩa là gì?  
A. Cài đặt phần mềm mới  
B. Thay đổi một hoặc nhiều byte mã máy để thay đổi hành vi chương trình  
C. Gỡ lỗi chương trình  
D. Biên dịch mã nguồn C++  

**Đáp án:** B

---

### Câu 2 (Thông hiểu)
Sự khác biệt giữa Memory Patch và File Patch là gì?  
*Gợi ý trả lời:* Memory Patch chỉ ảnh hưởng đến phiên chạy hiện tại trong debugger — khi tắt chương trình, mọi thay đổi mất đi. File Patch ghi thay đổi vĩnh viễn vào file EXE trên đĩa bằng chức năng "Copy to Executable".

---

### Câu 3 (Thông hiểu)
Byte `0x90` trong mã máy x86/x64 có ý nghĩa gì?  
*Gợi ý trả lời:* `0x90` là opcode của lệnh `NOP` (No Operation). CPU thực thi lệnh NOP mà không làm gì cả và chuyển sang lệnh tiếp theo, thường dùng để "vô hiệu hóa" một lệnh mà không làm xáo trộn địa chỉ của các lệnh xung quanh.

---

### Câu 4 (Vận dụng)
Tại sao phải tính và ghi lại SHA-256 hash của file trước và sau khi Patch?  
*Gợi ý trả lời:* Hash SHA-256 là bằng chứng không thể làm giả về sự toàn vẹn của tệp. So sánh hash trước/sau giúp chứng minh chính xác những byte nào đã bị thay đổi, phục vụ Chain of Custody, báo cáo phân tích và rollback khi cần thiết.

---

### Câu 5 (Vận dụng)
Khi nào nên dùng **Restore Original Bytes** trong x64dbg?  
*Gợi ý trả lời:* Khi muốn hoàn tác Patch đã thực hiện trong phiên debug hiện tại để khôi phục mã ban đầu của chương trình, ví dụ sau khi kiểm tra một giả thuyết và muốn thử nghiệm một hướng Patch khác.

---

## Tổng kết Bài 7

* Nắm vững khái niệm và phân loại **Patch** (Memory Patch vs File Patch).
* Thực hành thành thạo quy trình 6 bước Patch trong x64dbg.
* Làm chủ các thao tác: **Assemble**, **Fill with NOPs**, **Restore Original Bytes**, **Copy to Executable**.
* Ghi lại hash SHA-256 trước/sau Patch để đảm bảo Chain of Custody trong Lab.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 06](../code/week06/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 06](../code/week06/README.md), học lần lượt từ `01_...` đến `20_...`.
