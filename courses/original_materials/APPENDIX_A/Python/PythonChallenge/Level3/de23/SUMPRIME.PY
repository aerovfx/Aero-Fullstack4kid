# Tạo hàm xét 1 số có phải là số nguyên tố hay không
def is_prime(num):
    if num < 1:
        return False
    if num == 2:
        return True
    if num % 2 == 0:
        return False
    for i in range(2, int(num**0.5) + 1, 2):
        if num % i == 0:
            return False
    return True


# Tạo hàm tính tổng các số nguyên tố vừa tìm được trong giới hạn A B
def sum_prime_numbers(A, B):
    prime_numbers = []
    prime_sum = 0

    if A <= 2 <= B:
        prime_numbers.append(2)
        prime_sum += 2
    
    for num in range(max(3,A), B + 1, 2):
        if is_prime(num):
            prime_numbers.append(num)
            prime_sum += num
    
    return prime_numbers, prime_sum


# Đọc dữ liệu từ file
with open("SUMPRIME.INP","r") as input_file:
    A, B = map(int, input_file.readline().split())

sum_prime_numbers, prime_sum = sum_prime_numbers(A, B)


# Ghi dữ liệu ra file
with open("SUMPRIME.OUT","w") as output_file:
    output_file.write("Dãy số nguyên tố: \n")
    output_file.write(" ".join(map(str, sum_prime_numbers)))
    output_file.write("\nTổng của dãy số nguyên tố: ")
    output_file.write(str(prime_sum))