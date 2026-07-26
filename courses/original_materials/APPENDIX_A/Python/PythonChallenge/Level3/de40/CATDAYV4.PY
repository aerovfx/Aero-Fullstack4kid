# Đọc giá trị N từ file văn bản CATDAY.INP
with open('CATDAY.INP', 'r') as input_file:
    N = int(input_file.readline().strip())

# Tạo danh sách để lưu các cặp (x, y) thỏa mãn điều kiện
valid_pairs = []

# Duyệt giá trị của x từ 1 đến N/2
for x in range(1, N // 2 + 1):
    y = N - 2 * x

    # Kiểm tra điều kiện: x + x > y và y > x
    if x + x > y and y > x:
        valid_pairs.append((x, y))
        print("Ba cạnh của tam giác phù hợp là: ", x, x, y)

# Tính số lượng cách cắt dây bằng cách sử dụng số lượng cặp hợp lệ
# count = len(valid_pairs)
count = valid_pairs

# Ghi giá trị của count vào file văn bản CATDAY.OUT
with open('CATDAY.OUT', 'w') as output_file:
    output_file.write(str(count))
