#Bài 21. Định nghĩa một class có ít nhất 2 method:

#getString: để nhận một chuỗi do người dùng nhập vào từ giao diện điều khiển.
#printString: in chuỗi vừa nhập sang chữ hoa.
#Thêm vào các hàm hiểm tra đơn giản để kiểm tra method của class.

#Ví dụ: Chuỗi nhập vào là o2.edu.vn thì đầu ra phải là O2.EDU.VN

class InputOutString(object):	
   def __init__(self):
       self.s = ""
   def getString(self):
       self.s = input("Nhập chuỗi:")
   def printString(self):
       print (self.s.upper())
strObj = InputOutString()
strObj.getString()
strObj.printString()