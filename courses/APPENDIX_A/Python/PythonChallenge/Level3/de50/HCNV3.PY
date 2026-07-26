# Hàm đọc dữ liệu từ file và trả về danh sách các điểm
def read_input(filename):
    points = []
    with open(filename, 'r') as f:
        n = int(f.readline().strip())  # Đọc số lượng điểm N
        for _ in range(n):
            x, y = map(int, f.readline().strip().split())  # Đọc tọa độ x, y của điểm
            points.append((x, y))
    return points

# Hàm tìm và đếm số lượng hình chữ nhật thỏa mãn yêu cầu
def find_rectangles(points):
    point_set = set(points)
    rectangles = set()  # Sử dụng tập hợp để tránh trùng lặp hình chữ nhật

    for i in range(len(points)):
        for j in range(i + 1, len(points)):
            x1, y1 = points[i]
            x2, y2 = points[j]
            if x1 != x2 and y1 != y2:
                if (x1, y2) in point_set and (x2, y1) in point_set:
                    rect = tuple(sorted(((x1, y1), (x2, y1), (x2, y2), (x1, y2))))  # Sắp xếp tọa độ để đảm bảo thứ tự
                    rectangles.add(rect)

    return len(rectangles)  # Trả về số lượng hình chữ nhật thỏa mãn

# Đọc dữ liệu từ file input
points = read_input('HCN.INP')

# Tìm và đếm số lượng hình chữ nhật thỏa mãn
num_rectangles = find_rectangles(points)

# Ghi kết quả vào file output
with open('HCN.OUT', 'w') as f:
    f.write(str(num_rectangles) + '\n')
