# Đọc dữ liệu từ file INPUT
with open("b4_DICT.INP", "r") as file:  # Mở file "b4_DICT.INP" trong chế độ đọc
    numbers = file.readlines()  # Đọc nội dung file và lưu vào biến numbers dưới dạng danh sách các dòng

# Tạo từ điển chứa (i, i*i) từ 1 đến n
results = {}  # Khởi tạo một từ điển rỗng để lưu kết quả
for num in numbers:  # Lặp qua từng phần tử trong danh sách numbers
    n = int(num.strip())  # Chuyển đổi phần tử num thành số nguyên và gán vào biến n, loại bỏ khoảng trắng và ký tự xuống dòng
    result = {i: i*i for i in range(1, n+1)}  # Tạo một từ điển với các cặp (i, i*i) từ 1 đến n
    results[n] = result  # Gán từ điển result vào từ điển results với khóa là n

# Xuất kết quả vào file OUTPUT
with open("b4_DICT.OUT", "w") as file:  # Mở file "b4_DICT.OUT" trong chế độ ghi
    for n, result in results.items():  # Lặp qua từng cặp khóa-giá trị trong từ điển results
        file.write(f"{n} thì đầu ra {result}\n")  # Ghi dòng kết quả vào file với định dạng "n thì đầu ra result"
