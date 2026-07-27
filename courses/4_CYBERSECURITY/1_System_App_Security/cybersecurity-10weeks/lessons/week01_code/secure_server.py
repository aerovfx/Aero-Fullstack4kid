import socket
import logging # Thư viện Logging chuyên dùng để ghi nhật ký hệ thống thay vì dùng lệnh print

# Cấu hình bộ ghi nhật ký: Hiển thị mức độ INFO trở lên, định dạng bao gồm thời gian (asctime) và thông báo (message)
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

def run_secure_server():
    # Sử dụng "Context manager" (từ khoá with) để khởi tạo Socket.
    # Lợi ích: Dù chương trình bị lỗi văng ra ngoài, 'with' vẫn đảm bảo socket luôn được đóng tự động (không bị treo Port)
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) # Cho phép tái sử dụng port ngay
        server.bind(('127.0.0.1', 9999)) # Chỉ được phép gán vào Localhost để đảm bảo cách ly mạng
        server.listen(5) # Cho phép tối đa 5 người xếp hàng chờ
        logging.info("🛡️ Secure Server đang lắng nghe trên 127.0.0.1:9999")
        
        while True: # Vòng lặp cấp 1: Giữ Server luôn chạy 24/7 để tiếp các Client khác nhau
            try: # Bắt đầu khối kiểm soát lỗi (Exception Handling)
                client_conn, client_addr = server.accept() # Chờ 1 Client bất kỳ nối máy
                
                # BẢO MẬT: Phân tích địa chỉ IP (client_addr[0]) của người vừa kết nối.
                # Nếu họ không đến từ 127.0.0.1 (Localhost), lập tức đá văng họ ra.
                if client_addr[0] != '127.0.0.1':
                    logging.warning(f"⚠️ Phát hiện IP lạ {client_addr[0]}! Đang chặn...")
                    client_conn.close() # Đóng kết nối ngay lập tức
                    continue # Bỏ qua các lệnh bên dưới, quay lại đầu vòng lặp while để chờ người khác
                
                # Nếu IP an toàn, tiếp tục dùng 'with' để quản lý kết nối riêng biệt của Client này
                with client_conn:
                    logging.info(f"✅ Đã kết nối với máy khách an toàn: {client_addr}")
                    
                    # Vòng lặp cấp 2: Phục vụ riêng cho Client này nhắn nhiều tin liên tục
                    while True:
                        data = client_conn.recv(1024) # Nhận dữ liệu
                        if not data: # Nếu Client mất tín hiệu
                            break # Thoát vòng lặp cấp 2, kết thúc phục vụ Client này
                        
                        msg = data.decode('utf-8') # Dịch dữ liệu
                        logging.info(f"📥 Nhận được: {msg}") # Ghi log thay vì print
                        
                        # Xây dựng câu phản hồi gồm chiều dài của chuỗi
                        response = f"[Server Ack] Đã nhận {len(msg)} ký tự."
                        client_conn.sendall(response.encode('utf-8')) # sendall() đảm bảo toàn bộ byte được đẩy đi hết
            
            # Nếu người quản trị (Admin) bấm Ctrl+C trên Terminal để tắt Server
            except KeyboardInterrupt:
                logging.info("🛑 Admin đã chủ động tắt Server.")
                break # Thoát vòng lặp cấp 1, tắt hoàn toàn chương trình
            
            # Bắt toàn bộ các lỗi chưa lường trước khác (như lỗi phần cứng mạng, tràn bộ nhớ...) để Server không bị Crash
            except Exception as e:
                logging.error(f"❌ Lỗi hệ thống: {e}")

if __name__ == "__main__":
    run_secure_server()
