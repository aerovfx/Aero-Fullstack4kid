# Bài 7: Hàm (Functions)
# Hàm giúp đóng gói các đoạn code dùng nhiều lần thành một khối duy nhất, giúp code gọn gàng.

# Định nghĩa (define) một hàm bằng từ khoá 'def', theo sau là tên hàm và tham số truyền vào
def port_scan(ip, port):
    '''
    Hàm này mô phỏng việc quét cổng. (Phần text nằm trong 3 ngoặc đơn là Docstring giải thích hàm)
    '''
    print(f"[*] Đang quét {ip} trên cổng {port}...")
    
    # Giả lập logic: Nếu cổng là 80 hoặc 443 thì báo MỞ, còn lại báo ĐÓNG
    if port == 80 or port == 443:
        return "MỞ (OPEN)" # Hàm return dùng để trả về kết quả cho người gọi
    else:
        return "ĐÓNG (CLOSED)"

# Gọi hàm và truyền tham số vào để sử dụng
print("=== CÔNG CỤ SCANNER CƠ BẢN ===")
target = "10.10.10.5"

# Quét cổng 80 và hứng kết quả vào biến
result_80 = port_scan(target, 80)
print(f"Kết quả cổng 80: {result_80}\n")

# Dùng vòng lặp gọi hàm nhiều lần để quét một dải cổng
danh_sach_cong = [21, 22, 80, 443, 3306]
for c in danh_sach_cong:
    ket_qua = port_scan(target, c)
    print(f"-> Cổng {c} đang {ket_qua}")
