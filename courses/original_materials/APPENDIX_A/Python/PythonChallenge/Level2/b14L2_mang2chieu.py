#Viết chương trình Python nhập một mảng hai chiều các số thực A (m hàng, n cột) từ bàn phím.
"""a. Tìm giá trị lớn nhất và nhỏ nhất trên mỗi cột

b. Tìm phần tử lớn nhất và phần tử nhỏ nhất của mảng A cùng các chỉ số hàng và cột của 2 phần tử này.

c. Trong mảng A có bao nhiêu phần tử bằng phần tử lớn nhất.

Gợi ý:

Sử dụng thư viện numpy để khởi tạo mảng A và thực hiện các phép toán trên mảng.
Câu lệnh np.amax(A, axis=0) trả về giá trị lớn nhất trên mỗi cột của mảng A, còn np.amin(A, axis=0) trả về giá trị nhỏ nhất trên mỗi cột.
Để tìm phần tử lớn nhất và nhỏ nhất của mảng A cùng với chỉ số hàng và cột của 2 phần tử này, chúng ta sử dụng np.amax(A) và np.amin(A) để tìm giá trị lớn nhất và nhỏ nhất của mảng A, sau đó sử dụng hàm np.unravel_index để chuyển đổi chỉ số dạng 1 chiều thành chỉ số dạng 2 chiều.
"""
def find_min_max_column(matrix):
    min_values = []
    max_values = []
    num_rows = len(matrix)
    num_cols = len(matrix[0])
    
    for col in range(num_cols):
        column = [matrix[row][col] for row in range(num_rows)]
        min_val = min(column)
        max_val = max(column)
        min_values.append(min_val)
        max_values.append(max_val)
    
    return min_values, max_values

def find_min_max_element(matrix):
    min_val = matrix[0][0]
    max_val = matrix[0][0]
    min_row = 0
    min_col = 0
    max_row = 0
    max_col = 0
    
    for row in range(len(matrix)):
        for col in range(len(matrix[row])):
            if matrix[row][col] < min_val:
                min_val = matrix[row][col]
                min_row = row
                min_col = col
            if matrix[row][col] > max_val:
                max_val = matrix[row][col]
                max_row = row
                max_col = col
    
    return min_val, min_row, min_col, max_val, max_row, max_col

def count_max_elements(matrix):
    max_val = matrix[0][0]
    count = 0
    
    for row in matrix:
        for element in row:
            if element == max_val:
                count += 1
    
    return count

# Nhập số hàng và số cột
m = int(input("Nhập số hàng: "))
n = int(input("Nhập số cột: "))

# Nhập ma trận từ bàn phím
matrix = []
for i in range(m):
    row = [float(x) for x in input(f"Nhập hàng {i+1}: ").split()]
    matrix.append(row)

# Tìm giá trị lớn nhất và nhỏ nhất trên mỗi cột
min_values, max_values = find_min_max_column(matrix)
print("Giá trị nhỏ nhất trên mỗi cột:", min_values)
print("Giá trị lớn nhất trên mỗi cột:", max_values)

# Tìm phần tử lớn nhất và nhỏ nhất cùng chỉ số hàng và cột
min_val, min_row, min_col, max_val, max_row, max_col = find_min_max_element(matrix)
print("Phần tử nhỏ nhất:", min_val, "vị trí hàng:", min_row, "cột:", min_col)
print("Phần tử lớn nhất:", max_val, "vị trí hàng:", max_row, "cột:", max_col)

# Đếm số phần tử bằng phần tử lớn nhất
count = count_max_elements(matrix)
print("Số phần tử bằng phần tử lớn nhất:", count)
