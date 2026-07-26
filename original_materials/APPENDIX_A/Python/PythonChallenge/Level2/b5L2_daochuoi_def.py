def process_string(input_string):
    words = list(set(input_string.split(" ")))
    sorted_words = sorted(words)
    result = " ".join(sorted_words)
    return result

# Nhập chuỗi từ người dùng
input_string = input("Nhập chuỗi của bạn: ")

# Gọi hàm để xử lý chuỗi và in kết quả
output_string = process_string(input_string)
print(output_string)
