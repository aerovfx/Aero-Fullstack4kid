def tim_so_Armstrong():
    amstrong_nums = []

    for num in range(100, 1000):
        temp = num
        sum_of_cubes = 0

        while temp > 0:
            digit = temp % 10
            sum_of_cubes += digit ** 3
            temp //= 10

        if num == sum_of_cubes:
            amstrong_nums.append(num)

    return amstrong_nums

# Tìm các số Armstrong
result = tim_so_Armstrong()

# In ra kết quả
print("Các số Armstrong có 3 chữ số:")
print(result)
