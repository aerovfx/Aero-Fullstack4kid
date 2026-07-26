def process_corona_data(input_filename, output_filename):
    # Mở tệp đầu vào và đọc dòng đầu tiên
    with open(input_filename, "r") as file:
        s = file.readline()

    # Đếm số lần xuất hiện của các ký tự trong dòng đầu tiên
    c = s.count("C")
    o = s.count("O")
    r = s.count("R")
    n = s.count("N")
    a = s.count("A")

    # Tìm số lượng tối thiểu của các ký tự "C", "R", "N", "A"
    temp = min(c, r, n, a)
    
    # Tính toán kết quả dựa trên số lượng ký tự "O"
    if 2 * temp <= 0:
        kq = temp
    else:
        kq = int(o / 2)

    # Ghi kết quả vào tệp đầu ra
    with open(output_filename, "w") as file2:
        file2.write(str(kq))

    # Trả về kết quả để có thể sử dụng nếu cần
    return kq

# Tên tệp đầu vào và tên tệp đầu ra
input_file = "CORONA.INP"
output_file = "CORONA.OUT"

# Gọi hàm xử lý dữ liệu và lưu kết quả vào biến result
result = process_corona_data(input_file, output_file)

# In kết quả ra màn hình
print(result)
