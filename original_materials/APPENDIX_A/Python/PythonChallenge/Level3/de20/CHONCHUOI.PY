# Khối hàm tách chữ ra khỏi số
def extract_words(line):
    words = line.split()
    non_num_words = [ word for word in words if not word.isdigit()]
    return non_num_words

#print(extract_words("32 toi hj 01 fd r3 dfde32"))

# Đọc dữ liệu từ file
with open("CHONCHUOI.INP", "r") as file_input:
    lines = file_input.readlines()

# Khối xử lí
all_lines = []

for line in lines:
    line = line.strip()
    words = extract_words(line)
    all_lines.append(" ".join(words))

lines = all_lines
# Ghi dữ liệu ra file
with open("CHONCHUOI.OUT", "w") as file_output:
    for i in range(len(lines)):
        file_output.write(lines[i].strip() + "\n")
    