# Tạo hàm tìm phần tử lớn thứ 2 trong danh sách cho trước
def find_second_max(numbers):
    if len(numbers) < 2:
        print("Danh sách này không đủ số phần tử cần thiết")
        return
    max1 = max(numbers) # Khởi tạo phần tử lớn nhất
    max2 = None # Khởi tạo phần tử thứ 2 với giá trị None
    index_max2 = - 1 #Khởi tạo biến index_max2 với giá trị - 1

    for i in range(len(numbers)):
        if numbers[i] != max1: #Kiểm tra nếu phần tử không bằng phần tử lớn nhất
            if max2 is None or numbers[i] > max2: #Kiểm tra nếu max2 chưa cập nhật hoặc phần tử hiện tại lớn hơn max2
                max2 = numbers[i] # cập nhật giá trị max2
                index_max2 = i # cập nhật giá trị index_max2

    if max2 is None: #Kiểm tra nếu không tìm thấy phần tử lớn thứ 2
        print("Không tìm thấy phần tử lớn thứ 2")
    else:
        print("Phần tử lớn thứ 2 là: ", max2)
        print("Vị trí của phần tử lớn thứ hai là ", index_max2)

numbers = [1, 3, 5, 8, 10, 4, 6]
find_second_max(numbers)


