# Hàm tính tổng các chữ số của một số
def sum_of_digits(number):
    sum_digits = 0
    while number > 0:
        sum_digits += number % 10
        number //= 10
    return sum_digits

# Nhập số nguyên N từ người dùng
N = int(input("Nhập số nguyên N: "))

# Nhập dãy số từ người dùng
numbers = input("Nhập dãy số, cách nhau bằng khoảng trắng: ").split()

# Chuyển các phần tử trong dãy từ chuỗi sang số nguyên
numbers = [int(num) for num in numbers]

# Tìm số có tổng các chữ số lớn nhất trong dãy
max_sum_digits = max(numbers, key=sum_of_digits)

# In ra số có tổng các chữ số lớn nhất
print("Số có tổng các chữ số lớn nhất:", max_sum_digits)

# In ra dãy số đảo ngược
reversed_numbers = numbers[::-1]
print("Dãy số đảo ngược:", ' '.join(map(str, reversed_numbers)))
