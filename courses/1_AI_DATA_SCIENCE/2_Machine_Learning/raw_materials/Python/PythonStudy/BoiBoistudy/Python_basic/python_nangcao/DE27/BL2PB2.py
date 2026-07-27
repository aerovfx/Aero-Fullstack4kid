# Đọc dữ liệu vào từ file BL2.INP
with open("BL2.INP", "r") as file_inp:
    lines = file_inp.readlines()

# Tạo danh sách kết quả
results = []

# Xử lý từng cặp dòng dữ liệu
for i in range(0, len(lines), 2):
    # Lấy giá trị từ dòng đầu tiên
    c, t, A, k, h = map(float, lines[i].split())

    # Tính toán kết quả
    if c == 0:
        P = A + A * (h/100) * t
        results.append("{:.1f}".format(P))
    else:
        P = A * (1 + k/100)**c * (1 + h/100)**(t-c)
        results.append("{:.1f}".format(P))

# Ghi kết quả vào file BL2.OUT
with open("BL2.OUT", "w") as file_out:
    for result in results:
        file_out.write(result + "\n")