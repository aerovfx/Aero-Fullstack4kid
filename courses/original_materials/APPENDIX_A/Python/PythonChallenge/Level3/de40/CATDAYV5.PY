import math
# Đọc giá trị N từ file văn bản CATDAY.INP
with open('CATDAY.INP', 'r') as input_file:
    N = int(input_file.readline().strip())

# Tạo biến count và gán giá trị ban đầu là 0
count = 0

# Duyệt giá trị của x từ 1 đến N/2
for x in range(1, N // 2 + 1):
    y = N - 2 * x
    # Tính giá trị h theo quan hệ đã tìm được
    h = (math.sqrt(3) / 3) * x
    # print(h)

    # Kiểm tra điều kiện: x + x > 2h và h < x
    if x + x > y and y > x:
        # Nếu điều kiện đúng, tăng biến count lên 1
        count += 1
        print("Ba cạnh của tam giác phù hợp là: ", x, x, y)

# Ghi giá trị của count vào file văn bản CATDAY.OUT
with open('CATDAY.OUT', 'w') as output_file:
    output_file.write(str(count))

# Xem chu thich giai thuat