def tinh_tong_chu_so(n):
    tong = 0
    while n > 0:
        tong += n % 10
        n //= 10
    return tong

# Đọc N và K từ file input
with open("SONGUYEN49.INP", "r") as file_in:
    n, k = map(int, file_in.readline().split())

# Tính tổng S
s = n
for i in range(k):
    x10 = n * 10**i
    s += x10

# Tính tổng các chữ số của S
tong_chu_so = tinh_tong_chu_so(s)

# Ghi kết quả vào file output
with open("SONGUYEN49.OUT", "w") as file_out:
    file_out.write(str(tong_chu_so))
