def tim_phan_tu_lon_nhat(danh_sach):
    if not danh_sach:
        return None, -1

    max_element = danh_sach[0]
    max_index = 0

    for i, num in enumerate(danh_sach):
        if num > max_element:
            max_element = num
            max_index = i

    return max_element, max_index

# Đọc dữ liệu từ người dùng (các số nguyên cách nhau bằng dấu cách)
danh_sach_str = input("Nhập danh sách các số nguyên cách nhau bằng dấu cách: ")
danh_sach = list(map(int, danh_sach_str.split()))

# Tìm phần tử lớn nhất và vị trí của nó trong danh sách
phan_tu_lon_nhat, vi_tri_lon_nhat = tim_phan_tu_lon_nhat(danh_sach)

if phan_tu_lon_nhat is not None:
    print(f"Phần tử lớn nhất là {phan_tu_lon_nhat}, nằm ở vị trí thứ {vi_tri_lon_nhat + 1} trong danh sách.")
else:
    print("Danh sách rỗng.")
