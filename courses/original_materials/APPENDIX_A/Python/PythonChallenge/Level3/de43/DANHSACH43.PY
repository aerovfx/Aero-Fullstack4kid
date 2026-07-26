def ghep_danh_sach(danh_sach1, danh_sach2):
    danh_sach_moi = danh_sach1 + danh_sach2
    return danh_sach_moi

# Nhập danh sách thứ nhất
danh_sach1 = input("Nhập danh sách thứ nhất, các phần tử cách nhau bằng dấu phẩy: ").split(',')

# Nhập danh sách thứ hai
danh_sach2 = input("Nhập danh sách thứ hai, các phần tử cách nhau bằng dấu phẩy: ").split(',')

# Gọi hàm ghep_danh_sach để ghép hai danh sách
danh_sach_moi = ghep_danh_sach(danh_sach1, danh_sach2)

# In ra danh sách mới
print("Danh sách mới sau khi ghép hai danh sách:")
print(danh_sach_moi)
