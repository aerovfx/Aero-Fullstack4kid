# Đọc dữ liệu vào từ file BL2.INP
with open("BL2.INP", "r") as file_inp:
    lines = file_inp.readlines()

# Ghi kết quả vào file BL2.OUT
with open("BL2.OUT", "w") as file_out:
    # Xử lý từng dòng dữ liệu
    for line in lines:
        # Lấy giá trị từ dòng hiện tại
        values = line.split()

        # Kiểm tra số lượng giá trị
        if len(values) == 5:
            c, t, A = int(values[0]), int(values[1]), float(values[2])
            k, h = float(values[3]), float(values[4])

            # Tính toán kết quả
            if c == 0:
                P = A + A * (h/100) * t
                file_out.write("{:.1f}\n".format(P))
            else:
                P = A * (1 + k/100)**c * (1 + h/100)**(t-c)
                file_out.write("{:.1f}\n".format(P))
                    