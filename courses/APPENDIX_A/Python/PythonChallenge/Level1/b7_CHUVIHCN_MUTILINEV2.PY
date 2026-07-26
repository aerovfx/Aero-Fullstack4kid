def chuvihcn(a, b):
    c = (int(a) + int(b)) * 2
    return c

# Đọc dữ liệu từ file INPUT
with open("b7_CHUVIHCN_MULTILINE.INP", "r") as file:
    lines = file.readlines()

# Xử lý từng dòng trong danh sách lines
results = []  # Gan ket qua ban dau la chuoi rong
for line in lines:  # Lap tung dong lenh va ghi vao bien results
    ab_list = line.strip().split(" ")
    if len(ab_list) != 2:  # Kiểm tra số lượng phần tử của ab_list
        continue  # Bỏ qua các dòng không hợp lệ

    a, b = ab_list
    try:
        a = int(a)
        b = int(b)
    except ValueError:
        continue  # Bỏ qua các dòng không chuyển đổi được sang số nguyên

    result = chuvihcn(a, b)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("b7_CHUVIHCN_MULTILINE.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")
