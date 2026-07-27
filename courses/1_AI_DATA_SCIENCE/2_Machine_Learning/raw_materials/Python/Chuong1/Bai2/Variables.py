# Khai báo biến
x = 5
y = "VietChung"
print(x) # Out x = 5
print(y) # Out y = "VietChung"

# # Ghi đè biến
# x = 5       # x là kiểu integer
# x = "VietChung" # x gán gía trị khác là kiểu string
# print(x) # Out x là "VietChung"

# # Ép kiểu
# x = str(3)    # x là một chuỗi string '3'
# y = int(3)    # y là một số nguyên 3
# z = float(3)  # z là một số thực 3.0

# print(type(x)) # In kiểm dữ liệu của x
# print(type(y)) # In kiểm dữ liệu của y
# print(type(z)) # In kiểm dữ liệu của z

# Sử dụng nháy đơn và kép đều giống nhau
# x = "Viet Chung"
# y = 'Viet Chung'
# if x == y:
#     print("True")
# else:
#     print("False")

# # Phân biệt hoa thường
# x = 5       # x là kiểu integer
# X = "VietChung" # x gán gía trị khác là kiểu string
# print(x) # Out x là 5

# # Khai báo nhiều biến trên 1 dòng
# x, y, z = "Python", "Javascript", "C++"
# print(x) # x = "Python"
# print(y) # y = "Javascript"
# print(z) # z = "C++"

# # Trích xuất danh sách, tuple 
# language = ["Python", "Javascript", "C++"]
# x, y, z = language
# print(x)
# print(y)
# print(z)

# # Biến toàn cục vầ cục bộ, 
# # ngoại lệ là bạn khai báo trong hàm myFunction với từ khoá global thì nó cũng thuộc biến toàn cục
# x = "Hello World"

# def myFunction():
#   global y
#   x = "VietChung"
#   y = "Python"
#   print("Biến cục bộ là " + x)

# myFunction()

# print("Biến toàn cục là  " + x)
# print("Biến toàn cục là  " + y)
