import socket

def get_local_ip():
    """Hàm phụ trợ để tự động lấy địa chỉ IP LAN (Wi-Fi) của máy tính này."""
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # Không cần thực sự kết nối, chỉ mượn IP ảo để hệ điều hành nhả IP thực
        s.connect(('100.255.255.255', 1))
        IP = s.getsockname()[0]
    except Exception:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# CẢNH BÁO BẢO MẬT (WARNING):
# '0.0.0.0' nghĩa là Server sẽ lắng nghe trên TẤT CẢ các thẻ mạng (bao gồm cả Wi-Fi LAN).
# Bất kỳ ai dùng chung mạng Wi-Fi (bố mẹ, anh chị em, thiết bị lạ) đều có thể truy cập vào cổng 9999 của máy bạn.
server.bind(('0.0.0.0', 3667)) 
server.listen(5)

lan_ip = get_local_ip()
print("="*50)
print(f"🌍 LAN CHAT SERVER ĐANG CHẠY!")
print(f"👉 Hãy nói với máy tính thứ 2 nhập IP này vào Client: {lan_ip}")
print(f"👉 Cổng (Port): 3667")
print(f"👉 Cổng (Port): 6776")
print("="*50)
print("Đang chờ người thứ 2 kết nối...")

client, address = server.accept()
print(f"\\n[+] ĐÃ KẾT NỐI VỚI MÁY KHÁCH TẠI ĐỊA CHỈ: {address}")

while True:
    try:
        data = client.recv(1024).decode('utf-8')
        if not data or data == 'EXIT':
            print("Máy kia đã thoát cuộc trò chuyện.")
            break
            
        print(f"Bạn của bạn nói: {data}")
        
        reply = input("Bạn trả lời: ")
        client.send(reply.encode('utf-8'))
        
    except ConnectionResetError:
        print("Lỗi: Máy kia đã ngắt kết nối đột ngột.")
        break

client.close()
server.close()
print("Đã tắt Server.")
