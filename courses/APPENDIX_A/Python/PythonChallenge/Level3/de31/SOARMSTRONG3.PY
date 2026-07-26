def tim_so_Armstrong():
    amstrong_nums = []

    for num in range(100, 1000):
        digit1 = num // 100  # Chữ số hàng trăm
        digit2 = (num % 100) // 10  # Chữ số hàng chục
        digit3 = num % 10  # Chữ số hàng đơn vị

        tonglapphuong = digit1 ** 3 + digit2 ** 3 + digit3 ** 3

        if num == tonglapphuong:
            amstrong_nums.append(num)

    return amstrong_nums

# Tìm các số Armstrong
result = tim_so_Armstrong()

# In ra kết quả
print("Các số Armstrong có 3 chữ số:")
print(result)
