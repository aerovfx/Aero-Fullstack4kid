def find_divisors(n):
    divisors = []  # Tạo một danh sách rỗng để lưu trữ ước số
    for i in range(1, int(n)):  # Lặp qua các số từ 1 đến n
        if n % i == 0:  # Kiểm tra xem i có phải là ước số của n hay không
            divisors.append(i)  # Thêm i vào danh sách ước số
            if i != n // i:  # Kiểm tra xem i có phải là một ước số khác của n hay không
                divisors.append(n // i)  # Thêm ước số khác vào danh sách
    divisors.sort()  # Sắp xếp danh sách ước số theo thứ tự tăng dần
    return divisors  # Trả về danh sách ước số

# Đọc dữ liệu từ file
with open('CAKES.INP', 'r') as file:
    n = int(file.readline().strip())  # Đọc dòng đầu tiên trong file và chuyển đổi thành số nguyên

# Tính toán các phương án chia bánh
result = find_divisors(n)  # Gọi hàm divide_cakes để tìm các phương án chia bánh

# Ghi kết quả vào file
with open('CAKES.OUT', 'w') as file:
    for divisor in result:  # Lặp qua danh sách ước số
        file.write(str(divisor) + '\n')  # Ghi từng ước số vào file, mỗi số trên một dòng
