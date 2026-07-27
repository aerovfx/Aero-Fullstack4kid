# Ham tinh dien tich
def dientich(a, b):
    dientich = int(a)*int(b)
    return dientich


# Doc du lieu tu fiel
with open("b6_DIENTICH.INP", "r") as file:
    # Thay vì sử dụng phương thức read() để đọc toàn bộ nội dung của tệp vào một chuỗi, ta sử dụng readline() để chỉ đọc một dòng đầu tiên từ tệp và loại bỏ dấu cách thừa bằng phương thức strip().
    dai_rong = file.readline().strip().split(" ")

# Sử dụng map(int, dai_rong) để chuyển đổi từng phần tử trong _rong thành số thực và gán vào a và b.
a, b = map(int, dai_rong)
# Tính toán và lưu kết quả vào biến result
result = (dientich(a, b))


# Xuất kết quả vào file OUTPUT
with open("b6_DIENTICH.OUT", "w") as file:
    file.write(f"{result}\n")  # Ghi kết quả vào file với định dạng "result\n"
