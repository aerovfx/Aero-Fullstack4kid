with open('MARATHON.INP', 'r') as file: 
    n = int(file.readline())  # Số đoàn viên tham gia
    times = list(map(int, input().split()))  # Thời gian chạy của từng đoàn viên

# Tạo mảng kết quả ban đầu
results = []

# Tính số lượng đoàn viên được trao giải cho từng đoàn viên
for i in range(n):
    value = 1
    for j in range(n):
        if times[j] <= times[i]:
            value += 1
    results.append(value)
# In ra kết quả
with open('MARATHON.OUT', 'w') as file:
    for value in results:
        file.write(str(value))