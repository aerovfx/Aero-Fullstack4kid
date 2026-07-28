# Tuần 6: Secure patching, regression và rollback

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

