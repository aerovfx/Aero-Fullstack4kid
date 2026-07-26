#Bài 16. Viết chương trình giải phương trình bậc hai ax2+bx+c=0 với a, b, c là số nguyên và được nhập vào từ bàn phím.
a, b, c = map(int, input('Nhập a, b, c cách nhau bằng dấu cách: ').split())
#ham giai phuong trinh bac 2
def PT2(a,b,c):
    if a == 0:
        if b == 0:
            if c == 0:
                return "Phương trình có vô số nghiệm"
            else:
                return "Phương trình vô nghiệm"
        else:
            return -c/b
    else:
        delta = b**2 - 4*a*c
        if delta < 0:
            return "Phương trình vô nghiệm"
        elif delta == 0:
            return -b/(2*a)
        else:
            return (-b - delta**0.5)/(2*a)
print(PT2(a,b,c))
