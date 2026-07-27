def max(a, b):
    if a > b:
        return a
    else:
        return b

# Đọc dữ liệu từ file INPUT
with open("SOSANH.INP", "r") as file:
    lines = file.readlines()

# Xử lý từng dòng trong danh sách lines
results = []
for line in lines:
    max_list = line.strip().split(" ")
    a, b = map(int, max_list)  # Chuyển đổi thành số nguyên

    result = max(a, b)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("SOSANH.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")
