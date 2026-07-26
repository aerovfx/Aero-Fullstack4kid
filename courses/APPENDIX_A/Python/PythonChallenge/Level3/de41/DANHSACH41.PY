def tinh_tong_danh_sach(danh_sach):
    tong = sum(danh_sach)
    return tong

# Nhập danh sách các số nguyên từ người dùng
danh_sach = input("Nhập các số nguyên, cách nhau bằng dấu phẩy: ").split(",")
danh_sach = [int(x) for x in danh_sach]

# Gọi hàm tính tổng và in ra kết quả
tong = tinh_tong_danh_sach(danh_sach)
print("Tổng các phần tử trong danh sách là:", tong)
