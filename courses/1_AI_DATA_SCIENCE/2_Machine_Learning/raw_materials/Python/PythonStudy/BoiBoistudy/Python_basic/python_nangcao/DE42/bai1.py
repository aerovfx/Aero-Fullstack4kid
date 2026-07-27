#Hàm kiểm tra danh sách có phần tử tăng dần
def tang_dan(danh_sach):
    for i in range(len(danh_sach) - 1 ):
        if danh_sach[i] > danh_sach[i + 1]:
            return False
    return True
#Nhập danh sách:
danh_sach = [1, 3, 7, 8]
#Kiểm tra và in kq
if tang_dan(danh_sach):
    print('danh sách tăng dần')
else:
    print('Danh sach không tăng dần')
