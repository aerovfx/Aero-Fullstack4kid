# Đọc dữ liệu từ file HCN.INP
with open('HCN.INP', 'r') as f:
    n = int(f.readline())
    points = [list(map(int, line.split())) for line in f.readlines()]

# Tìm toạ độ của góc trên bên trái và góc dưới bên phải của hình chữ nhật
min_x = min([point[0] for point in points])
max_x = max([point[0] for point in points])
min_y = min([point[1] for point in points])
max_y = max([point[1] for point in points])

# Tính diện tích hình chữ nhật
width = max_x - min_x
height = max_y - min_y
area = width * height

# Ghi kết quả vào file HCN.OUT
with open('HCN.OUT', 'w') as f:
    f.write(str(area))
