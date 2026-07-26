# Đọc dữ liệu từ file
with open("THUASO.INP", "r") as input_file:
    m = int(input_file.readline().strip())  # Đọc số lượng số nguyên tố và bình phương của chúng
    primes_and_powers = []
    for _ in range(m):
        prime, power = map(int, input_file.readline().split())  # Đọc thông tin về số nguyên tố và bình phương của chúng
        primes_and_powers.append((prime, power))
    
    questions = [list(map(int, input_file.readline().split())) for _ in range(3)]  # Đọc 3 câu hỏi về khoảng [A, B]
    # print(primes_and_powers)
# Hàm để tạo tất cả các ước của n
def generate_divisors(primes_and_powers):
    divisors = [1]  # Bắt đầu với ước số 1
    for prime, power in primes_and_powers:
        new_divisors = []  # Danh sách mới để lưu ước số sau khi thêm số mũ mới
        for divisor in divisors:
            for i in range(power + 1):
                new_divisor = divisor * (prime ** i)  # Tạo một ước số mới
                print(new_divisor)
                # new_divisors.append(new_divisor)  # Thêm ước số mới vào danh sách
                # print(new_divisors)
        divisors = new_divisors  # Cập nhật danh sách ước số
    return divisors  # Trả về danh sách tất cả các ước của n
# divisor_out = generate_divisors(primes_and_powers)
# print(divisor_out)
# Tính số ước của nằm trong khoảng [A, B]
def count_divisors_in_range(divisors, A, B):
    count = 0  # Khởi tạo biến đếm
    for divisor in divisors:
        if A <= divisor <= B:
            count += 1  # Nếu ước số nằm trong khoảng [A, B], tăng biến đếm lên
    return count  # Trả về số lượng ước số nằm trong khoảng [A, B]

# Ghi kết quả vào file
with open("THUASO.OUT", "w") as output_file:
    for A, B in questions:
        divisors = generate_divisors(primes_and_powers)  # Tạo danh sách tất cả các ước của n
        count = count_divisors_in_range(divisors, A, B)  # Đếm số ước nằm trong khoảng [A, B]
        output_file.write(f"{count}\n")  # Ghi kết quả vào file THUASO.OUT

"""
Dữ liệu vào 
THƯASO.INP
3           
2 4  
3 4
5 4
1 5
1 10
1 5 

Kết quả ra
THƯASO.OUT
5
9
5

"""