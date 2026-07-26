def count_occurrences(lst, element):
    count = 0
    for item in lst:
        if item == element:
            count += 1
    return count

# Nhập danh sách từ người dùng
lst = input("Nhập danh sách, các phần tử cách nhau bằng dấu cách: ").split()

# Nhập phần tử cần đếm từ người dùng
element = input("Nhập phần tử cần đếm: ")

# Đếm số lần xuất hiện của phần tử trong danh sách
occurrences = count_occurrences(lst, element)

# In ra số lần xuất hiện
print(f"Số lần xuất hiện của phần tử {element} là: {occurrences}")
