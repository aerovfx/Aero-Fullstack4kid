def tinh_tong_chu_so_phan_thap_phan(a, b, N):
    phan_thap_phan = a / b
    chuoi_phan_thap_phan = str(phan_thap_phan)
    tong = 0
    for i in range(2, N+2):
        if i < len(chuoi_phan_thap_phan):
            tong += int(chuoi_phan_thap_phan[i])
        else:
            tong += 0
    return tong

# Đọc dữ liệu từ file input
with open("SUMAB.INP", "r") as file_in:
    lines = file_in.readlines()

results = []
for line in lines:
    a, b, N = map(int, line.strip().split())
    tong_chu_so = tinh_tong_chu_so_phan_thap_phan(a, b, N)
    results.append(str(tong_chu_so))

# Ghi kết quả vào file output
with open("SUMAB.OUT", "w") as file_out:
    file_out.write('\n'.join(results))
