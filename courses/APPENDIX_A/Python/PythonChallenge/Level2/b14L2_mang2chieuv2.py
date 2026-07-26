# Hàm nhập mảng A từ bàn phím
def input_array(m, n):
    A = []
    for i in range(m):
        row = list(map(float, input(f"Nhập hàng {i+1}, cách nhau bởi dấu cách: ").split()))
        A.append(row)
    return A

# Hàm tìm giá trị lớn nhất và nhỏ nhất trên mỗi cột của mảng A
def find_max_min_per_col(A):
    m, n = len(A), len(A[0])
    max_per_col = [max([A[i][j] for i in range(m)]) for j in range(n)]
    min_per_col = [min([A[i][j] for i in range(m)]) for j in range(n)]
    return max_per_col, min_per_col

# Hàm tìm phần tử lớn nhất và nhỏ nhất của mảng A cùng các chỉ số hàng và cột
def find_max_min_index(A):
    max_val, min_val = A[0][0], A[0][0]
    max_row, max_col, min_row, min_col = 0, 0, 0, 0
    m, n = len(A), len(A[0])
    for i in range(m):
        for j in range(n):
            if A[i][j] > max_val:
                max_val = A[i][j]
                max_row, max_col = i, j
            if A[i][j] < min_val:
                min_val = A[i][j]
                min_row, min_col = i, j
    return max_val, max_row, max_col, min_val, min_row, min_col

# Hàm đếm số phần tử trong mảng A bằng phần tử lớn nhất
def count_max_value(A):
    max_val = max([max(row) for row in A])
    count = 0
    for row in A:
        count += row.count(max_val)
    return count

# Nhập mảng A từ bàn phím
m, n = map(int, input("Nhập số hàng và số cột của mảng A, cách nhau bởi dấu cách: ").split())
A = input_array(m, n)

# Tìm giá trị lớn nhất và nhỏ nhất trên mỗi cột của mảng A
max_per_col, min_per_col = find_max_min_per_col(A)
print("Giá trị lớn nhất trên mỗi cột: ", max_per_col)
print("Giá trị nhỏ nhất trên mỗi cột: ", min_per_col)

# Tìm phần tử lớn nhất và nhỏ nhất của mảng A cùng các chỉ số hàng và cột
max_val, max_row, max_col, min_val, min_row, min_col = find_max_min_index(A)
print(f"Phần tử lớn nhất: {max_val}, hàng: {max_row+1}, cột: {max_col+1}")
print(f"Phần tử nhỏ nhất: {min_val}, hàng: {min_row+1}, cột: {min_col+1}")

# Đếm số phần tử trong mảng
count = count_max_value(A)
print(f"Số phần tử bằng giá trị lớn nhất ({max_val}) trong mảng A: {count}")