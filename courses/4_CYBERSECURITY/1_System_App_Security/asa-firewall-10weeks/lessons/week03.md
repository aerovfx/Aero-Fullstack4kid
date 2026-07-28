# Tuần 3: Hardening và quản lý thông tin xác thực

## Mục tiêu

- Thiết lập baseline quản trị tối thiểu.
- Phân biệt enable secret, tài khoản cục bộ và AAA tập trung.
- Thực hiện khôi phục quyền quản trị theo quy trình có ủy quyền.

## Video nguồn

Video 5 về console/enable password và video 13 về khôi phục mật khẩu.

## Baseline minh họa

```text
configure terminal
hostname ASA-LAB
domain-name lab.example
username admin password <LAB_SECRET> privilege 15
aaa authentication ssh console LOCAL
service password-encryption
banner motd Authorized lab access only
end
```

Không chép mật khẩu thật vào tài liệu, terminal recording hoặc Git. Với môi trường thật, dùng vault, AAA tập trung, MFA qua jump host nếu nền tảng hỗ trợ và tài khoản riêng cho từng quản trị viên.

## Khôi phục có kiểm soát

Quy trình gồm: xác minh quyền sở hữu, phê duyệt downtime, sao lưu nếu còn truy cập, theo runbook đúng model/version, đặt secret mới, phục hồi boot settings, kiểm chứng cấu hình, thu hồi credential tạm và lập biên bản. Khóa học không dùng kỹ thuật này trên thiết bị ngoài lab.

## Bài tập

Viết checklist offboarding quản trị viên và bảng bằng chứng audit cần lưu sau một lần password recovery.

