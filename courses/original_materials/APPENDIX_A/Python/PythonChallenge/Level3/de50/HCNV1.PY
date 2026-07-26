"""
Chương trình này chưa loại bỏ được các hình chữ nhật trùng lặp

Để giải quyết bài toán này, bạn có thể sử dụng một thuật toán để tìm tất cả các hình chữ nhật có các cạnh song song 
với các trục toạ độ và có các đỉnh là 4 điểm trong danh sách đã cho. 
Dưới đây là một cách tiếp cận để làm điều này:

"""
# Đọc dữ liệu từ tệp HCN.INP:
def read_input(filename):
    points = []
    with open(filename, 'r') as f:
        n = int(f.readline().strip())
        for _ in range(n):
            x, y = map(int, f.readline().strip().split())
            points.append((x, y))
    return points

points = read_input('HCN.INP')


# Tạo một tập hợp (set) chứa tất cả các điểm để dễ dàng tra cứu:
point_set = set(points)

# Duyệt qua tất cả cặp điểm để xác định các hình chữ nhật có các đỉnh là 4 điểm từ danh sách đã cho:
rectangles = []
for i in range(len(points)):
    for j in range(i + 1, len(points)):
        x1, y1 = points[i]
        x2, y2 = points[j]
        if x1 != x2 and y1 != y2:
            if (x1, y2) in point_set and (x2, y1) in point_set:
                rectangles.append(((x1, y1), (x2, y1), (x2, y2), (x1, y2)))


# Sắp xếp và in ra kết quả theo định dạng:
def format_rectangle(rect):
    return "HCN ((" + "; ".join([f"({x}, {y})" for x, y in rect]) + "))"

rectangles.sort()  # Sắp xếp theo thứ tự tọa độ để in ra đúng thứ tự

with open('HCN.OUT', 'w') as f:
    for rect in rectangles:
        f.write(format_rectangle(rect) + '\n')

