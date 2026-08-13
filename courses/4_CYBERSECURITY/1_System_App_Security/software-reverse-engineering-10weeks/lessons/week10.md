# Tuần 10: License integrity, anti-tamper và capstone

## Nguồn bài học

- **Crack Serial Key of An Application Software For the First Time** được chuyển thành đánh giá thiết kế license phòng thủ. Khóa học không tạo keygen, serial hợp lệ hoặc hướng dẫn bypass phần mềm thật.

## Chuyên đề: Đánh Giá Thiết Kế License Integrity, Chống Can Thiệp (Anti-Tamper) & Đồ Á Capstone

### 1. Lời mở đầu: Mô hình Đe dọa (Threat Model) cho Ứng dụng Máy Trạm

Khi phát hành một phần mềm thương mại chạy trên máy trạm của khách hàng, nhà phát triển phải giả định rằng người dùng có toàn quyền kiểm soát môi trường phần cứng và hệ điều hành: họ có thể đọc bộ nhớ RAM, sửa file trên đĩa cứng, tạm dừng tiến trình qua Debugger hoặc thay đổi đồng hồ hệ thống. Một thiết kế bảo vệ bản quyền bền vững không dựa vào việc "giấu thuật toán" (Security through Obscurity) mà dựa trên các nguyên tắc mã hóa bất đối xứng (Public-key Cryptography) và xác thực từ Server.

### 2. So sánh Checksum, HMAC và Digital Signature

```text
+-----------------------------------------------------------------------------------------+
| Cơ chế | Secret tại Client? | Khả năng Chống Giả Mạo | Trường hợp Sử dụng Phù hợp      |
+-----------------------------------------------------------------------------------------+
| Checksum (CRC32/SHA256) | Không | Không (Kẻ tấn công tự tính lại Hash) | Kiểm tra lỗi truyền file ngẫu nhiên |
| HMAC (Shared Secret)    | Có   | Yếu (Lộ Shared Key trong RAM)       | Hai Server tin cậy giao tiếp      |
| Digital Signature (Ed25519) | Không | Rất cao (Client chỉ giữ Public Key) | Phát hành License Certificate    |
+-----------------------------------------------------------------------------------------+
```

### 3. Mô hình Xác thực License bằng Chữ ký số Ed25519

```json
{
  "version": 1,
  "product": "toy-re-lab",
  "license_id": "LIC-2026-99881",
  "customer_id": "student-001",
  "hardware_hash": "a1b2c3d4e5f6...",
  "issued_at": "2026-01-01T00:00:00Z",
  "expires_at": "2026-02-01T00:00:00Z",
  "features": ["analysis-lab", "advanced-capstone"]
}
```

* **Server Side**: Nhà phát hành dùng Private Key (được bảo vệ trong HSM/Server) để ký số lên chuỗi JSON trên.
* **Client Side**: Ứng dụng nhúng Public Key để xác minh chữ ký (`crypto_sign_verify_detached`). Ngăn chặn tuyệt đối việc kẻ tấn công tự viết Keygen hoặc sửa ngày hết hạn trong License File.

### 4. Quy định & Tiêu chí Đánh giá Đồ án Capstone

Học viên lựa chọn 1 trong 3 hướng Đồ án Capstone phòng thủ:
- **Option A: Parser Hardening**: Phân tích PE toy app bị lỗi parser, tái lập crash, sửa mã nguồn C/C++, thực hiện Fuzzing/Negative testing và phát hành bản vá có manifest.
- **Option B: GUI Authorization Hardening**: Truy vết luồng sự kiện GUI tới Service Boundary, loại bỏ các quyết định bảo mật sai lầm chỉ nằm ở Client-side, chuyển sang mô hình Fail-closed.
- **Option C: Signed License Integrity Design**: Đánh giá thiết kế license không an toàn, xây dựng mô hình mã hóa chữ ký số bất đối xứng kèm theo bộ Unit Test xác minh.

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
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
