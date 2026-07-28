# Tuần 7: Quy trình phân tích tái lập và báo cáo finding

## Nguồn bài học

**Summary of Software Cracking Workflow** được chuyển thành playbook reverse engineering phòng thủ có chain of custody, hypothesis và verification.

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

