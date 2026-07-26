#C2 STRING
input_file = "b3_GIAITHUA.INP"
output_file = "b3_GIAITHUA.OUT"

# Định nghĩa hàm tính giai thừa
def giai_thua(n):
    if n == 0:
        return 1
    else:
        return n * giai_thua(n - 1)

# Đọc dãy số từ file b3_GIAITHUA.IND và tính giai thừa
with open(input_file, "r") as file:
    numbers = file.read().strip().split()

result_string = ""

for num in numbers:
    num = int(num)
    giai_thua_num = giai_thua(num)
    result_string += str(giai_thua_num) + "\n"

# Ghi kết quả vào file b3_GIAITHUA.OUT
with open(output_file, "w") as file:
    file.write(result_string)
