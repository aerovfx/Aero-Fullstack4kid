# Bài 8: Xử lý ngoại lệ (Try - Except)
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
