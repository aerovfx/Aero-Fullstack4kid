#Sắp xếp dãy theo thứ tự tăng dần:
def sapxep(arr):
    arr.sort()
#Số lần xuất hiện của x:
def dem(arr,x):
    dem_so = 0
    for num in arr:
        if num == x:
            dem_so +=1
    return dem_so
#Đếm số phần tử nhỏ hơn hoặc bằng x:
def phantunhohon(arr,x):
    dem_so = 0
    for num in arr:
        if num <= x:
            dem_so +=1
    return dem_so
#Đếm số phần tử lớn hơn x:
def phantulonhon(arr,x):
    dem_so = 0
    for num in arr:
        if num > x:
            dem_so +=1
    return dem_so
#Nhập danh sách và gọi hàm
n = int(input('Nhập số phần tử của dãy:'))
x= int(input('Nhập biến x:'))
arr = []
for i in range(n):
    num = int(input('Nhập phần tử thứ {}:'.format(i+1)))
    arr.append(num)
#Sắp xếp theo thứ tự tăng dần
sapxep(arr)
#Đếm số lần xuất hiện của x
dem = dem(arr,x)
#Đếm phần tử nhỏ hơn hoặc bằng x
dem_nho = phantunhohon(arr,x)
#Đếm phần tử lớn hơn x:
dem_lon = phantulonhon(arr,x)
#In kết quả ra màn hình
print('Dãy số sau khi sắp xếp là:',arr)
print('Số lần xuất hiện của x là:',dem)
print('Số phần tử nhỏ hơn hoặc bằng x là:',dem_nho)
print('Số phần tử lớn hơn x là:',dem_lon)
