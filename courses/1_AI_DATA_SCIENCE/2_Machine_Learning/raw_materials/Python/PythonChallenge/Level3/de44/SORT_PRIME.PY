def is_prime(n):
    if n <= 1:
        return False  # Nếu số nhỏ hơn hoặc bằng 1, không phải số nguyên tố
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False  # Nếu có số nào trong khoảng từ 2 đến căn bậc hai của n chia hết cho n, không phải số nguyên tố
    return True  # Nếu không có số nào trong khoảng từ 2 đến căn bậc hai của n chia hết cho n, là số nguyên tố

n = int(input("Nhập số phần tử của mảng: "))
array = []

for i in range(n):
    num = int(input(f"Nhập phần tử thứ {i+1}: "))
    array.append(num)

prime_numbers = []

for num in array:
    if is_prime(num):
        prime_numbers.append(num)  # Thêm số nguyên tố vào danh sách prime_numbers

prime_numbers.sort()  # Sắp xếp danh sách prime_numbers theo thứ tự tăng dần

print("Các số nguyên tố trong mảng theo thứ tự tăng dần:")
for prime_num in prime_numbers:
    print(prime_num)  # In từng số nguyên tố trong danh sách prime_numbers
