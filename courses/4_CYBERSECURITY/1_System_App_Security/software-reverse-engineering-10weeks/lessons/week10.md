# Tuần 10: License integrity, anti-tamper và capstone

## Nguồn

Bài 12 về serial-key cracking được chuyển thành đánh giá phòng thủ cơ chế cấp phép của toy application.

## Mục tiêu

- Giải thích vì sao secret/decision hoàn toàn ở client có thể bị quan sát hoặc sửa.
- Thiết kế license verification có chữ ký và server-side entitlement khi phù hợp.
- Báo cáo weakness mà không tạo keygen hoặc crack phần mềm thật.

## Thiết kế phòng thủ

- License payload chứa product, subject, feature và expiry; nhà phát hành ký bằng private key ngoại tuyến/an toàn.
- Client chỉ chứa public key để xác minh chữ ký; không nhúng secret đối xứng dùng chung.
- Entitlement giá trị cao được server kiểm lại; hỗ trợ revocation, clock abuse policy và offline grace rõ ràng.
- Code obfuscation/anti-debug chỉ tăng chi phí, không thay thế cryptographic verification.
- Failure mode rõ ràng, tôn trọng privacy và không làm mất dữ liệu người dùng.

## Capstone

Phân tích một toy PE được cấp phép, lập static/dynamic evidence, tìm một weakness, sửa source, tạo regression/tamper tests và hash manifest. Không nộp patched third-party binary, serial/keygen hay hướng dẫn bypass.

## Rubric 100 điểm

Authorization/safety 15; methodology/evidence 20; technical analysis 20; root-cause fix 20; tests/rollback 15; report/limitations 10. Vi phạm phạm vi hoặc dùng phần mềm thương mại làm target: không đạt.

