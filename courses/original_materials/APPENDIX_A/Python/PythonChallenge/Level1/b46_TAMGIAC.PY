# Nhập giá trị a, b, c từ bàn phím
a = float(input("Nhập giá trị cạnh a: "))
b = float(input("Nhập giá trị cạnh b: "))
c = float(input("Nhập giá trị cạnh c: "))
# Kiểm tra xem bộ ba số a, b, c có phải là bộ ba cạnh của tam giác hay không
if (a + b > c) and (a + c > b) and (b + c > a):
    if a == b == c:
        print("Đây là bộ ba cạnh của tam giác đều.")
    elif a == b or a == c or b == c:
        if (a**2 == b**2 + c**2) or (b**2 == a**2 + c**2) or (c**2 == a**2 + b**2):
            print("Đây là bộ ba cạnh của tam giác vuông cân.")
        else:
            print("Đây là bộ ba cạnh của tam giác cân.")
    elif (a**2 == b**2 + c**2) or (b**2 == a**2 + c**2) or (c**2 == a**2 + b**2):
        print("Đây là bộ ba cạnh của tam giác vuông.")
    else:
        print("Đây là bộ ba cạnh của tam giác thường.")
else:
    print("Đây không phải là bộ ba cạnh của tam giác.")