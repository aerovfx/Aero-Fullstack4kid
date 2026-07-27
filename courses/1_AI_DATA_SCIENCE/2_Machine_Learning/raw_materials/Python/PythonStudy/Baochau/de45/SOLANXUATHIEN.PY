danh_sach = input('nhập vào các phần tử, cách nhau bởi dấu cách: ').split()
a = input('nhập phần tử để đếm: ')
def dem_phantu(danh_sach, a):
    dem = 0
    for i in danh_sach:
        if i == a:
            dem += 1
    return dem


print('số lần xuất hiện của',a,'là:',dem_phantu(danh_sach, a))