# Ví dụ sử dụng chương trình
#danh_sach = [2, 4, 8, 16, 32, 64, 128, 256, 512]

# Nhập chuỗi danh sách từ bàn phím
input_string = input("Nhập các phần tử của danh sách, cách nhau bằng dấu phẩy: ")

# Tách các phần tử bằng dấu phẩy và loại bỏ khoảng trắng
elements = input_string.split(',')

# Chuyển đổi các phần tử thành số nguyên
danh_sach = [int(element.strip()) for element in elements]

# Hiển thị danh sách đã nhập
print("Danh sách:", danh_sach)

def is_cap_so_nhan(sequence):
    # Kiểm tra dãy có ít nhất 2 phần tử không
    if len(sequence) < 2:
        return False

    # Tính công bội
    r = sequence[1] / sequence[0]

    # Kiểm tra các phần tử còn lại trong dãy
    for i in range(1, len(sequence)):
        # Kiểm tra công bội giữa các phần tử liền kề
        if sequence[i] / sequence[i-1] != r:
            return False

    # Dãy là cấp số nhân
    return True, r, sequence[-1]




if is_cap_so_nhan(danh_sach):
    print("Dãy là cấp số nhân")
    _, cong_boi, so_hang_thu_n = is_cap_so_nhan(danh_sach)
    print("Công bội:", cong_boi)
    print("Số hạng thứ n:", so_hang_thu_n)
   
else:
    print("Dãy không phải là cấp số nhân")
