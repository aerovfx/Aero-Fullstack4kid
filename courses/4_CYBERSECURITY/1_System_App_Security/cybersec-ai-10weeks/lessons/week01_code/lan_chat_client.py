import socket

print("="*50)
print("🌍 LAN CHAT CLIENT")
print("="*50)

# Hỏi người dùng nhập địa chỉ IP của máy chủ (do máy Server in ra trên màn hình)
target_ip = input("Nhập IP của máy chủ bạn muốn kết nối (vd: 192.168.1.5): ")
target_port = 9999

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    print(f"Đang gọi tới {target_ip}:{target_port}...")
    client.connect((target_ip, target_port))
    print("[+] KẾT NỐI THÀNH CÔNG! Bạn có thể bắt đầu chat.")
    print("-" * 50)
    
    while True:
        msg = input("Bạn gửi (gõ EXIT để thoát): ")
        client.send(msg.encode('utf-8'))
        
        if msg == 'EXIT':
            break
            
        print("Đang chờ máy kia trả lời...")
        reply = client.recv(1024).decode('utf-8')
        if not reply:
            print("Máy kia đã đóng kết nối.")
            break
            
        print(f"Bạn của bạn trả lời: {reply}")

except ConnectionRefusedError:
    print(f"[-] LỖI: Không thể kết nối. Hãy chắc chắn Server ở máy {target_ip} đang mở và bạn gõ đúng IP.")
except Exception as e:
    print(f"[-] Lỗi mạng: {e}")
finally:
    client.close()
    print("Đã thoát ứng dụng.")
