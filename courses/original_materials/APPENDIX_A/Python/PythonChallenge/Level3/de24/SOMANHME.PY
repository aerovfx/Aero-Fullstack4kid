# hàm tìm các số nguyên tố trong phạm vi num
def gen_prime(num):
    primes = []
    for number in range(2, num + 1):
        is_prime = True
        for prime in primes:
            if number % prime == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(number)
    return primes

# Hàm kiểm tra tính mạnh mẽ của một sô
def is_strongnum(number, primes):
    for prime in primes:
        if number % prime == 0 and number % prime ** 2 == 0:
            return True
    return False

# Tạo danh sách các số nguyên tố trong phạm vi từ 2 đến 40
primes = gen_prime(40)

# In ra các số mạnh mẽ từ 2 đến 40
for number in range(2,41):
    if is_strongnum(number, primes):
        print(number)