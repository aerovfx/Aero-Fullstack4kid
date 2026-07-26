def PT2(a, b, c):
    if a == 0:
        if b == 0:
            if c == 0:
                return "Phương trình có vô số nghiệm"
            else:
                return "Phương trình vô nghiệm"
        else:
            return -c / b
    else:
        delta = b ** 2 - 4 * a * c
        if delta < 0:
            return "Phương trình vô nghiệm"
        elif delta == 0:
            return -b / (2 * a)
        else:
            return (-b - delta ** 0.5) / (2 * a)

input_file = "b16_PTB2.INP"
output_file = "b16_PTB2.OUT"

with open(input_file, "r") as file:
    a_list = file.read().strip().split(",")

# Kiểm tra và chuyển đổi thành số nguyên
try:
    a, b, c = map(int, a_list) #map chuyen danh sach thanh so nguyen
except ValueError:
    print("Lỗi: Tệp tin đầu vào chứa giá trị không hợp lệ.")
    exit(1)

# Ghi kết quả vào file OUTPUT
with open(output_file, "w") as file:
    result_string = str(PT2(a, b, c))
    file.write(result_string)
