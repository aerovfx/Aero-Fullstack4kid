#Hàm:
def tinh_tong_lap_phuong(chuoi):
    cac_so = list(map(int, chuoi.split()))
    tong = sum([x**3 for x in cac_so])
    return tong
#Đọc dữ liệu từ file TONGLAPPHUONG.INP:
with open("TONGLAPPHUONG.INP","r") as file:
    chuoi_du_lieu = file.readlines()
#Xử lý từng dòng trong danh sách lines:
ketqua = []
for chuoi in chuoi_du_lieu:
    tong_lap_phuong = tinh_tong_lap_phuong(chuoi)
    ketqua.append(tong_lap_phuong)
#Xuất kết quả vào file TONGLAPPHUONG.OUT:
with open("TONGLAPPHUONG.OUT","w") as file:
    for ket_qua_chuoi in ketqua:
        file.write(str(ket_qua_chuoi) + "\n")