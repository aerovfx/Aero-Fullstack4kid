def tinh_tong_lap_phuong(chuoi):
    cac_so = list(map(int, chuoi.split()))
    tong = sum([x**3 for x in cac_so])
    return tong

# Đọc dữ liệu từ file TONGLAPPHUONG.INP
with open("TONGLAPPHUONG.INP", "r") as file_input:
    chuoi_du_lieu = file_input.readlines()

ket_qua = []
for chuoi in chuoi_du_lieu:
    tong_lap_phuong = tinh_tong_lap_phuong(chuoi)
    ket_qua.append(tong_lap_phuong)

# Ghi kết quả vào file TONGLAPPHUONG.OUT
with open("TONGLAPPHUONG.OUT", "w") as file_output:
    for ket_qua_chuoi in ket_qua:
        file_output.write(str(ket_qua_chuoi) + "\n")
