import socket
import logging 

# Cấu hình bộ ghi nhật ký
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

def run_lan_server():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        
        # SỬA Ở ĐÂY: Dùng '0.0.0.0' để lắng nghe trên TẤT CẢ các địa chỉ IP của máy, 
        # giúp các máy trong mạng LAN có thể kết nối được.
        server.bind(('0.0.0.0', 3200)) 
        
        server.listen(5) 
        # SỬA Ở ĐÂY: Sửa lại câu thông báo cho đúng thực tế
        logging.info("🛡️ Server đang lắng nghe trên cổng 3200 (Sẵn sàng nhận kết nối từ mạng LAN)")
        
        while True: 
            try: 
                client_conn, client_addr = server.accept() 
                
                # SỬA Ở ĐÂY: Thay vì chỉ cho phép 127.0.0.1, chúng ta cho phép các IP trong mạng LAN 
                # (Thường bắt đầu bằng 192.168.). Bạn có thể bỏ luôn khối if này nếu muốn mở hoàn toàn.
                if not client_addr[0].startswith('192.168.') and client_addr[0] != '127.0.0.1':
                    logging.warning(f"⚠️ Phát hiện IP lạ ngoài mạng LAN {client_addr[0]}! Đang chặn...")
                    client_conn.close() 
                    continue 
                
                with client_conn:
                    logging.info(f"✅ Đã kết nối với máy khách: {client_addr}")
                    
                    while True:
                        data = client_conn.recv(1024) 
                        if not data: 
                            break 
                        
                        msg = data.decode('utf-8') 
                        logging.info(f"📥 Nhận được từ {client_addr[0]}: {msg}") 
                        
                        response = f"[Server Ack] Đã nhận {len(msg)} ký tự."
                        client_conn.sendall(response.encode('utf-8')) 
            
            except KeyboardInterrupt:
                logging.info("🛑 Admin đã chủ động tắt Server.")
                break 
            
            except Exception as e:
                logging.error(f"❌ Lỗi hệ thống: {e}")

if __name__ == "__main__":
    run_lan_server()