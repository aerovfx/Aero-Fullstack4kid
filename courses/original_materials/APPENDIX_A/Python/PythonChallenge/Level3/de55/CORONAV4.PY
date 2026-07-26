# Block 1: Định nghĩa hàm xử lý dữ liệu
def process_word_data(input_str, target_word):
    char_counts = {char: input_str.count(char) for char in target_word}
    min_count = min(char_counts.values())
    
    # Tính toán kết quả dựa trên ký tự "O" nếu có
    if "O" in target_word:
        kq = min(min_count, char_counts["O"] // 2)
    else:
        kq = min_count
    
    return kq

# Block 2: Đọc dữ liệu từ file CORONA.INP
input_filename = "CORONA.INP"
with open(input_filename, "r") as file:
    input_str = file.readline().strip()  # Đọc và loại bỏ khoảng trắng thừa

# Block 3: Gọi hàm process_word_data()
target_word = "MI"
result = process_word_data(input_str, target_word)

# Block 4: Ghi dữ liệu ra file
output_filename = "CORONA.OUT"
with open(output_filename, "w") as file:
    file.write(str(result))
