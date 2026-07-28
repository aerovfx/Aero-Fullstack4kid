# Tuần 6: Secure patching và regression

## Nguồn

Bài 8: patch software application, áp dụng chỉ cho binary lab thuộc quyền kiểm soát.

## Mục tiêu

- Ưu tiên sửa source, rebuild và ký artifact mới.
- Hiểu binary patch là biện pháp cuối cùng khi có quyền nhưng mất source.
- Chứng minh patch đúng qua test và manifest hash.

## Quy trình chuẩn

1. Reproduce lỗi trên input tối thiểu và ghi hash binary gốc.
2. Tìm root cause, sửa source và code review.
3. Build tái lập nếu có thể; chạy unit/integration/regression test.
4. Tạo SBOM/release note, ký hoặc tạo hash manifest.
5. Pilot trong lab, theo dõi, phát hành và giữ rollback artifact.

Nếu buộc binary patch trong bài học: chỉ patch một chương trình do lớp tự tạo, ghi offset/byte trước-sau, không vô hiệu hóa license hoặc control bảo mật, và đánh dấu artifact không dùng production.

```bash
python code/hash_manifest.py create patched/manifest.json patched/toy.exe
python code/hash_manifest.py verify patched/manifest.json
```

## Bài tập

Nộp source diff, test report, before/after hash, rollback instruction và giải thích tại sao fix không mở rộng quyền ngoài ý muốn.

