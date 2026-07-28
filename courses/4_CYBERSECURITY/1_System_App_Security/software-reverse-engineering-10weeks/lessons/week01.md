# Tuần 1: Phạm vi, đạo đức và lab cô lập

## Nguồn

Bài 1 và 3: tổng quan ethical hacking phần mềm, workspace và workflow.

## Mục tiêu

- Phân biệt reverse engineering hợp pháp, vulnerability research và piracy.
- Lập Rules of Engagement cho binary lab.
- Tạo VM có snapshot, logging và đường khôi phục.

## Lab checklist

1. Windows VM riêng, cập nhật và snapshot `clean-baseline`.
2. Không đăng nhập tài khoản cá nhân; tắt shared folder/clipboard khi phân tích mẫu lạ.
3. Cài x64dbg và Detect It Easy từ nguồn chính thức; ghi version/hash installer.
4. Tạo thư mục `samples`, `evidence`, `notes`, `patched`; sample để read-only.
5. Dùng binary “crackme” do lớp tự biên dịch và kèm license cho phép phân tích.

## Rules of Engagement tối thiểu

- Owner và người phê duyệt.
- Hash/tên binary, phạm vi chức năng và thời gian lab.
- Kỹ thuật được phép, dữ liệu cấm truy cập và tiêu chí dừng.
- Nơi lưu bằng chứng, thời hạn giữ và kênh báo cáo.

## Bài tập

Viết một trang authorization cho toy application. Bài không được bắt đầu nếu thiếu target hash hoặc quyền phân tích.

