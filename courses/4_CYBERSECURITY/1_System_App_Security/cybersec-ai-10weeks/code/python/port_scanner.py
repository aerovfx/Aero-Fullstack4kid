import socket
import sys

def port_scanner(target_host, ports):
    """
    Hàm quét cổng đơn giản bằng Socket
    Simple TCP Port Scanner using Socket library
    """
    print(f"[*] Bắt đầu quét mục tiêu / Starting scan on: {target_host}")
    for port in ports:
        # Tạo socket TCP
        # Create a TCP socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # Thiết lập timeout phản hồi kết nối
        # Set connection timeout
        s.settimeout(0.5)
        
        # Kết nối tới mục tiêu (Trả về 0 nếu thành công)
        # Connect to target (Returns 0 if successful)
        result = s.connect_ex((target_host, port))
        if result == 0:
            print(f"[+] Cổng {port} đang MỞ / Port {port} is OPEN")
        s.close()

if __name__ == "__main__":
    host = "127.0.0.1"
    if len(sys.argv) >= 2:
        host = sys.argv[1]
        
    # Danh sách các cổng phổ biến để quét thử nghiệm
    # Common ports to scan for test
    test_ports = [21, 22, 23, 25, 53, 80, 110, 443, 3306, 8080]
    port_scanner(host, test_ports)
