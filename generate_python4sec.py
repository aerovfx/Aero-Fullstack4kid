import os

base_dir = "/Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersec-ai-10weeks/code/python/python4security"
os.makedirs(base_dir, exist_ok=True)

lessons = {
    "01_variables_and_io.py": """# Bài 1: Biến số và Nhập/Xuất dữ liệu (Variables & I/O)
# Trong bảo mật, chúng ta thường xuyên phải tương tác với người dùng để lấy thông tin.

# Khai báo biến (Variable) để lưu trữ một mục tiêu mạng
target_ip = "192.168.1.10"
port = 22

# Hàm print() dùng để xuất thông tin ra màn hình Terminal
print("=== HỆ THỐNG KIỂM THỬ BẢO MẬT ===")
print("Đang chuẩn bị quét IP:", target_ip, "trên cổng:", port)

# Hàm input() dùng để lấy dữ liệu nhập vào từ bàn phím của Hacker/Người dùng
# Dữ liệu lấy từ input() luôn luôn là một chuỗi văn bản (String)
username = input("Nhập tài khoản quản trị (admin): ")
password = input("Nhập mật khẩu: ")

# Sử dụng f-string (chữ f đặt trước chuỗi) để dễ dàng ghép biến vào câu văn
print(f"[*] Đang thử đăng nhập vào {target_ip} với tài khoản {username}:{password}")
""",
    "02_data_types_and_casting.py": """# Bài 2: Kiểu dữ liệu và Ép kiểu (Data Types & Casting)
# Xử lý địa chỉ IP và Port đòi hỏi sự chính xác về kiểu dữ liệu.

# 1. Chuỗi văn bản (String - str): Thường dùng để lưu địa chỉ IP hoặc tên miền
ip_address = "10.0.0.5"
domain = "google.com"

# 2. Số nguyên (Integer - int): Thường dùng để lưu số cổng (Port)
# Lưu ý: Port là số, không có dấu ngoặc kép
http_port = 80
ssh_port = 22

# 3. Số thực (Float - float): Lưu thời gian trễ (timeout) hoặc phiên bản phần mềm
timeout_seconds = 2.5

# 4. Kiểu luận lý (Boolean - bool): Chỉ có True (Đúng) hoặc False (Sai)
is_vulnerable = True # Máy chủ có lỗ hổng không?

print(f"Mục tiêu {ip_address} mở cổng {http_port}. Lỗ hổng: {is_vulnerable}")

# --- ÉP KIỂU (Casting) ---
# Khi người dùng nhập số cổng từ bàn phím, nó là Chuỗi (String)
user_input_port = input("Nhập cổng muốn quét (vd: 443): ") # Ví dụ nhập "443"

# Nếu chúng ta muốn làm toán (vd cộng thêm 1) với Port này, ta phải ép nó về số nguyên (int)
real_port = int(user_input_port)
print(f"Cổng tiếp theo sẽ quét là: {real_port + 1}")
""",
    "03_conditions.py": """# Bài 3: Cấu trúc rẽ nhánh (If - Else)
# Dùng để kiểm tra quyền truy cập hoặc đối chiếu mật khẩu (Access Control).

print("=== HỆ THỐNG ĐĂNG NHẬP ===")
# Giả lập mật khẩu đúng lưu trong cơ sở dữ liệu
correct_password = "SuperSecretPassword123!"

# Lấy mật khẩu do người dùng nhập
user_pass = input("Password: ")

# Lệnh if (nếu) dùng để so sánh 2 giá trị. Ký hiệu == nghĩa là "bằng nhau tuyệt đối"
if user_pass == correct_password:
    print("[+] Đăng nhập thành công! Chào mừng Admin.")
    print("Truy cập hệ thống cấp quyền cao nhất...")
    
# elif (else if - nếu không thì, xét điều kiện khác)
elif user_pass == "admin":
    print("[-] Mật khẩu quá yếu! Hãy đổi mật khẩu ngay lập tức.")
    
# else (nếu tất cả các điều kiện trên đều sai)
else:
    print("[!] CẢNH BÁO: Mật khẩu sai. Ghi log địa chỉ IP kẻ xâm nhập!")
""",
    "04_loops.py": """# Bài 4: Vòng lặp (Loops)
# Vũ khí quan trọng để tự động hoá: Quét hàng ngàn Port, thử hàng ngàn Mật khẩu (Brute-force).

import time # Thư viện thời gian để giả lập độ trễ

# 1. Vòng lặp FOR: Biết trước số lần lặp
print("--- BẮT ĐẦU QUÉT CỔNG (PORT SCANNING) ---")
# Dùng range(20, 26) để tạo danh sách số từ 20 đến 25
for port in range(20, 26):
    print(f"Đang quét cổng {port}...")
    time.sleep(0.2) # Dừng 0.2 giây cho giống thật
    if port == 22:
        print("  => Cổng 22 (SSH) đang MỞ!")

print("\\n--- BẮT ĐẦU TẤN CÔNG BRUTE-FORCE ---")
# 2. Vòng lặp WHILE: Lặp cho đến khi một điều kiện bị sai
attempts = 0
max_attempts = 3

# Vòng lặp sẽ chạy chừng nào attempts còn nhỏ hơn max_attempts
while attempts < max_attempts:
    pwd = input(f"Lần thử thứ {attempts + 1}, Nhập mã PIN (4 số): ")
    if pwd == "9999":
        print("Mã PIN chính xác! Đã mở khóa két sắt.")
        break # Lệnh break dùng để phá vỡ và thoát khỏi vòng lặp ngay lập tức
    else:
        print("Mã PIN sai.")
        attempts = attempts + 1 # Tăng số lần thử lên 1

# Kiểm tra xem vì sao vòng lặp kết thúc
if attempts == max_attempts:
    print("Hệ thống tự động khóa vì thử sai quá nhiều lần!")
""",
    "05_lists_and_tuples.py": """# Bài 5: Danh sách và Tuple (Lists & Tuples)
# Dùng để lưu trữ hàng loạt địa chỉ IP hoặc tên miền thay vì khai báo từng biến một.

# 1. LIST (Danh sách): Ký hiệu bằng ngoặc vuông []. Có thể thay đổi, thêm, xoá dữ liệu.
# Khai báo một danh sách các IP nghi ngờ là botnet
suspicious_ips = ["192.168.1.100", "10.0.0.5", "172.16.2.8"]

print("Danh sách IP đen hiện tại:")
print(suspicious_ips)

# Lấy ra IP đầu tiên (Vị trí đếm từ số 0)
print(f"IP nguy hiểm nhất: {suspicious_ips[0]}")

# Thêm một IP mới vào cuối danh sách bằng hàm append()
suspicious_ips.append("8.8.8.8")
print("Đã cập nhật danh sách:", suspicious_ips)

# Dùng vòng lặp for để duyệt qua từng IP trong danh sách
print("Tiến hành chặn Firewall các IP:")
for ip in suspicious_ips:
    print(f"[Block] IP: {ip}")

# 2. TUPLE (Bộ): Ký hiệu bằng ngoặc tròn (). BẤT BIẾN - không thể thay đổi sau khi tạo.
# Thường dùng để lưu toạ độ, hoặc cặp (IP, Port) cố định để tránh vô tình ghi đè
server_address = ("192.168.1.1", 8080)
print(f"Server cố định tại: IP {server_address[0]}, Cổng {server_address[1]}")
# server_address[1] = 9000  <-- Nếu bỏ comment dòng này, Python sẽ báo lỗi vì Tuple không cho sửa
""",
    "06_dictionaries.py": """# Bài 6: Từ điển (Dictionaries)
# Cực kỳ quan trọng trong bảo mật để lưu trữ dữ liệu dạng Cặp "Khoá - Giá trị" (Key - Value).
# Ví dụ: Tên đăng nhập và Mật khẩu, hoặc IP và Tên máy tính.

# Khai báo Dictionary bằng ngoặc nhọn {}
credentials = {
    "admin": "Admin@123",
    "root": "toor",
    "guest": "123456"
}

print("=== HỆ THỐNG PHÂN TÍCH THÔNG TIN ĐĂNG NHẬP ===")
# Lấy mật khẩu của tài khoản 'root' (truy xuất thông qua Khoá/Key)
print(f"Mật khẩu của root là: {credentials['root']}")

# Thêm một tài khoản mới vào từ điển
credentials["hacker"] = "hacked_you!"
print("Đã thêm user 'hacker'.")

# Sửa mật khẩu của 'guest'
credentials["guest"] = "khong_co_mat_khau"

# Kiểm tra xem một user có tồn tại trong từ điển không
target_user = "admin"
if target_user in credentials:
    print(f"Tài khoản '{target_user}' CÓ trong hệ thống. Mật khẩu: {credentials[target_user]}")
else:
    print("Tài khoản không tồn tại.")

# Duyệt qua tất cả các cặp user-pass bằng hàm items()
print("\\nDanh sách toàn bộ User và Pass (Mô phỏng rò rỉ dữ liệu):")
for user, password in credentials.items():
    print(f"User: {user} | Pass: {password}")
""",
    "07_functions.py": """# Bài 7: Hàm (Functions)
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
print(f"Kết quả cổng 80: {result_80}\\n")

# Dùng vòng lặp gọi hàm nhiều lần để quét một dải cổng
danh_sach_cong = [21, 22, 80, 443, 3306]
for c in danh_sach_cong:
    ket_qua = port_scan(target, c)
    print(f"-> Cổng {c} đang {ket_qua}")
""",
    "08_error_handling.py": """# Bài 8: Xử lý ngoại lệ (Try - Except)
# Trong môi trường mạng mạng, kết nối bị đứt hoặc lỗi là chuyện bình thường.
# Hacker/Bảo mật viên không bao giờ được phép để tool của mình bị 'Crash' (văng lỗi đỏ) giữa chừng.

print("=== CHƯƠNG TRÌNH CHIA SỐ TỰ ĐỘNG ===")
# Lỗi chia cho số 0 (ZeroDivisionError) hoặc lỗi nhập chữ thay vì số (ValueError) rất hay gặp

try:
    # Đặt những dòng code CÓ NGUY CƠ GÂY LỖI vào trong khối try
    so_chia = input("Nhập số để chia 100: ")
    so_chia = int(so_chia) # Có thể văng lỗi nếu người dùng nhập chữ "abc"
    
    ket_qua = 100 / so_chia # Có thể văng lỗi nếu so_chia = 0
    print(f"100 / {so_chia} = {ket_qua}")

except ZeroDivisionError:
    # Nếu xảy ra lỗi chia cho 0, code sẽ nhảy vào đây thay vì làm crash chương trình
    print("[-] LỖI: Không thể chia một số cho 0. Hacker định phá sập hệ thống à?")
    
except ValueError:
    # Nếu xảy ra lỗi nhập chữ
    print("[-] LỖI: Vui lòng nhập SỐ, không nhập CHỮ.")
    
except Exception as e:
    # Bắt TẤT CẢ các lỗi khác chưa lường trước được
    print(f"[-] LỖI HỆ THỐNG KHÔNG XÁC ĐỊNH: {e}")
    
finally:
    # Khối finally luôn luôn chạy bất chấp có lỗi hay không. Thường dùng để đóng kết nối mạng, đóng file.
    print("[*] Dọn dẹp bộ nhớ và kết thúc quá trình kiểm tra.")
""",
    "09_file_handling.py": """# Bài 9: Xử lý Tệp tin (File Handling)
# Dùng để đọc danh sách mật khẩu (Wordlist) từ file txt hoặc ghi log kết quả tấn công ra file.

import os

# Đường dẫn file
file_path = "passwords.txt"

print("=== BƯỚC 1: GHI DỮ LIỆU RA FILE ===")
# Hàm open() mở file. Chế độ 'w' (Write) sẽ tạo file mới hoặc ghi đè lên file cũ.
# Dùng cấu trúc 'with' để tự động đóng file sau khi thao tác xong (rất an toàn).
with open(file_path, "w", encoding="utf-8") as file:
    file.write("admin123\\n")
    file.write("password\\n")
    file.write("12345678\\n")
print(f"Đã tạo file {file_path} và ghi 3 mật khẩu vào đó.")

print("\\n=== BƯỚC 2: GHI THÊM (APPEND) VÀO FILE ===")
# Chế độ 'a' (Append) dùng để ghi tiếp vào cuối file mà không xoá dữ liệu cũ
with open(file_path, "a", encoding="utf-8") as file:
    file.write("qwerty\\n")
print("Đã thêm mật khẩu 'qwerty'.")

print("\\n=== BƯỚC 3: ĐỌC DỮ LIỆU TỪ FILE ===")
# Chế độ 'r' (Read) dùng để đọc dữ liệu.
if os.path.exists(file_path): # Kiểm tra xem file có tồn tại không trước khi đọc
    with open(file_path, "r", encoding="utf-8") as file:
        # readlines() đọc toàn bộ file và trả về một danh sách (List) các dòng
        danh_sach_pass = file.readlines() 
        
        print(f"Đã tải {len(danh_sach_pass)} mật khẩu từ Wordlist:")
        for pwd in danh_sach_pass:
            # Dùng .strip() để cắt bỏ ký tự xuống dòng (\\n) ở cuối mỗi chữ
            print(f" - Đang thử: {pwd.strip()}")
else:
    print("File không tồn tại!")
""",
    "10_modules_and_os.py": """# Bài 10: Thư viện (Modules) và tương tác Hệ điều hành (OS)
# Python mạnh mẽ vì có các thư viện (module) viết sẵn. 
# Trong bảo mật, thư viện 'os' và 'sys' giúp tương tác trực tiếp với hệ điều hành của máy nạn nhân/máy chủ.

import os
import sys
import platform

print("=== THU THẬP THÔNG TIN HỆ THỐNG (FOOTPRINTING) ===")
# Lấy tên hệ điều hành (Windows, Linux, Darwin/macOS)
os_name = platform.system()
print(f"Hệ điều hành mục tiêu: {os_name}")
print(f"Phiên bản chi tiết: {platform.release()}")

# Lấy thư mục hiện tại mà script đang chạy (Current Working Directory)
current_dir = os.getcwd()
print(f"Thư mục hiện tại: {current_dir}")

print("\\n=== THỰC THI LỆNH HỆ THỐNG (COMMAND EXECUTION) ===")
# CẢNH BÁO BẢO MẬT: Hàm os.system() cho phép chạy các lệnh terminal ngay từ bên trong Python.
# Nếu kẻ tấn công chèn được mã độc vào hàm này, họ có thể chiếm quyền kiểm soát hệ thống.
print("Đang thực thi lệnh 'ping' tới localhost (chỉ ping 2 lần):")

if os_name == "Windows":
    # Lệnh ping trên Windows dùng -n
    os.system("ping -n 2 127.0.0.1")
else:
    # Lệnh ping trên Mac/Linux dùng -c
    os.system("ping -c 2 127.0.0.1")

print("\\n=== KẾT THÚC KHÓA HỌC PYTHON CƠ BẢN ===")
# Thoát chương trình một cách an toàn bằng sys.exit()
sys.exit(0)
"""
}

for filename, content in lessons.items():
    filepath = os.path.join(base_dir, filename)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
        
print(f"Successfully generated {len(lessons)} Python lessons at {base_dir}")
