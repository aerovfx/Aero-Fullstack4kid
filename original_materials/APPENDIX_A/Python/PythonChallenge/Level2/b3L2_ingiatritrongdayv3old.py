def calculate_sequence_value(n):
    if n == 1:
        return 2
    elif n == 2:
        return 4
    else:
        a = 2
        b = 4
        for i in range(3, n + 1):
            c = b + (i - 2) * 3
            a = b
            b = c
        return c

n = int(input("Nhập vị trí n: "))
sequence_value = calculate_sequence_value(n)
print(f"Giá trị của số đứng ở vị trí {n} trong dãy là: {sequence_value}")

# Đọc dữ liệu từ file input
input_filename = "b3L2_INGIATRIDAY.INP"
with open(input_filename, 'r') as file:
    lines = file.readlines()

# Xử lý dữ liệu
results = []
for line in lines:
    values = line.strip().split(',')
    for value in values:
        n = int(value)
        sequence_value = calculate_sequence_value(n)
        results.append(sequence_value)

# Ghi kết quả vào file output
output_filename = "b3L2_INGIATRIDAY.OUT"
with open(output_filename, 'w') as file:
    for result in results:
        file.write(f"{result}\n")
