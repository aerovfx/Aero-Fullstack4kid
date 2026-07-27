def find_divisible_by_5(binary_string):
    values = []
    items = binary_string.split(',')
    for item in items:
        int_value = int(item, 2)
        if int_value % 5 == 0:
            values.append(item)
    return ','.join(values)

# Đọc dữ liệu từ file input
with open("b6L2_SONHIPHAN.INP", "r") as input_file:
    binary_string = input_file.read().strip()

# Gọi hàm để tìm các số chia hết cho 5
result = find_divisible_by_5(binary_string)

# Ghi kết quả vào file output
with open("b6L2_SONHIPHAN.OUT", "w") as output_file:
    output_file.write(result)
