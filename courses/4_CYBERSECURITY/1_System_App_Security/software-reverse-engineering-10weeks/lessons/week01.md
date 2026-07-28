# Tuần 1: Phạm vi, đạo đức và xây dựng lab cô lập

## Nguồn bài học

- **Overview of Software Ethical Hacking**.
- **Setting up your cracking workspace and workflow**.
- Nội dung “cracking” trong nguồn được chuyển thành phân tích bảo mật có ủy quyền.

## Kết quả cần đạt

- Phân biệt reverse engineering, debugging, vulnerability research, malware analysis và piracy.
- Viết Rules of Engagement (RoE) xác định chính xác target và kỹ thuật được phép.
- Tạo Windows VM có snapshot, evidence folder và quy trình khôi phục.
- Tính hash, quản lý chain of custody và biết khi nào phải dừng phân tích.

## 1. Reverse engineering hợp pháp là gì?

Reverse engineering quan sát artifact để hiểu cấu trúc và hành vi khi source không có hoặc cần xác minh độc lập. Hoạt động có thể hợp pháp trong kiểm thử nội bộ, tương thích, điều tra sự cố hoặc CTF; quyền cụ thể vẫn phụ thuộc chủ sở hữu, hợp đồng và luật áp dụng.

| Hoạt động | Mục tiêu | Target phù hợp với khóa |
|---|---|---|
| Debugging | Tìm nguyên nhân lỗi | Chương trình lớp tự viết |
| Security review | Xác nhận weakness và fix | Binary được owner ủy quyền |
| CTF/crackme | Học kỹ thuật | Challenge có license rõ |
| Malware analysis | Hiểu mẫu độc hại | Chỉ trong lab chuyên dụng và có quy trình riêng |
| Bypass license/DRM | Dùng tính năng không được phép | Không thuộc khóa học |

## 2. Rules of Engagement

```markdown
Authorization ID: RE-LAB-W01
Owner / Approver: <name>
Target: toy_validator.exe
Expected SHA-256: <64 hex>
Allowed: static triage, debugger, breakpoint, source patch
Not allowed: third-party software, public upload, external network
Data prohibited: real credentials, personal/customer data
Time window: <start> — <end>
Stop conditions: hash mismatch, VM escape signal, out-of-scope data
Evidence location / retention: <path>, <days>
```

Quyền phân tích phải gắn với **artifact cụ thể**, không phải câu chung chung như “được phép hack phần mềm”.

## 3. Kiến trúc lab

```text
Host
└── Windows Analysis VM
    ├── tools/             # x64dbg, DIE và công cụ đã kiểm hash
    ├── samples/original/  # read-only
    ├── samples/working/   # bản sao để phân tích
    ├── evidence/          # screenshot, JSON, log
    ├── notes/             # hypothesis và timeline
    └── patched/           # artifact sau sửa + manifest
```

Thiết lập đề xuất:

1. Cập nhật Windows VM, không dùng bản Windows đã hết hỗ trợ.
2. Tạo user không có dữ liệu cá nhân và không đăng nhập cloud account.
3. Tắt shared folder, shared clipboard, drag-and-drop và USB passthrough mặc định.
4. Dùng NAT hạn chế hoặc network disabled tùy target; không bridge vào mạng thật.
5. Snapshot `clean-tools`, sau đó snapshot riêng trước mỗi dynamic lab.
6. Đồng bộ thời gian phục vụ log nhưng ghi rõ timezone.

## 4. Chain of custody tối thiểu

```powershell
Get-FileHash .\samples\original\toy_validator.exe -Algorithm SHA256
Get-Date -Format o
```

Ghi: ai nhận file, nhận khi nào, từ đâu, hash ban đầu, bản sao nào được mở và artifact nào được tạo. Không sửa trực tiếp sample gốc.

## 5. Tiêu chí dừng

Dừng và báo giảng viên nếu:

- Hash khác RoE hoặc target không đúng version.
- Binary cố truy cập credential, file cá nhân hoặc hệ thống ngoài lab.
- Cần tắt protection của host hay kết nối production để tiếp tục.
- Phát hiện dữ liệu thật không nằm trong phạm vi.
- Không chắc binary/challenge có quyền phân tích.

## Lab từng bước

1. Tạo VM và cấu trúc thư mục.
2. Chụp ảnh cấu hình isolation, tool version và snapshot name.
3. Copy toy binary vào `original`, tính hash, chuyển read-only.
4. Tạo working copy, xác minh hash giống bản gốc.
5. Viết RoE một trang và analysis journal đầu tiên.
6. Khôi phục snapshot để chứng minh đường rollback hoạt động.

## Bài tập và rubric

Nộp RoE, sơ đồ lab, hash record, screenshot snapshot và recovery checklist. Chấm: authorization 30, isolation 25, evidence 20, stop conditions 15, trình bày 10. Thiếu quyền hoặc target hash: không đạt.

