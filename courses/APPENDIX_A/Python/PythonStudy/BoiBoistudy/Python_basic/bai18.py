#Hàm
def convert_to_uppercase(input_string):
    lines = input_string.split("\n")  # Tách các dòng trong chuỗi thành danh sách các dòng
    kq = [line.upper() for line in lines]  # Chuyển các dòng thành chữ in hoa
    return "\n".join(kq)  # Kết hợp các dòng thành chuỗi kết quả
#Nhập 1 chuỗi từ bàn phím
input_string = input('Nhập vào 1 chuỗi:')

#In ra kết quả
result = convert_to_uppercase(input_string)
print(result)