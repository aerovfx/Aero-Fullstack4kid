# Tuần 10: License integrity, anti-tamper và capstone

## Nguồn bài học

**Crack Serial Key of An Application Software For the First Time** được chuyển thành đánh giá thiết kế license phòng thủ. Khóa học không tạo keygen, serial hợp lệ hoặc hướng dẫn bypass phần mềm thật.

## Kết quả cần đạt

- Giải thích giới hạn của secret và quyết định chỉ tồn tại ở client.
- Phân biệt checksum, MAC và digital signature.
- Thiết kế signed license payload, expiry, revocation và offline grace.
- Hoàn thành capstone gồm analysis, fix, tests, manifest và report.

## 1. Threat model

Giả định người dùng kiểm soát máy client và có thể:

- Đọc file/config và quan sát process memory.
- Debug chương trình và thay đổi clock/network.
- Sao chép license file giữa máy.
- Chạy version cũ hoặc restore snapshot.

Không thiết kế client như trust anchor tuyệt đối. Mục tiêu thực tế là bảo vệ integrity, giảm lạm dụng, hỗ trợ người dùng hợp lệ và phát hiện/revoke khi phù hợp.

## 2. Checksum, MAC và signature

| Cơ chế | Secret verifier? | Phù hợp |
|---|---:|---|
| Hash/checksum | Không | Integrity do lỗi ngẫu nhiên, không chống giả mạo |
| HMAC | Có, shared key | Hai bên tin cậy; không phù hợp khi client không thể giữ secret |
| Digital signature | Public key không bí mật | Publisher ký, client verify mà không chứa private key |

Không tự phát minh crypto hoặc nhúng private/shared signing key trong client.

## 3. Signed license model

```json
{
  "version": 1,
  "product": "toy-re-lab",
  "subject": "student-001",
  "features": ["analysis-lab"],
  "issued_at": "2026-01-01T00:00:00Z",
  "expires_at": "2026-02-01T00:00:00Z",
  "license_id": "lab-example"
}
```

Publisher canonicalize payload và ký bằng private key được bảo vệ. Client chứa public key, xác minh signature, schema, product, expiry và policy. Entitlement giá trị cao nên được trusted service xác nhận khi mô hình cho phép.

## 4. Failure policy

- Invalid signature/schema/product → deny và error không lộ chi tiết nhạy cảm.
- Expired → grace period rõ ràng hoặc deny theo policy.
- Service unavailable → không tự động cấp quyền cao; cung cấp UX phục hồi hợp lý.
- Clock rollback → dùng server time/last-seen policy thận trọng, tránh khóa nhầm người dùng.
- Revocation → privacy-aware, audit được và có quy trình appeal/support.

Obfuscation, anti-debug và packing chỉ tăng chi phí quan sát; chúng không thay thế chữ ký hoặc server-side authorization và có thể làm accessibility/support kém hơn.

## 5. Capstone options

### A. Parser hardening

Phân tích toy PE có lỗi parser, tái lập crash, sửa source, test boundary/fuzz seed và phát hành patched artifact.

### B. GUI authorization

Truy event tới service boundary, phát hiện client-only decision, sửa fail-closed và thêm integration tests.

### C. License integrity design

Review toy unsigned license, thiết kế signed payload và verification tests. Không tạo bypass/keygen.

## 6. Deliverables

```text
capstone/
├── authorization.md
├── target-manifest.json
├── methodology.md
├── evidence-index.csv
├── finding.md
├── source-fix.diff
├── test-report.md
├── patched-manifest.json
├── rollback.md
└── limitations.md
```

## Rubric 100 điểm

| Tiêu chí | Điểm |
|---|---:|
| Authorization, isolation và ethics | 15 |
| Static/dynamic methodology | 15 |
| Evidence và reproducibility | 15 |
| Root-cause analysis | 15 |
| Source fix/design quality | 15 |
| Security + regression tests | 10 |
| Integrity, release và rollback | 10 |
| Report, limitations và demo | 5 |

Không đạt nếu target ngoài phạm vi, dùng phần mềm thương mại để crack, tạo serial/keygen hoặc nộp patched third-party binary.

