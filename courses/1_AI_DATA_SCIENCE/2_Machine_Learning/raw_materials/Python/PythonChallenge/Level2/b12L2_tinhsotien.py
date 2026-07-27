#Viết chương trình tính số tiền thực của một tài khoản ngân hàng dựa trên nhật ký giao dịch được nhập vào từ giao diện điều khiển.
"""Định dạng nhật ký được hiển thị như sau:

D 100
W 200

(D là tiền gửi, W là tiền rút ra).
Giả sử đầu vào được cung cấp là:

D 300
D 300
W 200
D 100
Thì đầu ra sẽ là: 500

Gợi ý:

Trong trường hợp dữ liệu đầu vào được nhập vào chương trình nó nên được giả định là dữ liệu được người dùng nhập vào từ giao diện điều khiển.

"""
import sys
netAmount = 0

while True:
    s = input("Nhập nhật ký giao dịch: ")
    if not s:
        break
    values = s.split(" ")
    operation = values[0]
    amount = int(values[1])
    if operation=="D":
        netAmount+=amount
    elif operation=="W":
        netAmount-=amount
    else:
        pass
print (netAmount)