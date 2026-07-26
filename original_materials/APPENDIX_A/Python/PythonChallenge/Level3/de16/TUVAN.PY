def tinh_hieu_suat(cong_suat, thoi_gian, khoi_luong_nuoc, do_cao):
    cong_co_ich = khoi_luong_nuoc * 1000 * 9.8 * do_cao
    cong_toan_phan = cong_suat * thoi_gian *3600
    hieu_suat = (cong_co_ich / cong_toan_phan) * 100
    return hieu_suat

# Đọc dữ liệu từ file TUVAN.INP
with open("TUVAN.INP", "r") as file:
    lines = file.readlines()

results = []  # Lưu kết quả

for line in lines:
    data = line.strip().split(" ")
    cong_suat = int(data[0])
    thoi_gian = int(data[1])
    khoi_luong_nuoc = int(data[2])
    do_cao = int(data[3])

    hieu_suat = tinh_hieu_suat(cong_suat, thoi_gian, khoi_luong_nuoc, do_cao)
    results.append(hieu_suat)

# Xuất kết quả vào file TUVAN.OUT
with open("TUVAN.OUT", "w") as file:
    for result in results:
        file.write(f"{result}%\n")
