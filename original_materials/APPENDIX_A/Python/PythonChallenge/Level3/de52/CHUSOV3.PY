def fast_exponentiation(base, exponent, modulo):
    result = 1
    while exponent > 0:
        if exponent % 2 == 1:
            result = (result * base) % modulo
        base = (base * base) % modulo
        exponent //= 2
    return result
    

with open("CHUSO.INP", "r") as file:
    lines = file.readlines()

output_lines = [
    f"{fast_exponentiation(m, n, 10 ** k):0{k}}" + "\n"
    for m, n, k in [map(int, line.split()) for line in lines]
]
print(output_lines)
with open("CHUSO.OUT", "w") as output_file:
    output_file.writelines(output_lines)

"""
sử dụng list comprehension để ngắn gọn hóa việc đọc và xử lý dữ liệu đầu vào, 
sau đó sử dụng f-strings để định dạng và thêm các số 0 vào đầu chuỗi số.

"""