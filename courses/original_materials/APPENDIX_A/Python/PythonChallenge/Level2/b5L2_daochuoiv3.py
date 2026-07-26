def process_string(input_string):
    words = list(set(input_string.split(" ")))
    sorted_words = sorted(words)
    result = " ".join(sorted_words)
    return result

# Đọc dữ liệu từ file input
with open("b5L2_CHUOI.INP", "r") as input_file:
    input_string = input_file.read().strip()

# Gọi hàm để xử lý chuỗi
output_string = process_string(input_string)

# Ghi kết quả vào file output
with open("b5L2_CHUOI.OUT", "w") as output_file:
    output_file.write(output_string)
