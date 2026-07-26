# Nhập vào dãy số nguyên
numbers = list(map(int, input("Nhập dãy phân cách bởi khoảng trắng: ").split()))
# Sắp xếp dãy thứ tự giảm dần
numbers.sort(reverse=True)
# In dãy ra màn hình
print("Dãy sắp xếp giảm dần", numbers)
# nhập vào số x
x = int(input("Nhập vào số x: "))
# Đếm số lần xuất hiện của x trong dãy
count = numbers.count(x)
print("Số lần xuất hiện của x là: ", count)
# Đếm số phần tử nhỏ hơn x
count_smaller = len([num for num in numbers if num < x])
print("Số phần tử nhỏ hơn x là: ", count_smaller)
# Đếm số phần tử lớn hơn x
count_larger = len([num for num in numbers if num > x])
print("Số phần tử lớn hơn x là: ", count_larger)
