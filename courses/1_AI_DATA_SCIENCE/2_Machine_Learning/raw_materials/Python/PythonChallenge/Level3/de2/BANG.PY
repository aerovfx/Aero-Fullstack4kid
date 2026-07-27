def find_largest_beautiful_rectangle(m, n, k, matrix):
    max_area = 0

    # Duyệt qua từng ô trong ma trận
    for i in range(m):
        for j in range(n):
            count_A = 0
            count_B = 0

            # Duyệt qua tất cả các ô con có góc trên bên trái là (i, j)
            for x in range(i, m):
                for y in range(j, n):
                    # Đếm số lượng kí tự 'A' và 'B' trong ô con
                    count_A += matrix[x][y] == 'A'
                    count_B += matrix[x][y] == 'B'

                    # Kiểm tra điều kiện bảng đẹp bậc k
                    if abs(count_A - count_B) <= k:
                        # Tính diện tích của ô con và cập nhật diện tích lớn nhất
                        area = (x - i + 1) * (y - j + 1)
                        max_area = max(max_area, area)

    return max_area


# Đọc dữ liệu từ file input
with open('BANG.INP', 'r') as f:
    T = int(f.readline().strip())  # Đọc số lượng bộ dữ liệu
    results = []

    for _ in range(T): #Trong Python, dấu gạch dưới (_) thường được sử dụng để đại diện cho một biến không cần thiết. Khi sử dụng vòng lặp for, nếu chúng ta không quan tâm đến giá trị của biến đếm, chúng ta có thể sử dụng _ để đại diện cho biến đó.
        m, n, k = map(int, f.readline().strip().split())  # Đọc kích thước và độ chênh lệch
        matrix = []

        # Đọc ma trận từ file input
        for _ in range(m):
            row = f.readline().strip()
            matrix.append(row)

        # Tìm bảng đẹp lớn nhất và lưu kết quả
        result = find_largest_beautiful_rectangle(m, n, k, matrix)
        results.append(result)


# Ghi kết quả ra file output
with open('BANG.OUT', 'w') as f:
    for result in results:
        f.write(str(result) + '\n')
