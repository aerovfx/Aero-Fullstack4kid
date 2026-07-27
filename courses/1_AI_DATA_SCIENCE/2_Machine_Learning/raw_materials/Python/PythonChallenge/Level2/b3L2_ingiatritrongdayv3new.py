def calculate_sequence_value(sequence, n):
    if n <= len(sequence):
        return sequence[n-1]
    else:
        a = sequence[0]
        b = sequence[1]
        for i in range(3, n + 1):
            c = b + (i - 2) * (sequence[i-3] - sequence[i-4])
            a = b
            b = c
        return c

input_file = "b3L2_INGIATRIDAY.INP"
output_file = "b3L2_INGIATRIDAY.OUT"


# Đọc dãy số từ file input
with open(input_file, 'r') as file:
    sequence = [int(x) for x in file.readline().strip().split(',')]

# Tính giá trị số đứng ở vị trí n
n = int(input("Nhập vị trí n: "))
sequence_value = calculate_sequence_value(sequence, n)

# Ghi kết quả vào file output
with open(output_file, 'w') as file:
    file.write(str(sequence_value))

print(f"Giá trị của số đứng ở vị trí {n} trong dãy đã được ghi vào file {output_file}")
