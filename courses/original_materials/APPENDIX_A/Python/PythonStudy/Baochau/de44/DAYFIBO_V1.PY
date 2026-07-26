def is_fibonacci_string(s):
    # Kiểm tra xâu có ít nhất 3 ký tự trở lên
    if len(s) < 3:
        return False
    
    # Kiểm tra xâu có bắt đầu bằng 0, 1
    if s[:2] != '01':
        return False
    
    # Duyệt từ ký tự thứ 2 trở đi và kiểm tra tính chất của chuỗi Fibonacci
    a, b = 0, 1
    i = 2
    while i < len(s):
        fib_sum = a + b
        if s[i:i + len(str(fib_sum))] != str(fib_sum):
            return False
        a, b = b, fib_sum
        i += len(str(fib_sum))
    
    return True

# Kiểm tra xâu có phải là chuỗi Fibonacci hay không
input_string = input("Nhập xâu cần kiểm tra, ví dụ 01124 : ")
if is_fibonacci_string(input_string):
    print("Xâu là chuỗi Fibonacci.")
else:
    print("Xâu không phải là chuỗi Fibonacci.")