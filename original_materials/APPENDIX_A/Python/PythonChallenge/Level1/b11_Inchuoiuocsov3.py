input_file = "b11_UOC.INP"
output_file = "b11_UOC.OUT"

# Định nghĩa hàm in ước số
def uoc(n):
    uoc_list = []
    for i in range(1, n + 1):
        if n % i == 0:
            uoc_list.append(i)
    return uoc_list

# Đọc dãy số từ file b11_UOC.INP và tính ước số
with open(input_file, "r") as file:
    numbers = file.read().strip().split()

result_string = ""

for num in numbers:
    num = int(num)
    uoc_num = uoc(num)
    result_string += ' '.join(map(str, uoc_num)) + "\n"

# Ghi kết quả vào file b11_UOC.OUT
with open(output_file, "w") as file:
    file.write(result_string)
