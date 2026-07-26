# Phương án khai báo giá trị biến ban đầu khác
def find_min_max(numbers):
    min_num = numbers[0] #Giả sử phần tử đầu tiên là nhỏ nhất
    second_min_num = float('inf') # Khởi tạo giá trị ban đầu của biến là số dương vô cùng lớn
    max_num = numbers[0] #Giả sử phần tử đầu tiên là lớn nhất
    max_index = 0 

#Sử dụng hàm enumerate, hàm này tự động tạo chỉ số index
#Những bạn học C sẽ rất quen thuộc với nó
    for i, num in enumerate(numbers): #Băt đầu từ phần tử thứ hai đến cuối
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

# Nhập danh sách ví dụ
numbers = [1, 3, 4, 6, 12, 9, 0]
min_num, second_min_num, max_index = find_min_max(numbers)
print("Phần tử nhỏ nhất là", min_num)
print("Phần tử nhỏ thứ hai là", second_min_num)
print("Vị trí phần tử lớn nhất là", max_index)