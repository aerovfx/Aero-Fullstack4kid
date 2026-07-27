a = input('nhập vào danh sách ngăn các nhau bởi dấu phẩy: ')
a = list(map(int, a.split(',')))
max = 0
max_vitri = a[0]
for i,j in enumerate(a):
    if i > max_vitri:
        max_vitri = i
        max = j
print('phần tử lớn nhất là:',max)
print('vị trí của phần tử lớn nhất là: ',max_vitri)