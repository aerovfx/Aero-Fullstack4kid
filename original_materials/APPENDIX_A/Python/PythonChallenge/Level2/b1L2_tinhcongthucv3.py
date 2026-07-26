#Viết chương trình theo hàm và cho phép nhập giá trị D từ một file và xuất kết quả ra một 
#file khác, bạn có thể sử dụng các tham số để truyền tên file đầu vào và tên file đầu ra vào hàm
import math

def calculate_q(d_values, output_file):
    c = 50
    h = 30

    values = [str(int(round(math.sqrt(2 * c * float(d) / h)))) for d in d_values]

    with open(output_file, 'w') as file:
        file.write(','.join(values))

input_file = 'b1L2_TINHSO.INP'
output_file = 'b1L2_TINHSO.OUT'

with open(input_file, 'r') as file:
    d_values = file.read().strip().split(',')

calculate_q(d_values, output_file)
