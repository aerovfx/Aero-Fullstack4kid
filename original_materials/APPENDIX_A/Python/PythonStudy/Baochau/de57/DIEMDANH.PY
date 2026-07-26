with open('DIEMDANH.INP', 'r') as file:
    n = int(file.readline().strip())
    danh_sach = [file.readline().strip() for _ in range(2 * n - 1)]
    print(danh_sach)
        
diem_danh = [0] * n # Ban đầu trạng thái ghi danh là = 0 tức là chưa ghi danh
print(diem_danh)
# Duyệt danh sách tên của N - 1 học sinh đã ghi danh
for i in range(n, 2 * n - 1):
    ten = danh_sach[i]
    # Nếu tên đã xuất hiện trong danh sách trước đó, đánh dấu là đã ghi danh
    if ten in danh_sach[i]:
        diem_danh[danh_sach.index(ten)] = 1 # 1 là đã ghi danh
print(diem_danh)

chua_diem_danh = []
for i in range(1, n):
    if diem_danh[i] == 0:
        chua_diem_danh.append(danh_sach[i])
print(chua_diem_danh)
with open('DIEMDANH.OUT', 'w') as file:
    for ten in chua_diem_danh:
        file.write(ten + "\n")