# Định nghĩa hàm tìm UCLN (Ước chung lớn nhất) của hai số a và b.
def UCLN(a, b):
    while b != 0:
        a, b = b, a % b
    return a

# Định nghĩa hàm tìm BCNN (Bội chung nhỏ nhất) của hai số a và b.
def BCNN(a, b):
    return a * b // UCLN(a, b)

# Đọc dữ liệu từ file BCNN.INP
# Mở file BCNN.INP với chế độ đọc ('r'), sau đó đọc dòng đầu tiên và chuyển các giá trị thành số nguyên.
# Gán giá trị của a và b lần lượt là hai số đã đọc.
with open('BCNN.INP', 'r') as f:
    a, b = map(int, f.readline().split())




# Tìm và in ra kết quả BCNN vào file BCNN.OUT
# Gọi hàm BCNN(a, b) để tính bội chung nhỏ nhất của a và b, lưu kết quả vào biến bcnn.
# Mở file BCNN.OUT với chế độ ghi ('w') và ghi kết quả bcnn vào file.
bcnn = BCNN(a, b)
with open('BCNN.OUT', 'w') as f:
    f.write(str(bcnn) + '\n')

# Tối giản phân số và in kết quả vào file BCNN.OUT
# Gọi hàm UCLN(a, b) để tìm ước chung lớn nhất của a và b, lưu kết quả vào biến ucln.
# Mở file BCNN.OUT với chế độ ghi ('a') (chế độ ghi tiếp tục) và ghi phân số tối giản vào file.
# Phân số tối giản là a chia cho ucln và b chia cho ucln.
ucln = UCLN(a,b)
with open('BCNN.OUT', 'a') as f:
    f.write(f'{a // ucln} {b // ucln}')
