#Hàm:
def day_fibonaxi(n):
    ds = [1,1]   #Tạo danh sách fibo với 2 số
    for i in range(2, n):
        num = ds[i - 1]+ ds[i - 2]
        ds.append(num)
    return ds

#Nhập số n và in ra dãy fibonaxi đầu tiên là:
n=int(input('Nhập số n:'))
fibonaxi_list = day_fibonaxi(n)
print('n so fibonaxi dau tien la:', fibonaxi_list)

#Nhập số n và in ra dãy fibonaxi nhỏ hơn hoặc bằng n:
n=int(input('Nhập số n:'))
fibonaxi_list = []
a, b = 1, 1
while a <=n :
    fibonaxi_list.append(a)
    a,b = b,a+b
print('Các số fibonaxi nhỏ hơn hoặc bằng n là:',fibonaxi_list)