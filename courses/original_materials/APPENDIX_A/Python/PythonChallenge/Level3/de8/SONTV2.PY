from math import sqrt

def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(sqrt(num)) + 1):
        if num % i == 0:
            return False
    return True

try:
    # Mở tệp đầu vào để đọc
    with open("SONT.INP", "r") as input_file:
        n = int(input_file.readline())  # Đọc số lượng phần tử
        data = list(map(int, input_file.readline().split()))  # Đọc dãy số

    # Đếm số lượng số nguyên tố và tìm số nguyên tố xuất hiện nhiều nhất
    primes = {}
    max_count = 0
    max_prime = None
    for num in data:
        if is_prime(num):
            if num in primes:
                primes[num] += 1
            else:
                primes[num] = 1
            if primes[num] > max_count:
                max_count = primes[num]
                max_prime = num

    # Mở tệp đầu ra để ghi
    with open("SONT.OUT", "w") as output_file:
        if max_prime is None:
            output_file.write("Khong tim duoc gia tri")
        else:
            output_file.write(f"{max_prime} {max_count}")

except FileNotFoundError:
    print("File not found: SONT.INP")
except ValueError:
    print("Invalid data in the file")
except IOError:
    print("Error reading or writing file")
