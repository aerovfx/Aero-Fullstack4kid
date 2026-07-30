# Software Reverse Engineering & Secure Patching — 10 Tuần (Giáo trình Chuyên sâu)

Giáo trình phân tích bảo mật phần mềm Windows có ủy quyền, kết hợp lý thuyết hệ thống, thực hành gỡ lỗi với **x64dbg**, **Detect It Easy (DIE)**, **dnSpy/ILSpy**, **Static Analyzers** và các binary do lớp tự biên dịch. Mục tiêu là giúp học viên hiểu quy trình **Ethical Hacking** và **Reverse Engineering**, phân tích chương trình thực thi (EXE/DLL), debug ứng dụng, crackme lab, bypass cơ chế bảo vệ phòng thủ, và phân tích malware ở mức cơ bản — đảm bảo tuyệt đối tuân thủ đạo đức an ninh mạng và không vi phạm bản quyền.

---

## 🎯 Mục tiêu khóa học

* **Phân tích tệp thực thi**: Đọc hiểu cấu trúc và hành vi của file EXE/DLL trên kiến trúc x86/x64.
* **Kỹ năng Debugging**: Làm chủ x64dbg (stepping, call stack, breakpoints, memory, registers).
* **Static Analysis**: Sử dụng Detect It Easy (DIE) và các công cụ Static Code Analyzer để nhận diện compiler, packer, entropy và chuỗi dữ liệu.
* **Triage & Patching**: Thực hiện patch thanh ghi, patch bộ nhớ, bypass kiểm tra logic có kiểm soát trên môi trường lab.
* **Đa nền tảng Windows**: Phân tích ứng dụng Native (C/C++), Visual Basic (VB6) và ứng dụng .NET (C#, VB.NET).
* **Phân tích Nâng cao**: Hiểu các kỹ thuật Obfuscation, Deobfuscation, DLL reverse, Hooking và cơ chế Anti-debugging.
* **Phòng thủ & An toàn**: Nắm vững nguyên tắc chống Tampering, bảo vệ phần mềm và viết báo cáo kiểm thử an ninh mạng chuyên nghiệp.

---

## 🛠️ Công cụ sử dụng

* **Trình gỡ lỗi (Debugger)**: x64dbg (x32dbg / x64dbg), Visual Studio Debugger.
* **Nhận diện Tệp PE (Triage)**: Detect It Easy (DIE), PE Studio, CFF Explorer.
* **Phân tích Tĩnh (Static Analyzer)**: Ghidra / IDA Free / Cutter, CFF Explorer.
* **Phân tích .NET**: dnSpy, ILSpy, de4dot.
* **Môi trường Lập trình & Scripting**: Visual Studio (C/C++), Python 3 (pefile, hashlib), PowerShell.
* **Môi trường Lab**: Windows 10/11 VM cô lập, snapshot sạch, không kết nối mạng ngoài khi phân tích.

---

## 📋 Kiến thức nền cần có

* Kiến thức cơ bản về hệ điều hành Windows (File PE, Registry, Process, Thread, DLL).
* Lập trình cơ bản bằng **C/C++** hoặc **C# / .NET**.
* Hiểu khái niệm cơ bản về bộ nhớ (Stack, Heap) và số Hexadecimal / Binary.
* Khai niệm sơ khai về Assembly x86/x64 (được giảng dạy từ căn bản trong khóa học).

---

## 🏆 Kết quả đạt được

Sau khi hoàn thành khóa học, học viên có thể:
1. Đọc và hiểu luồng điều khiển Assembly (x86/x64) trong debugger.
2. Sử dụng thành thạo x64dbg và DIE để triage, trace và phân tích ứng dụng.
3. Phân tích cơ chế bảo vệ phần mềm (Serial key check, Registration validation, Packing, Obfuscation).
4. Thực hiện các bản vá (patching) an toàn, tạo bằng chứng phân tích và kịch bản rollback.
5. Reverse và phân tích mã ứng dụng .NET, Visual Basic và thư viện DLL.
6. Xây dựng tư duy phòng thủ (Defensive RE), đề xuất giải pháp hardening mã nguồn cho doanh nghiệp.

---

## 🗺️ Cấu trúc Lộ trình 8 Giai đoạn (~41 Bài học)

Khóa học được chia làm **8 Giai đoạn** tương ứng với 10 tuần học:

### Giai đoạn 1 – Chuẩn bị môi trường & Triage tĩnh (Tuần 1 - 2)
* Giới thiệu tổng quan Software Ethical Hacking & Quy tắc Đạo đức (RoE).
* Giới thiệu x64dbg và Detect It Easy (DIE).
* Thiết lập workspace, Windows VM cô lập và Hash manifest chain of custody.
* Workflow phân tích tĩnh & phân tích động.

### Giai đoạn 2 – Debugging cơ bản & Assembly (Tuần 3 - 4)
* Debugger stepping: Step Over (F8), Step Into (F7), Execute till Return.
* Call Stack, Call Frames và luồng thực thi hàm.
* Breakpoints: Software Breakpoint (INT 3), Hardware Breakpoint (DR0-DR7), Memory Breakpoint.
* Bộ nhớ RAM & Các thanh ghi CPU (EAX/RAX, EBX/RBX, ECX/RCX, EDX/RDX, ESP/RSP, EBP/RBP, EIP/RIP).
* Assembly cơ bản (MOV, PUSH, POP, CALL, CMP, JMP, JNE, JE, TEST).

### Giai đoạn 3 – Phân tích GUI & Windows API (Tuần 5)
* Crack/Phân tích ứng dụng GUI Windows.
* Phân tích Serial Key & Logic kiểm tra chuỗi.
* Bypass kiểm tra đăng ký (Registration bypass).
* Windows API thường dùng (`MessageBoxA/W`, `GetWindowTextA/W`, `RegQueryValueEx`).
* Intermodular Calls: Theo vết lời gọi hàm giữa các module DLL.

### Giai đoạn 4 – Patch phần mềm & Hardware Breakpoint (Tuần 6)
* Patch thanh ghi CPU (Flags, EAX/RAX).
* Patch bộ nhớ (NOP Sled, Overwrite opcode, JMP manipulation).
* Thay đổi Serial Key / Logic điều kiện trong bộ nhớ.
* Kỹ thuật Hardware Breakpoints nâng cao.

### Giai đoạn 5 – Reverse Engineering & Static Analysis (Tuần 7)
* Sử dụng Static Code Analyzer (Ghidra / IDA / Cutter).
* Trích xuất Serial Key & Hardcoded secrets từ binary.
* Tìm kiếm Password & String references trong bộ nhớ/binary.
* Phân tích cấu trúc chương trình (Functions, Control Flow Graph, Call Trees).

### Giai đoạn 6 – Assembly nâng cao & Special Applications (Tuần 8)
* Lập trình Assembly x86/x64 cơ bản.
* Xây dựng thuật toán tạo mã đăng ký (External Keygen logic).
* Reverse Engineering ứng dụng Visual Basic (VB6, P-Code vs Native Code).

### Giai đoạn 7 – .NET Reverse Engineering (Tuần 9)
* Reverse & Crack ứng dụng .NET (C# & VB.NET).
* Trình phân tích dnSpy / ILSpy / de4dot.
* .NET Protection: Obfuscation, Strong Name, Decompilation resistance.

### Giai đoạn 8 – Kỹ thuật Nâng cao & Capstone (Tuần 10)
* Obfuscation & Deobfuscation (Control Flow Flattening, String Encryption).
* Reverse Engineering DLL: Export/Import functions, DLL Injection, Hooking.
* Anti-debugging cơ bản (IsDebuggerPresent, CheckRemoteDebuggerPresent).
* Capstone Defense: Báo cáo kiểm thử an ninh phần mềm & Đề xuất gia cố bảo mật.

---

## 📚 Danh mục tài nguyên & Mã nguồn

* [`schedule.md`](schedule.md): Lịch trình chi tiết 10 tuần học.
* [`lessons/`](lessons/): Bài giảng chi tiết Tuần 1 đến Tuần 10 theo chuẩn định dạng giáo trình.
* [`code/pe_triage.py`](code/pe_triage.py): Script Python phân tích header PE, section & mitigation.
* [`code/hash_manifest.py`](code/hash_manifest.py): Script tạo/xác minh SHA-256 manifest.
* [`code/toy_control_flow.c`](code/toy_control_flow.c): Chương trình C mẫu để thực hành debug.
* [`code/README.md`](code/README.md): Hướng dẫn biên dịch C và chạy các bài test.

---

> ⚠️ **Tuyên bố về Đạo đức & Pháp lý**: 
> Tất cả kỹ thuật, công cụ và kịch bản thực hành trong khóa học **CHỈ ĐƯỢC PHÉP ÁP DỤNG** trên các ứng dụng lab tự phát triển, các bài thi CTF/Crackme có giấy phép, hoặc các hệ thống do chính bạn sở hữu / được ủy quyền bằng văn bản. Mọi hành vi phá hoại bản quyền phần mềm, phát tán crack hoặc tấn công hệ thống trái phép đều bị nghiêm cấm.

