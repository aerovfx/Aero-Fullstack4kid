# Giáo trình Cyber Security – Reverse Engineering

## Tuần 1 – Bài 1 & 2

# Tổng Quan Software Ethical Hacking, Đạo Đức & Môi Trường Lab Cô Lập

---

# 1. Mục tiêu bài học

Sau khi hoàn thành bài này, học viên có thể:

* Hiểu định nghĩa, mục tiêu và ranh giới đạo đức của quy trình Reverse Engineering (RE) và Software Ethical Hacking.
* Nắm bắt bức tranh tổng thể lộ trình học gồm **8 Giai đoạn (~41 bài học)** từ chuẩn bị lab đến kỹ thuật nâng cao.
* Phân biệt giữa Debugging, Security Review, Malware Analysis và Piracy/DRM Bypass trái phép.
* Xây dựng kịch bản Rules of Engagement (RoE) và quy trình quản lý bằng chứng (Chain of Custody).
* Thiết lập môi trường Windows Virtual Machine (VM) cô lập an toàn, cấu hình snapshot và quy trình rollback.

---

# 2. Kiến thức chính

## 2.1 Tổng quan về Software Ethical Hacking & Reverse Engineering

Reverse Engineering (Kỹ thuật đảo ngược phần mềm) là quá trình tháo rời tệp thực thi đã biên dịch (EXE/DLL) để phân tích cấu trúc, thuật toán và luồng xử lý mà không cần tiếp cận mã nguồn (Source code).

```text
Chương trình biên dịch (hello.exe)
          ↓
Reverse Engineering (x64dbg / DIE / Ghidra)
          ↓
Mã Assembly + Struct + API + Logic kiểm tra
```

### Phân biệt mục đích sử dụng

| Hoạt động | Mục tiêu chính | Tính hợp pháp / Phạm vi |
|---|---|---|
| **Debugging** | Tìm và sửa lỗi phần mềm trong phát triển | Cho phép trên mã nguồn thuộc quyền sở hữu |
| **Security Review** | Tìm kiếm lỗ hổng an ninh mạng và vá mã | Cho phép khi có ủy quyền của chủ sở hữu |
| **Malware Analysis** | Phân tích cơ chế lây nhiễm và tác hại của mã độc | Thực hiện trong môi trường Sandbox cô lập |
| **Cracking / DRM Bypass** | Phá khóa bản quyền, tạo keygen trái phép | **Nghiêm cấm** (Vi phạm pháp luật) |

---

## 2.2 Lộ trình tổng quan khóa học (8 Giai đoạn — 41 Bài học)

Khóa học được thiết kế từ căn bản đến nâng cao theo 8 giai đoạn chính:

```text
Giai đoạn 1: Chuẩn bị môi trường & Static Triage (x64dbg, DIE)
     ↓
Giai đoạn 2: Debugging cơ bản & Assembly (Stepping, Call Stack, Breakpoints, Registers)
     ↓
Giai đoạn 3: Phân tích GUI Application & Windows API (Intermodular Calls)
     ↓
Giai đoạn 4: Software Patching & Hardware Breakpoints (Patch Registers, Memory Patch)
     ↓
Giai đoạn 5: Reverse Engineering & Static Analysis (Ghidra, Serial Extraction)
     ↓
Giai đoạn 6: Assembly nâng cao & Visual Basic RE (External Keygen, VB6 P-Code)
     ↓
Giai đoạn 7: .NET Reverse Engineering (dnSpy, C#, VB.NET, .NET Protection)
     ↓
Giai đoạn 8: Kỹ thuật nâng cao & Capstone Defense (Obfuscation, DLL Reverse, Hooking)
```

---

## 2.3 Quy tắc Đạo đức & Rules of Engagement (RoE)

Trước khi thực hiện phân tích bất kỳ file thực thi nào, chuyên gia an ninh mạng bắt buộc phải lập tài liệu **Rules of Engagement (RoE)** xác định rõ phạm vi được phép.

```markdown
Authorization ID: RE-LAB-W01
Owner / Approver: Nguyễn Văn A (Security Manager)
Target Artifact: toy_validator.exe
Expected SHA-256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
Allowed Tools & Actions: Static triage, x64dbg, Software/Hardware BP, Source patch
Prohibited Actions: Public upload, third-party software reversing, external network scan
Data Boundary: No real user credentials or production network access allowed
Time Window: 2026-08-01 08:00 — 2026-08-01 17:00 UTC+7
Stop Conditions: Target Hash Mismatch, VM Escape Signal, Unintended Network Traffic
```

---

## 2.4 Kiến trúc Lab Cô lập & Chain of Custody

Môi trường phân tích tĩnh và động bắt buộc phải chạy bên trong Windows Virtual Machine (VM) tách biệt hoàn toàn với Host.

```text
Host Operating System (Windows / macOS / Linux)
└── Windows Analysis VM (Hyper-V / VMware / VirtualBox)
    ├── tools/             # x64dbg, DIE, Ghidra (Checked Hashes)
    ├── samples/original/  # Read-Only Sample (Gốc)
    ├── samples/working/   # Copy làm việc trực tiếp
    ├── evidence/          # Log, Screenshot, Memory Dump
    └── patched/           # Artifact sau khi patch + Manifest
```

### Chain of Custody (Chuỗi quản lý bằng chứng)
Dùng PowerShell để kiểm tra hash tệp trước và sau khi làm việc:

```powershell
# Tính hash SHA-256 tệp mẫu
Get-FileHash .\samples\original\toy_validator.exe -Algorithm SHA256
```

---

# 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **Reverse Engineering (RE)** | Kỹ thuật đảo ngược mã máy thành Assembly/Logic |
| **Ethical Hacking** | Kiểm thử an ninh mạng hợp pháp và có ủy quyền |
| **Rules of Engagement (RoE)** | Quy tắc thỏa thuận phạm vi kiểm thử an toàn |
| **Sandbox / VM** | Môi trường ảo hóa cô lập để thực thi file an toàn |
| **Chain of Custody** | Chuỗi ghi vết bằng chứng và toàn vẹn dữ liệu (SHA-256) |
| **PE File (Portable Executable)** | Định dạng file thực thi tiêu chuẩn trên Windows (EXE/DLL) |
| **x64dbg** | Trình gỡ lỗi động (Dynamic Debugger) mở mã nguồn |
| **Detect It Easy (DIE)** | Công cụ phân tích tĩnh thông tin header, compiler & packer |

---

# 4. Ví dụ minh họa

## Ví dụ 1: Thiết lập thư mục làm việc tiêu chuẩn

```powershell
# Tạo cấu trúc thư mục lab trong VM
New-Item -ItemType Directory -Path C:\RE_Lab\tools, C:\RE_Lab\samples\original, C:\RE_Lab\samples\working, C:\RE_Lab\evidence
Set-ItemProperty -Path C:\RE_Lab\samples\original -Name IsReadOnly -Value $true
```

## Ví dụ 2: Lập hồ sơ kiểm tra tính toàn vẹn (Manifest)

Tạo file `manifest.txt` để theo dõi tệp làm việc:

```text
Target: toy_control_flow.exe
SHA256: 8f3d8a7c2b...
Date: 2026-07-30
Status: Original Verified
```

---

# 5. Ghi nhớ

```text
Bước 1: Xác nhận Ủy quyền (RoE) → Bước 2: Cô lập Môi trường (Windows VM)
                                              ↓
Bước 4: Lưu log Bằng chứng (SHA-256) ← Bước 3: Đưa tệp vào `original` (Read-only)
```

> **Nguyên tắc vàng**: "Chỉ phân tích trên môi trường ảo hóa cô lập, kiểm tra SHA-256 hash và chỉ thực hiện trên target được cấp phép."

---

# 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Reverse Engineering trong ngữ cảnh an ninh mạng có mục tiêu chính là gì?
A. Phá khóa phần mềm thương mại để sử dụng miễn phí  
B. Phân tích chương trình đã biên dịch để hiểu logic và phát hiện lỗ hổng  
C. Lập trình giao diện người dùng mới  
D. Cài đặt lại hệ điều hành Windows  

**Đáp án:** B

---

### Câu 2 (Thông hiểu)
Tài liệu Rules of Engagement (RoE) có vai trò gì trong quá trình kiểm thử phần mềm?
A. Hướng dẫn cách cài đặt phần mềm x64dbg  
B. Xác định phạm vi pháp lý, mục tiêu được phép và điều kiện dừng phân tích  
C. Tăng tốc độ thực thi của CPU  
D. Tự động sửa lỗi mã nguồn  

**Đáp án:** B

---

### Câu 3 (Thông hiểu)
Tại sao cần đặt tệp mẫu ban đầu vào thư mục `samples/original` với thuộc tính Read-Only?
*Gợi ý trả lời:* Để bảo vệ tính toàn vẹn dữ liệu gốc, đảm bảo tệp sample không bị sửa đổi ngoài ý muốn trong quá trình dynamic analysis, phục vụ quy trình Chain of Custody.

---

### Câu 4 (Vận dụng)
Khi bắt đầu phân tích tệp `sample.exe` nhận từ khách hàng, bạn phát hiện hash SHA-256 không trùng khớp với hash ghi trong tài liệu RoE. Bạn sẽ xử lý như thế nào?
*Gợi ý trả lời:* Dừng ngay quá trình thực thi/phân tích, không mở bằng debugger. Báo cáo ngay cho chủ sở hữu/người ủy quyền để xác minh lại đúng phiên bản tệp mẫu và cập nhật tài liệu RoE trước khi tiếp tục.

---

### Câu 5 (Vận dụng)
Nêu 3 thiết lập bắt buộc khi cấu hình Windows Virtual Machine làm lab phân tích mã độc/tệp thực thi không rõ nguồn gốc.
*Gợi ý trả lời:* 
1. Tắt Shared Folder, Drag-and-drop và Shared Clipboard với máy Host.
2. Cấu hình Card mạng ở chế độ Host-Only hoặc Disabled.
3. Tạo Clean Snapshot trước khi đưa tệp thực thi vào phân tích.

---

## Tổng kết bài học

* Hiểu rõ khái niệm và ranh giới đạo đức của **Reverse Engineering** trong an ninh mạng.
* Nắm vững bức tranh tổng thể 8 Giai đoạn của khóa học.
* Thành thạo lập tài liệu **Rules of Engagement (RoE)** và thực hiện **Chain of Custody**.
* Làm chủ quy trình xây dựng phòng lab VM cô lập an toàn cho phân tích phần mềm.

---

# Bài 2: Thiết Lập Workspace & Workflow Reverse Engineering

## 1. Mục tiêu bài học

Sau khi hoàn thành bài này, học viên có thể:

* Xây dựng môi trường làm việc (Workspace) chuyên nghiệp phục vụ Reverse Engineering.
* Cài đặt và tổ chức các công cụ cần thiết theo chuẩn phân tích bảo mật.
* Hiểu và áp dụng quy trình phân tích 7 bước chuẩn trước khi bắt đầu debug.
* Quản lý dự án phân tích CrackMe, ghi chú kết quả và lập báo cáo lab.

---

## 2. Kiến thức chính

### 2.1 Workspace là gì?

Workspace là môi trường làm việc có tổ chức để:
- Lưu trữ và quản lý mẫu chương trình phân tích (Samples).
- Chứa các công cụ Reverse Engineering đã kiểm tra hash.
- Lưu ghi chú phân tích, bằng chứng và báo cáo kết quả.
- Quản lý nhiều dự án phân tích song song.

```text
ReverseEngineering/               ← Root Workspace
├── CrackMe/                      ← Các bài luyện tập CTF/CrackMe có phép
│   ├── Week01/
│   │   ├── Calculator.exe        ← Sample gốc (Read-Only)
│   │   ├── Calculator.md         ← Ghi chú phân tích
│   │   ├── Images/               ← Screenshot evidence
│   │   ├── Dump/                 ← Memory dumps
│   │   └── Patch/                ← Binary patches (Lab only)
│   └── Week02/
├── Malware/                      ← Chỉ dùng trong lab chuyên dụng
├── Tools/                        ← x64dbg, DIE, HxD... (hash verified)
├── Notes/                        ← Ghi chú và hypothesis
├── Dumps/                        ← Memory artifacts
├── Screenshots/                  ← Evidence images
└── Reports/                      ← Báo cáo phân tích
```

---

### 2.2 Bộ công cụ cần chuẩn bị

| Công cụ | Vai trò | Ghi chú |
|---|---|---|
| **x64dbg** (x32dbg + x64dbg) | Dynamic Debugger chính | Tải từ x64dbg.com, kiểm tra hash |
| **Detect It Easy (DIE)** | Static Triage & PE Analysis | Tải từ GitHub, mã nguồn mở |
| **HxD** | Hex Editor để đọc/sửa binary thô | Chỉ dùng trên working copy |
| **VS Code / Notepad++** | Ghi chú phân tích và scripting | |
| **ShareX / Snipping Tool** | Chụp ảnh màn hình evidence | |
| **VMware / VirtualBox** | Môi trường VM cô lập | **Bắt buộc** cho dynamic analysis |

---

### 2.3 Workflow chuẩn 7 bước

```text
Bước 1: Quan sát tệp thực thi (kích thước, tên, nguồn gốc)
        ↓
Bước 2: Phân tích tĩnh bằng Detect It Easy (DIE)
        ↓
Bước 3: Kiểm tra Compiler, Architecture (x86/x64) và Packer
        ↓
Bước 4: Mở bằng x64dbg (x32dbg cho PE32, x64dbg cho PE64)
        ↓
Bước 5: Đặt Breakpoint tại Entry Point hoặc API mục tiêu
        ↓
Bước 6: Theo dõi Registers, Memory và Call Stack
        ↓
Bước 7: Ghi chú kết quả và lập báo cáo phân tích
```

---

## 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **Workspace** | Không gian làm việc có tổ chức cho dự án RE |
| **Sample** | Chương trình mẫu cần phân tích |
| **CrackMe** | Phần mềm luyện tập Reverse Engineering có phép |
| **Dump** | Dữ liệu trích xuất từ bộ nhớ hoặc file |
| **Patch** | Thay đổi mã máy của file thực thi |
| **Offset** | Địa chỉ tương đối trong file binary |
| **Entry Point** | Địa chỉ lệnh đầu tiên được thực thi |
| **Report** | Báo cáo kết quả phân tích |
| **Working Copy** | Bản sao file để làm việc (không phải file gốc) |

---

## 4. Ví dụ minh họa

### Ví dụ 1: Cấu trúc dự án Week01

```text
Week01/
├── Calculator.exe          ← SHA-256: a1b2c3... (Read-Only, gốc)
├── Calculator_work.exe     ← SHA-256: a1b2c3... (Bản sao làm việc)
├── Calculator_analysis.md  ← Ghi chú phân tích
├── Images/
│   ├── 01_DIE_result.png
│   └── 02_EntryPoint_BP.png
├── Dump/
│   └── memory_0x400000.bin
└── Patch/
    └── Calculator_patched.exe  ← LAB ONLY
```

### Ví dụ 2: Áp dụng Workflow chuẩn cho Calculator.exe

```text
Calculator.exe
      ↓ (Bước 1-3: Static Analysis)
Detect It Easy → PE64, Visual Studio 2022, No Packer
      ↓ (Bước 4: Mở debugger)
x64dbg (vì PE64)
      ↓ (Bước 5: Entry Point)
Breakpoint tại Entry Point (F2)
      ↓ (Bước 6: Dynamic Analysis)
Quan sát: RAX=0, RIP=0x7FF61001000, RSP=...
      ↓ (Bước 7: Ghi chú)
Calculator.md: "Entry Point 0x7FF61001000, no anti-debug detected"
```

---

## 5. Bài thực hành (Lab)

### Lab 1: Tạo Workspace
- Tạo cấu trúc thư mục `ReverseEngineering/` theo mô hình trên.
- Thiết lập thư mục `Tools/` với x64dbg và DIE đã tải từ nguồn chính thức.
- Tính hash SHA-256 của từng tool vừa tải và lưu vào `Tools/tool_hashes.txt`.

### Lab 2: Triage file EXE cơ bản
- Copy một file EXE mẫu vào `Week01/` (đặt Read-Only cho file gốc).
- Tạo Working Copy.
- Mở file bằng DIE và ghi lại: kiến trúc (x86/x64), Compiler, Packer (nếu có).

### Lab 3: Áp dụng Workflow
- Thực hiện đầy đủ 7 bước Workflow với file EXE mẫu từ Lab 2.
- Chụp ảnh màn hình từng bước quan trọng.
- Viết báo cáo ngắn `Calculator.md` tóm tắt kết quả.

---

## 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Workspace trong Reverse Engineering được dùng để làm gì?  
A. Chơi game  
B. Lưu trữ, tổ chức công cụ, samples và tài liệu cho dự án phân tích phần mềm  
C. Biên dịch mã nguồn C++  
D. Tạo giao diện ứng dụng  

**Đáp án:** B

---

### Câu 2 (Thông hiểu)
Những công cụ nào là bắt buộc cần có trong bộ công cụ Reverse Engineering cơ bản?  
A. Photoshop, PowerPoint  
B. x64dbg, Detect It Easy (DIE), VM (VMware/VirtualBox)  
C. Excel, Word  
D. Chrome, Firefox  

**Đáp án:** B

---

### Câu 3 (Thông hiểu)
Tại sao cần ghi chú kết quả trong quá trình debug thay vì chỉ ghi nhớ trong đầu?  
*Gợi ý trả lời:* Quá trình phân tích có thể kéo dài nhiều giờ hoặc nhiều ngày. Ghi chú giúp đảm bảo khả năng tái lập (Reproducibility), phục vụ báo cáo chuyên nghiệp, chia sẻ với đồng nghiệp và tuân thủ Chain of Custody khi cần làm bằng chứng pháp lý.

---

### Câu 4 (Vận dụng)
Khi phát hiện file cần phân tích bị nén bằng **UPX** (thông qua Detect It Easy), bước tiếp theo trong Workflow là gì?  
*Gợi ý trả lời:* Không thể debug trực tiếp mã logic chính ngay (chỉ thấy stub giải nén). Cần Unpack trước: (1) Dùng lệnh `upx -d file.exe` để giải nén tĩnh, hoặc (2) Trong x64dbg, chạy đến khi stub giải nén xong và dump bộ nhớ (OEP dump).

---

### Câu 5 (Vận dụng)
Tại sao phải giữ nguyên file gốc (Sample) ở chế độ Read-Only và chỉ làm việc trên Working Copy?  
*Gợi ý trả lời:* Để bảo vệ tính toàn vẹn của bằng chứng (Chain of Custody). File gốc với hash SHA-256 đã xác minh là cơ sở để chứng minh phân tích được thực hiện đúng trên mẫu đúng. Working Copy cho phép thao tác tự do mà không làm mất dữ liệu gốc.

---

## Tổng kết Bài 2

* Thiết lập **Workspace** có tổ chức khoa học là nền tảng của mọi dự án phân tích chuyên nghiệp.
* Chuẩn bị đầy đủ **bộ công cụ** (x64dbg, DIE, HxD, VM) trước khi bắt đầu phân tích.
* Áp dụng nhất quán **Workflow 7 bước** giúp phân tích có hệ thống và tái lập được.
* Luôn **ghi chú và chụp ảnh màn hình** để đảm bảo khả năng báo cáo và tái lập kết quả.
