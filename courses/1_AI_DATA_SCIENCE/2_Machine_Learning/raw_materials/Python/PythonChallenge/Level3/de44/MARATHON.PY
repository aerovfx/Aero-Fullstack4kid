# Đọc dữ liệu từ input
n = int(input())  # Số đoàn viên tham gia
times = list(map(int, input().split()))  # Thời gian chạy của từng đoàn viên

# Tạo mảng kết quả ban đầu
results = [0] * n

# Tính số lượng đoàn viên được trao giải cho từng đoàn viên
for i in range(n):
    for j in range(n):
        if times[j] <= times[i]:
            results[i] += 1

# In ra kết quả
for result in results:
    print(result)
