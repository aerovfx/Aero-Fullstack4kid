input_file = "b2_CHECKMOD7.INP"
output_file = "b2_CHECKMOD7.OUT"


# Đọc dữ liệu từ file CHECKMOD7.INP
with open(input_file, "r") as file:
    numbers = file.read().strip().splitlines()

results = []
for num in numbers:
    num = int(num)
    if num % 7 == 0 and num % 5 != 0:
        results.append(str(num))

result_string = ", ".join(results)

# Ghi kết quả vào file CHECKMOD7.OUT
with open(output_file, "w") as file:
    file.write(result_string)