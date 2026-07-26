# Đọc dữ liệu từ file
with open("UOCSO.INP", "r") as input_file:
    m = int(input_file.readline().strip())
    primes_and_powers = []
    for _ in range(m):
        prime, power = map(int, input_file.readline().split())
        primes_and_powers.append((prime, power))
    
    questions = [list(map(int, input_file.readline().split())) for _ in range(3)]
    # print(questions)
# Hàm để tạo tất cả các ước của n
def generate_divisors(primes_and_powers):
    divisors = [1]  # Bắt đầu với ước số 1
    for prime, power in primes_and_powers:
        new_divisors = []  # Danh sách mới để lưu ước số sau khi thêm số mũ mới
        for divisor in divisors:
            for i in range(power + 1):
                new_divisor =  divisor * (prime ** i)
                print(new_divisor)
                new_divisors.append(divisors)
                
    return divisors 
divisor_out = generate_divisors(primes_and_powers)
print(divisor_out)
#  Tính số ước của nằm trong khoảng [A, B]
def bien(divisors, A, B):
    count = 0
    for divisor in divisors:
        if A<=divisor<=B:
            count += 1 
    return count
    

#  Ghi kết quả vào file
with open("THUASO.OUT", "w") as output_file:
    for A, B in questions:
        divisors = generate_divisors(primes_and_powers)
        count = bien(divisors, A, B)
        output_file.write(f"{count}\n")