# Hàm tìm số Fibonacci
def fibonacci_numbers(n):
    fib_numbers = [1, 1] # Tạo danh sách số Fibonacci với 2 phần tử đầu tiên

    for i in range(2, n):
        fib_num = fib_numbers[i - 1] + fib_numbers[i - 2]
        fib_numbers.append(fib_num)
    return fib_numbers
# In ra n số fibonacci đàu tiên
n = int(input("Nhập vào số n: "))
finbonacci_nums = fibonacci_numbers(n)
print(f"N số Fibonacci đầu tiên là: {finbonacci_nums}")

# In ra các số Fibonacci nhỏ hơn hoặc bàng n
n = int(input("Nhập vào số n: "))
finbonacci_nums = [] # Khởi tạo danh sách số Fibonacci rỗng
a, b = 1, 1
while a <= n:
    finbonacci_nums.append(a)
    a, b = b, a + b
print(f"Các số Fibonacci nhỏ hơn hoặc bằng {n} là: {finbonacci_nums} ")
