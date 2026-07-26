# Đọc giá trị N từ file CATDAY.INP
with open('CATDAY.INP', 'r') as file_input:
    N = int(file_input.read())

# Tạo biến count và gán giá trị ban đầu là 0
count = 0

# Duyệt giá trị của x từ 1 đến N/2, x: cạnh bên, y: đáy và N là tổng
for x in range(1, N // 2 + 1):
    y = N - 2 * x
    # nếu tổng chiều dài 2 cạnh bên lớn hơn đáy và chiều dài đáy lớn hơn cạnh bên
    if x + x > y and y > x: 
        count += 1
    
# Ghi giá trị của count vào file CATDAY.OUT
with open('CATDAY.OUT', 'w') as file_output:
    file_output.write(str(count))
