# Hàm tìm số lớn nhất và nhỏ nhất
def find_min_max(numbers):
    min_num = numbers[0] #Giả sử phần tử đầu tiên là nhỏ nhất
    second_min_num = float('inf') # Khởi tạo giá trị ban đầu của biến là số dương vô cùng lớn
    max_num = numbers[0] #Giả sử phần tử đầu tiên là lớn nhất
    max_index = 0 

    for i in range(len(numbers)):
        num = numbers[i]
        if num < min_num:
            second_min_num = min_num
            min_num = num
        elif num < second_min_num and num != min_num:
            second_min_num = num
        if num > max_num:
            max_num = num
            max_index = i
    return min_num, second_min_num, max_index

# Danh sách ví dụ
numbers = [11, 2, 3, 4, 5, 8, 9, 10]
min_num, second_min_num, max_index = find_min_max(numbers)
print("Phần tử nhỏ nhất là ", min_num)
print("Phần tử nhỏ thứ hai là ", second_min_num)
print("Vị trí phần tử lớn nhất là ", max_index)