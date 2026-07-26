"""Bước 1: Đọc các toạ độ điểm từ file, ta có danh sách [[-1, 0], [0, 1], [-1, -1], [2, 0]]
Bước 2: Lấy toạ độ lớn nhất và nhỏ nhất của x và y với hàm min và max ta có -1 2 -1 1
Bước 3: Vẽ một hình chữ nhật tạo vởi các toạ độ x, y đó
Với min thì trừ toạ độ đi 1 giá trị còn max thì cộng thêm 1 giá trị
Bước 4: Tính chiều dài 2 cạnh a, b và nhân a với b để có diện tích
"""
    
with open('HINHCHUNHAT.INP', 'r') as file:
    n = int(file.readline().strip())
    point = [list(map(int, line.split())) for line in file.readlines()]
        
min_x = min_y = float('inf')
max_x = max_y = float('-inf')
#Lấy toạ độ lớn nhất và nhỏ nhất của x và y

for x,y in point:
    min_x = min(min_x, x)
    max_x = max(x, max_x)
    min_y = min(y, min_y)
    max_y = max(y, max_y)
        
print(min_x, max_x, min_y, max_y)  
dai = (max_x + 1) - (min_x -1)
rong = (max_y+1) - (min_y-1)
s = dai*rong
with open('HINHCHUNHAT.OUT', 'w') as file:
    file.write(str(s))