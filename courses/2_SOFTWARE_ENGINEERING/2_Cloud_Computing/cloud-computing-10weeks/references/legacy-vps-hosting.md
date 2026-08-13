# Ghi chú nguồn: triển khai VPS thủ công

Tài liệu nguồn mô tả quy trình LAMP trên Ubuntu 18 và lựa chọn nhà cung cấp VPS. Nội dung được lưu để tham khảo lịch sử, không dùng nguyên trạng cho production vì phiên bản hệ điều hành, giá và thực hành bảo mật có thể đã thay đổi.

Các ý còn giá trị:

- Cấu hình firewall chỉ mở HTTP/HTTPS và SSH cần thiết.
- Dùng virtual host cho nhiều domain.
- Kiểm tra cấu hình trước khi restart web server.
- Phân quyền thư mục/tập tin theo nguyên tắc tối thiểu.
- Dùng TLS, secret manager, backup và monitoring trước khi public dịch vụ.

Không sao chép credential, IP hoặc giá nhà cung cấp vào code. Luôn dùng tài liệu chính thức hiện hành của hệ điều hành và nhà cung cấp.
