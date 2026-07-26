def multi(a, b):
    multi = int(a)*int(b)
    return multi

# Đọc dữ liệu từ file INPUT
with open("MULTI.INP", "r") as file:
    lines = file.readlines()

# Xử lý từng dòng trong danh sách lines
results = []
for line in lines:
    ab_list = line.strip().split(" ")
    a, b = map(int, ab_list)  # Chuyển đổi thành số nguyên

    result = multi(a, b)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("MULTI.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")
