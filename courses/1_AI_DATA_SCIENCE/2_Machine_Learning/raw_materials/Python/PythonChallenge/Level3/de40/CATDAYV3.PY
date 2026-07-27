# Đọc giá trị N từ file văn bản CATDAY.INP
with open('CATDAY.INP', 'r') as input_file:
    N = int(input_file.readline().strip())

# Tạo biến count và gán giá trị ban đầu là 0
count = 0

# Với x chạy từ 1 đến N/2
for x in range(1, N // 2 + 1):
    # Tính giá trị y = N - 2 * x
    y = N - 2 * x

    # Kiểm tra điều kiện: x + x > y và y > x
    if x + x > y and y > x:
        # Nếu điều kiện đúng, tăng biến count lên 1
        count += 1
        print("Ba cạnh của tam giác phù hợp là: ", x, x, y)
# Ghi giá trị của count vào file văn bản CATDAY.OUT
with open('CATDAY.OUT', 'w') as output_file:
    output_file.write(str(count))
