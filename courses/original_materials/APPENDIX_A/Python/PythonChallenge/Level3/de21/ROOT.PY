import math # Dòng này import module math cho phép sử dụng hàm math.sqrt().

# Đọc dữ liệu từ file ROOT.INP
with open("ROOT.INP","r") as file:
    lines = file.readlines()
    a = int(lines[0])
    b = int(lines[1])
    c = int(lines[2])

# Tính giá trị của biểu thức S
S = (a**2 + b**2 + c**2)/(a*b*c) + math.sqrt(a*b*c)

# Ghi kết quả vào file ROOT.OUT
with open("ROOT.OUT", "w") as file:
    file.write("{:.2f}".format(S))