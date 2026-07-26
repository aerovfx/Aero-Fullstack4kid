def vantoc(s, t):
    vantoc = float(s) / float(t)
    return vantoc

# Đọc dữ liệu từ file INPUT
with open("b5_VANTOC.INP", "r") as file:
    quangduong_thoigian = file.readline().strip().split(" ") #Thay vì sử dụng phương thức read() để đọc toàn bộ nội dung của tệp vào một chuỗi, ta sử dụng readline() để chỉ đọc một dòng đầu tiên từ tệp và loại bỏ dấu cách thừa bằng phương thức strip().

s, t = map(float, quangduong_thoigian) #Sử dụng map(float, quangduong_thoigian) để chuyển đổi từng phần tử trong quangduong_thoigian thành số thực và gán vào s và t.

# Tính toán và lưu kết quả vào biến result
result = vantoc(s, t)

# Xuất kết quả vào file OUTPUT
with open("b5_VANTOC.OUT", "w") as file:  
    file.write(f"{result}\n")  # Ghi kết quả vào file với định dạng "result\n"
