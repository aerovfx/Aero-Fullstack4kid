# Đọc dữ liệu từ file "BAI14":
with open('BAI14.INP', 'r') as file:
    danh_sach = list(map(int, file.readline().split(",")))
  
n= int(input('Nhập số bạn muốn đếm:'))
kq = danh_sach.count(n)
#Xuất kết quả ra file:
with open('BAI14.OUT', 'w') as file:
    file.write(str(kq) + "\n")