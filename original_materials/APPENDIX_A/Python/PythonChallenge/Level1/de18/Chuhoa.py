def convert_to_uppercase(input_string):
    lines = input_string.split("\n")  # Tách các dòng trong chuỗi thành danh sách các dòng
    uppercase_lines = [line.upper() for line in lines]  # Chuyển các dòng thành chữ in hoa

    return "\n".join(uppercase_lines)  # Kết hợp các dòng thành chuỗi kết quả

def main():
    input_string = """Hello world 
    Practice makes perfect"""

    output_string = convert_to_uppercase(input_string)
    print(output_string)

if __name__ == "__main__":
    main()
