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
input_list = [1, 6, 5]
a, b, c = input_list

# Gọi hàm và lấy kết quả
result = max_of_three(a, b, c)

# In kết quả
print("Kết quả:", result)
