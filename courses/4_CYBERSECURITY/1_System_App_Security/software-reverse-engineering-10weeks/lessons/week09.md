# Tuần 9: PE GUI, imports, resources và build hardening

## Nguồn bài học

**Analysing the PE for a graphical User Interface-Based Program**. Giáo trình mở rộng thành attack-surface review và CI hardening cho PE được phép phân tích.

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

