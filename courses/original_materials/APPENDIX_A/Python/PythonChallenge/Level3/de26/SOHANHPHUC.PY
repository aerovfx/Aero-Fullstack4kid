def is_happy_number(n):
    seen = set()  # Tập hợp lưu trữ các số đã xem

    while n != 1 and n not in seen:
        seen.add(n)
        n = sum(int(digit) ** 2 for digit in str(n))

    return n == 1

# Kiểm tra số hạnh phúc
number = int(input("Nhập số nguyên dương: "))
if is_happy_number(number):
    print(number, "là số hạnh phúc.")
else:
    print(number, "không là số hạnh phúc.")
