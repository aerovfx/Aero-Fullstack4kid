import math

def kiem_tra_thuoc_duong_tron(a, b, r, x, y):
    # Tính khoảng cách từ điểm A đến tâm I của đường tròn
    khoang_cach = math.sqrt((x - a)**2 + (y - b)**2)

    # Kiểm tra xem điểm A có thuộc đường tròn hay không
    if khoang_cach <= r:
        return True
    else:
        return False

# Nhập tọa độ tâm và bán kính của đường tròn
a = int(input("Nhập tọa độ x của tâm I: "))
b = int(input("Nhập tọa độ y của tâm I: "))
r = int(input("Nhập bán kính r của đường tròn: "))

# Nhập tọa độ điểm A
x = int(input("Nhập tọa độ x của điểm A: "))
y = int(input("Nhập tọa độ y của điểm A: "))

# Kiểm tra xem điểm A có thuộc đường tròn hay không
if kiem_tra_thuoc_duong_tron(a, b, r, x, y):
    print("Điểm A thuộc đường tròn.")
else:
    print("Điểm A không thuộc đường tròn.")
