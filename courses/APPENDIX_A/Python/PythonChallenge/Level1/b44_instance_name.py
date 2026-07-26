#Định nghĩa một lớp gồm có tham số lớp và có cùng tham số instance
#Khi định nghĩa tham số instance, cần thêm nó vào __init__
#Bạn có thể khởi tạo một đối tượng với tham số bắt đầu hoặc thiết lập giá trị sau đó.
class Hocsinh:
 # Định nghĩa lớp "name"
 ten = "nguoi"
 # Code by Quantrimang.com
 def __init__(self, name = None):
 # self.name là biến instance
 self.name = name

matt_joy = nguoi("Matt")
print ("%s name is %s" % (nguoi.ten, matt_joy.ten))

nicon = nguoi()
nicon.ten = "Nicon"
print ("%s ten laf %s" % (nguoi.ten, nicon.ten))