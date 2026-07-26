#Nhập các số liệu từ bàn phím
n=int(input('Nhập vào số giờ làm mỗi tuần:'))
thu_lao = int(input('Nhập vào số tiền mỗi giờ là:'))
#Công thức
tien = n*thu_lao
#Xét lệnh if
if n > 48:
    tien = n*thu_lao*1.5
#In ra kết quả
print('Tiền thù lao của bạn là:', tien)