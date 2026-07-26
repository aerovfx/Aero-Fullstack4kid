# Hàm đọc dữ liệu từ file vào danh sách các điểm
def read_input(filename):
    points = []
    with open(filename, 'r') as f:
        n = int(f.readline().strip())  # Đọc số lượng điểm N
        for _ in range(n):
            x, y = map(int, f.readline().strip().split())  # Đọc tọa độ x, y của điểm
            points.append((x, y))
    return points

# Hàm tìm tất cả các hình chữ nhật có các cạnh song song với trục toạ độ
def find_rectangles(points):
    point_set = set(points)
    rectangles = set()  # Sử dụng tập hợp để tránh trùng lặp điểm

    for i in range(len(points)):
        for j in range(i + 1, len(points)):
            x1, y1 = points[i]
            x2, y2 = points[j]
            if x1 != x2 and y1 != y2:
                if (x1, y2) in point_set and (x2, y1) in point_set:
                    rect = tuple(sorted(((x1, y1), (x2, y1), (x2, y2), (x1, y2))))  # Sắp xếp tọa độ để đảm bảo thứ tự
                    rectangles.add(rect)

    return sorted(rectangles)  # Sắp xếp lại danh sách các hình chữ nhật

# Hàm định dạng chuỗi cho một hình chữ nhật
def format_rectangle(rect):
    return len(find_rectangles(points))
# Hàm ghi kết quả vào file
def write_output(rectangles, filename):
    with open(filename, 'w') as f:
        f.write(str(format_rectangle(points)) )

# Đọc dữ liệu từ file input
points = read_input('HINHCHUNHAT.INP')

# Tìm tất cả các hình chữ nhật thỏa mãn
rectangles = find_rectangles(points)

# Ghi kết quả vào file output
write_output(rectangles, 'HINHCHUNHAT.OUT')