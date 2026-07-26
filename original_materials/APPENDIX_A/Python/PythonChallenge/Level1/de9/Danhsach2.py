with open('danhsach2.INP', 'r') as file:
    # Đọc dòng đầu tiên và trích xuất giá trị của n và r
    danh_sach = list(map(int, file.readline().split(",")))
print(danh_sach)

