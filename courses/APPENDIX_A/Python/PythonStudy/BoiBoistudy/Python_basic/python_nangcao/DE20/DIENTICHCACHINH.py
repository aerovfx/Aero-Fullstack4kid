import math
def dtht():
    r = float(input('nhập r:'))
    ht = r*r*3.14
    print('Diện tích hình tròn là:',ht)
def dthcn():
    a = float(input('Nhập chiều dài hình chữ nhật:'))
    b = float(input('Nhập chiều rộng hình chữ nhật:'))
    cn = a*b
    print('Diện tích hình chữ nhật là:',cn)
def dthv():
    c = float(input('Nhập độ dài cạnh là:'))
    hv =c*c
    print('Diện tích hình vuông là:',hv)
def dthtg():
    d = float(input('Nhập độ dài đáy của tam giác là:'))
    h = float(input('Nhập chiều cao của tam giác là:'))
    s = (d*h)/2
    print('Diện tích hình tam giác là:',s)

def main():
    while True:
        print('Bảng chọn lệnh:')
        print('1.Không làm gì hết và trở về màn hình soạn thảo.')
        print('2.Tính diện tích hình tròn')
        print('3.Tính diện tích hình chữ nhật')
        print('4.Tính diện tích hình vuông')
        print('5.Tính diện tích hình tam giác')
        
        chon = input('Chọn một lệnh (1-5):')
        
        if chon == '1':
            break
        elif chon == '2':
            dtht()
        elif chon == '3':
            dthcn()
        elif chon == '4':
            dthv()
        elif chon == '5':
            dthtg()
        else:
            print('Lệnh không hợp lệ.Vui lòng chọn lại.')
main()
            