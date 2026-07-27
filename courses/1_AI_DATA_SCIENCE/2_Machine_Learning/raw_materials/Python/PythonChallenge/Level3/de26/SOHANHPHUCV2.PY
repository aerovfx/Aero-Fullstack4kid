# Hàm kiểm tra số hạnh phúc
def is_happy_number(n):
    seen = set() # Tập hợp lưu trữ các số đã xem

    while n != 1 and n not in seen:
        seen.add(n)
        n = sum(int(digit) ** 2 for digit in str(n))
    return n == 1

# Đọc dữ liệu từ file input
with open("SOHANHPHUC.INP","r") as input_file:
    numbers = input_file.readlines()

# Xử lý dữ liệu và ghi kết quả vào file output
with open("SOHANHPHUC.OUT","w") as output_file:
    for number in numbers:
        number = int(number.strip())
        if is_happy_number(number):
            output_file.write(str(number) + " là số hạnh phúc. \n")
        else:
            output_file.write(str(number) + " không phải là số hạnh phúc. \n")

