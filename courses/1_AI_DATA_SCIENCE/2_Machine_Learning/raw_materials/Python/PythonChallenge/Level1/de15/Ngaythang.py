from datetime import datetime

def tinh_tuoi(ngay_sinh):
    ngay_hien_tai = datetime.now()
    nam_sinh = datetime.strptime(ngay_sinh, '%Y/%m/%d')
    tuoi = ngay_hien_tai.year - nam_sinh.year
    # Kiểm tra nếu ngày hiện tại chưa tới sinh nhật thì trừ 1 năm đi
    if (ngay_hien_tai.month, ngay_hien_tai.day) < (nam_sinh.month, nam_sinh.day):
        tuoi -= 1
    return tuoi

# Lấy thông tin từ người dùng
ngay_sinh = input("Nhập ngày tháng năm sinh dạng y/m/d: ")
tuoi = tinh_tuoi(ngay_sinh)
print("Tuổi của người này là:", tuoi)
