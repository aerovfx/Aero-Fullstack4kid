# Hàm loại bỏ phần tử trùng nhau
def remove_dup(danhsach):
    return list(set(danhsach)) # hàm set() được sử dụng để tạo một tập hợp (set) chứa các phần tử duy nhất từ danh sách "danhsach"

# Nhập danh sách từ người dùng
danhsach = input("Nhập danh sách, các phần tử cách nhau bằng dấu phẩy: ").split(",")

# Xoá khoảng trắng ở đầu và cuối mỗi phần tử
danhsach = [item.strip() for item in danhsach]

# Loại bỏ các phần tử trùng
unique_lst = remove_dup(danhsach)

# In danh sách sau khi đã loại bỏ phần tử trùng nhau
print("Danh sách sau khi đã loại bỏ phần tử trùng nhau: ", unique_lst)