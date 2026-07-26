import math

def calculate_q(d_values):
    c = 50
    h = 30

    results = []

    for d in d_values:
        values = [str(int(round(math.sqrt(2 * c * float(val) / h)))) for val in d.split(',')]
        results.append(','.join(values))

    return results

input_file = 'b1L2_TINHSO_NHIEUDONG.INP'
output_file = 'b1L2_TINHSO_NHIEUDONG.OUT'

try:
    with open(input_file, 'r') as file:
        lines = file.readlines()

    results = calculate_q(lines)

    with open(output_file, 'w') as file:
        file.write('\n'.join(results))

    print("Đã tạo ra file kết quả:", output_file)

except Exception as e:
    print("Đã xảy ra lỗi:", str(e))
