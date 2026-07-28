# Tuần 10: Translation profile và đồ án tổng hợp

## Mục tiêu

- Áp translation profile đúng chiều inbound/outbound.
- Kiểm thử dial plan bằng ma trận số trước khi nối trunk.
- Bàn giao hệ thống VoIP cùng tài liệu vận hành và bảo mật.

## Video nguồn

Bài 25–26: inbound translation từ PSTN và hiệu chỉnh outbound Caller ID.

## Ví dụ

```text
voice translation-rule 20
 rule 1 /^0287300\(...\)$/ /2\1/
voice translation-profile PSTN-IN
 translate called 20
dial-peer voice 201 pots
 incoming called-number 0287300...
 translation-profile incoming PSTN-IN
```

Escape/capture syntax thay đổi theo IOS context; kiểm tra bằng `test voice translation-rule 20 <number>` trước khi áp dụng. Không thay đổi Caller ID trái quy định nhà mạng hoặc giả mạo danh tính.

## Đồ án cuối khóa

Xây hai site có voice/data VLAN, CME, SCCP hoặc SIP endpoint và SIP trunk giả lập. Yêu cầu:

- Dial plan 2XXX/3XXX, gọi nội bộ/liên site và translation vào/ra.
- Chọn codec dựa trên capacity plan và nêu QoS policy.
- Trusted peer, endpoint authentication, `max-conn` và logging.
- Test matrix ít nhất 12 ca gồm success, reject, busy và mất trunk.
- Runbook đăng ký lỗi, one-way audio, dial-peer mismatch và rollback.

## Rubric

Thiết kế 20; cấu hình 25; voice quality/capacity 15; bảo mật 15; kiểm thử 15; tài liệu/demo 10. Không đạt nếu dùng credential thật hoặc tương tác trunk ngoài phạm vi được ủy quyền.

