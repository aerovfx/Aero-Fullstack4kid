# Tuần 2: Console, CLI và chế độ cấu hình

## Mục tiêu

- Kết nối console và nhận biết user EXEC, privileged EXEC, global/interface config.
- Dùng lệnh `show` để khảo sát mà không thay đổi trạng thái.
- Ghi lại cấu hình trước/sau một change.

## Video nguồn

Video 3–4: kết nối CLI và khảo sát chế độ dòng lệnh.

## Lab

```text
enable
show version
show inventory
show running-config
show interface ip brief
show route
configure terminal
hostname ASA-LAB
end
show running-config | include hostname
```

Tên lệnh có thể khác theo phiên bản ASA. Dùng `?` và tài liệu đúng phiên bản thay vì đoán cú pháp.

## Quy trình thay đổi nhỏ

1. Ghi ticket, mục tiêu và phạm vi.
2. Chụp `show running-config` và trạng thái liên quan.
3. Thay đổi một nhóm lệnh nhỏ.
4. Kiểm chứng control plane và traffic nghiệp vụ.
5. Chỉ lưu cấu hình khi kết quả đúng; nếu sai, rollback theo kế hoạch.

## Bài tập

Tạo cheat sheet 15 lệnh `show`, ghi rõ lệnh nào read-only và dữ liệu nào cần che trước khi chia sẻ log.

