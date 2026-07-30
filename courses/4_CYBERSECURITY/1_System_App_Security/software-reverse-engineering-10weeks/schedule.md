# Lịch trình Giáo trình Software Reverse Engineering & Secure Patching (10 Tuần)

| Tuần | Chủ đề | Giai đoạn & Chủ đề chính (41 bài) | Sản phẩm & Lab Artifacts |
|---|---|---|---|
| 1 | Tổng quan Ethical Hacking & Lab cô lập | **Giai đoạn 1**: Tổng quan Ethical Hacking, Đạo đức & Quy tắc RoE, Thiết lập Windows VM & Workspace | Rules of Engagement (RoE) + Lab Isolation Checklist |
| 2 | Environment Setup & PE Static Triage | **Giai đoạn 1**: Giới thiệu x64dbg & Detect It Easy (DIE), Static Analysis vs Dynamic Analysis, Workflow Triage | Static Triage Report (DIE + `pe_triage.py`) |
| 3 | Assembly, CPU Registers & Memory | **Giai đoạn 2**: Kiến trúc x86/x64, Thanh ghi CPU, Stack/Heap, Các lệnh Assembly căn bản (MOV, CMP, JMP) | Assembly Function Map & Register Diagram |
| 4 | Debugging Mechanics (Stepping & Breakpoints) | **Giai đoạn 2**: Debugger Stepping (F7/F8), Call Stack, Software (INT3) & Hardware Breakpoints | Debugging Evidence & Call Stack Analysis |
| 5 | Windows API & GUI Application Analysis | **Giai đoạn 3**: Phân tích GUI Apps, Windows API (`MessageBox`, `GetWindowText`), Intermodular Calls, Bypass đăng ký | Intermodular Call Map & Registration Finding |
| 6 | Software Patching & Hardware Breakpoints | **Giai đoạn 4**: Patch thanh ghi (Flags/EAX), Patch bộ nhớ (NOP Sled, Byte Patching), Serial Key Change, Hardware BP | Verified Patch + Rollback Script + Manifest |
| 7 | Static Code Analyzers & Reverse Engineering | **Giai đoạn 5**: Static Code Analyzer (Ghidra/IDA), Trích xuất Serial Key, Tìm Password & Phân tích cấu trúc hàm | Decompiled Function Map & Serial Extraction Log |
| 8 | Advanced Assembly & Visual Basic Reverse | **Giai đoạn 6**: Lập trình Assembly, Tạo thuật toán External Keygen, Reverse ứng dụng Visual Basic (VB6) | Keygen Algorithm Specification + VB6 Analysis |
| 9 | .NET Reverse Engineering & Protections | **Giai đoạn 7**: Crack & Reverse .NET (C#, VB.NET), dnSpy, ILSpy, de4dot, .NET Protection & Deobfuscation | .NET Decompiled Source & Protection Audit |
| 10 | Obfuscation, DLL Reverse & Capstone Defense | **Giai đoạn 8**: Obfuscation/Deobfuscation, Cracking/Reverse DLL, Anti-debugging, Báo cáo Capstone | Defensive RE Report + Tamper Proofing Recommendations |

---

### Quy tắc Thực hành Lab:
1. Tất cả lab phải ghi rõ SHA-256 hash của binary trước và sau khi phân tích/patch.
2. Lưu giữ snapshot VM và log bằng chứng theo chuẩn Chain of Custody.
3. Không thực thi mẫu không tin cậy ngoài môi trường VM đã cô lập.


