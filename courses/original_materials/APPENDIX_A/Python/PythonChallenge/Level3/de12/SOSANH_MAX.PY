def my_max(a, b):
    my_max = int(max(a,b))
    return my_max

# Đọc dữ liệu từ file INPUT
with open("SOSANH.INP", "r") as file:
    lines = file.readlines()

# Xử lý từng dòng trong danh sách lines
results = []
for line in lines:
    max_list = line.strip().split(" ")
    numbers = list(map(int, max_list))  # Chuyển đổi thành danh sách số nguyên

    result = my_max(*numbers)  # Sử dụng hàm my_max() để tìm giá trị lớn nhất
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("SOSANH.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")
