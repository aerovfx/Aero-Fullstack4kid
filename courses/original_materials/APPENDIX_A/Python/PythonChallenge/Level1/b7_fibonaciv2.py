def fibonacci(n):
    fib_list = [1, 1]  # Khởi tạo dãy Fibonacci với hai số đầu tiên là 0 và 1
    while len(fib_list) < n:
        next_number = fib_list[-1] + fib_list[-2]  # Tính số Fibonacci tiếp theo
        
        fib_list.append(next_number)
    return fib_list

# Nhập vào số nguyên dương N từ người dùng
N = int(input("Nhập vào số nguyên dương N: "))

# In dãy Fibonacci có N số đầu tiên
fib_sequence = fibonacci(N)
print("Dãy Fibonacci có", N, "số đầu tiên là:")
for num in fib_sequence:
    print(num)

