# Mở file đầu vào để đọc
with open('CAPSONHAN.INP', 'r') as file:
    # Đọc dòng đầu tiên và trích xuất giá trị của n và r
    n, r = map(int, file.readline().split())
    
    # Đọc dòng thứ hai và chuyển đổi các giá trị cách nhau bằng dấu cách thành một danh sách các số nguyên
    a = list(map(int, file.readline().split()))

# Khởi tạo biến để lưu trữ độ dài tối đa và dãy con kết quả
max_length = 0
result = []

# Lặp qua các phần tử của danh sách đã cho
for i in range(n):
    # Khởi tạo bộ đếm và một danh sách để lưu trữ dãy con
    count = 1
    sequence = [i + 1]
    temp = a[i]

    # Lặp qua các phần tử còn lại để tìm dãy con
    for j in range(i + 1, n):
        # Kiểm tra xem phần tử tiếp theo có tạo thành một dãy con hợp lệ với phần tử hiện tại không
        if temp * r == a[j]:
            sequence.append(j + 1)
            count += 1
            temp *= r

    # Kiểm tra xem độ dài của dãy con hiện tại có lớn hơn độ dài tối đa đã tìm được hay không
    if count > max_length:
        result = sequence.copy()
        max_length = count

# Chuyển đổi dãy con kết quả thành một chuỗi
result_string = ''.join(map(str, result))

# Mở file đầu ra để ghi
with open('CAPSONHAN.OUT', 'w') as file2:
    # Ghi độ dài tối đa theo sau là ký tự xuống dòng
    file2.write(str(max_length) + '\n')
    
    # Ghi dãy con kết quả
    file2.write(result_string)
