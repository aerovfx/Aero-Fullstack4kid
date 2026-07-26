"""
Bước 1: Đọc các toạ độ điểm từ file, ta có danh sách [[-1, 0], [0, 1], [-1, -1], [2, 0]]
Bước 2: Lấy toạ độ lớn nhất và nhỏ nhất của x và y với hàm min và max ta có -1 2 -1 1
Bước 3: Vẽ một hình chữ nhật tạo vởi các toạ độ x, y đó
Với min thì trừ toạ độ đi 1 giá trị còn max thì cộng thêm 1 giá trị
Bước 4: Tính chiều dài 2 cạnh a, b và nhân a với b để có diện tích
"""

with open('HINHCHUNHAT.INP', 'r') as file:
    n = int(file.readline().strip())
    points = [list(map(int, line.split())) for line in file.readlines()]
    # print(points)   
minx = miny = float('inf')
maxx = maxy = float('-inf')
# print(point)
for x, y in points:
    minx = min(x, minx)
    miny = min(y, miny)
    maxx = max(x, maxx)
    maxy = max(y, maxy)
# print(minx,maxx,miny,maxy)    
a = (maxx+1) - (minx-1)
b = (maxy+1) - (miny-1)
s = a*b
with open('HINHCHUNHAT.OUT','w') as file:
    file.write(str(s))