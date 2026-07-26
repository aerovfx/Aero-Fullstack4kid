#Nhap gtri cua n tu ban phim vao:
n = input('Nhap vao so nguyen n :')  
n = int(n)
#Nhap cac cap toa do vao va so sanh va tim cac gtri lon nhat,nho nhat cua x va y:
for i in range(n):
    data = input('Nhap vao toa do diem thu' + str( i+1 ) + ': ')
    data = data.split()
    x = int(data[0])
    y = int(data[1])
    
    if i == 0 :
        xmin = x
        xmax = x
        ymin = y
        ymax = y
    else:
        if xmin > x:
            xmin = x
        if xmax < x:
            xmax = x
        if ymin > y:
            ymin = y
        if ymax < y:
            ymax = y
#Tinh do dai hai canh cua hcn va in ra ket qua cua bai toan:
a = xmax - xmin + 2
b = ymax - ymin + 2

print(a*b)