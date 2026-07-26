def cong(P,t):
    cong = int(P)*int(t)
    return cong

# Đọc dữ liệu từ file INPUT
with open("CONG.INP", "r") as file:
    lines = file.readlines()

# Xử lý từng dòng trong danh sách lines
results = []
for line in lines:
    Pt_list = line.strip().split(" ")
    P, t = map(int, Pt_list)  # Chuyển đổi thành số nguyên

    result = cong(P, t)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("CONG.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")
