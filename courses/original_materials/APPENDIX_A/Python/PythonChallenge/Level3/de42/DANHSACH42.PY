# Hàm kiểm tra danh sách có phần tử tăng dần, nếu tăng dần thì trả về kết quả True và ngược lại.
def kiem_tra_tang_dan(danh_sach):
    for i in range(len(danh_sach) - 1):
        if danh_sach[i] > danh_sach[i + 1]:
            return False
    return True

# Nhập danh sách các số nguyên từ người dùng
# Cách nhập 1:
# danh_sach = input("Nhập danh sách các số nguyên, cách nhau bởi dấu phẩy: ").split(",")
# danh_sach = [int(x.strip()) for x in danh_sach] # Gán biến danh_sach cho các số vừa nhập với vòng lặp for

# Cách nhập 2:
danh_sach = [1, 2, 4, 5, 6]

# Kiểm tra và in kết quả
if kiem_tra_tang_dan(danh_sach):
    print("Danh sách tăng dần")
else:
    print("Danh sách không tăng dần")
