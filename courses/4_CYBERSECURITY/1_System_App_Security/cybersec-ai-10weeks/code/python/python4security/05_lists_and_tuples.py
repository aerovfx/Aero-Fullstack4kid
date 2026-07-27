# Bài 5: Danh sách và Tuple (Lists & Tuples)
# Dùng để lưu trữ hàng loạt địa chỉ IP hoặc tên miền thay vì khai báo từng biến một.

# 1. LIST (Danh sách): Ký hiệu bằng ngoặc vuông []. Có thể thay đổi, thêm, xoá dữ liệu.
# Khai báo một danh sách các IP nghi ngờ là botnet
suspicious_ips = ["192.168.1.100", "10.0.0.5", "172.16.2.8"]

print("Danh sách IP đen hiện tại:")
print(suspicious_ips)

# Lấy ra IP đầu tiên (Vị trí đếm từ số 0)
print(f"IP nguy hiểm nhất: {suspicious_ips[0]}")

# Thêm một IP mới vào cuối danh sách bằng hàm append()
suspicious_ips.append("8.8.8.8")
print("Đã cập nhật danh sách:", suspicious_ips)

# Dùng vòng lặp for để duyệt qua từng IP trong danh sách
print("Tiến hành chặn Firewall các IP:")
for ip in suspicious_ips:
    print(f"[Block] IP: {ip}")

# 2. TUPLE (Bộ): Ký hiệu bằng ngoặc tròn (). BẤT BIẾN - không thể thay đổi sau khi tạo.
# Thường dùng để lưu toạ độ, hoặc cặp (IP, Port) cố định để tránh vô tình ghi đè
server_address = ("192.168.1.1", 8080)
print(f"Server cố định tại: IP {server_address[0]}, Cổng {server_address[1]}")
# server_address[1] = 9000  <-- Nếu bỏ comment dòng này, Python sẽ báo lỗi vì Tuple không cho sửa
