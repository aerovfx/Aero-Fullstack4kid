def dientichhcn(a, b):
    S = int(a)*int(b)
    return S

# Đọc dữ liệu từ file INPUT
with open("b6_DIENTICH.INP", "r") as file:
    chieudai2canh = file.readline().strip().split(" ") #Thay vì sử dụng phương thức read() để đọc toàn bộ nội dung của tệp vào một chuỗi, ta sử dụng readline() để chỉ đọc một dòng đầu tiên từ tệp và loại bỏ dấu cách thừa bằng phương thức strip().

a, b = map(float, chieudai2canh) #Sử dụng map(float, chieudai2canh) để chuyển đổi từng phần tử trong chieudai2canh thành số thực và gán vào a và b.

# Tính toán và lưu kết quả vào biến result
result = dientichhcn(a, b)

# Xuất kết quả vào file OUTPUT
with open("b6_DIENTICH.OUT", "w") as file:  
    file.write(f"{result}\n")  # Ghi kết quả vào file với định dạng "result\n"
