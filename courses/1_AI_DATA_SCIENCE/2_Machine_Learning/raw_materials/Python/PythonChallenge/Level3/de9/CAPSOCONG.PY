"""
Dưới đây là một ví dụ về một cấp số cộng:

Ví dụ: Hãy xác định cấp số cộng với công sai (d) và số hạng đầu tiên (a₁).

Công sai (d) = 3
Số hạng đầu tiên (a₁) = 2

Cấp số cộng tương ứng là: 2, 5, 8, 11, 14, ...

Công thức để tính số hạng thứ n (aₙ) trong một cấp số cộng là:
aₙ = a₁ + (n - 1) * d

Với ví dụ trên:
a₅ = 2 + (5 - 1) * 3 = 2 + 12 = 14
a₆ = 2 + (6 - 1) * 3 = 2 + 15 = 17

Vậy các số hạng trong cấp số cộng là 2, 5, 8, 11, 14, 17, ...
"""
# Mở file đầu vào để đọc
with open('CAPSOCONG.INP', 'r') as file:
    # Đọc dòng đầu tiên và trích xuất giá trị của n và d
    n, d = map(int, file.readline().split())
    
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
        if temp + d == a[j]: # Điều kiện này kiểm tra xem tổng của số hạng hiện tại (temp) và công sai (d) có bằng số hạng tiếp theo (a[j]) không. Nếu điều kiện này đúng, tức là hai số hạng này tạo thành một cấp số cộng hợp lệ.
            sequence.append(j + 1) #Nếu điều kiện trên đúng, chúng ta sẽ thêm chỉ số j + 1 (thứ tự của số hạng tiếp theo trong dãy) vào danh sách sequence. Điều này giúp chúng ta lưu trữ các chỉ số của các số hạng tạo thành cấp số cộng hợp lệ.
            count += 1 #Bước này tăng giá trị biến count lên 1. Biến count đếm số lượng số hạng trong cấp số cộng hợp lệ hiện tại.
            temp += d #Sau khi đã xác nhận được rằng số hạng hiện tại và số hạng tiếp theo tạo thành cấp số cộng hợp lệ, chúng ta cập nhật lại giá trị của temp bằng cách thêm công sai (d) vào số hạng hiện tại. Điều này để chuẩn bị cho việc kiểm tra cấp số cộng tiếp theo."""

    # Kiểm tra xem độ dài của dãy con hiện tại có lớn hơn độ dài tối đa đã tìm được hay không
    if count > max_length:
        result = sequence.copy()
        max_length = count

# Chuyển đổi dãy con kết quả thành một chuỗi
result_string = ''.join(map(str, result))

# Mở file đầu ra để ghi
with open('CAPSOCONG.OUT', 'w') as file2:
    # Ghi độ dài tối đa theo sau là ký tự xuống dòng
    file2.write(str(max_length) + '\n')
    
    # Ghi dãy con kết quả
    file2.write(result_string)
