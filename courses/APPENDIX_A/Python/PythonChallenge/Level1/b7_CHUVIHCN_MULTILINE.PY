def chuvihcn(a, b):
    c = (int(a) + int(b))*2
    return c
# Đọc dữ liệu từ file INPUT

# Đọc dữ liệu từ file INPUT
with open("b7_CHUVIHCN_MULTILINE.INP", "r") as file:
    lines = file.readlines()

# Xử lý từng dòng trong danh sách lines
results = [] # gan ket qua ban dau la chuoi rong 
for line in lines: #lap tung dong lenh va ghi vao bien results
    ab_list = line.strip().split(" ")
    a, b = map(int, ab_list)  # Chuyển đổi thành số nguyên

    result = chuvihcn(a, b)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("b7_CHUVIHCN_MULTILINE.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")