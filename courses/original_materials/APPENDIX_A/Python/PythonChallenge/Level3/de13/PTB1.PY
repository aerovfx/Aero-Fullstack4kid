# Hàm giải phương trình bậc 1
def ptb1(a, b):
    if a != 0:
        return -b/a
    else:
        return "pt vn"

# Đọc dữ liệu từ file INPUT
with open("PTB1.INP", "r") as file:
    lines = file.readlines()

# Xử lý từng dòng trong danh sách lines
results = []
for line in lines:
    pair_list = line.strip().split(" ")
    a, b = map(int, pair_list)  # Chuyển đổi thành số nguyên

    result = ptb1(a, b)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("PTB1.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")
