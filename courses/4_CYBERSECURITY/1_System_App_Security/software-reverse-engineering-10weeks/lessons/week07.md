# Tuần 7: Quy trình phân tích tái lập và báo cáo finding

## Nguồn bài học

- **Summary of Software Cracking Workflow** được chuyển thành playbook reverse engineering phòng thủ có chain of custody, hypothesis và verification.

## Chuyên đề: Quy Trình Phân Tích Tái Lập (Reproducible Playbook) & Báo Cáo Bảo Mật Chuyên Nghiệp

### 1. Lời mở đầu: Tầm quan trọng của tính Tái lập (Reproducibility) trong Security Reporting

Một báo cáo phân tích kỹ thuật đảo ngược không có giá trị nếu nhà nghiên cứu khác hoặc đối tác không thể **tái lập (reproduce)** lại chính xác các quan sát và kết quả đó. Việc nhảy vội từ một dòng text trong memory tới kết luận "hệ thống bị bẻ khóa" là sai lầm nguy hiểm. Một Playbook chuyên nghiệp yêu cầu sự phân tách bạch minh giữa **Sự thật (Fact)**, **Quan sát (Observation)**, **Giả thuyết (Hypothesis)** và **Kết luận (Conclusion)**.

### 2. Chuẩn Playbook 10 Bước trong Reverse Engineering Phòng Thủ

```text
1. Authorization & Scope ──► 2. Preserve Artifact & Hash ──► 3. Static Triage (DIE/PE) ──► 4. Form Hypothesis
                                                                                                │
10. Rollback & Closure ◄── 9. Sign/Hash Release ◄── 8. Security Regression ◄── 7. Source Fix ◄── 5. Controlled Dynamic Analysis
```

### 3. Ma Trận Quản Lý Chứng Cứ (Evidence Index Table)

Mọi ảnh chụp màn hình, tệp log hay script xuất dữ liệu đều phải được lưu vết bằng mã hash SHA-256 và định danh duy nhất:

```csv
id,type,description,target_sha256,tool,location
E01,json,PE header static triage output,a1b2c3...,pe_triage.py,evidence/E01.json
E02,image,Assembly branch before return instruction,a1b2c3...,x64dbg,evidence/E02.png
E03,text,Unit test execution output,d4e5f6...,test_suite,evidence/E03.txt
```

* Quy tắc an toàn: Ảnh chụp màn hình phải làm mờ/che đi thông tin cá nhân, credential thật, hoặc username host machine.

### 4. Vòng Đời Giả Thuyết (Hypothesis Lifecycle)

```markdown
Giả thuyết (H1): Cờ ASLR (Dynamic Base) được bật trong PE Header nhưng không hỗ trợ đầy đủ trên tất cả các DLL phụ thuộc.
Cơ sở thực tế (Fact): Cờ DllCharacteristics hiển thị IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE.
Thử nghiệm kiểm chứng (Test): Kiểm tra địa chỉ nạp trong RAM qua 5 lần khởi chạy ngẫu nhiên.
Kết quả (Result): Xác nhận 100%. Đơn vị địa chỉ luôn thay đổi theo ASLR.
Độ tin cậy (Confidence): High.
Giới hạn (Limitations): Cờ ASLR ở Client không thay thế được việc bảo mật trên Server.
```

### 5. Cấu Trúc Một Báo Cáo Bảo Mật Chuẩn (Security Finding Report)

1. **Title & Severity**: Tiêu đề ngắn gọn kèm mức độ nghiêm trọng (Critical / High / Medium / Low / Info) dựa trên CVSS v3.1.
2. **Affected Artifact**: Tệp thực thi, phiên bản và mã băm SHA-256.
3. **Trust Boundary**: Xác định vị trí ranh giới tin cậy bị vi phạm (ví dụ: Client-side trusted decision).
4. **Proof of Concept (PoC)**: Các bước tái lập ngắn nhất trong lab cô lập.
5. **Impact**: Tác động thực tế đối với hệ thống, không thổi phồng nguy cơ.
6. **Remediation**: Khuyến nghị sửa đổi mã nguồn gốc và đề xuất CI/CD Gate.

## Kết quả cần đạt

- Thực hiện workflow từ authorization đến remediation verification.
- Tách fact, observation, hypothesis, inference và conclusion.
- Tạo evidence index để reviewer tái lập.
- Viết finding có impact, confidence và giới hạn.

## 1. Playbook chuẩn

```text
1 Authorize and scope
2 Preserve artifact and hash
3 Static triage
4 Form a testable hypothesis
5 Controlled dynamic analysis
6 Identify root cause and trust boundary
7 Fix or recommend mitigation
8 Regression and security verification
9 Sign/hash and document release
10 Report, retain evidence and rollback
```

Mỗi bước có input, output và stop condition. Không nhảy từ “thấy string” tới “đã có lỗ hổng”.

## 2. Evidence index

```csv
id,type,description,target_sha256,tool,location
E01,json,PE triage,<hash>,pe_triage.py,evidence/E01.json
E02,image,branch before return,<hash>,x64dbg,evidence/E02.png
E03,text,test output,<patched-hash>,unit-test,evidence/E03.txt
```

Screenshot cần che username, đường dẫn cá nhân và secret; vẫn phải giữ đủ context để reviewer hiểu observation.

## 3. Hypothesis lifecycle

```markdown
H1: Release binary enables CFG.
Basis: DllCharacteristics flag observed by two parsers.
Test: compare linker config and load configuration.
Result: partially confirmed.
Confidence: medium.
Limit: flag alone does not prove every indirect call is protected.
```

Hypothesis bị bác bỏ vẫn là kết quả có giá trị nếu test đúng và evidence được giữ.

## 4. Finding structure

- Title và severity có lý do.
- Affected version/hash.
- Preconditions và trust boundary.
- Reproduction chỉ cho target lab/owner.
- Actual vs expected behavior.
- Impact thực tế, không phóng đại.
- Root cause và evidence reference.
- Remediation, verification và residual risk.

## 5. Peer-review lab

Mỗi nhóm nhận evidence của nhóm khác nhưng không nhận conclusion. Họ phải:

1. Tái lập tối thiểu một observation.
2. Chỉ ra evidence thiếu hoặc claim vượt dữ liệu.
3. Xếp confidence độc lập.
4. Xác nhận fix bằng black-box test.
5. Ghi điểm bất đồng thay vì ép đồng thuận.

## Bài tập và rubric

Nộp analysis playbook, evidence index và một finding hoàn chỉnh. Chấm: reproducibility 30, evidence 25, reasoning 20, report 15, scope/safety 10.

