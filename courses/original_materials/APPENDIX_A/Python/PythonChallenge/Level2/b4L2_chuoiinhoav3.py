def convert_lines_to_uppercase():
    lines = []
    with open(input_filename, 'r') as file:
        lines = file.readlines()

    uppercase_lines = [line.upper() for line in lines]

    with open(output_filename, 'w') as file:
        for sentence in uppercase_lines:
            file.write(sentence)

    print("Đã ghi kết quả vào file", output_filename)
input_filename = "b4L2_CHUOIINHOA.INP"
output_filename = "b4L2_CHUOIINHOA.OUT"
# Gọi hàm để thực thi chương trình
convert_lines_to_uppercase()
