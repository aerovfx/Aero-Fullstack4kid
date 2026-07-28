# Tuần 5: Audit branch và tìm root cause

## Nguồn bài học

**Reversing Jumps in Software Cracking** được chuyển thành bài audit control flow phòng thủ. Không thực hành đảo jump để vượt license hoặc authorization.

## Kết quả cần đạt

- Truy dữ liệu từ input đến `cmp/test` và conditional branch.
- Phân biệt branch behavior, business rule và security boundary.
- Chứng minh vì sao client-side-only decision không phải trust anchor.
- Đề xuất fix từ source cùng test tampering.

## 1. Branch không phải root cause

Một branch chỉ thể hiện quyết định tại build cụ thể. Đổi `je` thành `jne` có thể thay outcome nhưng:

- Không sửa dữ liệu đầu vào không đáng tin.
- Không tạo authorization đáng tin cậy.
- Có thể phá error path và gây fail-open.
- Không tồn tại sau rebuild/version update.
- Không cung cấp test, review, provenance hoặc rollback đúng chuẩn.

## 2. Toy case study

```c
#include <stdbool.h>
#include <string.h>

bool feature_allowed(const char *role, bool server_approved) {
    if (role == NULL) return false;
    return server_approved && strcmp(role, "student-lab") == 0;
}
```

Phiên bản lỗi chỉ kiểm tra `role` đọc từ file cục bộ. Phiên bản sửa còn yêu cầu `server_approved` từ thành phần tin cậy giả lập. Đây là mô hình dạy trust boundary, không phải cơ chế license production.

## 3. Data-flow questions

1. Input được tạo ở đâu và ai kiểm soát?
2. Parse/normalize trước hay sau validation?
3. Giá trị có chữ ký/xác thực hoặc freshness không?
4. Có đường gọi nào bỏ qua validation không?
5. Failure/timeout dẫn đến deny hay allow?
6. UI state có bị dùng thay authorization server-side không?

## 4. Lab

1. Chạy test matrix cho `role = NULL`, empty, `student-lab`, mixed case và chuỗi dài.
2. Dùng symbol để tới `feature_allowed` và vẽ CFG.
3. Ghi data origin, comparison, branch và caller sử dụng return value.
4. Không sửa jump. Chuyển sang source, bổ sung trust input và fail-closed.
5. Thêm unit test cho config tampering, timeout và approval false.
6. Build lại, tính hash và kiểm tra behavior cũ không bị phá.

## 5. Finding template

```markdown
Title: Authorization decision relies on user-controlled local role
Impact: Local user may request a privileged UI path
Evidence: input origin + CFG + test case; no third-party target
Root cause: untrusted client field used as sole authorization decision
Fix: enforce decision at trusted service; verify signed response; fail closed
Regression: allow valid approval, deny missing/invalid/stale approval
Residual risk: offline mode and clock policy require separate design
```

## Bài tập và rubric

Nộp CFG, data-flow map, finding và source fix. Chấm: root cause 30, evidence 25, remediation 20, tests 15, residual risk 10. Bài chỉ đảo opcode/branch không đạt.

