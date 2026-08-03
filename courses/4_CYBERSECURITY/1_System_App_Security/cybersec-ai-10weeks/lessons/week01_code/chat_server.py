import socket # Nhập thư viện socket mạng

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Tạo TCP Socket (IPv4)

# Cấu hình tuỳ chọn SO_REUSEADDR = 1 cho phép hệ điều hành sử dụng lại Port 9999 ngay lập tức sau khi tắt Server
# Tránh lỗi "Port is already in use" (Cổng đang được sử dụng) thường gặp khi chạy lại code nhiều lần
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) 

server.bind(('192.168.1.100', 80)) # Mở port 9999 trên máy ảo localhost
server.listen(1) # Bật chế độ lắng nghe
print("Server Chat đang chạy...")

client, address = server.accept() # Chờ Client kết nối và cấp cho họ một luồng giao tiếp riêng (biến client)
print(f"Đã kết nối với {address}")

# Sử dụng vòng lặp vô hạn while True để giữ kết nối liên tục, cho phép chat nhiều lần
while True:
    # Lệnh recv() sẽ chờ và nhận tin nhắn từ Client, dịch ngược từ bytes sang văn bản
    data = client.recv(1024).decode('utf-8')
    
    # Nếu Client mất kết nối đột ngột (không có data) hoặc Client chủ động gửi chữ 'EXIT'
    if not data or data == 'EXIT':
        print("Client đã ngắt kết nối.")
        break # Phá vỡ vòng lặp while, kết thúc việc chat
        
    print(f"Client: {data}") # In tin nhắn của Client ra màn hình
    
    # Dừng lại chờ người quản trị Server gõ câu trả lời từ bàn phím
    reply = input("Server trả lời: ")
    # Gửi câu trả lời đó ngược lại cho Client (nhớ mã hoá thành bytes)
    client.send(reply.encode('utf-8'))

# Khi vòng lặp kết thúc, thực hiện đóng các kết nối
client.close()
server.close()
