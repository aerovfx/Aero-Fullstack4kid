def fast_exponentiation(base, exponent, modulo):
    result = 1
    while exponent > 0:
        if exponent % 2 == 1:
            result = (result * base) % modulo
        base = (base * base) % modulo
        exponent //= 2
    return result

with open("CHUSO.INP", "r") as file:
    lines = file.readlines()

output_lines = []
for line in lines:
    data = line.split()
    m, n, k = map(int, data)
    
    modulo = 10 ** k
    kq = fast_exponentiation(m, n, modulo)
    output_lines.append(str(kq).zfill(k) + "\n")

with open("CHUSO.OUT", "w") as output_file:
    output_file.writelines(output_lines)



"""
Thuật toán:
Chúng ta đã sử dụng thuật toán "bình phương nhanh" để tính lũy thừa m ^ n một cách hiệu quả hơn.
Điều này giúp giảm thiểu số lượng phép nhân và giữ cho các số trung gian nhỏ hơn, 
giảm nguy cơ vượt quá giới hạn dấu phẩy động.
Chúng ta tính toán kq modulo 10 ** k để đảm bảo chỉ giữ lại K chữ số cuối cùng.
Sử dụng .zfill(k) để đảm bảo rằng kết quả luôn có đúng K chữ số cuối cùng, thêm các số 0 nếu cần.

.zfill(k) là một phương thức dùng để thêm các ký tự "0" vào đầu chuỗi số 
(hoặc chuỗi ký tự) để đảm bảo rằng chuỗi có độ dài chính xác là k. Điều này thường được sử dụng 
để định dạng chuỗi số sao cho có cùng độ dài, thêm các số 0 đằng trước nếu cần.

Ví dụ:

number = "123"
padded_number = number.zfill(5)
print(padded_number)  # Kết quả: "00123"
Ở đây, number là chuỗi "123", và padded_number được tạo ra bằng cách thêm 2 ký tự "0" vào đầu chuỗi 
để đảm bảo độ dài của chuỗi là 5.

"""