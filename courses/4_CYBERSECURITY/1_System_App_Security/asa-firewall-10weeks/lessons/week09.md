# Tuần 9: Quản trị bằng ASDM

## Mục tiêu

- Cài/ghép đúng ASDM image với phiên bản ASA.
- Chỉ cho phép ASDM từ mạng quản trị.
- Đối chiếu thay đổi GUI với running-config và audit log.

## Video nguồn

Video 18–22: nâng cấp ASDM image, bật truy cập, đổi mật khẩu và cấu hình interface.

## Cấu hình truy cập minh họa

```text
configure terminal
http server enable
http 10.10.99.0 255.255.255.0 inside
aaa authentication http console LOCAL
asdm image disk0:/asdm-<approved-version>.bin
end
```

Tên image là placeholder. Chỉ dùng image vendor đã phê duyệt và kiểm checksum. Không mở ASDM từ `0.0.0.0/0` hoặc trực tiếp ra Internet.

## Bài thực hành

1. Ghi `show running-config` trước change.
2. Đổi mô tả một interface bằng ASDM.
3. Xem preview/audit nếu có, áp dụng rồi xuất running-config.
4. Diff trước/sau và xác định chính xác câu lệnh GUI đã tạo.
5. Hoàn tác và kiểm chứng.

## Bài tập

Lập bảng “CLI hay ASDM?” cho troubleshooting, bulk change, onboarding, audit và emergency recovery; nêu ưu/nhược điểm dựa trên khả năng kiểm soát thay đổi.

