#hàm 
def danhsach_thu_hai(numbers):
    if len(numbers) < 2 :
        print('Danh sách này không đủ số phần tử cần')
        return
    max1 = max(numbers) #Phần tử lớn nhất
    max2 = None #Khởi tạo phần tử thứ hai
    index_max2 = -1 #Khởi tạo biến index_max2 với giá trị -1
    for i in range(len(numbers)):
        if numbers[i] != max1: #Kiểm tra các phần tử không bằng phần tử lớn nhất
            if max2 is None or numbers[i] > max2:#Kiểm tra nếu max2 chưa cập nhật hoặc phần tử hiện tại lớn hơn max
                max2 = numbers[i] #Cập nhật một giá trị max2
                index_max2 = i #Cập nhật giá trị
    if max2 is None: 
        print('Không tìm thấy phần tử lớn thứ 2')
    else:
        print('Phần tử lớn thứ 2 là:',max2)
        print('Vị trí phần tử lớn thứ 2 là:', index_max2)
numbers = [1, 10, 4, 6, 2]
danhsach_thu_hai(numbers)
        