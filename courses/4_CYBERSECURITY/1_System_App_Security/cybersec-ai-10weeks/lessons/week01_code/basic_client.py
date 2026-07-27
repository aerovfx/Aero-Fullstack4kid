import socket # Nhập thư viện mạng

# Khởi tạo Socket máy khách với chuẩn IPv4 và giao thức TCP
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Yêu cầu gọi điện kết nối tới Server đang chạy ở địa chỉ '127.0.0.1' và cổng 9999
client.connect(('127.0.0.1', 9999))

# Gửi một chuỗi văn bản tới Server bằng hàm send()
# Bắt buộc phải dùng hàm encode('utf-8') để mã hoá văn bản thành các byte nhị phân trước khi truyền đi qua dây cáp mạng
client.send("Xin chao, toi la Client!".encode('utf-8'))

# Sau khi gửi xong thì ngắt kết nối với Server
client.close()
