# Tuần 6: Secure patching, regression và rollback

## Nguồn bài học

**How to patch a Software Application** được tái cấu trúc thành quy trình vá phần mềm có kiểm soát. Ưu tiên source patch; binary patch chỉ dùng trên toy artifact thuộc khóa.

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

