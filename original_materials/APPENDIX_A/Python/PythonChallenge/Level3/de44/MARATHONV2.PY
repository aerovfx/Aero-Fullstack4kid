# Đọc dữ liệu từ file MARATHON.INP
with open("MARATHON.INP", "r") as file_in:
    n = int(file_in.readline().strip())  # Số đoàn viên tham gia
    times = list(map(int, file_in.readline().strip().split()))  # Thời gian chạy của từng đoàn viên

# Tạo mảng kết quả ban đầu
results = [0] * n

# Tính số lượng đoàn viên được trao giải cho từng đoàn viên
for i in range(n):
    for j in range(n):
        if times[j] <= times[i]:
            results[i] += 1

# Ghi kết quả vào file MARATHON.OUT
with open("MARATHON.OUT", "w") as file_out:
    for result in results:
        file_out.write(str(result) + "\n")
