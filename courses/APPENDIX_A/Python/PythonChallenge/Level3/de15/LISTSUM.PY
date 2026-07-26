# Đọc dữ liệu từ file INPUT
with open("LISTSUM.INP", "r") as file:
    lines = file.readlines()

# Tính tổng của từng dòng và lưu vào danh sách kết quả
ket_qua = []
for line in lines:
    danh_sach = line.strip().split()
    tong = sum(map(int, danh_sach))
    ket_qua.append(tong)

# Xuất kết quả vào file OUTPUT
with open("LISTSUM.OUT", "w") as file:
    for ketqua in ket_qua:
        file.write(str(ketqua) + "\n")
