# Sắp xếp dãy theo thứ tự tăng dần
def sort_array(arr):
    arr.sort()

# Đếm số lần xuất hiện của x trong dãy
def count_num(arr, x):
    count = 0
    for num in arr:
        if num == x:
            count += 1
    return count

# Đếm số phần tử nhỏ hơn hoặc bằng x
def count_elements_smaller(arr, x):
    count = 0
    for num in arr:
        if num <= x:
            count += 1
    return count

# Đếm số phần tử lớn hơn x
def count_elements_greater(arr, x):
    count = 0
    for num in arr:
        if num > x:
            count += 1
    return count


# Yêu cầu người dùng nhập danh sách và gọi các hàm chức năng
n = int(input("Nhập số phần tử của dãy: "))
arr = []
for i in range(n):
    num = int(input("Nhập phần tử thứ {}: ".format(i + 1)))
    arr.append(num)

# Sắp xếp theo thứ tự tăng dần
sort_array(arr)

# Nhập số x
x = int(input("Nhập số x: "))

# Đếm số lần xuất hiện của x trong dãy
count_sq = count_num(arr, x)

# Đếm số phần tử nhỏ hơn hoặc bằng x
count_smaller = count_elements_smaller(arr, x)

# Đế số phần tử lớn hơn x
count_greater = count_elements_greater(arr, x)

# In kết quả ra màn hình
print("Dãy số sau khi sắp xếp: ", arr)
print("Số lần xuất hiện của x: ", count_sq)
print("Số phần tử nhỏ hơn hoặc bằng x: ", count_smaller)
print("Số phần tử lớn hơn x ", count_greater)


