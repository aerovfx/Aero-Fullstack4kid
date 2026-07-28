# Tuần 7: Quy trình phân tích tái lập

## Nguồn

Bài 9: tổng kết workflow software cracking, được chuyển thành playbook reverse engineering có kiểm soát.

## Mục tiêu

- Tách hypothesis, observation và conclusion.
- Ghi evidence đủ để người khác tái lập.
- Dừng đúng lúc khi phát hiện vượt phạm vi hoặc dữ liệu nhạy cảm.

## Playbook

```text
Authorize → Preserve/hash → Static triage → Form hypothesis
→ Controlled dynamic analysis → Root cause → Fix
→ Regression/security test → Sign/hash → Report/rollback
```

Mỗi finding cần: target hash/version, môi trường, steps, expected/actual, impact, confidence, evidence reference, remediation và verification.

## Tiêu chí dừng

Dừng ngay nếu target/hash không khớp, thấy credential/dữ liệu ngoài phạm vi, mẫu cố thoát VM, analysis cần kết nối hệ thống thật hoặc quyền ủy quyền không rõ.

## Bài tập

Nhận một bộ evidence bị thiếu thông tin và viết danh sách điều chưa thể kết luận. Chất lượng khóa học được đo bằng kết luận có căn cứ, không phải số lượng “lỗi” tìm thấy.

