#Viết chương trình nhập: số giờ làm mỗi tuần, thù lao trên mỗi giờ làm tiêu chuẩn,
# từ đó tính ra số tiền thực lĩnh của nhân viên. Biết rằng: số giờ tiêu chuẩn mỗi tuần là 44 giờ, 
#và mỗi giờ vượt chuẩn được trả gấp rưỡi so với giờ làm chuẩn.

so_gio_lam = float(input("Nhập số giờ làm mỗi tuần: "))
luong_gio = float(input("Nhập thù lao trên mỗi giờ làm tiêu chuẩn: "))

gio_tieu_chuan = 44  # Số giờ làm chuẩn mỗi tuần
gio_vuot_chuan = max(0, so_gio_lam - gio_tieu_chuan)  # Số giờ làm vượt chuẩn mỗi tuần
thuc_linh = gio_tieu_chuan * luong_gio + gio_vuot_chuan * luong_gio * 1.5  # Tính tổng thu nhập
print(f"Số tiền thực lĩnh của nhân viên: {thuc_linh}")