# Ham tinh dien tich
def chuvi(a, b):
    chuvi = (int(a) + int(b))*2
    return chuvi


# Doc du lieu tu fiel
with open("b7_CHUVI.INP", "r") as file:
    # Thay vì sử dụng phương thức read() để đọc toàn bộ nội dung của tệp vào một chuỗi, ta sử dụng readline() để chỉ đọc một dòng đầu tiên từ tệp và loại bỏ dấu cách thừa bằng phương thức strip().
    ablist = file.readline().strip().split(" ")

# Sử dụng map(int, dai_rong) để chuyển đổi từng phần tử trong _rong thành số thực và gán vào a và b.
a, b = map(int, ablist)
# Tính toán và lưu kết quả vào biến result
result = chuvi(a, b)


# Xuất kết quả vào file OUTPUT
with open("b7_CHUVI.OUT", "w") as file:
    file.write(f"{result}\n")  # Ghi kết quả vào file với định dạng "result\n"
