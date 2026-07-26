n = int(input('nhập vào số phần tử: '))
danh_sach = list(map(int, input('nhập các phàn tử, các số cách nhau dấu cách: ').split()))
k = int(input('nhập vào số nguyên k:'))

danh_sach.sort(reverse=True)

for i in range(len(danh_sach)):
    inserted = False
    if k >= danh_sach[i]:
        danh_sach.insert(i, k)
        inserted = True
        break

print('sắp xếp giảm dần: ')
print(''.join(map(str, danh_sach)))

print('sắp xếp khi có k:',)
print(''.join(map(str, danh_sach)))