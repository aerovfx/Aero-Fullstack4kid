# Tuần 9: PE GUI, imports, resources và build hardening

## Nguồn bài học

- **Analysing the PE for a graphical User Interface-Based Program**. Giáo trình mở rộng thành attack-surface review và CI hardening cho PE được phép phân tích.

## Chuyên đề: Phân Tích Chuyên Sâu PE GUI, Import Table, Resources & Kiểm Soát CI Hardening

### 1. Lời mở đầu: Bề mặt tấn công (Attack Surface) của một Tệp PE GUI

Ứng dụng GUI không chỉ là các câu lệnh Assembly trong phân vùng `.text`. Toàn bộ cấu trúc **PE Metadata**, bao gồm các thư viện hệ thống được import (IAT), tài nguyên nhúng (`.rsrc`), và cờ bảo mật của trình biên dịch, tạo nên một bề mặt tấn công tổng thể (Attack Surface). Việc rà soát PE Metadata giúp nhà nghiên cứu phát hiện các thông tin nhạy cảm bị rò rỉ (như đường dẫn PDB Debug, API endpoints, hoặc hardcoded keys) trước khi nạp ứng dụng vào môi trường gỡ lỗi động.

### 2. Phân tích Các Phân Vùng Cốt Lõi (Section Permissions & Anomaly Detection)

```text
+-------------------------------------------------------------------------+
| Section | Thuộc tính Mặc định | Ý nghĩa & Dấu hiệu Bất thường          |
+-------------------------------------------------------------------------+
| .text   | Read + Execute (R-X)| Chứa mã máy. Nếu thấy Write (W+X) -> Bất thường|
| .rdata  | Read-Only (R--)     | Hằng số, IAT. Chứa chuỗi văn bản tĩnh.  |
| .data   | Read + Write (RW-)  | Biến toàn cục.                           |
| .rsrc   | Read-Only (R--)     | Icon, Dialog, Manifest, Sub-binaries.   |
| .reloc  | Read-Only (R--)     | Bảng Relocation phục vụ ASLR.            |
+-------------------------------------------------------------------------+
```

* **Dấu hiệu Cảnh báo W+X**: Phân vùng vừa có quyền Ghi vừa có quyền Thực thi (`Writable + Executable`) thường là dấu hiệu của Stub giải nén (Packer), JIT Compiler hoặc mã tự thay đổi (Self-modifying code).

### 3. Rà soát Tài nguyên Nhúng (Resource & Config Security Review)

Trong quá trình Triage các ứng dụng GUI, nhà phân tích cần kiểm tra phân vùng `.rsrc` và `.rdata` để phát hiện:
1. **Đường dẫn Debug PDB (Program Database)**: Tiết lộ tên tài khoản Windows, cấu trúc thư mục nội bộ và phiên bản MSVC compiler của lập trình viên (ví dụ: `C:\Users\admin\SecretProject\Release\app.pdb`).
2. **API Endpoints & Manifest Permissions**: Các URL môi trường Test/Staging bị bỏ quên hoặc Manifest yêu cầu quyền Administrator (`requireAdministrator`) không cần thiết.
3. **Hardcoded Secrets**: Các chuỗi kết nối Database, API Key hoặc Private Key nạp sẵn trong tài nguyên tệp.

### 4. Thiết lập Quy trình CI/CD Build Hardening (Phòng thủ Sản xuất)

Để bảo vệ các tệp thực thi PE khỏi các kỹ thuật khai thác bảo mật, quy trình CI/CD cần bật đầy đủ các cờ Linker/Compiler:

```text
[Source Code] ──► [MSVC / Linker Flags] ──► [Hardened PE Binary] ──► [Artifact Sign]
                   - /DYNAMICBASE (ASLR)
                   - /NXCOMPAT (DEP)
                   - /GUARD:CF (CFG)
                   - /GS (Buffer Security Check)
```

| Cờ Bảo mật | Tác dụng Phòng thủ |
|---|---|
| **/DYNAMICBASE** | Kích hoạt ASLR, ngẫu nhiên hóa địa chỉ nạp trong RAM mỗi lần chạy. |
| **/NXCOMPAT** | Kích hoạt DEP/NX, cấm thực thi mã trên Stack và Heap. |
| **/GUARD:CF** | Kích hoạt Control Flow Guard (CFG), xác minh tính hợp lệ của các cuộc gọi hàm gián tiếp (`indirect calls`). |
| **/GS** | Chèn Stack Canaries (Cookie) để phát hiện và ngăn chặn tràn bộ nhớ Stack. |

## Kết quả cần đạt

- Đọc PE architecture, subsystem, section, import và resource ở mức triage.
- Nhận diện secret/config/debug path nhúng không phù hợp.
- Đánh giá ASLR, DEP/NX, CFG và signing/provenance có giới hạn.
- Chuyển finding thành CI/release control.

## 1. Từ PE metadata tới câu hỏi kiểm chứng

| Observation | Câu hỏi tiếp theo | Không được kết luận ngay |
|---|---|---|
| GUI subsystem | Entry/event model nào? | “Không có console nên an toàn” |
| Network import | Code path nào gọi, endpoint nào? | “Đây là malware” |
| High-entropy section | Packed/compressed/resource? | “Chắc chắn bị pack” |
| Debug path | Có lộ username/build layout? | “Có source code” |
| CFG/NX flag | Load config và build policy đúng? | “Không thể exploit” |
| Signature | Chain/timestamp/revocation hợp lệ? | “Publisher đáng tin tuyệt đối” |

## 2. Section permissions

Các section thường gặp: `.text` (code), `.rdata` (read-only data), `.data` (writable data), `.rsrc` (resources), `.reloc` (relocation). Tên chỉ là convention; cần dựa vào flags và RVA/raw layout.

Section vừa writable vừa executable (W+X) cần điều tra và justification, nhưng không tự động là lỗ hổng. JIT/runtime đặc biệt có thể tạo executable memory theo cơ chế riêng.

## 3. Resource/config review

Tìm trong toy build:

- API endpoint môi trường test/production.
- Private key, password hoặc shared secret giả được cố tình nhúng.
- Debug PDB path chứa username/internal directory.
- Manifest yêu cầu quyền cao không cần thiết.
- Version metadata và update URL.

Không in secret thật vào báo cáo; dùng redaction và secret identifier.

## 4. Lab Debug vs Hardened

1. Chạy `pe_triage.py --json` cho hai build.
2. Dùng DIE/PE viewer độc lập để cross-check.
3. So sánh sections, imports, resources, entry point và mitigation flags.
4. Dùng strings chỉ như discovery; xác minh reachability bằng source/symbol/lab execution.
5. Viết tối đa ba finding có evidence.
6. Đề xuất CI gate và build option tương ứng.

## 5. CI/release controls

- Warning-as-error và secure compiler/linker flags phù hợp toolchain.
- Secret scanning trước build và scan artifact sau build.
- SBOM/provenance, dependency review và artifact signing.
- Reproducible build khi khả thi; ghi lý do nếu không.
- Test signature verification, timestamp và update channel.
- Không phát hành debug symbol/path công khai ngoài policy.

## Bài tập và rubric

Nộp comparison report, JSON outputs và CI hardening checklist. Chấm: PE interpretation 30, evidence cross-check 20, findings 20, CI controls 20, giới hạn/false positives 10.

