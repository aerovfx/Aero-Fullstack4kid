import socket # Thư viện mạng

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Khởi tạo Socket
client.connect(('127.0.0.1', 9999)) # Gọi tới Server

# Bắt đầu vòng lặp vô hạn để chat liên tục
while True:
    # Hiển thị dấu nhắc để người dùng nhập tin nhắn từ bàn phím
    msg = input("Nhập tin nhắn (gõ EXIT để thoát): ")
    
    # Mã hoá tin nhắn và gửi sang Server
    client.send(msg.encode('utf-8'))
    
    # Nếu người dùng gõ chữ EXIT
    if msg == 'EXIT':
        break # Lập tức thoát khỏi vòng lặp và kết thúc chương trình
        
    # Nếu không phải EXIT, Client sẽ đứng chờ phản hồi từ Server
    reply = client.recv(1024).decode('utf-8')
    # In câu trả lời của Server ra màn hình
    print(f"Server nói: {reply}")

# Dọn dẹp bộ nhớ và tắt kết nối
client.close()
