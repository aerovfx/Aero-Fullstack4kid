# Tuần 9: PE GUI, imports, resources và cấu hình

## Nguồn

Bài 11: phân tích PE cho chương trình GUI.

## Mục tiêu

- Đọc PE header, section, import table và resource ở mức triage.
- Nhận diện secret/config nhúng không an toàn.
- Đánh giá mitigation mà không chỉ dựa vào tên section.

## Checklist

- Architecture, subsystem và compile timestamp có đáng tin không?
- Section permission có W+X bất thường không?
- Import nào liên quan file, registry, process, network, crypto?
- Resource/string có endpoint, debug path hoặc credential không?
- Binary có ASLR/DEP/CFG/signature theo yêu cầu release không?

Tool output cần được xác minh với nhiều nguồn. Timestamp có thể bị thay đổi; string có thể không reachable; import có thể được load động.

## Lab

So sánh hai build của toy GUI: một build chứa API key giả trong resource và một build đọc secret từ secure configuration. Viết finding, không trích xuất/hiển thị secret thật.

## Bài tập

Đề xuất CI checks cho secret scanning, compiler hardening, signing và reproducible provenance.

