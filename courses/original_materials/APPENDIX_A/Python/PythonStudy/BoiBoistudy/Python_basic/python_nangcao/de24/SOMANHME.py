from math import sqrt

def is_prime(a): # hàm kiểm tra một số phải là số nguyên tố hay không?
    if a == 1:
        return False
    if a == 2:
        return True
    for i in range(2, int(sqrt(a)) + 1):
        if a % i == 0:
            return False
    return True

n = 1
a = ""

while n < 40:
    is_composite = False
    for i in range(2, int(sqrt(n)) + 1):
        if n % (i * i) == 0:
            is_composite = True
            break
    if is_composite and is_prime(i):
        a += str(n) + " "
    n += 1

print("Dãy số mạnh mẽ:", a)
#Số nguyên tố: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,.