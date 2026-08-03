import socket # Nhập thư viện socket có sẵn của Python để sử dụng các hàm giao tiếp mạng

# Khởi tạo Socket (AF_INET = dùng địa chỉ IPv4, SOCK_STREAM = dùng giao thức TCP)
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Gắn socket này vào địa chỉ IP nội bộ '127.0.0.1' (localhost) và mở cổng 9999 để chờ kết nối
server.bind(('192.168.1.100', 9999))

# Bắt đầu lắng nghe các yêu cầu kết nối tới. Số 1 nghĩa là chỉ cho phép tối đa 1 người chờ trong hàng đợi
server.listen(1)
print("Server đang chờ kết nối trên port 9999...")

# Hàm accept() sẽ chặn (dừng) chương trình ở dòng này cho đến khi có một client thực sự kết nối vào
# Nó trả về 2 giá trị: 'client' là một đối tượng socket mới dành riêng để nói chuyện với người này, 'address' là IP và Port của họ
client, address = server.accept()
print(f"Có người kết nối từ: {address}")

# Nhận dữ liệu từ client thông qua hàm recv(). Tham số 1024 là số byte tối đa nhận trong 1 lần
# Dữ liệu truyền qua mạng luôn ở dạng byte thô, nên phải dùng hàm decode('utf-8') để dịch nó về lại chuỗi văn bản (string)
msg = client.recv(1024).decode('utf-8')
print(f"Tin nhắn nhận được: {msg}")

# Sau khi hoàn tất công việc, bắt buộc phải đóng kết nối với client để giải phóng bộ nhớ
client.close()
# Và đóng luôn cửa (port) của Server
server.close()