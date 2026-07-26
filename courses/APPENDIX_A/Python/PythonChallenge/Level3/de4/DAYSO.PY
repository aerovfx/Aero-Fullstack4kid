# Đọc dữ liệu từ file DAYSO.INP
with open('DAYSO.INP', 'r') as file:
    n = int(file.readline().strip())
    numbers = list(map(int, file.readline().split()))

# Sắp xếp mảng theo thứ tự giảm dần
numbers.sort(reverse=True)

# Tìm tổng cặp số lớn nhất
max_sum = 0
for i in range(n-1):
    pair_sum = numbers[i] + numbers[i+1]
    if pair_sum > max_sum:
        max_sum = pair_sum

# Ghi kết quả vào file DAYSO.OUT
with open('DAYSO.OUT', 'w') as file:
    file.write(str(max_sum))
