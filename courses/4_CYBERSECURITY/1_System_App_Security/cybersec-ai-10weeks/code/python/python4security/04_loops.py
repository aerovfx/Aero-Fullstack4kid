# Bài 4: Vòng lặp (Loops)
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

print("\n--- BẮT ĐẦU TẤN CÔNG BRUTE-FORCE ---")
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
