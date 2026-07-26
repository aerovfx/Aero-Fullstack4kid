# Chú thích dòng lệnh

print("hello world!") # in chuỗi
print(1 + 4) # In một số hoặc biểu thức


# Sử dụng thụt lề để đánh dấu các khối
x = int(input("Nhập một số nguyên: "))
if x > 5:
    print("x lớn hơn 5")
else:
    print("x nhỏ hơn hoặc bằng 5")

#Nhận dạng tên biến: 
age = 25
name = "John Doe"

# Cú pháp điều kiện rẽ nhánh
# Nhập một số nguyên từ người dùng
number = int(input("Nhập một số nguyên: "))

# Kiểm tra các điều kiện
if number > 0:
    print("Số bạn nhập là số dương")
elif number < 0:
    print("Số bạn nhập là số âm")
else:
    print("Số bạn nhập là số không")

# Kết thúc chương trình
print("Chương trình kết thúc")



# Ví dụ sử dụng biến trong vòng lặp for
fruits = ["Apple", "Banana", "Orange"]

for fruit in fruits:
    print("I like", fruit)

# Ví dụ sử dụng biến trong vòng lặp while
count = 0
while count < 5:
    print("Count:", count)
    count += 1

# Ví dụ về sử dụng hàm
name = input("Hãy nhập vào tên của bạn: ")
def greet(name):
    print("Xin chào, " + name + "!")
greet(name)
# Ví dụ về import
import math
result = math.sqrt(16)
