def convert_lines_to_uppercase():
    lines = []
    while True:
        s = input("Nhập chuỗi (nhập trống để kết thúc): ")
        if not s:
            break
        lines.append(s.upper())

    for sentence in lines:
        print(sentence)

# Gọi hàm để thực thi chương trình
convert_lines_to_uppercase()
