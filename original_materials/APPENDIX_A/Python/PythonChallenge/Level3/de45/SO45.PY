with open("SO45.INP", "r") as input_file:
    n, k = map(int, input_file.readline().split())

# Đọc dữ liệu từ tệp SO45.INP, gán n là số nguyên đầu tiên, k là số nguyên thứ hai

A = ""
for i in range(1, n + 1):
    A += str(i)

# Xây dựng chuỗi A bằng cách ghép các số từ 1 đến n thành chuỗi

with open("SO45.OUT", "w") as output_file:
    output_file.write(A + "\n")
    if k <= len(A):
        output_file.write(A[k - 1] + "\n")
    else:
        output_file.write("-1\n")

# Ghi kết quả vào tệp SO45.OUT:
# - Ghi chuỗi A vào dòng đầu tiên
# - Kiểm tra nếu k nằm trong số chữ số của A thì ghi chữ số tương ứng vào dòng thứ hai
# - Ngược lại, ghi -1
