def max_of_three(a, b, c):
    if a > b:
        if a > c:
            return a
        else:
            return c
    else:
        if b > c:
            return b
        else:
            return c

# Nhập dữ liệu từ người dùng
input_list = input("Nhập danh sách 3 phần tử, cách nhau bằng dấu phẩy: ")
a, b, c = [int(num) for num in input_list.split(",")]

# Gọi hàm và lấy kết quả
result = max_of_three(a, b, c)

# In kết quả
print("Kết quả:", result)
