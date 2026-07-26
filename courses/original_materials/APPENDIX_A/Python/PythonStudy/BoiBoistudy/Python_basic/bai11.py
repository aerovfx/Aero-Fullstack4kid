danh_sach = [1, 3, 6, 5, 2]
#Sắp xếp dãy theo thứ tự tăng dần:
danh_sach.sort()
print('Danh sách tăng dần là :', danh_sach)
#Sắp xếp dãy theo thứu tự giảm dần:
danh_sach.sort(reverse= True)
print('Danh sách giảm dần là:', danh_sach)
print('Số lớn nhất là:', max(danh_sach))
print('Số nhỏ nhất là:', min(danh_sach))
s = 0
for i in danh_sach:
    s += i
print('Tổng của danh sách này là:', s)