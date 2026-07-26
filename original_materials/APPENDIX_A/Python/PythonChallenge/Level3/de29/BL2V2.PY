# Hàm tính tiền gửi cho 2 trường hợp
def tienuinganhang(c, t, A, k, h):
    if c != 0: # Gửi có kỳ hạn
        amount = A * (1 + k/100) ** c * (1 + h/100) * (t - c)
    else: # Gửi không kỳ hạn
        amount = A * (1 + h/100) ** t
    return round(amount, 1)
# Đọc dữ liệu từ file input
with open("BL2.INP", "r") as f:
    lines = f.readlines()

# Ghi kết quả và file output
with open("BL2.OUT","w") as f:
    for line in lines:
        data = line.split()
        c = int(data[0])
        t = int(data[1])
        A = float(data[2])
        k = float(data[3])
        h = float(data[4])
        # TÍnh số tiền nhận được
        tiennhaduoc = tienuinganhang(c, t, A, k, h)

        # Ghi kết quả vào file output
        f.write(str(tiennhaduoc) + "\n")