# Hàm tìm số lớn nhất và nhỏ nhất
def vi_tri(numbers):
    nho_nhat = float('inf') # khởi tạo giá trị ban đầu của biến min_num là một số dương vô cùng.
    nho_thu_2 = float('inf')
    lon_nhat = float('-inf')  #khởi tạo giá trị ban đầu của biến max_num là một số âm vô cùng.
    vi_tri_so_lon = -1

    for i in range(len(numbers)):
        num = numbers[i]
        if num < nho_nhat:
            nho_thu_2 = nho_nhat
            nho_nhat = num
        elif num < nho_thu_2 and num != nho_nhat:
            nho_thu_2 = num
        if num > lon_nhat:
            lon_nhat =num
            vi_tri_so_lon = i
    return nho_nhat , nho_thu_2, vi_tri_so_lon

#Danh sách ví dụ
numbers = [8, 10, 12, 13, 3, 5, 9]
nho_nhat, nho_thu_2, vi_tri_so_lon = vi_tri(numbers)
print('Phần tử nhỏ nhất là:', nho_nhat)
print('Phần tử nhỏ thứ hai là:', nho_thu_2)
print('Vị trí phần tử lớn nhất là:', vi_tri_so_lon)