# Đọc dữ liệu vào từ file CORONA.INP
with open('CORONA.INP', 'r') as input_file:
    input_data = input_file.readline().strip()

# Tìm tất cả các vị trí bắt đầu của cụm từ "CORONA" trong chuỗi
corona_indices = [i for i in range(len(input_data)) if input_data.startswith('MI', i)]

# Tạo danh sách các cụm từ CORONA và các ký tự không phù hợp từ vị trí đã tìm thấy
corona_words = []
non_corona_chars = []
prev_index = 0

for i in corona_indices:
    non_corona_chars.extend(input_data[prev_index:i])
    corona_words.append(input_data[i:i+6])
    prev_index = i + 6

non_corona_chars.extend(input_data[prev_index:])

# Ghi kết quả vào file CORONA.OUT
with open('CORONA.OUT', 'w') as output_file:
    output_file.write(' '.join(corona_words + non_corona_chars))

"""
Chương trình sau chỉ đơn giản là tìm cụm từ phù hợp trong xâu chứ không sắp xếp nó
"""