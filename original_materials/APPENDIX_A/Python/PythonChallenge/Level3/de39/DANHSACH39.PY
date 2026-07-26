def dao_list(danhsach):
    return danhsach[::-1]

# Nhập vào danh sách
danhsach = input("Nhập danh sách với các phần tử các nhau bởi dấu phẩy: ").split(",")

# Xoá các khoảng trống ở đầu và cuối các phần tử
danhsach = [item.strip() for item in danhsach]

# Đảo ngược danh sách
dao_danhsach = dao_list(danhsach)

# In danh sách sau khi đã đảo người
print("Danh sách sau khi đảo ngược: ", dao_danhsach)