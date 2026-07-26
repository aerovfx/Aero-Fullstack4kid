file = open('SONT.INP')
file2 = open('SONT.OUT', 'w')
def is_prime(n):
    """
    Kiểm tra xem một số có phải là số nguyên tố hay không.
    """
    if n < 2:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

def count_most_frequent_primes(numbers):
    """
    Đếm số lượng số nguyên tố xuất hiện nhiều nhất trong dãy số.
    """
    primes = {}
    for num in numbers:
        if is_prime(num):
            if num in primes:
                primes[num] += 1
            else:
                primes[num] = 1
    
    if not primes:
        return 0
    
    max_count = max(primes.values())
    max_count_primes = [prime for prime, count in primes.items() if count == max_count]
    
    return len(max_count_primes)

# Thử nghiệm chương trình
number_sequence = [2, 3, 5, 7, 2, 3, 7, 11, 2, 5, 11, 11]
count = count_most_frequent_primes(number_sequence)
print("Số nguyên tố xuất hiện nhiều nhất:", count)

f_in = open("SONT.INP","r"); f_out = open("SONT.OUT","w")
line_1 = f_in.readline().split()
line_2 = f_in.readline().split()
#Tao mang
arr_1 = [int(x) for x in line_1];
arr_2 = [int(x) for x in line_2];
f_out.write(str(round()))
f_in.close(); f_out.close();