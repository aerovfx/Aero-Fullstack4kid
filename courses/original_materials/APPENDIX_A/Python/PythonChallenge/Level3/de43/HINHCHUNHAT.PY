def tinh_dien_tich_lon_nhat(chu_vi):
    canh = chu_vi / 4
    dien_tich = canh ** 2
    return round(dien_tich, 2)

# Đọc chu vi từ file input
with open("HINHCHUNHAT.INP", "r") as file_in:
    chu_vi = float(file_in.readline())

# Tính diện tích lớn nhất và làm tròn đến 2 chữ số sau dấu thập phân
dien_tich_lon_nhat = tinh_dien_tich_lon_nhat(chu_vi)

# Ghi kết quả vào file output
with open("HINHCHUNHAT.OUT", "w") as file_out:
    file_out.write(str(dien_tich_lon_nhat))
