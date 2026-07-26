# Đọc dữ liệu từ file HCN.INP
with open('HCN.INP', 'r') as f:
    n = int(f.readline())
    points = [list(map(int, line.split())) for line in f.readlines()]
    print(points)
# with open('HCN.INP', 'r') as f:
#     n = int(f.readline())
#     ds = [list(map(int, line.split())) for line in f.readlines()]
# print(ds)

# Tìm các điểm cực đại và cực tiểu
min_x = min_y = 10000
max_x = max_y = -1000

for x, y in points:
    min_x = min(x, min_x)
    max_x = max(max_x, x)
    min_y = min(min_y, y)
    max_y = max(max_y, y)
print(min_x,max_x,min_y,max_y)

# Xác định toạ độ của 4 đỉnh hình chữ nhật
top_right = (max_x + 1, max_y + 1)
top_left = (min_x - 1, max_y + 1)
bottom_right = (max_x + 1, min_y - 1)
bottom_left = (min_x - 1, min_y - 1)
print(top_right,top_left,bottom_right,bottom_left)
# Tính chiều dài và chiều rộng của hình chữ nhật
width = top_right[0] - top_left[0]
height = top_right[1] - bottom_right[1]

# Tính diện tích hình chữ nhật
area = width * height

# Ghi kết quả vào file HCN.OUT
with open('HCN.OUT', 'w') as f:
    f.write(str(area))

"""
Bước 1: Đọc các toạ độ điểm từ file, ta có danh sách [[-1, 0], [0, 1], [-1, -1], [2, 0]]
Bước 2: Lấy toạ độ lớn nhất và nhỏ nhất của x và y với hàm min và max ta có -1 2 -1 1
Bước 3: Vẽ một hình chữ nhật tạo vởi các toạ độ x, y đó
Với min thì trừ toạ độ đi 1 giá trị còn max thì cộng thêm 1 giá trị
Bước 4: Tính chiều dài 2 cạnh a, b và nhân a với b để có diện tích

"""