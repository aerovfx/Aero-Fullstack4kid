# Đọc dữ liệu từ tệp CSTN.INP
with open('CSTN.INP', 'r') as input_file:
    N = int(input_file.readline().strip())

# Khởi tạo giá trị ban đầu cho phần tử đầu tiên
current_number = 1

# Tính giá trị của các phần tử tiếp theo trong dãy
for i in range(2, N + 1):
    current_number += i - 1

# Ghi kết quả vào tệp CSTN.OUT
with open('CSTN.OUT', 'w') as output_file:
    output_file.write(str(current_number))
"""
Giải thuật lặp
Trong đoạn mã này, chúng ta đã thực hiện các bước sau:

Đọc giá trị N từ tệp CSTN.INP.
Khởi tạo giá trị ban đầu cho phần tử đầu tiên của dãy.
Sử dụng một vòng lặp để tính giá trị của các phần tử tiếp theo trong dãy. 
Trong mỗi lần lặp, chúng ta cộng giá trị hiện tại 
với giá trị của vị trí hiện tại trừ đi 1 (i - 1).
Cuối cùng, ghi giá trị của phần tử thứ N vào tệp CSTN.OUT.
"""