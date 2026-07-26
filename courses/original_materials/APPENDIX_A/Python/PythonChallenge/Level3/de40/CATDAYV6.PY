# Đọc giá trị N từ file văn bản CATDAY.INP
with open('CATDAY.INP', 'r') as input_file:
    N = int(input_file.readline().strip())

# Tạo biến count và gán giá trị ban đầu là 0
count = 0

# Tạo mảng tiền xử lý để lưu các giá trị có thể đạt được từ việc cắt dây
# Ở vị trí index i, giá trị tương ứng sẽ là số lượng cách cắt dây để đạt đến độ dài i
dp = [0] * (N + 1)

for x in range(1, N // 2 + 1):
    y = N - 2 * x # y là cạnh đáy của hình tam giác, x là cạnh bên
    # nếu tổng chiều dài 2 cạnh bên lớn hơn đáy và chiều dài đáy lớn hơn cạnh bên
    if x + x > y and y > x:
        # Tính tổng độ dài của 3 cạnh
        total_length = x + x + y

        # Nếu tổng độ dài nhỏ hơn hoặc bằng N, tăng giá trị tương ứng trong mảng dp
        if total_length <= N:
            dp[total_length] += 1
            print("Ba cạnh của tam giác phù hợp là: ", x, x, y)

# Tổng hợp số cách cắt dây thỏa mãn yêu cầu
for length_count in dp:
    count += length_count

# Ghi giá trị của count vào file văn bản CATDAY.OUT
with open('CATDAY.OUT', 'w') as output_file:
    output_file.write(str(count))
