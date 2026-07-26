from array import *
n = input("Nhap vao so nguyen duong N = ")
n = int(n)
#tao mang fibo voi 2 chi so dau tien mac dinh la 1, 1.
fibo = array("i", [1,1])
i = 2
a = 1
#chay vong lap voi dieu kien thoat la a >= n
while a < n:
    a = fibo[i -1 ] + fibo[i-2]
    print(a)
    fibo.append(a) #them phan tu a vao cuoi danh sach
    i += 1
#so sanh phan tu cuoi cung trong mang fibo co phai la gia tri n hay khong?
if fibo[i-1] == n:
    print("YES")
else:
    print("NO")


