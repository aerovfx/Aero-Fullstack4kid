# Đọc dữ liệu từ file đầu vào
with open("THT.INP", "r") as file_input:
    N = int(file_input.readline().strip())
    # danh_sach = [file_input.readline().strip() for _ in range(2 * N - 1)]
    # nếu dùng lệnh lặp và append thay vì viết tắt
    danh_sach = []
    for i in range(2 * N - 1):
        ten = file_input.readline().strip()
        danh_sach.append(ten)
    print(N, danh_sach)
    # ten = danh_sach[i]
    # for i in range(N, 2*(N-1)):
    #     if ten in danh_sach:
    #         dd = 1
    #     else:
    #         dd = 0
    # print(dd)


# Tạo danh sách để lưu trạng thái ghi danh của học sinh
diem_danh = [0] * N # Ban đầu trạng thái ghi danh là = 0 tức là chưa ghi danh
print(diem_danh)
# Duyệt danh sách tên của N - 1 học sinh đã ghi danh
for i in range(N, 2 * N - 1):
    ten = danh_sach[i]
    # Nếu tên đã xuất hiện trong danh sách trước đó, đánh dấu là đã ghi danh
    if ten in danh_sach[i]:
        diem_danh[danh_sach.index(ten)] = 1 # 1 là đã ghi danh
print(diem_danh)
chua_diem_danh =[]
for i in range(1,N):
    if diem_danh[i] == 0:
        chua_diem_danh.append(danh_sach[i])
print(chua_diem_danh)
with open('THT.OUT','w') as file:
    file.write(str(chua_diem_danh))